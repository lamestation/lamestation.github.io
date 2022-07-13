---
layout: subpage
title: Build
fulltitle: Build
subtitle: Build the LameStation from scratch.
permalink: /build/

steps:
  - image: "/images/ls_rc2.jpg"
    title: "LS1"
    description: The original LameStation gaming handheld.
    buttons:
      - url: https://ls1.docs.lamestation.org/
        name: Build LameStation RC2
---

{% assign fancylist = page.steps %}
{% include fancylist.html %}
