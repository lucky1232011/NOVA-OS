# NOVA OS build plan

## Milestone 1: a usable live desktop

1. Use Debian 12 (Bookworm) with Debian Live's `live-build` tooling as the stable, reproducible base.
2. Ship XFCE, LightDM, a terminal, browser, common utilities, coherent NOVA wallpaper/theme settings, and a system installer.
3. Add a small opt-in-at-session-start local personality service with a single one-hour joke; it has no network or data collection.
4. Provide exact build, validation, and VM instructions. Keep generated ISO artifacts out of source control.

## Milestone 2: verify and refine

Build the ISO on Debian 12, boot it in QEMU/VirtualBox, check login, launcher, terminal, networking, installer and shutdown/restart; fix issues from that test before describing it as verified.

## Current boundary

This repository is being authored on Windows without WSL, Docker, or QEMU. The live-build configuration and scripts can be inspected here, but producing or booting an ISO requires a Debian 12 build host and is not claimed as completed.
