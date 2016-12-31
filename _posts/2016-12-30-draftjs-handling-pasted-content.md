---
title: Handling Pasted Content in Draft.js
tags: [react, javascript, draftjs]
permalink: /blog/draftjs-handling-pasted-content
blurb: "For those times when you can't just let users go around pasting whatever they want."
description: "Sometimes you've got to be a control freak. For those times, use Draft.js's handlePastedText hook for fine grain control over pasted content."
metaname: Handling Pasted Content in Draft.js
image: draftjs-handling-pasted-content/draftjs.png
---
We use React for our client code at [Blue Matador](https://www.bluematador.com). A while ago, I needed to implement a text box for querying log entries (Blue Matador offers a centralized log management solution) and I wanted to highlight certain pieces of the query. Enter [Draft.js](https://facebook.github.io/draft-js/), Facebook's rich text editor framework.

![Draft.js](/assets/img/draftjs-handling-pasted-content/draftjs.png)

I won't go into the details about what Draft.js is ([their website](https://facebook.github.io/draft-js/) takes care of that), but I ran into a situation where users pasting in log entry data they got out of the viewer into the query box got some weird looking results because of HTML formatting:

![Not Ideal](/assets/img/draftjs-handling-pasted-content/notideal.png)

As I looked for a way to get better control over what the pasted values would look like, I ran across a function called `handlePastedText` in `Editor`'s props. It turned out to be exactly what I needed, but I couldn't seem to find any examples of using it. So here's one I created (with Flow type annotations):

{% highlight javascript %}
class ControllingEditor extends React.Component {
  render = (): React.Element<*> => {
    return (
      ...
      <Editor
        ...
        handlePastedText={this.handlePastedText}
      />
    );
  }

  handlePastedText = (text: string, html?: string): boolean => {
    // if they try to paste something they shouldn't let's handle it
    if (text.indexOf('text that should not be pasted') != -1) {

      // we'll add a message for the offending user to the editor state
      const newContent = Modifier.insertText(
        this.state.editorState.getCurrentContent(),
        this.state.editorState.getSelection(),
        'nice try, chump!'
      );

      // update our state with the new editor content
      this.onChange(EditorState.push(
        this.state.editorState,
        newContent,
        'insert-characters'
      ));
      return true;
    } else {
      return false;
    }
  }
}
{% endhighlight %}

`handlePastedText` takes two parameters:

* the plain text that the user pasted
* an HTML string as its second parameter if the text the user pasted was copied from HTML

Returning `true` tells Draft.js that you've handled the pasted text and it will take no further action. Returning `false` tells Draft.js to take the action it would have taken if `handlePastedText` hadn't been called. It's a simple mechanism, but gives you a lot of power over pasted content.
