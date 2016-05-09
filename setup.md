---
layout: subpage 
title: Setup
fulltitle: Setup 
permalink: /setup/

downloads:
    - image: "/images/theming.png"
      title: "PropellerIDE"
      description: The IDE for the LameStation.
      buttons:
            - url: /propelleride/download/
              icon: download
              name: Download PropellerIDE

    - image:
      title: "LameStation SDK"
      description: "Libraries, drivers, and tools for LameStation development."
      buttons:
            - url: https://github.com/lamestation/lamestation-sdk/releases/download/0.6.2-rc2/lamestation-sdk-0.6.2-rc2.zip
              icon: download
              name: Download SDK

---

<section class="hgroup">
<h1>Download</h1>
</section>

{% assign fancylist = page.downloads %}
{% include fancylist.html %}

<section class="hgroup">
<h1>Installation</h1>
</section>

<a href="/install/"><b>Onward to installation <i class="fa fa-arrow-right"></i></b></a>

<!--<i class="fa fa-info-circle" aria-hidden="true"></i> <a href="#">Which board do I have?</a>-->
