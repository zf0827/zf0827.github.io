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
* Zhejiang University, Undergraduate, 2023 - 2027

Research Interests
======
* Code LLMs and agents
* Reliability of generated code, including detecting data risks and estimating or verifying correctness
* AI for scientific research and discovery
* Automated systems with continual knowledge learning capability and reliability

Contact
======
* Email: `yunxwei.zju.edu.cn`
* Location: Hangzhou, Zhejiang

Publications
======
<ul>{% for post in site.publications reversed %}
  {% include archive-single-cv.html %}
{% endfor %}</ul>
