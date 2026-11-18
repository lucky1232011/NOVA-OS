#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
# Restrict cleanup to generated live-build paths in this project.
for path in "$ROOT/build" "$ROOT/chroot" "$ROOT/cache" "$ROOT/binary" "$ROOT/.build"; do
    case "$path" in
        "$ROOT"/*) rm -rf -- "$path" ;;
        *) echo "Refusing unexpected cleanup path: $path" >&2; exit 1 ;;
    esac
done
echo "Removed generated build paths."
