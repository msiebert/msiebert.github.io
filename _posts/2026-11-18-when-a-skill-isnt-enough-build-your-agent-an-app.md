---
title: "When a Skill Isn't Enough, Build Your Agent an App"
tags: [ai, claude, mcp, rust]
permalink: /build-your-agent-an-app/
blurb: "I built a todo app with no UI. I'm not the one using it."
description: Why I built Tally, a local list app whose only user is my AI agent, and what changes when you design software for an agent instead of a person.
metaname: "When a Skill Isn't Enough, Build Your Agent an App"
---

I've been letting Claude manage my todo list for a while now. For most of this year that meant a task database in Notion, with Claude adding things, moving due dates around, and marking stuff done when I told it I'd finished something.

It mostly worked. But if you looked closely, Claude was working pretty hard to use a tool that was never built for it. It had to work out how Notion wanted its date fields formatted (`date:Due Date:start`, not `date:Due:start`). Filters on the views it created didn't reliably apply, so they had to be set by hand in the UI. And once, when I told it I'd finished splitting a project into tickets, it marked the wrong task done (it did catch it and fix it, to be fair).

Linear had the same problem from the other direction. It's great for real projects, but it's way too heavy for "buy milk." And my actual grocery list lived in a separate app on my phone that I updated by hand, which is exactly the kind of thing I wanted to stop doing.

What I wanted was dead simple: a list my agent could manage for me, without me having to work at it. Nothing that existed was quite that, so I built one. It's called [Tally](https://msiebert.github.io/Tally/), and it's a todo app with no UI, because I'm not the one using it.

### Skills vs. Apps

The usual way to give Claude a new ability is a skill. A skill is basically instructions: it teaches Claude how to do something with tools it already has. I have one that teaches Claude how to log expenses to my budget spreadsheet, for example, and it works great.

But a skill can only teach Claude to use what's already there. When the thing underneath is shaped for humans, the skill ends up being a long list of workarounds. Sometimes what your agent actually needs isn't better instructions. It's a better tool.

![A skill teaches Claude how to use existing tools, an existing service is built for people, and an app built for your agent fits the way the agent works](/assets/img/build-your-agent-an-app/skill-service-app.svg)

So that's what Tally is: an MCP server, running locally on my Mac, whose only user is Claude.

### Designing for an Agent

Once you decide the agent is the user, a lot of design decisions get easier, and some of them come out a little weird.

**There's no UI.** The [agent guide](https://msiebert.github.io/Tally/llms.txt) literally says "There is no UI; you are the user interface." If I want to know what's on my list, I ask Claude.

**Errors are written for the agent.** When a human hits an error, you show them a nice message and maybe a link to the docs. When an agent hits an error, the best thing you can do is tell it exactly how to fix the problem, so it can just try again. Here's what Tally says if Claude tries to use tags that don't exist:

{% highlight text %}
Unknown tags 'bugg', 'urgnt'. Tags must be created before use: call create_tag first, or fix the spelling. Existing tags: 'bug', 'idea'.
{% endhighlight %}

That's also why tags have to be created before they're used. A human would find that annoying. For an agent, it means a typo can't quietly split one tag into two.

**Lists carry instructions.** Each list and tag can hold instructions for the agent, like "item titles must start with a verb." They come back with the list, so Claude picks up my preferences for that list without me repeating them.

**Context is the scarce resource.** The week before, I'd spent some time reading about how MCP servers eat up an agent's context window. So reads are paginated and compact, list and tag instructions only come back on the first page, and there are flags to skip them when Claude already has them in context. A human doesn't care if a screen repeats itself. An agent pays for it in tokens.

**Order is priority.** There are no priority fields. The first item on the list is the most important one, and Claude moves things up and down to change that. It turns out that's way easier for an agent to keep straight than a bunch of fields.

### Building It (While Watching a Movie)

The idea had been bouncing around in my head for a couple of days. By the time I actually sat down on Saturday, I already had a pretty good picture of what it should be.

I followed the same process I wrote about in [Agentic Waterfall](/agentic-waterfall/). First I brainstormed a design doc with Claude in Notion: the data model, every tool, how errors should behave, what was out of scope. Then Claude broke that doc into 11 tickets in Linear. Then I had Claude Code work through them while I watched a movie. All 11 commits landed between 3:18 and 3:39 PM. The whole thing is Rust, with SQLite for storage.

This one was small enough that I didn't bother with milestones. It was one release, built all at once to about 90%. Which brings me to the last 10%.

### Testing It on the Agent

If your user is an agent, your usability tests should be on the agent too.

Tally has a test script that registers it with a real Claude Code session, using a scratch database, and gives Claude a small workflow: create a list with instructions, make a tag, add some items where one blocks another, complete things, and check what's unblocked. The last step of the prompt asks Claude for a summary of what it did, "and anything about the tools that confused you."

I ran it the next morning. Claude got everything right, and it also told me what confused it:

- `move_item` moved items between lists, but reordering within a list needed a different tool, `reorder_item`.
- `reorder_item` took an argument called `to`, while `add_items` called the same idea `position`.
- `complete_item` lets you complete an item that's still blocked. It just warns.

The first two were real problems, so I fixed them: `reorder_item` takes `position` now, and `move_item` without a destination list just repositions the item. The third one is on purpose (sometimes you really do finish something before its blocker), so it stayed.

That's the last 10% from agentic waterfall, but instead of me poking at the app looking for rough edges, the user told me where they were.

### Running It

Tally speaks MCP over stdio, so it runs on my Mac and Claude Desktop talks to it there. Since the Claude app on my phone can reach the tools on my desktop, I can still add things to my list when I'm out (well, mostly. Voice mode doesn't see it yet, and that's on my list in Tally, naturally).

If you want to try it, you'll need Rust installed:

{% highlight bash %}
cargo install --git https://github.com/msiebert/Tally
claude mcp add tally --scope user -- tally
{% endhighlight %}

Or just point your agent at the [Tally site](https://msiebert.github.io/Tally/). There's an `llms.txt` there that's meant to be the complete guide for an agent, so it can figure out how to use Tally on its own. The rest of the site is for humans, which feels a little backwards for a product whose user is an agent, but here we are.

---

### Your Agent Needs Software Too

People have been talking for a while about how AI makes custom software cheap enough to build just for yourself. That's true, but I think the more interesting version is building software for your agent. When a skill can't get Claude where you want it, because the tools underneath were made for people, you can just make it a better tool. It took me an afternoon and a movie.

I'd love to hear what you'd build for your own agent, or if you've already built something like this. Let me know!
