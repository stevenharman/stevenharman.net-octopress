
---
layout: post
title: "From Testing to Test First to Test Driven"
date: 2012-05-08 11:16
comments: true
categories:
---

When I started writing tests, around 2005, using JUnit, I was stoked just to
have the tests.

When I started writing tests first, around 2006, I was excited because I was
"doing the TDD."

A couple of years later I found that writing tests was getting really painful.
Painful because they were so damn hard to set up, and painful because I had to
wait minutes for the test suite to run. I reacted to that pain and started to
change my tests. My tests got faster, but they were still painful.

At some point I realized the root cause of the pain was not the tests
themselves, but the design of the code under test. I had been doing Test-first
development, not Test-driven design. This all became clear to me in 2008, while
talking with [Corey Haines][corey] about test pain, object oriented design, and
"listening" to the former to influence the latter.

Over the past few years my ideas one how to drive design by listening to tests
has solidified and been reaffirmed by talking and listening to
other [fast test fanatics][das].

Rails has helped to jump-start this process for many; I see a lot of folks in
the Rails community get started where I was in 2005 or 2006, and many are
starting to feel some pain. The next step is to become more aware of that pain;
lower your pain threshold and then make it stop hurting!

It was by no means an overnight thing. It literally took years of work for me
to figure this out, but I hope by putting my experience out there, yours can be
better, faster, MOAR!

[corey]: http://coreyhaines.com/ "The Software Journeyman"
[das]: https://www.destroyallsoftware.com/screencasts "Screencasts for Serious Developers"
