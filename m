From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] man: Add io_setup.3 and io_destroy.3
Date: Thu, 28 Mar 2013 10:45:59 +0100
Message-ID: <CAKgNAkix4-YB0KCizA-aDD9Wfn341kWZtN8gcA55CcAsS0JbTw@mail.gmail.com>
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

On Tue, Mar 26, 2013 at 6:06 PM, Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org> wrote:
> This patch adds two missing manual pages.
>
> I've tried to format them in accordance with
> Linux man-pages project. If these are acked
> I'll reformat the rest of the io_* system call
> wrappers man pages to match.
>
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

So, the above %%% lines are a man-pages specific thing. I think you
don't need them here, just the license.

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

.BR io_destroy (2)

> +system call,

And then I would just delete the next 3 lines.

> see
> +.BR io_destroy (2)
> +for more information.
> +.PP
> +See
> +.BR io_queue_release (3)
> +for

+ the

> +.I libaio
> +highlevel interface.

"high-level"

> +.SH "RETURN VALUES"

.SH RETURN VALUE

(No quotes needed, and remove the "S")

> +On success

Add comma.

> +.BR io_setup ()
> +returns 0. On failure negative error number is returned.

+returns 0. On failure, a negative error number is returned.

(Two changes)

> +.SH NOTES
> +Note that Linux system call uses different type

+ Note that the L:inux system call uses a differnt type

(Two changes)

> +.RI ( "aio_context_t\ *" )
> +for the
> +.I ctx
> +argument.
> +.SH "SEE ALSO"

(No quotes needed in the preceding line.)

In man-pages at least the convention is to order man pages under SEE
ALSO, by section and the _alphabetically_ within the section.

> +.BR io_queue_release (3)
> +.BR io_setup (3)
> +.BR io_submit (3)
> +.BR io_cancel (3)
> +.BR io_getevents (3)
> diff --git a/man/io_setup.3 b/man/io_setup.3
> new file mode 100644
> index 0000000..626e954
> --- /dev/null

All of the above comments apply to the following page also:

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

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
