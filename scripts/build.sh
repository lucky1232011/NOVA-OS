#!/bin/sh
set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT"

if [ "$(id -u)" -eq 0 ]; then
    echo "Run as a normal user with sudo access; live-build will request privilege as needed." >&2
    exit 1
fi
if [ ! -r /etc/os-release ]; then
    echo "Cannot identify the build distribution." >&2
    exit 1
fi
. /etc/os-release
if [ "${ID:-}" != debian ] || { [ "${VERSION_CODENAME:-}" != bookworm ] && [ "${VERSION_CODENAME:-}" != trixie ]; }; then
    echo "Use Debian 12 (Bookworm) or Debian 13 (Trixie) as the build host." >&2
    exit 1
fi
command -v lb >/dev/null 2>&1 || {
    echo "live-build is missing. Install it with: sudo apt install live-build" >&2
    exit 1
}

chmod +x "$ROOT/config/hooks/live/0100-nova-config.hook.chroot"

mkdir -p build
lb config \
    --mode debian \
    --distribution bookworm \
    --architecture amd64 \
    --binary-images iso-hybrid \
    --archive-areas "main contrib non-free non-free-firmware" \
    --debian-installer live \
    --bootappend-live "boot=live components username=nova hostname=nova-os locales=en_US.UTF-8 keyboard-layouts=us" \
    --iso-application "NOVA OS" \
    --iso-publisher "NOVA OS" \
    --iso-volume "NOVA_OS" \
    --image-name nova-os-amd64 \
    --build-with-chroot true

lb build
iso=$(find "$ROOT" -maxdepth 1 -type f -name '*.iso' -print -quit)
if [ -z "$iso" ]; then
    echo "live-build completed but no ISO was found in $ROOT" >&2
    exit 1
fi
output="${LB_OUTPUT:-$ROOT/build/nova-os-amd64.iso}"
mv -- "$iso" "$output"
printf 'Built ISO: %s\n' "$output"

