---
layout: post
title: "Sensible Testing is About Sensible Design"
date: 2012-06-29 10:16
comments: true
categories:
---

If you've not yet seen [Justin Leitgeb's][justin] GoGaRuCo talk,
[Sensible Testing][sensible-testing], go check out the slides. I hope the
actual talk is posted soon; I'm sure it's more rich and full of context.

Overall I agree with most of Justin's points. However, I get the feeling that
he, like many folks, approaches testing as a method for verifying the
correctness of code. As I understand the thesis, *CUPID* is to testing what
*[SOLID][solid]*
is to design.

{% pullquote %}
While I'm not opposed to laying down some names and concepts to improve the
state of testing, I don't belive testing should be the goal. It's not about
testing. I believe {" testing is a tool to be used in guiding your design "}.
{% endpullquote %}

<!-- more -->

### An example

I realize that it's unfair to pick on sample code use in talks, but "Problem
2: Stubbing instead of mocking" provides a great illustration. Here the author
claims that we too often stub where we should be mocking. He gives the
following snippet:

{% img right /images/posts/sensible-testing-code.png "Problem 2: Stubbing instead of mocking" %}

Firstly I had to get over the use of the old RSpec 1.0-style `#stub!` and the
overly verbose `#and_return` syntax. After resetting my brain I quickly
realized the test was awkward. I re-read it a few times and then asked, "why
stub, or mock for that matter, methods on the object under test?"

### A design issue emerges

This is a design issue! The `BalanceCalculator` is doing too much work. This is
the "S" in SOLID - the Single Responsibility Principle. The friction of this
test suggests that we need to adjust the design.

For example, we could wrap the account info and account type into a cohesive
object and passed into the calculator.

### To stub or to mock?

Forgiving that design issue for now lets get back to the author's point -
should we mock or stub those methods?

The methods in question are queries. The `BalanceCalculator` presumably uses
the results of those calls to do its work. So why do we need to set an
expectation that we should call those methods? Afterall, if we don't call them
we'll not have their resulting values, so we won't be able to do the work, so
the test __should__ fail. Right?

And If we don't call those methods and the test passes, then they don't need
to be mocked nor stubbed as they aren't necessary.

So to stub or mock... how do we know when to use which?

My heuristic is that stubs are for queries and mocks are for commands. In a
very generic sense I'm talking about [Command-query separation][cqrs] applied
to testing.

### Its all design

In the end nearly everything we do is design in some sense. Testing is no
exception, and is in my opinion a much larger part of the design of software
systems that its given credit for. Or at least, I believe we should be
striving to make it so.


[justin]: http://justinleitgeb.com/
[sensible-testing]: http://justinleitgeb.com/wp-content/uploads/2012/06/SensibleTesting.pdf
[solid]: http://butunclebob.com/ArticleS.UncleBob.PrinciplesOfOod
[cqrs]: http://en.wikipedia.org/wiki/Command-query_separation