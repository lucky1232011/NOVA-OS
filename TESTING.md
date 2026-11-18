# Testing

## Checks performed in the authoring environment

- Repository inspection: workspace was empty except for `work/` and `outputs/`; no Git repository or previous implementation was present.
- Tool availability: Windows host has Python and Git; WSL is not installed. Docker and QEMU are unavailable. Git Bash was present but could not start because Windows denied creation of its MSYS named object.
- Direct Python checks passed: package list has no duplicates; SVG and XFCE XML parse; personality Python compiles; desktop autostart points to the expected executable.
- `git diff --check` and shell syntax checks: unavailable because this new workspace is not a Git repository and no usable POSIX shell is installed.
- Full `live-build`, package resolution, graphical session, ISO boot, installer, restart and shutdown checks: **not run**. They require a Debian 12 build host and, for runtime checks, a VM.

## Validation on a Debian build host

Run `sh scripts/validate.sh` before `sh scripts/build.sh`. Then boot the produced ISO with the QEMU command in `BUILDING.md` and record actual results here. Do not mark those checks passed based only on successful ISO generation.
