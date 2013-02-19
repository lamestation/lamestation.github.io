---
layout: mainpage
title: Home
---

<div id="galleria">
    <img src="images/giantagain1sc.jpg">
    <img src="images/tbrevs.jpg">
    <img src="images/tbselect.jpg">
    <img src="images/wifis1.jpg">
    <img src="images/wireframe.png">
</div>

<script>
    Galleria.loadTheme('/lib/galleria/themes/classic/galleria.classic.min.js');
    Galleria.run('#galleria');
</script>

{% include github_buttons %}

# Meet The LameStation

- {{ page.id }}
- {{ page.url }}
- {{ page.title }}
- {{ page.group }}

{% for node in site.title_bar %}

 {% if forloop.first == true %}
- {{ node }} - {{ forloop.first }}
 {% endif %}

 {% for subnode in node %}

   {% if forloop.first == true %}
  - {{ subnode }} - {{ forloop.first }}
   {% endif %}

   {% for subsubnode in subnode %}

    - {{ subsubnode }} - {{ forloop.first }}

   {% endfor %}
 {% endfor %}
{% endfor %}


{% assign content_tree = site.title_bar %}
{% include generate_pagelist %}

The LameStation is a gaming handheld designed with ease of software development and flexibility in mind. Leveraging the Parallax Propeller's 8-core architecture and established user base, the LameStation is a valuable tool for embedded systems and electronics education, teaching core concepts in context, using targeted, project-oriented lessons for true understanding.

The free-form paradigm and 8-pin expansion port mean easy repurposing of the hardware to new applications, so the user isn't limited to just games. 

Possibilities include:

* Digital oscilloscope
* Chat client
* Tone module
* Radio controller
* TV game console

<strong>What will you create with the LameStation?</strong>
