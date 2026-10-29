#!/usr/bin/env python3

import json
import sys
from pathlib import Path

from jsonschema import Draft202012Validator, FormatChecker
from jsonschema.exceptions import SchemaError

ROOT = Path(__file__).resolve().parents[1]
PORTS = ROOT / "ports"
CONFIG_SCHEMAS = ROOT / "docs" / "info" / "schemas" / "config"
FORKS = ROOT / "docs" / "info" / "forks.json"
FORKS_SCHEMA = ROOT / "docs" / "info" / "schemas" / "forks.schema.json"

_validators = {}


def rel(path):
    try:
        return path.relative_to(ROOT)
    except ValueError:
        return path


def load_json(path):
    with open(path, encoding="utf-8") as f:
        return json.load(f)


def get_validator(schema_path):
    """Load, check and cache a validator for the given schema file."""
    if schema_path in _validators:
        return _validators[schema_path]
    schema = load_json(schema_path)
    Draft202012Validator.check_schema(schema)
    validator = Draft202012Validator(schema, format_checker=FormatChecker())
    _validators[schema_path] = validator
    return validator


def check(data_path, schema_path):
    """Validate one file. Returns a list of error strings (empty if valid)."""
    try:
        data = load_json(data_path)
    except (OSError, json.JSONDecodeError) as error:
        return [f"cannot read JSON: {error}"]
    return check_data(data, schema_path)


def check_data(data, schema_path):
    try:
        validator = get_validator(schema_path)
    except FileNotFoundError:
        return [f"schema not found: {rel(schema_path)}"]
    except (OSError, json.JSONDecodeError) as error:
        return [f"cannot load schema {rel(schema_path)}: {error}"]
    except SchemaError as error:
        return [f"schema {rel(schema_path)} is invalid: {error.message}"]

    messages = []
    for error in sorted(
        validator.iter_errors(data), key=lambda e: list(e.absolute_path)
    ):
        location = "/".join(str(p) for p in error.absolute_path) or "(root)"
        messages.append(f"{location}: {error.message}")
    return messages


def check_config(config_path):
    try:
        data = load_json(config_path)
    except (OSError, json.JSONDecodeError) as error:
        return [f"cannot read JSON: {error}"]

    version = data.get("schema_version") if isinstance(data, dict) else None
    if not isinstance(version, int) or isinstance(version, bool):
        return ["schema_version is missing or not an integer, cannot pick a schema"]

    schema_path = CONFIG_SCHEMAS / f"v{version}.schema.json"
    return check_data(data, schema_path)


def main():
    if not PORTS.is_dir():
        print("ports/ directory is missing", file=sys.stderr)
        return 2

    results = []  # (path, errors)

    for directory in sorted(p for p in PORTS.iterdir() if p.is_dir()):
        config_path = directory / "config.json"
        if not config_path.is_file():
            results.append((config_path, ["config.json is missing"]))
            continue
        results.append((config_path, check_config(config_path)))

    if FORKS.is_file():
        results.append((FORKS, check(FORKS, FORKS_SCHEMA)))
    else:
        results.append((FORKS, ["forks.json is missing"]))

    failed = 0
    for path, errors in results:
        if errors:
            failed += 1
            print(f"FAIL {rel(path)}")
            for message in errors:
                print(f"  - {message}")
        else:
            print(f"OK   {rel(path)}")

    total = len(results)
    print(f"\n{total - failed}/{total} files valid.")
    return 1 if failed else 0


if __name__ == "__main__":
    raise SystemExit(main())
