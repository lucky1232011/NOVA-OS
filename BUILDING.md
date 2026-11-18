# Building NOVA OS

## Requirements

- A clean Debian 12 (Bookworm) or Debian 13 (Trixie) amd64 installation or WSL distribution with internet access
- `sudo` access and at least 20 GB free disk space
- The repository copied or cloned into the Debian host

## Build

From the repository root, run:

```sh
sudo apt update
sudo apt install -y git live-build python3
sh scripts/build.sh
```

The image target remains Debian 12 (Bookworm). The script accepts Debian 12 or 13 as the Linux build host, configures Debian Live for amd64 and builds a hybrid ISO. Keep the checkout in the Linux home directory (for example, `~/NOVA-OS` in WSL) rather than under `/mnt/c`, because live-build relies on Linux filesystem features. It writes build output to `build/nova-os-amd64.iso` and leaves live-build's temporary work directories at the repository root. Run `sh scripts/clean.sh` to remove generated build paths.

## Boot in QEMU

Install QEMU (`sudo apt install qemu-system-x86`) and run:

```sh
qemu-system-x86_64 -m 4096 -smp 2 -boot d -cdrom build/nova-os-amd64.iso
```

Test the live desktop before selecting the installer. Installing to a disk erases that selected disk; use a disposable VM disk for installation tests. Use the desktop menu or system power menu to restart or shut down.

## Reproducibility

The base release, architecture, package list, and overlays are versioned. Debian package repositories are rolling, so identical source on different dates can resolve to different package revisions. For byte-for-byte reproducibility, repository snapshots and pinned package versions must be added in a later milestone.

