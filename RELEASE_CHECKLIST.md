# TreeQt release checklist

1. Build release assets from the private `Elmiar0642/treeqt-private` repository.
2. Confirm the private repository remains private before every build.
3. Test `TreeQt-x86_64.AppImage` on a disposable directory.
4. Test install and uninstall from `TreeQt-linux-x86_64.tar.gz`.
5. Verify `SHA256SUMS`.
6. Confirm the exact Qt version in `QT_VERSION.txt` and satisfy the applicable Qt/LGPL obligations before publication.
7. Publish only the binary assets, checksum file, and Qt version metadata to the public release.
8. Never upload `core/`, `gui/`, `Makefile`, source archives, object files, or the private workflow source bundle to this public repository.
