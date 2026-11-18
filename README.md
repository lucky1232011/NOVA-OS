# NOVA-OS
HEHEHEHE TRYING A SHOT ON MAKING MY OWN OS

NOVA OS is a Debian 12 (Bookworm) live system configured around the XFCE desktop. Its first milestone aims for a practical desktop with a launcher, terminal, browser, graphical installer, NOVA styling, and one harmless local Easter egg.

## Current status

The repository contains a Debian Live `live-build` configuration and build instructions. No ISO has been built or booted yet: the authoring environment is Windows without WSL, Docker, or a VM. See [STATUS.md](STATUS.md) and [BUILDING.md](BUILDING.md) before treating this as a verified boot image.

## Build

Build on Debian 12 as a user with `sudo` access, following [BUILDING.md](BUILDING.md). The result is a live ISO under `build/`.

## What is included in the configured image

- XFCE desktop with LightDM login manager
- Firefox ESR and XFCE Terminal
- Debian live persistence support and Calamares installer
- NOVA wallpaper, dark theme, accent styling, and desktop launchers
- A local, one-hour session notification with an optional roast in the wording; no network activity or telemetry

The package list describes intended image contents; they are not yet runtime-verified. Contributions and test reports are welcome.
