#!/usr/bin/python3
"""A small, local-only NOVA desktop Easter egg."""
import os
import time

try:
    from gi.repository import Notify
except ImportError:
    raise SystemExit("NOVA personality requires python3-gi and libnotify")

Notify.init("NOVA")
time.sleep(60 * 60)
if os.environ.get("NOVA_PERSONALITY", "on").lower() not in {"off", "0", "false"}:
    note = Notify.Notification.new(
        "Professional Bum unlocked",
        "Some bum has been using this computer for one hour. Outstanding commitment.",
        "dialog-information",
    )
    note.set_timeout(8000)
    note.show()
