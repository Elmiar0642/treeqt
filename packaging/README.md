# TreeQt Linux distribution packaging

TreeQt application source remains private. Public distribution recipes consume official, unmodified binary release assets under the TreeQt Proprietary License.

## Ubuntu / Debian

Official releases include an `amd64` `.deb` package. Install a downloaded package with:

```bash
sudo apt install ./treeqt_VERSION_amd64.deb
```

A signed APT repository can be generated from the release assets once repository-signing credentials and a hosting endpoint are configured.

## Fedora / RHEL

Official releases include an `x86_64` `.rpm` package. Install a downloaded package with:

```bash
sudo dnf install ./treeqt-VERSION-1.x86_64.rpm
```

A signed DNF repository can be generated once repository-signing credentials and a hosting endpoint are configured.

## Arch Linux / AUR

The AUR package name is intended to be `treeqt-bin`. The public AUR recipe is under `packaging/arch/` and consumes the official TreeQt binary release rather than application source.

## Gentoo

The binary ebuild is maintained under `packaging/gentoo/`. The package name is `sys-fs/treeqt-bin`.

## Snap / Canonical

Snapcraft source lives only in the private TreeQt source repository because it builds the proprietary application. TreeQt requests classic confinement because its purpose requires broad filesystem access. Publishing a classic snap requires Canonical review and Snap Store credentials.

Copyright (C) 2026 ARIMA IMMANUEL. TreeQt application binaries remain governed by `LICENSE.txt`.
