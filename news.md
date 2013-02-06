---
layout: mainpage
title: News
---

# News

{% for post in site.posts limit:5 %}
### [{{ post.title}}]({{post.url}})
<p class="postauthor"><i>Posted by {{ post.author }} on {{ post.date | date: "%A, %B %d, %Y" }}</i></p>
{{post.content}}
{% endfor %}
