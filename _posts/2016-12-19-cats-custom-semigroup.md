---
title: How to Create Cats Semigroups for Custom Classes
tags: [scala, cats]
permalink: /blog/cats-semigroup-custom-classes
blurb: "The answer is simple, but not finding an answer in 2 pages of Google results is unacceptable."
description: "Cats's documentation is great. It explains the majesty of Semigroups and how to use them. It just doesn't tell me how to turn my own classes into Semigroups."
metaname: How to Create Cats Semigroups for Custom Classes
image: cats-semigroup-custom-classes/cats.png
---

After much cajoling, a friend of mine finally convinced me to use [Cats](http://typelevel.org/cats/). I should have done it a long time ago to up my Scala proficiency.

It's a cool library, and the documentation is really good for people who don't already know Scalaz or Haskell. I've started with the [documentation on Semigroups](http://typelevel.org/cats/typeclasses/semigroup.html) and loved the brevity that they made possible. However, I eventually wanted to call `combine` on some of my owns classes, and the documentation didn't explain how.

I suppose that most typical hardcore Scala programmers know the type class pattern well that it was obvious how to use Semigroups in this way, but I wasn't quite sure, and Google wasn't helping. Turns out you just need an implicit `Semigroup[CustomClass]` in scope to use the Semigroup methods with your custom class. Here's how I did it:

{% highlight scala %}
// CustomClass.scala
import cats.Semigroup

case class CustomClass(value: Int)

trait CustomClassSemigroupImpl extends Semigroup[CustomClass] {
  def combine(first: CustomClass, second: CustomClass): CustomClass = copy(
    value = first.value + second.value
  )
}

trait CustomClassSemigroup {
  implicit object customClassSemigroupImpl extends CustomClassSemigroupImpl
}

// package.scala
package custom extends CustomClassSemigroup
{% endhighlight %}

In this example, `CustomClassSemigroupImpl` implements Semigroup for `CustomClass`. I then create an implicit object that extends `CustomClassSemigroup` on the package object so that when I `import custom._`, I'm able to use `Semigroup[CustomClass]`.

So there it is. Pretty simple, and this approach can be used with the other type classes in Cats.
