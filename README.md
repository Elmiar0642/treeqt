# TreeQt Gentoo Overlay

This branch is a standalone Gentoo Portage overlay for the proprietary TreeQt binary package.

Add it with:

```bash
sudo eselect repository add treeqt git https://github.com/Elmiar0642/treeqt.git
```

Then set the branch to `gentoo-overlay` in the generated repo configuration or clone directly with that branch, sync, and install:

```bash
sudo emaint sync --repo treeqt
sudo emerge --ask sys-fs/treeqt-bin
```

TreeQt application source code is not included in this overlay. The ebuild downloads the official binary release from the public TreeQt GitHub release page.

Copyright (C) 2026 ARIMA IMMANUEL. All rights reserved.
