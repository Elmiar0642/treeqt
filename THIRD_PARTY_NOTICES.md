# Third-party notices

TreeQt is proprietary software. Third-party components retain their own copyrights and licenses.

## Qt

TreeQt uses Qt 5 Core, GUI, and Widgets libraries. Release builds intended to remain closed-source must use only Qt components whose selected license permits that distribution model, and must satisfy the applicable Qt/LGPL obligations.

For AppImage builds that bundle LGPL-covered Qt libraries:

- keep TreeQt application code separate from the Qt shared libraries;
- provide the applicable LGPL license text and a prominent Qt notice;
- do not restrict LGPL rights, including replacement/modification of the covered Qt libraries;
- provide the corresponding Qt library source, or a compliant written offer/instructions under your control, for the exact Qt version shipped;
- preserve notices for any additional third-party libraries bundled by Qt/linuxdeploy.

The release process should record the exact Qt version used for each binary.
