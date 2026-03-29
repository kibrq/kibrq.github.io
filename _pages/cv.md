---
layout: archive
title: "CV"
permalink: /cv/
author_profile: true
redirect_from:
  - /resume
---

{% include base_path %}

Education
======
* PhD student, EPFL, Lausanne
  * Mathematical Data Science Lab
  * Advisor: Emmanuel Abbé

Research Interests
======
* Machine learning
* Theoretical foundations of AI
* Data science
* Optimization

Contact
======
* kirill [dot] brilliantov [at] epfl [dot] ch

Publications
======
  <ul>{% for post in site.publications reversed %}
    {% include archive-single-cv.html %}
  {% endfor %}</ul>
