From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [patch] Document fork() behaviour for the Linux native AIO
	io_context
Date: Mon, 27 Apr 2009 17:31:36 +1200
Message-ID: <cfd18e0f0904262231sa4ac502r59d484190da05a7d@mail.gmail.com>
References: <x49r5zvxgsg.fsf@segfault.boston.devel.redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <x49r5zvxgsg.fsf-RRHT56Q3PSP4kTEheFKJxxDDeQx5vsVwAInAS/Ez/D0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, zach.brown-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Jeff,

On Wed, Apr 15, 2009 at 5:54 AM, Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Hi,
>
> It was noted on lkml that the fork behaviour is documented for the po=
six
> AIO calls, but not for the Linux native calls. =A0Here is a patch whi=
ch
> adds a small blurb that folks will hopefully find useful.
>
> Signed-off-by: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>
> Upon fork, the child process does not inherit the io_context_t data s=
tructures
> returned by io_setup, and thus cannot submit further asynchronous I/O=
 or
> reap event completions for said contexts.

Thanks.  I tweaked that very slightly, and have applied for man-pages-3=
=2E22.

Cheers,

Michael

--- a/man2/fork.2
+++ b/man2/fork.2
@@ -83,7 +83,9 @@ The child does not inherit timers from its parent
 The child does not inherit outstanding asynchronous I/O operations
 from its parent
 .RB ( aio_read (3),
-.BR aio_write (3)).
+.BR aio_write (3)),
+nor does it inherit outstanding asynchronous I/O context from its pare=
nt
+.RB ( io_setup (2)).
 .PP
 The process attributes in the preceding list are all specified
 in POSIX.1-2001.



> diff --git a/man2/fork.2 b/man2/fork.2
> index ce93b3e..fb9008e 100644
> --- a/man2/fork.2
> +++ b/man2/fork.2
> @@ -83,7 +83,9 @@ The child does not inherit timers from its parent
> =A0The child does not inherit outstanding asynchronous I/O operations
> =A0from its parent
> =A0.RB ( aio_read (3),
> -.BR aio_write (3)).
> +.BR aio_write (3)),
> +nor does it inherit the asynchronous io_context returned by
> +.BR io_setup (2).
> =A0.PP
> =A0The process attributes in the preceding list are all specified
> =A0in POSIX.1-2001.
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
=46ound a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
