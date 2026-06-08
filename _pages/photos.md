---
layout: page
title: Photos
permalink: /photos/
description: A few photos — fieldwork, conferences, and elsewhere.
nav: false
---

<div class="row">
{% for photo in site.data.photos %}
  {% assign p = photo.image | replace_first: "/assets/", "assets/" %}
  <div class="col-sm-4 mb-4">
    {% include figure.liquid path=p title=photo.caption class="img-fluid rounded z-depth-1" %}
  </div>
{% endfor %}
</div>
