#!/usr/bin/env python3

import struct
import subprocess
import sys
from pathlib import Path

from validate_schemas import check_config, load_json

ROOT = Path(__file__).resolve().parents[1]
PORTS = ROOT / "ports"
ERRORS = []


def fail(message):
    ERRORS.append(message)


def check_run_script(port_id, directory, config, file_sets):
    run_script = directory / "run.sh"
    if not run_script.is_file() or not run_script.stat().st_mode & 0o111:
        fail(f"{port_id}: run.sh must exist and be executable")
        return

    script = run_script.read_text(errors="replace")

    if file_sets and "cubegm/port_check.sh" not in script:
        fail(f"{port_id}: run.sh must use TreeFrogUI's shared required-files checker")

    binary = config["launch"]["binary"]
    if f"$PORT_DIR/{Path(binary).name}" not in script:
        fail(
            f"{port_id}: run.sh must launch configured binary from its port directory: {binary}"
        )

    for item in sorted({item for group in file_sets for item in group}):
        if Path(item).name not in script:
            fail(f"{port_id}: run.sh does not check configured file {item}")


def check_source_submodule(port_id, directory):
    source = directory / "source"
    if not source.is_dir() or not (ROOT / ".gitmodules").is_file():
        fail(f"{port_id}: source/ submodule is missing")
        return
    try:
        stage = subprocess.check_output(
            ["git", "ls-files", "--stage", str(source.relative_to(ROOT))],
            cwd=ROOT,
            text=True,
        )
    except (subprocess.CalledProcessError, OSError):
        fail(f"{port_id}: could not inspect source submodule")
        return
    if not stage.startswith("160000 "):
        fail(f"{port_id}: source/ is not recorded as a Git submodule")


def check_binary(port_id, directory, config):
    binary = config["launch"]["binary"]
    binary_path = directory / binary
    if not binary_path.is_file():
        fail(f"{port_id}: missing port-local launch binary {binary}")
        return
    with open(binary_path, "rb") as f:
        header = f.read(20)
    if (
        len(header) < 20
        or header[:6] != b"\x7fELF\x01\x01"
        or struct.unpack_from("<H", header, 18)[0] != 8
    ):
        fail(f"{port_id}: launch binary must be a little-endian 32-bit MIPS ELF")


def check_launch_content(port_id, directory, config, file_sets):
    content = config["launch"].get("content")
    if not content:
        return
    packaged = (directory / content).exists()
    declared = any(content in group for group in file_sets)
    if not packaged and not declared:
        fail(
            f"{port_id}: launch content is neither packaged nor declared as required game data: {content}"
        )


def check_game_data(port_id, directory, file_sets):
    marker = directory / ".requires_game_data"
    if marker.exists() != bool(file_sets):
        fail(f"{port_id}: .requires_game_data must match required_file_sets")
    for filename in sorted({item for group in file_sets for item in group}):
        if (directory / filename).exists():
            fail(
                f"{port_id}: user-provided game data must not be committed: {filename}"
            )


def check_assets(port_id, directory, config):
    if not (ROOT / config["setup_guide"]).is_file():
        fail(f"{port_id}: setup_guide must name a checked-in guide")
    if not (directory / "boxart.png").is_file():
        fail(f"{port_id}: boxart.png is missing")


def main():
    if not PORTS.is_dir():
        print("ports/ directory is missing", file=sys.stderr)
        return 1

    launchers = {}
    validated = 0

    for directory in sorted(path for path in PORTS.iterdir() if path.is_dir()):
        if directory.name == "source":
            continue

        config_path = directory / "config.json"
        if not config_path.is_file():
            fail(f"{directory.name}: config.json is missing")
            continue

        schema_errors = check_config(config_path)
        if schema_errors:
            for message in schema_errors:
                fail(f"{directory.name}: {message}")
            continue

        try:
            config = load_json(config_path)
        except (OSError, ValueError) as error:
            fail(f"{directory.name}: invalid config.json: {error}")
            continue

        validated += 1
        port_id = config["id"]
        file_sets = config["required_file_sets"]

        if port_id != directory.name:
            fail(f"{port_id}: id must match its directory ({directory.name})")

        launcher = config["launcher"]
        if launcher in launchers:
            fail(
                f"{port_id}: duplicate launcher {launcher} (also used by {launchers[launcher]})"
            )
        else:
            launchers[launcher] = port_id

        check_run_script(port_id, directory, config, file_sets)
        check_source_submodule(port_id, directory)
        check_binary(port_id, directory, config)
        check_launch_content(port_id, directory, config, file_sets)
        check_game_data(port_id, directory, file_sets)
        check_assets(port_id, directory, config)

    if validated == 0 and not ERRORS:
        fail("no ports found")

    if ERRORS:
        print("Port validation failed:", file=sys.stderr)
        for error in ERRORS:
            print(f"- {error}", file=sys.stderr)
        return 1

    print(
        f"Validated {validated} ports and their launch config, required files, artwork, and source submodules."
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
