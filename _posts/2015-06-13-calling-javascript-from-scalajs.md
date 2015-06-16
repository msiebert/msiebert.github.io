---
title: Calling an External Javascript API from Scala.js
tags: [scala, javascript, gapi, scalajs]
permalink: /blog/calling-javascript-from-scalajs
blurb: "Scala.js and Javascript interoperability. Not as difficult as you might think."
description: "In which I show to how to call native Javascript APIs in Scala and Scala.js, using gapi.auth.authorize as an example"
metaname: Calling an External Javascript API from Scala.js
image: calling-javascript-from-scalajs/scalajs.png
---

I recently started a new project, and since I love Scala, I thought it would be cool to write the whole webapp in the language. Thanks to Scala.js, it seems like this dream will be possible. Github user `vmunier` already has [a great repo](https://github.com/vmunier/play-with-scalajs-example) that shows how to integrate Play Framework and Scala.js, so I'll refer you to that if you're looking to get started.

![Scala.js logo](/assets/img/calling-javascript-from-scalajs/scalajs.png)

Shortly after starting this project, I needed to use Google's Javascript API, and therefore also had to find out how to call Javascript from Scala.js. [Scala.js's documentation on the subject](http://www.scala-js.org/doc/calling-javascript.html) explains how to do it, but in order to more fully understand the subject, I decided I would write a more detailed explanation, as well as explain how to pass messages to the Javascript API. In this post, I will call `gapi.auth.authorize` as an example, and will be working from [Google's Drive API example](https://developers.google.com/drive/web/quickstart/quickstart-js).

Here's what we're trying to mimic with Scala.js:

{% highlight html %}
<script>
    var CLIENT_ID = 'your client id';
    var SCOPES = 'https://www.googleapis.com/auth/drive';

    /**
     * Called when the client library is loaded to start the auth flow.
     */
    function OAuthBootstrap() {
      window.setTimeout(checkAuth, 1);
    }

    /**
     * Check if the current user has authorized the application.
     */
    function checkAuth() {
      gapi.auth.authorize(
          {'client_id': CLIENT_ID, 'scope': SCOPES, 'immediate': true},
          handleAuthResult);
    }
</script>
<script type="text/javascript" src="https://apis.google.com/js/client.js?onload=OAuthBootstrap"></script>
{% endhighlight %}

Essentially, when the Google API script is loaded, we tell it to call `handleClientLoad`, which then calls `checkAuth` a second later.

The first step to making this work from Scala is to define a Scala binding for the Javascript API. We need to be able to call `gapi.auth.authorize`. Scala.js defines Javascript objects with traits, so we'll need the following:

{% highlight scala %}
import scala.scalajs.js

/**
 * Scala binding for `gapi`
 */
sealed trait Gapi extends js.Object {
  val auth: Auth = js.native
}

/**
 * Scala binding for `auth`
 */
sealed trait Auth extends js.Object {
  /**
   * Try to authorize through Google OAuth.
   *
   * @param message the message to pass to the api
   * @param callback the callback that will handle the result of the `authorize` call
   */
  def authorize(
      message: Authorize,
      callback: js.Function1[AuthorizeResult, Unit]
  ): Unit = js.native
}
{% endhighlight %}

For now, don't worry about the types on the `authorize` method. That will come later. Both of these traits extend `js.Object`, and, as such, cannot contain values or methods that are not assigned `js.native`. When compiled to Javascript, `Gapi` will be a Javascript object that has a value called `auth`, which in turn is an object that has a function called `authorize`. However, to make it possible to use these objects in the global scope, we need the following:

{% highlight scala %}
import scalajs.js.GlobalScope

package object goog extends GlobalScope {
  /**
   * Root binding for the `gapi` object
   */
  val gapi: Gapi = js.native
}
{% endhighlight %}

Having an object that extends `GlobalScope` will make it so that the members of the object represent global Javascript variables.

Next, we need to define a Scala interface for the messages passed to and from `gapi.auth.authorize`.

{% highlight scala %}
/**
 * An interface the represents the message that is passed to the `gapi.auth.authorize`
 * call.
 */
trait Authorize extends js.Object {
  val client_id: String = js.native
  val scope: String = js.native
  val immediate: Boolean = js.native
}

/**
 * The companion object to Authorize allows a Javascript object to be created with the values
 * expected by `gapi.auth.authorize`, but tries to maintain type safety for the rest of the
 * Scala codebase.
 */
object Authorize {
  /**
   * Create an instance of the Authorize message.
   * @param clientId the client id provided by google
   * @param scope the scope we're requesting permission for
   * @param immediate whether to immediately refresh the token, with no ui shown to the user
   * @return the corresponding Authorize object
   */
  def apply(clientId: String, scope: String, immediate: Boolean): Authorize = {
    js.Dynamic.literal(
      client_id = clientId,
      scope = scope,
      immediate = immediate
    ).asInstanceOf[Authorize]
  }
}

/**
 * A trait representing the result of a call to `gapi.auth.authorize`
 */
trait AuthorizeResult extends js.Object {
  val error: js.UndefOr[Boolean] = js.native
}
{% endhighlight %}

Once again, we define Javascript objects with traits. The `Authorize` trait defines the interface we use in Scala, while the companion object calls on `js.Dynamic` to create the literal Javascript object that will be used in the browser. In order to maintain the type system in Scala, we cast the dynamic object that gets created to be an instance of `Authorize`.

`AuthorizeResult` just defines a Scala interface for the response from `gapi.auth.authorize`. In the Scala binding for the `authorize` function, we see that the type of the callback is `js.Function1[AuthorizeResult, Unit]`. That means it's a Javascript function that takes one parameter (which conforms to the interface defined by `AuthorizeResult`) and returns no result.

Finally, it's time to call the API from Scala!

{% highlight scala %}
import goog.gapi
import scala.scalajs.js.timers.setTimeout
import scalajs.js.annotation.JSExport

/**
 * The OAuth object will handle authenticating with OAuth for the Google Drive API.
 */
object OAuth {
  val clientId = "YOUR ID"
  val scopes = "https://www.googleapis.com/auth/drive"

  /**
   * This function is first called when the page is first loaded. Tries to get an auth token from
   * Google.
   */
  def checkAuth(): Unit = {
    gapi.auth.authorize(Authorize(clientId, scopes, true), { data: AuthorizeResult =>
      println(data.error)
    })
  }
}

/**
 * An object provided solely to bootstrap the oauth authorization process with `gapi.auth.authorize`
 */
@JSExport("OAuthBootstrap")
object OAuthBootstrap {
  setTimeout(1000) {
    OAuth.checkAuth()
  }
}
{% endhighlight %}

The `OAuth` object is very straight forward. We just call the API as we've defined it and provide a callback function that will print out the result. We also provide an `OAuthBootstrap` object, and export it as `OAuthBootstrap` (to avoid exporting that package name to Javascript). A call in Javascript to `OAuthBootstrap()` will result in the body of this object being called. A second later, thanks to `setTimeout`, we'll call our Scala `OAuth` object's `checkAuth` method, which will, in turn, call `gapi.auth.authorize`.

That's it! We've now called a Javascript API from Scala with Scala.js! Pretty cool stuff. Please let me know if you have any questions, or if I've written anything inaccurate here.

***Update***

Sébastien made a great suggestion: when defining the Scala binding for Javascript, use the JSName annotation to avoid creating a bunch of traits (and the package object), thus, the code example above would become the following:

{% highlight scala %}
import scala.scalajs.js
import scala.scalajs.js.annotation.JSName

@JSName("gapi.auth")
object Auth extends js.Object {
  def authorize(...): Unit = js.native
}
{% endhighlight %}

Thanks to Sébastien for the help!
