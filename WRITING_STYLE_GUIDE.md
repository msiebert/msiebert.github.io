# Mark Siebert's Blog Writing Style Guide

This document describes the writing style and patterns observed across Mark Siebert's blog posts on Binary Nirvana (msiebert.github.io). Use this as a reference when writing blog posts to match the existing voice and style.

## Overall Voice & Tone

**Conversational and Personal**
- Write in first-person ("I", "my", "we")
- Start posts with personal context or a problem you encountered
- Be approachable and relatable, not overly formal
- Show personality through honest reactions and admissions

**Technical but Accessible**
- Explain complex topics in straightforward language
- Don't assume too much prior knowledge
- Balance technical depth with readability
- It's okay to admit when something was harder than expected

**Self-Aware Humor**
- Use humor sparingly but effectively
- Self-deprecating remarks work well (e.g., "I'm a backend developer by trade and haven't had much practice making things that look nice")
- Add asterisk footnotes for humorous qualifications (e.g., "I'll never install Ruby again*!" with "*Unless, of course, I need to.")
- Parenthetical asides that add wit or context

## Post Structure

### Title
- Clear and descriptive
- Should tell readers exactly what they'll learn
- Use action words when appropriate
- Examples:
  - "How to Create Cats Semigroups for Custom Classes"
  - "Handling Pasted Content in Draft.js"
  - "Snowflake Python UDF with List Params"

### Opening (First 1-3 paragraphs)
- Start with personal context or a specific problem
- Explain why you needed to solve this
- Set up the "story" of the post
- Common patterns:
  - "I recently [did something] and needed to [solve problem]..."
  - "After much cajoling, a friend convinced me to..."
  - "This week at work, I was helping..."
  - "Every October, my wife and I..."

### Body
- Problem-solution structure
- Use numbered or bulleted lists for steps
- Include code examples with proper syntax highlighting
- Add images to break up text and illustrate points
- Explain the "why" not just the "how"
- Call out important details (e.g., "It's especially important to note...")

### Closing
- Keep it brief
- Often includes:
  - Invitation for feedback ("Let me know if you have any questions")
  - Reflection on the experience
  - Links to resources or repos
  - Updates if you learned something new later

### Updates
- Add updates at the end with clear demarcation
- Format: `***Update: [Date]***` or `***Update***`
- Show willingness to incorporate feedback and improvements

## Writing Patterns & Phrases

### Common Opening Phrases
- "I recently..."
- "After much [action], I..."
- "This week at work..."
- "So I did it. After [time period] of..."

### Transitional Language
- "Turns out..."
- "However..."
- "So here's..."
- "That's it!"
- "Pretty cool stuff."

### Explanatory Patterns
- "Here's what we're trying to mimic..."
- "Essentially..."
- "In this example..."
- "For now, don't worry about..."
- "Once again..."
- "Finally, it's time to..."

### Honest Admissions
- "I suppose that most typical [X] know [Y], but I wasn't quite sure"
- "It was hard enough to even come up with..."
- "It's not entirely clear..."
- "This was probably the part that worked most poorly..."

## Code & Technical Content

### Code Examples
- Use proper syntax highlighting (Jekyll Liquid tags)
- Add comments to explain non-obvious parts
- Show both the "before" and "after" when relevant
- Include import statements and full context
- Break down complex examples into digestible chunks

### Technical Explanations
- Define terms when first introducing them
- Use metaphors or analogies when helpful
- Break down complex concepts step-by-step
- Acknowledge when documentation elsewhere is lacking

### Problem-Solving Approach
1. Describe the problem
2. Explain what you tried
3. Show the solution
4. Explain why it works
5. Provide the full working example

## Metadata & Front Matter

### Blurb
- Casual and conversational
- Often includes personality
- Examples:
  - "Just in case you, like me, needed one."
  - "For those times when you can't just let users go around pasting whatever they want."
  - "Can an LLM create a convincing mystery for nerds like me?"

### Description
- More straightforward than blurb
- Explains what the post covers
- Can be slightly informal

### Tags
- Specific and relevant (e.g., "scala", "docker", "python")
- Include framework/library names
- Keep to 2-5 tags per post

## Humor & Personality Quirks

### Parenthetical Asides
- Use parentheses to add context, humor, or side notes
- Examples:
  - "(in case you were wondering, this is it)"
  - "(imagine that, users not doing what you tell them!)"
  - "(to be honest, based only on the work I do at my job...)"
  - "(this was honestly probably slower than just copy pasting TBH)"

### Asterisk Footnotes
- Use for humorous qualifications or corrections
- Example format:
  ```
  I'll never install Ruby again*!

  * Unless, of course, I need to.
  ```

### Self-Deprecating Humor
- Poke fun at your own limitations
- Admit when you struggled with something
- Show the human side of problem-solving
- Don't overdo it - keep it light

## Common Topics & Themes

Based on existing posts, common themes include:
- Developer tooling and workflow improvements
- Solving specific technical problems
- Framework and library integrations
- Side projects and personal experiences
- Gaming on Linux
- Using AI/LLMs for creative projects

## Mistakes to Avoid

**Don't:**
- Be overly formal or academic
- Use corporate/marketing language
- Assume readers know everything
- Hide mistakes or struggles
- Write walls of text without breaks
- Skip the "why" and only explain "how"
- Use jargon without explanation

**Do:**
- Show your personality
- Admit when something was tricky
- Explain your reasoning
- Use concrete examples
- Break up long content with images or code blocks
- Link to helpful resources
- Invite feedback and discussion

## Length & Scope

**Post Length:**
- Short posts (200-400 words): Quick tips or fixes
- Medium posts (400-800 words): Tutorial-style posts
- Long posts (800-1500+ words): In-depth guides or project retrospectives

**Scope:**
- Focus on one specific problem or topic
- Provide enough context for readers to understand
- Include practical, actionable takeaways
- Don't try to cover everything - depth over breadth

## Example Sentence Structures

### Strong Opening Sentences
- "I run this blog on Github Pages."
- "After much cajoling, a friend of mine finally convinced me to use Cats."
- "We use React for our client code at Blue Matador."
- "Recently, my wife decided that she wanted to try Thomas Was Alone..."
- "Every October, my wife and I host a Harry Potter party..."

### Transition Sentences
- "Turns out someone's already done the work of..."
- "However, I recently reinstalled Ubuntu, and I didn't have Ruby."
- "So I did it."
- "That's it! We've now called a Javascript API from Scala with Scala.js!"
- "If I were to do it again, I'd probably..."

### Closing Sentences
- "Let me know if you have any questions!"
- "Hopefully this helps someone out."
- "Please let me know if you have any questions, or if I've written anything inaccurate here."
- "I highly recommend using AI for a project like this."

## Visual Elements

**Images:**
- Include relevant images to break up text
- Use technology logos when discussing tools
- Add screenshots to illustrate problems/solutions
- Alt text should be simple and descriptive
- Format: `![Description](/assets/img/folder/image.png)`

**Code Blocks:**
- Use syntax highlighting
- Format with Jekyll Liquid tags: `{% highlight language %} ... {% endhighlight %}`
- Keep examples focused and relevant
- Add comments for clarity when needed

## Writing Process Tips

1. **Start with the problem** - What were you trying to solve?
2. **Show the journey** - What did you try? What worked?
3. **Be specific** - Use concrete examples and code
4. **Add personality** - Let your voice come through
5. **Keep it practical** - Give readers something they can use
6. **Invite engagement** - Ask for feedback or questions

## Checklist for New Posts

Before publishing, ensure your post:
- [ ] Has a clear, descriptive title
- [ ] Starts with personal context or a problem
- [ ] Includes code examples (if technical)
- [ ] Has at least one image
- [ ] Explains both "how" and "why"
- [ ] Shows personality through voice
- [ ] Ends with invitation for feedback or next steps
- [ ] Has appropriate front matter (title, tags, permalink, blurb, description, image)
- [ ] Uses first-person perspective
- [ ] Breaks up long paragraphs with visual elements
- [ ] Is proofread but conversational (not overly polished)
