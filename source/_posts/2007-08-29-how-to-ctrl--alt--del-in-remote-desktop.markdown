---
layout: post
title: "How-To: Ctrl + Alt + Del in Remote Desktop"
date: 2007-08-29 12:11
comments: true
categories:
---
I’m a fan of [Microsoft’s Remote Desktop][rdp]; it’s built into
Windows and allows me to quickly and easily administer a remote box from
the comfort of my own work station. I use it at my house to administer
the headless servers on my home network, the [Subtext][subtext] build
server, and the co-located [VelocIT][veloc-it] servers.

### Gotta’ love that magic!

{% img left /images/posts/virtual-pc-ctrl-alt-del.png "Ctrl + Alt + Del in Virtual PC" %}

Today a [co-worker][micah] asked me how to send the infamous `Control + Alt +
Delete` keystroke combination to a machine he was working on via <abbr
title="Remote Display (or Desktop) Protocol">RDP</abbr>. This is a pretty
common keystroke to use when trying administer windows… it does have uses other
than just killing the box.

With [Virtual PC][virtualpc] there is menu item to send the keystrokes on to the
virtual box. Go to the *Action* menu and select the `Ctrl + Alt + Del`
option.

### And with Remote Desktop?

{% img right /images/posts/ctrl-alt-del.gif "The only keyboard you'll ever need" %}

Well it’s not quite as obvious. Actually it’s not an obvious solution at all…
hell it might not even be documented!

*For the record, since I already knew the answer I decided to be lazy
and didn’t bother to search the tubes for any official documentation.*

To send the `Ctrl + Alt + Del` keystroke combination via RDP you actually need
to use...

`Ctrl + Alt + End`

WTF? _That_ sure is intuitive!

  [rdp]: http://en.wikipedia.org/wiki/Remote_Desktop_Protocol "Remote Desktop Protocol"
  [subtext]: http://subtextproject.com "Subtext Project"
  [veloc-it]: http://veloc-it.com "VelocIT - We Deliver IT"
  [micah]: http://www.micahdylan.com/ "Micah Dylan"
  [virtualpc]: http://www.microsoft.com/windows/products/winfamily/virtualpc/ "Microsoft Virtual PC"
