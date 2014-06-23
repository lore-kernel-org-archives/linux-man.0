From: "Heinrich Schuchardt" <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 1/1 v2] inotify.7: Bug 77111 - watch descriptor reuse
Date: Mon, 23 Jun 2014 11:45:49 +0200
Message-ID: <trinity-31079439-24e4-4fa8-a1bd-88d99d3e7aab-1403516749332@msvc010>
References: <538883D9.5090709@gmail.com>
 <1403448323-13459-1-git-send-email-xypron.glpk@gmx.de>,
 <53A7E39C.7050505@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53A7E39C.7050505-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Paris <eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jeff Smitth <jsmith.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Michael,

the further descripton is fine for me. Please, integrate it into the inotify(7) page.

Best regards

Heinrich Schuchardt

Am 23.06.14 um 10:21 schrieb Michael Kerrisk (man-pages)

> On 06/22/2014 04:45 PM, Heinrich Schuchardt wrote:
> 
> > The revised patch below uses the wording suggested by Michael Kerrisk.
> 
> > 
> 
> > ***
> 
> > 
> 
> > Watch descriptor IDs are returned by inotify_add_watch.
> 
> > When calling inotify_rm_watch an IN_IGNORE is placed on the inotify queue
> 
> > pointing to the ID of the removed watch.
> 
> > 
> 
> > inotify_add_watch should not return a watch descriptor ID for which events are
> 
> > still on the queue but should return an unused ID.
> 
> > 
> 
> > Unfortunately the existing Kernel code does not provide such a guarantee.
> 
> > 
> 
> > Actually in rare cases watch descriptor IDs are returned by inotify_add_watch
> 
> > for which events are still on the inotify queue.
> 
> > 
> 
> > cf. https://bugzilla.kernel.org/show_bug.cgi?id=77111
> 
> > 
> 
> > Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> 
> > ---
> 
> >  man7/inotify.7 | 18 ++++++++++++++++++
> 
> >  1 file changed, 18 insertions(+)
> 
> > 
> 
> > diff --git a/man7/inotify.7 b/man7/inotify.7
> 
> > index 1fc83f8..d64523f 100644
> 
> > --- a/man7/inotify.7
> 
> > +++ b/man7/inotify.7
> 
> > @@ -754,6 +754,24 @@ if the older had not yet been read)
> 
> >  instead checked if the most recent event could be coalesced with the
> 
> >  .I oldest
> 
> >  unread event.
> 
> > +
> 
> > +As of Linux 3.15.1, the following bug exists:
> 
> > +.\" FIXME https://bugzilla.kernel.org/show_bug.cgi?id=77111
> 
> > +When a watch descriptor is removed by calling
> 
> > +.BR inotify_rm_watch (2),
> 
> > +any pending unread events for that watch descriptor remain available to read.
> 
> > +As watch descriptors are subsequently allocated with
> 
> > +.BR inotify_add_watch (2),
> 
> > +the kernel cycles through the range of possible watch descriptors (0 to
> 
> > +.BR INT_MAX )
> 
> > +incrementally.
> 
> > +When allocating a free watch descriptor, no check is made to see whether that
> 
> > +watch descriptor number has any pending unread events in the inotify queue.
> 
> > +Thus, it can happen that a watch descriptor is reallocated even
> 
> > +when pending unread events exist for a previous incarnation of
> 
> > +that watch descriptor number, with the result that the application
> 
> > +might then read those events and interpret them as belonging to 
> 
> > +the file associated with the newly recycled watch descriptor.
> 
> >  .SH EXAMPLE
> 
> >  The following program demonstrates the usage of the inotify API.
> 
> >  It marks the directories passed as a command-line arguments
> 
> 
> 
> Thanks, Heinrich. Applied with some minor tweaks, and pushed to 
> 
> kernel.org Git. 
> 
> 
> 
> I also added this piece:
> 
> 
> 
> [[
> 
> In practice, the likelihood of hitting this bug may be extremely low,
> 
> since it requires that an application cycle through
> 
> .B INT_MAX
> 
> watch descriptors,
> 
> release a watch descriptor while leaving unread events for that
> 
> watch descriptor in the queue in the queue,
> 
> and then recycle that watch descriptor.
> 
> For this reason, and because there have been no reports
> 
> of the bug occurring in real-world applications,
> 
> as of Linux 3.15,
> 
> .\" FIXME https://bugzilla.kernel.org/show_bug.cgi?id=77111
> 
> no kernel changes have yet been made to eliminate this possible bug.
> 
> ]]
> 
> 
> 
> Okay?
> 
> 
> 
> Cheers,
> 
> 
> 
> Michael
> 
> 
> 
> 
> 
> -- 
> 
> Michael Kerrisk
> 
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> 
> Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
