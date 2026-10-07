# Copyright 2026 ARIMA IMMANUEL
# Distributed under the terms of the 0BSD license for packaging metadata.

EAPI=8

DESCRIPTION="Graphical filesystem tree editor (official prebuilt binary)"
HOMEPAGE="https://github.com/Elmiar0642/treeqt"
SRC_URI="https://github.com/Elmiar0642/treeqt/releases/download/v${PV}/TreeQt-linux-x86_64.tar.gz"

LICENSE="TreeQt-Proprietary"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror strip"

S="${WORKDIR}"
QA_PREBUILT="/opt/treeqt/TreeQt.AppImage"

src_install() {
    exeinto /opt/treeqt
    newexe TreeQt-x86_64.AppImage TreeQt.AppImage

    dosym /opt/treeqt/TreeQt.AppImage /usr/bin/treeqt-appimage

    exeinto /usr/bin
    doexe "${T}"/treeqt

    insinto /usr/share/icons/hicolor/scalable/apps
    newins treeqt.svg treeqt.svg

    insinto /usr/share/applications
    doins "${T}"/treeqt.desktop

    insinto /usr/share/licenses/treeqt-bin
    doins LICENSE.txt

    dodoc THIRD_PARTY_NOTICES.md
}

src_prepare() {
    default

    cat > "${T}"/treeqt <<'EOF'
#!/bin/sh
APP=/opt/treeqt/TreeQt.AppImage
if command -v fusermount >/dev/null 2>&1 || command -v fusermount3 >/dev/null 2>&1; then
    exec "$APP" "$@"
fi
APPIMAGE_EXTRACT_AND_RUN=1 exec "$APP" "$@"
EOF

    cat > "${T}"/treeqt.desktop <<'EOF'
[Desktop Entry]
Type=Application
Name=TreeQt
Comment=Graphical filesystem tree editor
Exec=treeqt
Icon=treeqt
Terminal=false
Categories=Utility;FileTools;
EOF
}
