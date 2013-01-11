From: Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>
Subject: Re: [PATCH] prctl.2: PR_{SET,GET}_CHILD_SUBREAPER
Date: Fri, 11 Jan 2013 17:00:47 +0100
Message-ID: <20130111160047.GA30380@tango.0pointer.de>
References: <1344233940-2680-4-git-send-email-shawnlandden@gmail.com>
 <50240ad3.6ae4440a.5977.ffffc0ce@mx.google.com>
 <CAKgNAkj3=v7uYEj7EBYnEbAJU6E_9Vh6Civn-VLWXsjJgJ=QSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkj3=v7uYEj7EBYnEbAJU6E_9Vh6Civn-VLWXsjJgJ=QSA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kay Sievers <kay-tD+1rO4QERM@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, 10.01.13 23:51, Michael Kerrisk (man-pages) (mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org) wrote:


Hey, 

sorry for never doing the doc work! Here are my comments:

> > +.BR PR_SET_CHILD_SUBREAPER " (since Linux 3.3)"
> > +Sets a process, such as a service manager, such that orphan (double-forking)
> > +child processes re-parent to this process instead of
> > +.BR init (8).

I don't like this reference to "double-forking" here. After all, this
also applies to triple-forking, quadruple-forking and even
quintuple-forking... ;-)

Expressing this is difficult, but here's my try:

"Enables that the process becomes a 'subreaper' for all its (immediate
or indirect) offspring processes. Any process whose immediate parent
dies and whose ancestry includes a process where this flag is set will
be reparented to the closest process with this flag set, instead of PID
1. A 'subreaper' hence receives SIGHCLD signals for any orphaned
offspring processes, that otherwise would be received by the init
process."

> > +The service manager
> > +is able to receive
> > +.B SIGCHLD
> > +signals and is able to investigate the process until
> > +it calls
> > +.BR wait (2).

Drop this.

> > +All children of this process will inherit a flag if they should
> > +look for a child_subreaper process at exit. Set

This bit should go, it's an inplementation detail, als Kay already
pointed out.

> > +.I arg2
> > +to 1 or 0 to enable or disable, respectively.
> > +.TP
> > +.BR PR_GET_CHILD_SUBREAPER " (since Linux 3.3)"
> > +Returns whether calling process is a child subreaper (see
> > +.BR PR_SET_CHILD_SUBREAPER ),
> > +in the location pointed to by
> > +.IR "(int\ *) arg2" .
> > +.TP
> >  .BR PR_SET_SECUREBITS " (since Linux 2.6.26)"
> >  Set the "securebits" flags of the calling thread to the value supplied in
> >  .IR arg2 .
> >

Otherwise sounds good.

Lennart

-- 
Lennart Poettering - Red Hat, Inc.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
