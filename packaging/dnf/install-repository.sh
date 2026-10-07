#!/usr/bin/env bash
set -euo pipefail

BASE="https://raw.githubusercontent.com/Elmiar0642/treeqt/package-repo"

curl -fsSL "$BASE/treeqt.repo" | sudo tee /etc/yum.repos.d/treeqt.repo >/dev/null
sudo dnf clean metadata
sudo dnf install treeqt
