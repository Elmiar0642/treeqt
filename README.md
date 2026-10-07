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

### Run without installing

Download `TreeQt-x86_64.AppImage`, then:

```bash
chmod +x TreeQt-x86_64.AppImage
./TreeQt-x86_64.AppImage
```

### Install for your user account

Download `TreeQt-linux-x86_64.tar.gz`, then:

```bash
tar -xzf TreeQt-linux-x86_64.tar.gz
./install.sh
```

After installation, run:

```bash
treeqt
```

or launch **TreeQt** from your desktop application menu.

## Source code

TreeQt application source code is not distributed in this public release repository.

Copyright (C) 2026 ARIMA IMMANUEL. All rights reserved. See `LICENSE.txt`.

Qt and other third-party components remain governed by their respective licenses. See `THIRD_PARTY_NOTICES.md` in the installer package.
