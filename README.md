Overview
========

Alternative icon for [Polymail.app](https://polymail.io).

![Polymail.icns](https://raw.github.com/Greenek/polymail.icns/master/preview.png)

Installation methods
====================

Quick
-----

> **NOTE:** Xcode Command Line Tools are required for that method: `xcode-select --install`.

1. Run in Terminal:

  ```
  curl -s https://raw.githubusercontent.com/Greenek/polymail.icns/master/install.sh | bash
  ```

Normal
------

1. Download latest version of [Polymail.icns](https://raw.githubusercontent.com/Greenek/polymail.icns/master/Polymail.icns).
2. Quit `Polymail.app`.
3. Go to `/Applications/` folder.
4. Select `Polymail.app` icon and press <kbd>⌘</kbd> + <kbd>I</kbd> or select `Get Info` from right-click menu.
5. Drag `Polymail.icns` onto it's icon at the top left of the info window.
6. Launch the application. New icon should be now visible in the dock.

From scratch
------------

#### Requirements

 * Xcode Command Line Tools (`xcode-select --install`)

 * Inkscape (`brew cask install inkscape`)

#### Install

1. Download or clone the repository.
2. Run in Terminal:
```
make
```

Troubleshooting
===============

If you cannot solve your issues please file a [bug report](https://github.com/Greenek/polymail.icns/issues/new).

After successful installation old icon is still visible at the Dock.
----------------------------------------------

There are two methods to fix this:

1. Restart application

2. or run in Terminal:

  ```
  sudo find /private/var/folders/ -name com.apple.dock.iconcache -exec rm {} \;
  sudo find /private/var/folders -name com.apple.iconservices -exec rm -rf {} \;
  killall Dock
  ```

Author
======

Paweł Golonko, [greenek.com](http://greenek.com)
