#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

python3 - "$ROOT" <<'PY'
import configparser
import pathlib
import sys
import xml.etree.ElementTree as ET

root = pathlib.Path(sys.argv[1])
packages = (root / "config/package-lists/nova.list.chroot").read_text().splitlines()
assert packages and all(p.strip() and not p.startswith("#") for p in packages)
assert len(packages) == len(set(packages)), "duplicate package entries"
ET.parse(root / "config/includes.chroot/usr/share/backgrounds/nova/nova.svg")
ET.parse(root / "config/includes.chroot/etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml")
ET.parse(root / "config/includes.chroot/etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml")
autostart = configparser.ConfigParser()
autostart.read(root / "config/includes.chroot/etc/xdg/autostart/nova-personality.desktop")
assert autostart["Desktop Entry"]["Exec"] == "/usr/local/bin/nova-personality.py"
hook = root / "config/hooks/live/0100-nova-config.hook.chroot"
assert hook.read_text().startswith("#!/bin/sh\nset -eu")
app = root / "config/includes.chroot/usr/local/bin/nova-personality.py"
compile(app.read_text(), str(app), "exec")
print(f"Validated {len(packages)} package entries, SVG wallpaper, autostart entry, hook header, and personality Python syntax.")
PY

for file in "$ROOT/scripts/build.sh" "$ROOT/scripts/clean.sh" "$ROOT/scripts/validate.sh" "$ROOT/config/hooks/live/0100-nova-config.hook.chroot"; do
    sh -n "$file"
done
echo "Shell syntax validation passed."
