From: Eric Paris <eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/1] Man pages for the fanotify API
Date: Wed, 26 Mar 2014 15:09:01 -0400
Message-ID: <1395860941.24733.20.camel@flatline.rdu.redhat.com>
References: <53271880.4090100@gmail.com>
	 <1395506528-10026-1-git-send-email-xypron.glpk@gmx.de>
	 <5330A257.9080100@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5330A257.9080100-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: xypron.glpk-Mmb7MZpHnFY@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org, james.hunt-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, 2014-03-24 at 22:23 +0100, Michael Kerrisk (man-pages) wrote:
> [Eric-- heads up. I'm pretty sure there's a bug in the fanotify API.
> See the discussion of FAN_MARK_FLUSH below.]
> 
> 
> Hello Heinrich,
> 
> Many more comments below. Sorry, but this is a complex API, and 
> there are many corner cases to consider....
> 
> ==
> 
> Some of my past comments seem to have got dropped. Rather than just
> sending me a new draft of the page, could you also answer / comment 
> on each of the substantial points/questions in this mail (could be
> as simple as saying "fixed in new draft"), then I am able to
> know what questions remain open.
> 
> Some of my substantial points are at the top of this mail, others 
> are listed below.
> 
> ==
> 
> What permissions does one need on a file to watch it with
> fanotify? That should be documented.

CAP_SYS_ADMIN   that's all you need...

Some question just came up about if this is what we want (probably not),
but that's all the perms you need.

> 
> ==
> 
> The pages say nothing about merging of events. Merging can happen
> for non-permission events, but not for permission events.
> Something needs to be said about this, probably in fanotify(7)
> If you are unsure of what I mean, just add the following in
> fanotify(7)
> 
> .\" FIXME Document merging of events
> 
> ==
> 
> The discussion of monitoring of directories could be clearer.
> To begin with, it wasn't immediately obvious from reading the
> page whether one could monitor children of a directory. See the 
> text in fanotify_mark.2 for FAN_MARK_MOUNT.  The discussion of 
> FAN_ONDIR/FAN_EVENT_ON_CHILD should say somethingsimilar, noting 
> that FAN_ONDIR on its own gives just monitoring of directories; 
> to monitor children you need  FAN_ONDIR | FAN_EVENT_ON_CHILD.
> 
> And some questions. If I monitor a directory ("xxx") and its 
> children, creating, modifying, and deleting files in that directory 
> generates events as I'd expect. But, if I create a subdirectory 
> ("xxx/yyy") in that directory, it does not generate an event, and
> creating objects in that subdirectory also does not generate events
> (i.e., unlike with mount points, monitoring directories is not truly
> recursive). Are both of these points correct? If yes, they need 
> to be documented in the man page. (rmdir() of the subdirectory
> also seems not to generate an event.)
> 
> On the other hand, open() and close() of the subdir xxx/yyy 
> DO generate events. Strange. What is the rationale, for generating
> events there, but not on mkdir()/rmdir(), do you know? 
> 
> And, given the above state of affairs, is it possible to reliably
> monitor an entire directory subtree (that is not a mount point)?
> The lack of mkdir(2)/rmdir(2) notification seems to make that task
> difficult or, probably, impossible to do reliably. If it is
> possible, the man page should explain how. If it is not pssible, 
> the fanotify(7) page should say so explicitly, and I'd be inclined
> to put it under the heading BUGS.
> 
> fanotify(7) should also mention that fanotify() doesn't detect 
> file deletions (unlink(2)) and renames (rename()). Again, 
> I'd put this under BUGS.

I think you are correct.  fanotify does not provide
link()/unlink()/rename()/mkdir()/rmdir() notification.  Noting this is a
good idea.  Calling it a 'bug' is questionable, but not not a big deal
to me...

> I asked this earlier (in a different wording), but it seems not to have 
> been addressed:
> 
>     What happens if the application hits its file descriptor limit
>     (RLIMIT_NOFILES) when handling read()s from the FAN FD? (EMFILE).
> 
> This needs to be covered under the errors for read(2).
> 
> And now I think of a related question: what if we hit the system-wide
> limit on the number of open files (/proc/sys/fs/file-max)? (I suspect 
> ENFILE.)
> 
> And yet another related question: what if the file in question
> is being executed? In this case, we can't get an ETXTBUSY from read().

I don't honestly remember...


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
