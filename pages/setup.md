---
layout: subpage
title: Setup
fulltitle: Setup
subtitle: Download and install the tools you need to work with the LameStation.
permalink: /setup/

downloads:
  - image: /images/setup/ide.png
    title: "PropellerIDE"
    description: The code editor for LameStation.
    button:
      url: /propelleride/
      icon: download
      name: Download PropellerIDE

  - image: /images/setup/sdk.png
    title: "LameStation SDK"
    description: Everything else.
    button:
      url: /sdk/
      icon: download
      name: Download SDK
---


{% assign actionlist = page.downloads %}
{% include actionlist.html %}
