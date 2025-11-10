---
title: Generating a Harry Potter Murder Mystery Dinner with Claude
tags: [ai, claude]
permalink: /blog/harry-potter-murder-mystery
blurb: "Can an LLM create a convincing mystery for nerds like me?"
description: "Creating a Harry Potter themed murdery mystery party was not effortless, but it was better than if I'd done it by hand"
metaname: Harry Potter Murder Mystery with Claude
image: harry-potter-murder-mystery/header.png
---

Every October, my wife and I host a Harry Potter party for several couples in our area. It's a big event, complete with decorations, costumes, and a potluck. This year, we decided we wanted to do a murder mystery party, but a quick Google search showed there were no ready-made scenarios for the 14-20 guests we planned on having. So we decided to make one ourselves. The only catch? We'd never actually been to a murder mystery party.

Given my interest in LLMs, I decided I'd try my hand at generating the mystery using Claude. Turns out it still took a lot of work, but the result was more immersive and thorough than if I had written it myself. Read on to see the steps I took.

![Claude Snitch](/assets/img/harry-potter-murder-mystery/header.png)

### 1. The System Prompt

First thing I did was create a project in Claude. This gave me a good place to gather all the documents I'd be creating. Then, to make sure I got the results I wanted consistently throughout the process, I seeded it with the following project instructions:

{% highlight markdown %}

You are an expert at writing mysteries stories and a big fan of social deduction games. You know exactly how to write clues and character backstories to help a team catch the murderer, but not make them so obvious that the game is no fun.

In this project, we will be planning a Harry Potter themed murder mystery dinner party for 10 couples. None of the characters from the books should be present in the scenario, but the themes and the world building from the series should be evident.

{% endhighlight %}

Next, I started a chat to get a rough overall storyline:

{% highlight markdown %}

Let's start by planning the overall story of the murder mystery. There should be 20 roles, 10 male and 10 female. The characters should all be adults, and not students at Hogwarts. There should be a victim, a murderer, and two accomplices. Give a rough overview of the scenario, the murder method, and motive. Provide a list of the 20 characters and a brief background on each one

{% endhighlight %}

I was fairly pleased with the result of this first query: we would be focused on a tale of magical embezzlement of funds for endangered magical creatures at the Ministry of Magic. The cast of characters was varied and interesting. I decided to accept Claude's first pass at generating the story structure.

### 2. The Clues

The next step was to create the clues. I wanted the mystery to have a mix of environmental clues like notes or newspapers, and interaction clues, which would be discovered by having characters talk to each other. Here's the prompt I used:

{% highlight markdown %}

Let's create the clues for the mystery. Let's include a mix of clues that will be found in the environment, and clues that can be unearthed by certain characters talking to the right person. First, create an artifact to hold approved clues. Next, present me with each clue individually as you design it. Once I say it is good enough to use, add it to the artifact

{% endhighlight %}

After that, it was just a matter of iterating over clues. This was probably the part of the project that worked the most poorly using Claude. I found that it was fairly repetitious in the types of clues it generated (maybe because it was using prior entries in the context and I should have specified that clues should be more varied). I also had to keep track of what clues existed and essentially anticipate the investigation that would take place based on the clues presented. I was often very pointed about the exact clue I wanted, and Claude was basically fancy autocomplete at that point. Then again, this is probably the most interesting part of the mystery, and probably the part of the process most in need of a human in the loop.

### 3. The Cast

Once we had the clues in place, I needed to flesh out the backstories for the cast of characters. Because I knew I wanted much of the same process for all of the 20 characters, I added the following to my system prompt to cut down on repitition:

{% highlight markdown %}

When I ask you to enter character backstory planning mode, you should do the following:
1. Consult the project docs to understand the overall story and the clues that point towards the murderer.
2. Create a new artifact for the backstory of the character I mention. Ensure that the character's relationships are consistent with existing character backstories
3. Generate a first draft of their backstory. It should include a brief description of the character and their work/background. Do not include any details about the character's physical appearance so that anyone can be the character. Make sure to write in a whimsical way that befits the Harry Potter theme, and try to add details that make the character feel like a real part of the Wizarding World. Include any details that are mentioned in the clues that the person should know about. Then, create 2 Gala Objectives (information to glean from other characters to help with their own lives or to make friends) for the character, making sure to include any that may be mentioned in the clues for that character.
5. Add a quote from the character to show off their personality at the top of the document
6. Work with me to fine tune the backstory

{% endhighlight %}

Then I just created a chat per character and went through the process 20 times.

Claude did a great job on this part. I would never have been able to create character stories as immersive if I'd been writing by hand (I'm just not that creative). If there's one part I'd use AI for again, it'd definitely be character generation.

### 4. The Website

Once I had the story, the clues, and the characters, I wanted an easy way to share what I'd created with my wife. Because Github Pages is easy and free, I had Claude write all the artifacts to disk using the File System MCP (this was honestly probably slower than just copy pasting TBH), and then used Claude Code to put together a quick [Jekyll site](https://msiebert.github.io/harry-potter-murder-mystery/).

### 5. Changes Based on Who Was Attending

Well, of course, not all 20 people ended up being able to come to the party. This meant that I needed to change some of the essential characters (the ones with clues in their Gala objectives) so that the genders would be right for the party. Claude Code made this a breeze. It was able to find all the pronouns, names, and relationships for these characters and change them throughout the website.

### 6. Prop Generation

A couple of the environmental clues were documents that I planned to create on my own. However, a couple days before the party, Anthropic dropped their document creation Skills (of course, we didn't know they were Skills at the time). These made creating the props a delight. I was so happy to be able to create a convincing newspaper and page out of a book without having to lose my sanity with formatting in a word processor.

And with that, our party was ready to go!

### 7. Reflection

If I were to do it again, I'd probably make the mystery a little less obvious. The group of people we invited are all heavy strategy game players, and they only got it wrong because they thought the true murderer was too obvious (which, to be fair, is a problem I'd like to have). I'd also make the characters have the same first name as the person playing the role. People kept forgetting who was who when they heard character names that weren't their own.

I'd probably also try using Claude Code with specialized agents to generate things in parallel. I use it a lot for other projects, so it's honestly a more comfortable interface for me.

Overall, the project still took at least 8 hours to complete, but the result was awesome. The party went well: everyone enjoyed their characters, accusations flew, and the murderer barely got away with it.

It was great fun, and I highly recommend using AI for a project like this. If you're planning your own murder mystery party (Harry Potter themed or otherwise), check out [the website](https://msiebert.github.io/harry-potter-murder-mystery/) to see the full results. And if you have any questions about the process, let me know!