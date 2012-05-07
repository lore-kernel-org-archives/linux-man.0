From: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: aio manuals
Date: Mon, 07 May 2012 17:21:29 -0400
Message-ID: <x49havrsn52.fsf@segfault.boston.devel.redhat.com>
References: <20110309180600.GA14533@saboteur.suse.cz>
	<x49ei6gnpsx.fsf@segfault.boston.devel.redhat.com>
	<20110316104356.GB32095@saboteur.suse.cz>
	<x49pqpr9m5l.fsf@segfault.boston.devel.redhat.com>
	<20110316152018.GG2096@saboteur.suse.cz>
	<20111013082918.GA17800@saboteur.suse.cz>
	<CAKgNAkj68CwJFkqYNvz5X5Jt+6xTwVb1eR+vSkXmFYorQvHJ5A@mail.gmail.com>
	<x4962c8t8b8.fsf@segfault.boston.devel.redhat.com>
	<CAKgNAkjZS0VyV4y6P-NyrLv8_a8G2K6=yFPijef3d3wfQuPwXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjZS0VyV4y6P-NyrLv8_a8G2K6=yFPijef3d3wfQuPwXw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Michael Kerrisk's message of "Tue, 8 May 2012 09:14:23 +1200")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

"Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> Here's what I think should be done:
>
> 1) For io_submit, io_cancel, io_getevents, io_destroy, io_setup:
>
> a) There should be .2 pages provided by man-pages that document the
> raw system calls. These pages need a bit of cleaning up. These pages
> should be updated to focus on the system calls, and note the existence
> of libaio and the existence of the wrappers it provides.
>
> b) There should be .3 pages provided by libaio. (The pages should be
> provided by libaio, because that's the library that implements them.
> If those wrappers were in glibc, then I'd have said that man-pages
> should provide them.) Since the wrappers are mostly very thin, I think
> it would be sufficient to have very short man pages that:
> - note the need to link with "-laio"
> - document io_context_t versus aio_context_t
> - refer the reader to the corresponding .2 page for details of behavior.
>
> 2) For the other io_* functions provided by libaio:
>
> a) libaio should provide man pages. (And this seems already to be the case.)
>
> 3) For the aio_* and lio_listio functions:
>
> a) The right place to document these is man-pages, since they are
> glibc interfaces, not libaio interfaces. man-pages already has such
> pages.
>
> b) The versions of these man pages in libaio should be dropped. The
> pages seem to be unmaintained, and they describe interfaces that are
> not even part of libaio. Along the way, we should check if there are
> pieces in the libaio pages that could usefully be added to the
> corresponding man-pages pages.
>
> How does the above sound?

Sounds like a plan.  I'll clean this up in the coming weeks, if nobody
beats me to it.

Cheers,
Jeff
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
