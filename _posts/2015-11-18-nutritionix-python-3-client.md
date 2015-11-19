---
title: Python 3 Client for Nutritionix
tags: [nutritionix, python, opensource]
permalink: /blog/nutritionix-python-3
blurb: "Just in case you, like me, needed one."
description: "I needed Nutritionix's Python client to work with Python 3. It didn't. Now it does."
metaname: Python 3 Client for Nutritionix
image: nutritionix-python-3/nutritionix.png
---
![Nutritionix logo](/assets/img/nutritionix-python-3/nutritionix.png)

As part of my side project, [ieatfit](https://ieatfit.com), we're using Nutritionix's API to get data about meals users might have eaten that aren't on ieatfit's site (imagine that, users not doing what you tell them!). Nutritionix provides a Python API, but it's written with Python 2, and we're using Python 3 at ieatfit. So I ported it to Python 3. It was relatively trivial, but at least now you won't have to do it yourself.

You can find it [on Github](https://github.com/msiebert/nutritionix-python-3) or install it with pip:

{% highlight bash %}
pip install -e  git+https://github.com/msiebert/nutritionix-python-3.git#egg=nutritionix-python-3
{% endhighlight%}

Enjoy!
