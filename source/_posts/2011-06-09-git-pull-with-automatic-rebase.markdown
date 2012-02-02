---
layout: post
title: "Git Pull with Automatic Rebase"
date: 2011-06-09 22:57
comments: true
categories: 
---

<div class="thumbnail right"><a title="Y U NO REBASE!?!" href="https://skitch.com/stevenharman/fdhm5/y-u-no-rebase"><img class="right" title="Y U NO REBASE!?!" alt="y-u-no-rebase" src="https://img.skitch.com/20110609-jhy91eh42t193wquj6ryi91ura.preview.jpg" /></a>     <br /><span class="smallnote">Uploaded with <a href="http://skitch.com">Skitch</a>!</span></div>  <p>To rebase, or not to rebase… for me its not really a question. I generally prefer a clean, linear commit history. Why? Because merge bubbles make history confusing, noisy, break <code>git bisect</code>.</p>  <p>Don’t believe me? Check out the pretty log to the right. See all those merge bubbles in there? <em>Eww!</em></p>  <h3>The Why?</h3>  <p>The workflow that caused those merges was as follows:</p>  <ol>   <li><code>git pull</code> (to bring local up to date) </li>    <li><em>hackity-hack</em> </li>    <li><code>git commit</code> </li>    <li><code>git pull</code> </li>    <li><code>git push</code> </li> </ol>  <p>By default <code>git pull</code> will fetch any new commits from the remote, and then merge any local changes in, resulting in the merge bubbles.</p>  <h3>A better approach</h3>  <p>I typically use the same workflow as above with one tweak. Rather than <code>git pull</code>, I use <code>git pull --rebase</code>, which will fetch the remote commits, and rebase your commits on top of the new commits from the remote. This is the “re-writing” of history folks often talk about.</p>  <h3>Make it better, automatically!</h3>  <p>You can tell git to use rebase, rather than merge, in one of two ways, depending on your situation.</p>  <p>To have all future branches automatically use rebase</p>  <div class="csharpcode">   <pre class="alt">$ git config branch.autosetuprebase always</pre>
</div>

<p>You can add the <code>--global</code> switch to have all future branches, in all repositories on this machine, behave this way.</p>

<p>If, however, you have an existing branch, you’ll need</p>

<div class="csharpcode">
  <pre class="alt">$ git config branch.<em>branch-name</em>.rebase true</pre>
</div>

<h3>Get more info</h3>

<p>Be sure to check out the <a title="git-config Manual Page" href="http://www.kernel.org/pub/software/scm/git/docs/git-config.html" rel="external">git man pages</a> for more info on what those options mean and when you may or may not want to use them. </p>

<p>You might also want to check out my <a title="Git Workflows" href="https://github.com/stevenharman/git-workflows" rel="external">Git Workflows repository on The GitHubs</a> where you can find a Keynote presentation (or PDF in the Downloads) explaining <code>git rebase</code> vs. <code>git merge</code>. Complete with pictures!</p>
