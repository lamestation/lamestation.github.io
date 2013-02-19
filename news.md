---
layout: mainpage
title: News
---

<div class="row">
<div class="span4">
  <h3>All Posts</h3>
  <ul>
    {% for post in site.posts %}
    <li>
    <dl>
      <dt><a href="{{ post.url }}" title="{{ post.title }}"><strong>{{ post.title }}</strong></a></dt>
      <dd><small>Posted {{ post.date | date: '%Y' }}-{{ post.date | date: '%b' }}-{{ post.date | date: '%d' }}</small></dd>
    </dl>
    </li>
    {% endfor %}
  </ul>
</div>
<div class="span8">
       {% for post in site.posts limit:5 %}
       <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
       <p class="postauthor"><i>Posted by {{ post.author }} on {{ post.date | date: "%A, %B %d, %Y" }}</i></p>
       {{post.content}}
       <hr>
       {% endfor %}
</div>
</div> 




