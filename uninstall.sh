#!/usr/bin/env bash
# TreeQt
# Copyright (C) 2026 ARIMA IMMANUEL. All rights reserved.
set -euo pipefail

rm -f "${HOME}/.local/bin/treeqt"
rm -f "${HOME}/.local/share/applications/treeqt.desktop"
rm -f "${HOME}/.local/share/icons/hicolor/scalable/apps/treeqt.svg"
rm -rf "${HOME}/.local/opt/treeqt"

if command -v update-desktop-database >/dev/null 2>&1; then
  update-desktop-database "${HOME}/.local/share/applications" >/dev/null 2>&1 || true
fi

echo "TreeQt has been uninstalled from your user account."
