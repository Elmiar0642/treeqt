#!/usr/bin/env bash
set -euo pipefail

BASE="https://raw.githubusercontent.com/Elmiar0642/treeqt/package-repo"

curl -fsSL "$BASE/treeqt-repo.gpg" | sudo tee /usr/share/keyrings/treeqt-repo.gpg >/dev/null
curl -fsSL "$BASE/treeqt.sources" | sudo tee /etc/apt/sources.list.d/treeqt.sources >/dev/null
sudo apt update
sudo apt install treeqt
