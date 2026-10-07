# Snap Store classic confinement request for TreeQt

Use this text when submitting the TreeQt classic-confinement request in the Snapcraft forum under the `store-requests` → `classic-confinement` category.

- name: `treeqt`
- description: TreeQt is a graphical filesystem tree editor for Linux. It scans a user-selected directory tree, stages filesystem operations such as move, copy, rename, directory creation, and deletion, and applies those operations only when the user presses Finish.
- snapcraft: The Snapcraft recipe is maintained in the private upstream source repository.
- upstream: https://github.com/Elmiar0642/treeqt
- upstream-relation: I am the owner and maintainer of TreeQt and the publisher of its official binary releases.
- supported-category: system administration / filesystem management utility
- reasoning: TreeQt requires classic confinement because its core function is to inspect and modify arbitrary filesystem locations selected by the user, including paths outside the home directory, removable or mounted filesystems, and other host paths that cannot be fully covered by the existing strict-confinement interfaces without materially breaking the application's purpose. TreeQt needs to perform user-authorized filesystem operations such as move, copy, rename, mkdir, and delete directly against those selected host paths. Restricting TreeQt to the fixed filesystem locations made available by strict confinement would prevent it from operating as a general-purpose filesystem tree editor.

I understand that strict confinement is generally preferred over classic.

I have considered the existing strict-confinement interfaces, but they do not provide the arbitrary host-path access required for TreeQt's intended filesystem-management functionality.

The public distribution repository is:
https://github.com/Elmiar0642/treeqt

TreeQt application source is proprietary and maintained in a private source repository; the public repository contains official binary releases, licensing, integrity hashes, and distribution metadata.
