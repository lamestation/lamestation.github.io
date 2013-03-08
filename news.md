---
layout: default
title: News
---

<script id="feed-1362564474952855" type="text/javascript" src="http://rss.bloople.net/?url=https%3A%2F%2Flametech.atlassian.net%2Fwiki%2Fspaces%2Fcreaterssfeed.action%3Ftypes%3Dblogpost%26spaces%3DLAME%26maxResults%3D15%26title%3D%5BLameStation%5D%2BBlog%2BFeed%26amp%3BpublicFeed%3Dfalse%26amp%3Bos_authType%3Dbasic&showtitle=false&type=js&id=1362564474952855"></script>

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




