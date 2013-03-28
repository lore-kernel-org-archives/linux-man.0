From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] man: Add io_setup.3 and io_destroy.3
Date: Thu, 28 Mar 2013 10:15:35 +0100
Message-ID: <CAKgNAkgUN7y8j2Gp8sG6hvHMJ=YBV3FGWg=EYj5X1Fg+njNysA@mail.gmail.com>
References: <20130326170626.GA11360@rei.suse.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130326170626.GA11360-J5syqNJeCN7twjQa/ONI9g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Cc: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Cyril,

On Tue, Mar 26, 2013 at 6:06 PM, Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org> wrote:
> This patch adds two missing manual pages.
>
> I've tried to format them in accordance with
> Linux man-pages project. If these are acked
> I'll reformat the rest of the io_* system call
> wrappers man pages to match.

So, here's what I'm not clear on. AFAIK, the io_setup() wrapper (and
the other io_*() wrappers) is provided in libaio, right? And libaio is
a completely separate package from glibc, right?

The man-pages project documents the Linux syscall and glibc APIs, so
if my understanding above is correct, then these io_*(3) pages belong
in the libaio package, not in in man-pages. Could you or Jeff clarify?

Thanks,

Michael

> Signed-off-by: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
> ---
>  man/io_destroy.3 |   45 +++++++++++++++++++++++++++++++++++++++++++++
>  man/io_setup.3   |   45 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 90 insertions(+), 0 deletions(-)
>  create mode 100644 man/io_destroy.3
>  create mode 100644 man/io_setup.3
>
> diff --git a/man/io_destroy.3 b/man/io_destroy.3
> new file mode 100644
> index 0000000..6d84213
> --- /dev/null
> +++ b/man/io_destroy.3
> @@ -0,0 +1,45 @@
> +.\" Copyright (C) 2013 Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
> +.\"
> +.\" %%%LICENSE_START(GPL_NOVERSION_ONELINE)
> +.\" This file is distributed according to the GNU General Public License.
> +.\" %%%LICENSE_END
> +.\"
> +.TH IO_DESTROY 3 2013-03-26 "Linux" "Linux AIO"
> +.SH NAME
> +io_destroy \- destroy an asynchronous I/O context
> +.SH SYNOPSIS
> +.nf
> +.B #include <libaio.h>
> +
> +.BI "int io_destroy(io_context_t ctx)"
> +.sp
> +Link with \fI\-laio\fP.
> +.fi
> +.SH DESCRIPTION
> +This is a wrapper for the
> +.BR io_destroy
> +system call, see
> +.BR io_destroy (2)
> +for more information.
> +.PP
> +See
> +.BR io_queue_release (3)
> +for
> +.I libaio
> +highlevel interface.
> +.SH "RETURN VALUES"
> +On success
> +.BR io_setup ()
> +returns 0. On failure negative error number is returned.
> +.SH NOTES
> +Note that Linux system call uses different type
> +.RI ( "aio_context_t\ *" )
> +for the
> +.I ctx
> +argument.
> +.SH "SEE ALSO"
> +.BR io_queue_release (3)
> +.BR io_setup (3)
> +.BR io_submit (3)
> +.BR io_cancel (3)
> +.BR io_getevents (3)
> diff --git a/man/io_setup.3 b/man/io_setup.3
> new file mode 100644
> index 0000000..626e954
> --- /dev/null
> +++ b/man/io_setup.3
> @@ -0,0 +1,45 @@
> +.\" Copyright (C) 2013 Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
> +.\"
> +.\" %%%LICENSE_START(GPL_NOVERSION_ONELINE)
> +.\" This file is distributed according to the GNU General Public License.
> +.\" %%%LICENSE_END
> +.\"
> +.TH IO_SETUP 3 2013-03-26 "Linux" "Linux AIO"
> +.SH NAME
> +io_setup \- create an asynchronous I/O context
> +.SH SYNOPSIS
> +.nf
> +.B #include <libaio.h>
> +
> +.BI "int io_setup(int maxevents, io_context_t *ctx)"
> +.sp
> +Link with \fI\-laio\fP.
> +.fi
> +.SH DESCRIPTION
> +This is a wrapper for the
> +.BR io_setup
> +system call, see
> +.BR io_setup (2)
> +for more information.
> +.PP
> +See
> +.BR io_queue_init (3)
> +for
> +.I libaio
> +highlevel interface.
> +.SH "RETURN VALUES"
> +On success
> +.BR io_setup ()
> +returns 0. On failure negative error number is returned.
> +.SH NOTES
> +Note that Linux system call uses different type
> +.RI ( "aio_context_t\ *" )
> +for the
> +.I ctx
> +argument.
> +.SH "SEE ALSO"
> +.BR io_queue_init (3)
> +.BR io_destroy (3)
> +.BR io_submit (3)
> +.BR io_cancel (3)
> +.BR io_getevents (3)
> --
> 1.7.8.6
>
>
> --
> Cyril Hrubis
> chrubis-AlSwsSmVLrQ@public.gmane.org



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
