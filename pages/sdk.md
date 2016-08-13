---
layout: sdkdownload 
title: Download SDK 
fulltitle: Download SDK
subtitle: Click the LameStation to begin.
permalink: /sdk/

archive: https://github.com/lamestation/lamestation-sdk/releases
copyright: Copyright © 2016 LameStation LLC. LameStation SDK is free software, released under the MIT License.
platform:
  name: LameStation
  link: https://github.com/lamestation/lamestation-sdk/releases/download/0.6.2-rc2/lamestation-sdk-0.6.2-rc2.zip

---

{% include info %}
This guide assumes that you already have PropellerIDE installed on your computer. If not, take a moment to <a href="/propelleride/"><b>install PropellerIDE</b></a> now.
{% include infoend %}

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

