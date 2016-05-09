---
layout: tocpage
title: Installation
fulltitle: Installation
permalink: /install/
---

# Windows Installation

PropellerIDE is packaged as a Windows installer that will guide the user throughout the installation process.

# OS X Installation

PropellerIDE is packaged as a regular DMG image, so mount the Volume and drag the icon into the Applications folder.

# Ubuntu / Debian Installation

PropellerIDE requires a minimum of Qt 5.2 which is only available on Ubuntu as of 14.04.

After downloading the Debian package for your platform, install it with `dpkg`.

    $ sudo dpkg -i propelleride-(version)-amd64.deb

It will complain about dependencies at which point you can run `apt-get` to fix them.

    $ sudo apt-get install -f

Make sure you install the FTDI drivers!

    $ sudo apt-get install libftdi1

Add yourself to the `dialout` group so you can use the serial port.

    $ sudo usermod -a -G dialout USER_NAME

# Setting up the SDK

1.  Unpack the SDK, which is a `.zip` archive, to a directory of your choosing.

1.  Open PropellerIDE and go to "*Edit -> Preferences*".

    > **Note:** On OS X, *Preferences* falls under *PropellerIDE*, not *Edit*.

    ![](edit_preferences.png)

1.  Click the *Languages* tab, and under *Includes* in the *Spin* box, and click *Add Path* to
    add the location of the unpacked SDK.

    ![](add_path.png)

1.  Hit _OK_!

    ![](hit_ok.png)

PropellerIDE should now be set up for use with the LameStation.

# Testing your installation

We can verify that the LameStation is working by loading a game from the `games/` directory of
the SDK. Let's start by opening `games/piXel/piXel.spin` and pressing <kbd>F10</kbd> to download.

If it worked, you should see this screen.

![](title.png)

If you'd like to try a different game, they follow a simple naming convention: in a folder named
`AwesomeGame/`, the game would be named `AwesomeGame.spin`.

![](naming.png)

> **Note:** You can only have one game loaded at a time.

# Troubleshooting

-   *I'm getting lots of _'NOT FOUND'_ messages. What's the deal?*

    ![](notfound.png)

    Looks like you haven't set up the library path correctly. Make sure you properly added the SDK.
