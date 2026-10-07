# TreeQt distribution setup

The repository is already configured for binary-only Linux distribution while keeping the TreeQt C/C++ application source private.

## Canonical Snap Store

The private repository `Elmiar0642/treeqt-private` contains `snap/snapcraft.yaml` and `.github/workflows/build-snap.yml`.

One-time requirements:

1. Register the `treeqt` snap name with the Snap Store.
2. Request/obtain approval for classic confinement. TreeQt needs broad filesystem access by design.
3. Export Snapcraft store credentials and save them as the private-repository secret:
   - `SNAPCRAFT_STORE_CREDENTIALS`
4. Run **Build and optionally publish TreeQt Snap** from the private repository Actions tab and choose a channel.

Without store credentials the workflow can still build the `.snap` as a private CI artifact.

## AUR

The public repository contains:

- `packaging/arch/PKGBUILD`
- `packaging/arch/.SRCINFO`
- `.github/workflows/publish-aur.yml`

One-time requirements:

1. Create/log into your AUR account.
2. Add an SSH public key to the AUR account.
3. Store the corresponding private key in this GitHub repository as:
   - `AUR_SSH_PRIVATE_KEY`
4. Ensure the AUR package name `treeqt-bin` is available.
5. Run **Publish treeqt-bin to AUR**, or publish a GitHub Release to trigger it automatically.

## Signed APT and DNF repositories

The public repository contains `.github/workflows/publish-native-repos.yml`. It consumes `.deb` and `.rpm` files from an existing public GitHub Release and publishes signed repository metadata to the `package-repo` branch.

Create a dedicated GPG repository-signing key. Do not commit its private key.

Configure these GitHub repository secrets:

- `TREEQT_GPG_PRIVATE_KEY_B64` — base64 encoding of the armored or binary private-key export
- `TREEQT_GPG_PASSPHRASE` — passphrase for that key

After a public GitHub Release contains the `.deb` and `.rpm`, run **Publish signed APT and DNF repositories** (or let the release event trigger it).

The workflow publishes:

- APT metadata under `package-repo/apt/`
- DNF metadata under `package-repo/rpm/x86_64/`
- `treeqt-repo.gpg` / `treeqt-repo.asc`
- `treeqt.sources`
- `treeqt.repo`

Users can then use:

```bash
bash packaging/apt/install-repository.sh
```

or:

```bash
bash packaging/dnf/install-repository.sh
```

## Gentoo

The overlay is already present under `packaging/gentoo/` with:

- `metadata/layout.conf`
- `profiles/repo_name`
- `licenses/TreeQt-Proprietary`
- `sys-fs/treeqt-bin/treeqt-bin-0.1.1.ebuild`
- `sys-fs/treeqt-bin/Manifest`

The v0.1.1 ebuild is pinned to the canonical public release tarball and its full Manifest hashes.

## Release asset set

For v0.1.1 publish these assets together:

- `TreeQt-x86_64.AppImage`
- `TreeQt-linux-x86_64.tar.gz`
- `treeqt_0.1.1_amd64.deb`
- `treeqt-0.1.1-1.x86_64.rpm`
- `SHA256SUMS-v0.1.1.txt`
- `QT_VERSION.txt`

Copyright (C) 2026 ARIMA IMMANUEL. TreeQt application binaries are governed by `LICENSE.txt`.
