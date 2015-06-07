---
title: Building My Personal Website
tags: [website, blogging]
permalink: /blog/building-my-personal-website
blurb: "I embark on a new adventure: blogging."
description: "In which I share my experience building this website, and start blogging."
---

So I did it. After months of feeling like I should make one, I now have a personal website (in case you were wondering, this is it).

Writing this website was an interesting experience. It's served by Github Pages, and technically, it's a very simple website. The CSS is simple, and I don't do anything really special with the Liquid templating system. The main difficultly I had was in designing the look of the website. I'm a backend developer by trade and haven't had much practice making things that look nice (to be honest, based only on the work I do at my job, one would think the only UI I'm capable of designing for is curl and the command line).

When I started, I knew I wanted to use *Binary Nirvana* as the name of my website, as I had used the same name when I was required to blog for a CS class in college. I originally wanted to have a nice green zen feel (I was going for an "elegant" look), but found I was unable to really visualize a unique look. So ultimately, I decided to go with a simple look and use the fish logo to accentuate the "Asian-ness" of the site. It was hard enough to even come up with a simple design.

But it's done now, and I think it looks relatively nice. My next task is to make it responsive. It shouldn't be terribly difficult, but you never know. Let me know if you have any suggestions for how I could make the site better!

***Update: June 6, 2015***
The site should now be responsive! It took a while longer than I should have liked, mostly cause there were kinks to be worked out with [Concrete](https://github.com/davidlumley/concrete) (the grid system I used) and it's declaration that all rows needed to have a `min-width`. But it's fixed and the site should look good on mobile.

Also, I added a `meta` in my HTML that should change the color of the omnibar in Chrome on Android Lollipop. It's a cool little feature that looks nice. Here's how to do it:

{% highlight html %}
<head>
    <meta name="theme-color" content="#f33">
    ...
</head>
{% endhighlight %}

Cool, the website should be all set to go! Again, let me know if you find any issues with the site!
