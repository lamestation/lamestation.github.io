---
layout: mainpage
title: Home
group: "navigation"
---

<div id="galleria">
    <img src="images/giantagain1sc.jpg">
    <img src="images/tbrevs.jpg">
    <img src="images/tbselect.jpg">
    <img src="images/wifis1.jpg">
    <img src="images/wireframe.png">
</div>

<script>
    Galleria.loadTheme('/lamestation/lib/galleria/themes/classic/galleria.classic.min.js');
    Galleria.run('#galleria');
</script>

# Meet The LameStation

The LameStation is a gaming handheld designed with ease of software development and flexibility. Leveraging the Parallax Propeller's 8-core architecture and established user base, the LameStation is a valuable tool for embedded systems and electronics education, teaching core concepts in context, using targeted, project-oriented lessons for true understanding.

The free-form paradigm and 8-pin expansion port mean easy repurposing of the hardware to new applications, so the user isn't limited to just games.

Possibilities include:

* Digital oscilloscope
* Chat client
* Tone module
* Radio controller
* TV game console

What will you create with the LameStation?

# News
{% for post in site.posts limit:5 %}
### [{{ post.title}}]({{post.url}})
<p class="postauthor"><i>Posted by {{ post.author }} on {{ post.date | date: "%A, %B %d, %Y" }}</i></p>
{{post.content}}
{% endfor %}
