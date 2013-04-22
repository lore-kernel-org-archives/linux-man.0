From: chrubis-AlSwsSmVLrQ@public.gmane.org
Subject: Re: [PATCH 4/4] io_setup.2: clarify nr_events
Date: Mon, 22 Apr 2013 15:08:28 +0200
Message-ID: <20130422130827.GA3975@rei>
References: <1365104218-26042-1-git-send-email-jmoyer@redhat.com>
 <1365104218-26042-5-git-send-email-jmoyer@redhat.com>
 <CAKgNAkhGAiDETDcQSFhYNCqJgbRH20SVHfV4=osW9=xAr1Zk4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkhGAiDETDcQSFhYNCqJgbRH20SVHfV4=osW9=xAr1Zk4Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi!
> > Signed-off-by: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > ---
> >  man2/io_setup.2 |    5 +++--
> >  1 files changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/man2/io_setup.2 b/man2/io_setup.2
> > index 2a541bf..8527b80 100644
> > --- a/man2/io_setup.2
> > +++ b/man2/io_setup.2
> > @@ -21,7 +21,7 @@ There is no glibc wrapper for this system call; see NOTES.
> >  The
> >  .BR io_setup ()
> >  system call
> > -creates an asynchronous I/O context capable of receiving
> > +creates an asynchronous I/O context capable of concurrently processing
> >  at least \fInr_events\fP.
> >  The
> >  .I ctx_idp
> > @@ -37,7 +37,8 @@ For the failure return, see NOTES.
> >  .SH ERRORS
> >  .TP
> >  .B EAGAIN
> > -The specified \fInr_events\fP exceeds the user's limit of available events.
> > +The specified \fInr_events\fP exceeds the user's limit of available events,
> > +as defined in /proc/sys/fs/aio-max-nr.
> >  .TP
> >  .B EFAULT
> >  An invalid pointer is passed for \fIctx_idp\fP.

I've pulled the man pages git and started to work on the aio manpages
and noticed that there is (for some strange reason) double 'of' added by
this patch, see trivial patch to fix that bellow.

diff --git a/man2/io_setup.2 b/man2/io_setup.2
index 81b9a8b..549495a 100644
--- a/man2/io_setup.2
+++ b/man2/io_setup.2
@@ -21,7 +21,7 @@ There is no glibc wrapper for this system call; see NOTES.
 The
 .BR io_setup ()
 system call
-creates an asynchronous I/O context capable of of concurrently processing
+creates an asynchronous I/O context capable of concurrently processing
 at least \fInr_events\fP.
 The
 .I ctx_idp

-- 
Cyril Hrubis
chrubis-AlSwsSmVLrQ@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
