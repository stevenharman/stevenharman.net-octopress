---
layout: post
title: "Gain New Insights by Visualizing What You’ve Already Got"
date: 2010-02-24 22:32
comments: true
categories:
---

I don’t know about you, but I like pretty things. Things that engage me. Shiny things. I enjoy seeing <em>the same old thing</em> in new and interesting ways. I suppose I’m just a visual kinda’ guy.

Unfortunately, the desire for visual representation is at odds with the high bandwidth flood of information we’re subjected to these days. Even if we manage to trim the overwhelming flood of information down to a laser-focused stream, it still takes an immense amount of effort to make sense of it.

<h3>For example</h3>

For years the primary way we’ve looked at the activity or interaction within various source control management systems is via log files. Yep… plain, text-laden, indecipherable logs chock full of entries each a similitude of it’s predecessors.

<object width="560" height="315"><param name="movie" value="http://www.youtube.com/v/S_mMKXFaLaE?version=3&amp;hl=en_US&amp;rel=0"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="http://www.youtube.com/v/S_mMKXFaLaE?version=3&amp;hl=en_US&amp;rel=0" type="application/x-shockwave-flash" width="560" height="315" allowscriptaccess="always" allowfullscreen="true"></embed></object>

However, thanks to projects like <a title="Processing" href="http://processing.org/" rel="external">Processing</a> there may be a change on the horizon. Using tools of their ilk we can build exciting new ways to <em>see</em> and consume the vast seas of data we’re drowning in. By visualizing the data we are able to discover new and interesting patterns, behaviors, and insights.

<h3>An example</h3>

The video to the right is an example of one such visualization I produced using <a title="Gource - software version control visualization" href="http://code.google.com/p/gource/" rel="external">Gource</a> to analyze the Git repository of one of the product’s we’ve build at <a title="VersionOne: Simplifying Software Delivery" href="http://versionone.com/" rel="external">VersionOne</a>.

For reference, each branch (line) is a different directory containing files. Each leaf (dot) is a file, and different file types (Ruby, JavaScript, C#, etc.) have different colors. Each contributor is represented by their name and Gravatar.  The colored lines that occasionally connect a contributor to a file are color coded to represent adds (green), changes (orange) and deletes (red).

A few interesting things this visualization leads me to think about are

- how much churn happens in various parts of the code base?
- where are we spending time?
- is new-feature work well isolated? (perhaps an indicator of composition)
- are there <em>specialists</em> within the team?

Do any interesting things pop to mind when you watch the video? Let me know by leaving a comment.
