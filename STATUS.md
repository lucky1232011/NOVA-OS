# Status

## Implemented in source

- Debian 12 amd64 live-build configuration with XFCE, LightDM, Firefox ESR, terminal, live boot support, and Calamares installer packages.
- Build, cleanup, and configuration validation scripts.
- NOVA wallpaper and XFCE session defaults, plus a modular local one-hour notification service.
- Build and testing documentation that distinguishes configured contents from verified runtime behavior.

## Not yet verified

- No ISO has been produced in this Windows environment.
- No graphical session, application launch, network connection, installer, reboot, or shutdown has been tested.
- Package availability and live-build integration must be confirmed on Debian 12.

## Known limitation

Builds use current Debian Bookworm repository package revisions, so rebuilding later may not produce a byte-identical ISO.
