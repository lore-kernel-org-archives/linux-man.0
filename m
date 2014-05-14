From: Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: [PATCH 1/1 v2] fanotify.7: BUGS, error handling in fanotify_read
Date: Wed, 14 May 2014 22:54:04 +0200
Message-ID: <20140514205404.GA18511@quack.suse.cz>
References: <5373ADF9.4020505@bfs.de>
 <1400091016-17670-1-git-send-email-xypron.glpk@gmx.de>
 <CAKgNAki6E91d+GJnev5UWc4KPuXSTCnPnXE56fsDtoRerUS3jg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAki6E91d+GJnev5UWc4KPuXSTCnPnXE56fsDtoRerUS3jg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>, Eric Paris <eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

  Hello,

On Wed 14-05-14 20:52:12, Michael Kerrisk (man-pages) wrote:
> Do you have any comments/additions for this man-pages patch?
  No, it looks good to me. 

								Honza

> On Wed, May 14, 2014 at 8:10 PM, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org> wrote:
> > The patch in
> > http://www.spinics.net/lists/linux-man/msg05589.html
> > was not accepted.
> >
> > Michael Kerrisk suggested in a private mail to add a comment
> > in the BUGS section.
> >
> > Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> > ---
> >  man7/fanotify.7 | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/man7/fanotify.7 b/man7/fanotify.7
> > index 2a92908..c6cec7c 100644
> > --- a/man7/fanotify.7
> > +++ b/man7/fanotify.7
> > @@ -164,7 +164,7 @@ so that multiple events can be retrieved by a single
> >  The return value of
> >  .BR read (2)
> >  is the number of bytes placed in the buffer,
> > -or \-1 in case of an error.
> > +or \-1 in case of an error (but see BUGS).
> >
> >  The fields of the
> >  .I fanotify_event_metadata
> > @@ -468,7 +468,7 @@ The event queue can overflow.
> >  In this case, events are lost.
> >  .SH BUGS
> >  As of Linux 3.15,
> > -the following bug exists:
> > +the following bugs exists:
> >  .IP * 3
> >  .\" FIXME: A patch was proposed.
> >  When an event is generated,
> > @@ -478,6 +478,16 @@ before passing a file descriptor for that file.
> >  This poses a security risk, when the
> >  .B CAP_SYS_ADMIN
> >  capability is set for programs executed by unprivileged users.
> > +.IP *
> > +If a call to
> > +.BR read( 2 )
> > +processes multiple events from the fanotify queue and an error occurs, the
> > +return value will be the cumulated length of the events successfully copied to
> > +the user space buffer before the error occured.
> > +The return value will not be \-1.
> > +.I errno
> > +will not be set.
> > +Thus, the user program has no way to detect the error.
> >  .SH EXAMPLE
> >  The following program demonstrates the usage of the fanotify API.
> >  It marks the mount point passed as a command-line argument
> > --
> > 2.0.0.rc0
> >
> 
> 
> 
> -- 
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/
-- 
Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
SUSE Labs, CR
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
