#!/usr/bin/env bash
# TreeQt
# Copyright (C) 2026 ARIMA IMMANUEL. All rights reserved.
set -euo pipefail

APP_NAME="TreeQt"
BIN_NAME="treeqt"
INSTALL_DIR="${HOME}/.local/bin"
APP_DIR="${HOME}/.local/opt/treeqt"
DESKTOP_DIR="${HOME}/.local/share/applications"
ICON_DIR="${HOME}/.local/share/icons/hicolor/scalable/apps"
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

find_appimage() {
  local candidates=("$SCRIPT_DIR/TreeQt-x86_64.AppImage" "$SCRIPT_DIR/TreeQt-aarch64.AppImage")
  local f
  for f in "${candidates[@]}"; do
    [[ -f "$f" ]] && { printf '%s\n' "$f"; return 0; }
  done
  shopt -s nullglob
  local matches=("$SCRIPT_DIR"/TreeQt-*-x86_64.AppImage "$SCRIPT_DIR"/TreeQt-*-aarch64.AppImage)
  shopt -u nullglob
  (( ${#matches[@]} > 0 )) && { printf '%s\n' "${matches[0]}"; return 0; }
  return 1
}

APPIMAGE="$(find_appimage || true)"
if [[ -z "$APPIMAGE" ]]; then
  echo "TreeQt AppImage was not found next to install.sh." >&2
  echo "Download/extract the complete TreeQt Linux release package, then rerun ./install.sh." >&2
  exit 1
fi

mkdir -p "$INSTALL_DIR" "$APP_DIR" "$DESKTOP_DIR" "$ICON_DIR"
INSTALLED_APP="$APP_DIR/TreeQt.AppImage"
cp -f "$APPIMAGE" "$INSTALLED_APP"
chmod 0755 "$INSTALLED_APP"
ln -sfn "$INSTALLED_APP" "$INSTALL_DIR/$BIN_NAME"

if [[ -f "$SCRIPT_DIR/assets/treeqt.svg" ]]; then
  cp -f "$SCRIPT_DIR/assets/treeqt.svg" "$ICON_DIR/treeqt.svg"
elif [[ -f "$SCRIPT_DIR/treeqt.svg" ]]; then
  cp -f "$SCRIPT_DIR/treeqt.svg" "$ICON_DIR/treeqt.svg"
fi

cat > "$DESKTOP_DIR/treeqt.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=$APP_NAME
Comment=Transactional filesystem tree editor
Exec=$INSTALL_DIR/$BIN_NAME
Icon=treeqt
Terminal=false
Categories=Utility;FileTools;FileManager;
StartupNotify=true
DESKTOP

if command -v update-desktop-database >/dev/null 2>&1; then
  update-desktop-database "$DESKTOP_DIR" >/dev/null 2>&1 || true
fi

echo "TreeQt installed. Run: treeqt"
