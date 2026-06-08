---
layout: page
title: Links
permalink: /links/
description: Useful tools, datasets, and resources.
nav: false
---

<ul>
{% for link in site.data.links %}
  <li>
    <a href="{{ link.url }}" target="_blank" rel="noopener">{{ link.name }}</a>
    {% if link.description %} — {{ link.description }}{% endif %}
  </li>
{% endfor %}
</ul>
