---
layout: download
title: Download PropellerIDE
fulltitle: Download PropellerIDE
subtitle: Click on your operating system to start the download.
permalink: /propelleride/

archive: https://github.com/parallaxinc/PropellerIDE/releases
copyright: Copyright © 2016 Parallax Inc. PropellerIDE is free software, licensed under the GPLv3. It is and always will be free software.
platforms:
  - name: Windows
    link: https://github.com/parallaxinc/PropellerIDE/releases/download/0.38.5/propelleride-0.38.5-amd64.exe

  - name: OS X
    link: https://github.com/parallaxinc/PropellerIDE/releases/download/0.38.5/propelleride-0.38.5-amd64.dmg

  - name: Ubuntu
    link: https://github.com/parallaxinc/PropellerIDE/releases/download/0.38.5/propelleride-0.38.5-amd64.deb

  - name: Raspbian OS
    link: https://github.com/parallaxinc/PropellerIDE/releases/download/0.38.5/propelleride-0.38.5-armhf.deb

---

# Windows Installation

PropellerIDE is packaged as a Windows installer that will guide the user throughout the installation process.

You will also need to [download the FTDI drivers](http://www.ftdichip.com/Drivers/CDM/CDM21218_Setup.zip)
in order to connect LameStation to your computer.

# OS X Installation

PropellerIDE is packaged as a regular DMG image, so mount the Volume and drag the icon into the Applications folder.

You will also need to [download the FTDI drivers](http://www.ftdichip.com/Drivers/VCP/MacOSX/FTDIUSBSerialDriver_v2_2_18.dmg)
in order to connect LameStation to your computer.

# Ubuntu / Debian Installation

PropellerIDE requires a minimum of Qt 5.2 which is only available on Ubuntu as of 14.04.

After downloading the Debian package for your platform, install it with `dpkg`.

    $ sudo dpkg -i propelleride-(version)-amd64.deb

It will complain about dependencies at which point you can run `apt-get` to fix them.

    $ sudo apt-get install -f

Make sure you install the FTDI drivers!

    $ sudo apt-get install libftdi1

Add yourself to the `dialout` group so you can use the serial port, then reboot.

    $ sudo usermod -a -G dialout USER_NAME
    $ reboot
