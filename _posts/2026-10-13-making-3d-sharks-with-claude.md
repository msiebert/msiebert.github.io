---
title: Making 3D Sharks with Claude
tags: [ai, claude, 3d]
permalink: /making-3d-sharks-with-claude/
blurb: "I set out to learn whether Claude can make 3D models. I ended up with a shark family tree."
description: What I learned building Shark Fam, a browsable collection of 3D sharks, almost entirely with Claude.
metaname: Making 3D Sharks with Claude
image: projects/shark-fam-mark.jpg
---

I love marine biology. I also love poking at new AI tools to see what they can actually do. Lately I'd been hearing that Claude had gotten much better at 3D, and I wanted to see for myself. On top of that, Anthropic had given me about a hundred dollars in Claude Code remote credits, and I figured a big, slightly silly project was the perfect way to put them to use while learning something. Sharks seemed like the obvious subject.

So I built [Shark Fam](https://msiebert.github.io/shark-fam/), a browsable family tree of 3D sharks you can spin around and poke at. The source is on [GitHub](https://github.com/msiebert/shark-fam) if you want to look at it.

Honestly, the sharks are almost a side effect. The real project was figuring out how to make 3D things with Claude. A few things surprised me along the way.

### Prototyping in an Artifact

I figured I'd sit down at my computer and have Claude write a bunch of code. What actually worked best was prototyping inside an artifact, using regular Claude on the desktop and the phone app. No repo, no local setup, just a chat and a preview.

That meant I could work on it anywhere. A lot of the early iteration happened while I was walking to work, and the rest while I was waiting for a plane. Describe a shark, look at what came back, say "the fins are too big," repeat. It's a surprisingly good way to learn what Claude can do in 3D, because the feedback loop is so short (and because you can do it one-handed on a sidewalk, which I do not recommend if you're also trying not to walk into things).

### One-Shotting Is Fine, But It's From Memory

Once the prototype was working, I tried the obvious thing: ask Claude to make a shark and see what comes out. It does work! You get something that is recognizably a shark.

But it's not very accurate. Claude is building the model from memory, and it shows. Everything comes out a little generic, like a shark in the abstract rather than a specific species. A great white and a bull shark end up looking suspiciously related (which, to be fair, they sort of are, but not *that* related).

### Reference Images Changed Everything

The fix turned out to be simple: let Claude go find reference images, build the model, and then compare its result against those references.

That loop made a big difference. It would build a shark, look at real photos and diagrams, notice that the snout was the wrong shape or the dorsal fin was in the wrong place, and fix it. Same model, same code, but now it had something real to check itself against instead of its own memory. If you take one thing away from this post, it's that. Don't let it work from memory when it can look.

### Letting It Run Overnight

The part I had the most fun with was this one. Once the process worked for a single shark, I wanted to see if it could do the 50 most common sharks. So I had Claude do each one in its own sub agent, and then I let it go.

I wasn't paying attention to it at all. I went to bed, and it kept generating models. Using a sub agent per shark kept things efficient, since each one got its own fresh context and its own round of finding references and checking its work. Waking up to a pile of finished sharks felt a little like cheating.

---

### How Did It Turn Out?

It's not perfect. Some of the sharks aren't completely accurate, and the UX could definitely use some work. I'm a backend developer by trade, and it shows.

But it was a really fun project, and I learned a lot from it. I'd call that a win. Go [check out the sharks](https://msiebert.github.io/shark-fam/), and let me know if you spot one that's way off. I'm sure there are a few.
