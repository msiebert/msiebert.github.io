---
title: Github Pages in Docker with One Line Command
tags: [docker, "github pages", jekyll]
permalink: /blog/one-line-github-pages-with-docker
blurb: "One line and you've got Github Pages!"
description: "It's remarkably simple to run your Jekyll site with Github Pages and Docker locally. I'll never install rvm again!"
metaname: Github Pages in Docker with One Line Command
image: one-line-github-pages-with-docker/github-pages.jpg
---
I run this blog on Github Pages. In the past, when writing posts, I've previewed my blog by installing Ruby through RVM and then doing the good old `bundle exec jekyll serve` dance.

![Github Pages](/assets/img/one-line-github-pages-with-docker/github-pages.jpg)

However, I recently reinstalled Ubuntu, and I didn't have Ruby. I've been using Docker a lot at work, and decided that this would be the perfect way to avoid having to set up Ruby again. Turns out someone's already done the work of making a Github Pages Docker image and it can be run in one line:

{% highlight bash %}
docker run --rm -v $PWD/..:/usr/src/app -p 4000:4000 starefossen/github-pages:latest \
  bundle exec jekyll serve --config _config.yml --host 0.0.0.0
{% endhighlight %}

It's especially important to note the `--host 0.0.0.0` part. Without it, you won't be able to access the running Jekyll server on `localhost:4000`.

I'll never install Ruby again*!

\* Unless, of course, I need to.
