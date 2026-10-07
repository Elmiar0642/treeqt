# TreeQt

TreeQt is a lightweight graphical filesystem tree editor for Linux.

It scans a directory into a visual tree, lets you queue filesystem changes, and applies the queued operations when you press **Finish**.

## Current features

- directory-tree scan
- move and copy
- rename
- create directory
- delete
- pending-operation queue
- undo/clear before commit
- basic pre-execution validation

> TreeQt is early software. Test destructive operations on disposable data first and keep backups.

## Linux x86_64

### AppImage

Download `TreeQt-x86_64.AppImage` from Releases, then:

```bash
chmod +x TreeQt-x86_64.AppImage
./TreeQt-x86_64.AppImage
```

### Generic user installer

Download `TreeQt-linux-x86_64.tar.gz`, then:

```bash
tar -xzf TreeQt-linux-x86_64.tar.gz
./install.sh
```

### Ubuntu / Debian

Download the release `.deb` and install it with:

```bash
sudo apt install ./treeqt_0.1.1_amd64.deb
```

A signed APT repository workflow is included under `.github/workflows/publish-native-repos.yml`. Once the repository signing secrets are configured and the `package-repo` branch has been published, `packaging/apt/install-repository.sh` installs the repository and TreeQt.

### Fedora / RHEL

Download the release `.rpm` and install it with:

```bash
sudo dnf install ./treeqt-0.1.1-1.x86_64.rpm
```

The same signed repository workflow generates DNF repository metadata. After the `package-repo` branch is published, `packaging/dnf/install-repository.sh` configures it.

### Arch Linux / AUR

The AUR package is designed as:

```bash
yay -S treeqt-bin
```

The maintained `PKGBUILD` and `.SRCINFO` are in `packaging/arch/`. The GitHub workflow `publish-aur.yml` can publish them to AUR after the repository secret `AUR_SSH_PRIVATE_KEY` is configured.

### Gentoo

The binary overlay lives under `packaging/gentoo/`, with package:

```text
sys-fs/treeqt-bin
```

Clone this repository and use `packaging/gentoo/` as the local Portage repository path. The ebuild is pinned to the official TreeQt v0.1.1 binary release and uses `RESTRICT="mirror strip"` so Portage does not mirror or mutate the prebuilt payload.

### Snap / Canonical

TreeQt has a private-source Snapcraft recipe and GitHub workflow. Because TreeQt needs broad filesystem access, the snap uses **classic confinement**. Canonical requires review before a classic snap can be released publicly. Once Snap Store credentials are configured in the private repository as `SNAPCRAFT_STORE_CREDENTIALS`, the workflow can publish to a selected channel.

## Release integrity

`SHA256SUMS-v0.1.1.txt` contains canonical hashes for the AppImage, generic archive, Debian package, and RPM package.

## Source code and licensing

TreeQt application source code is not distributed in this public release repository.

Copyright (C) 2026 ARIMA IMMANUEL. All rights reserved. TreeQt is distributed under the TreeQt Proprietary License v1.1 in `LICENSE.txt`. The license permits redistribution of byte-for-byte unmodified official TreeQt binaries and distro packages while keeping the TreeQt application source proprietary.

Qt and other third-party components remain governed by their respective licenses. See `THIRD_PARTY_NOTICES.md`.
