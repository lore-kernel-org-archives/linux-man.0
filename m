From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 1/3] getrusage.2: Description of maintained fields
Date: Mon, 24 May 2010 07:53:48 +0200
Message-ID: <AANLkTinm6e-WUTzLdYh8ChC_2BZFAUPaZGF8yoQqLRsf@mail.gmail.com>
References: <1272228153-11825-1-git-send-email-mark@pogo.org.uk>
	<1272228153-11825-2-git-send-email-mark@pogo.org.uk>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1272228153-11825-2-git-send-email-mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Apr 25, 2010 at 10:42 PM, Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org> wrote:
> These descriptions are taken from NetBSD 5.0's getrusage(2).

Applied for man-pages-3.25.

thanks for your patience Mark!

Cheers,

Michael


> Signed-off-by: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
> ---
> =A0man2/getrusage.2 | =A0 69 +++++++++++++++++++++++++++++++++++++++-=
-------------
> =A01 files changed, 51 insertions(+), 18 deletions(-)
>
> diff --git a/man2/getrusage.2 b/man2/getrusage.2
> index 2771817..6ffdce2 100644
> --- a/man2/getrusage.2
> +++ b/man2/getrusage.2
> @@ -89,6 +89,57 @@ struct rusage {
> =A0};
> =A0.fi
> =A0.in
> +.PP
> +Not all fields are completed; unmaintained fields are set to zero by
> +the kernel. The fields are interpreted as follows:
> +.TP
> +.I ru_utime
> +the total amount of time spent executing in user mode.
> +.TP
> +.I ru_stime
> +the total amount of time spent in the system executing on behalf
> +of the process(es).
> +.TP
> +.IR ru_maxrss " (unmaintained)"
> +.TP
> +.IR ru_ixrss " (unmaintained)"
> +.TP
> +.IR ru_idrss " (unmaintained)"
> +.TP
> +.IR ru_isrss " (unmaintained)"
> +.TP
> +.I ru_minflt
> +the number of page faults serviced without any I/O activity; here
> +I/O activity is avoided by \*(lqreclaiming\*(rq a page frame from
> +the list of pages awaiting reallocation.
> +.TP
> +.I ru_majflt
> +the number of page faults serviced that required I/O activity.
> +.TP
> +.IR ru_nswap =A0" (unmaintained)"
> +.TP
> +.IR ru_inblock " (since Linux 2.6.22)"
> +the number of times the file system had to perform input.
> +.TP
> +.IR ru_oublock " (since Linux 2.6.22)"
> +the number of times the file system had to perform output.
> +.TP
> +.IR ru_msgsnd " (unmaintained)"
> +.TP
> +.IR ru_msgrcv " (unmaintained)"
> +.TP
> +.IR ru_nsignals " (unmaintained)"
> +.TP
> +.IR ru_nvcsw " (since Linux 2.6)"
> +the number of times a context switch resulted due to a process
> +voluntarily giving up the processor before its time slice was
> +completed (usually to await availability of a resource).
> +.TP
> +.IR ru_nivcsw " (since Linux 2.6)"
> +the number of times a context switch resulted due to a higher
> +priority process becoming runnable or because the current process
> +exceeded its time slice.
> +.PP
> =A0.SH "RETURN VALUE"
> =A0On success, zero is returned.
> =A0On error, \-1 is returned, and
> @@ -140,24 +191,6 @@ This nonconformance is rectified in Linux 2.6.9 =
and later.
> =A0.LP
> =A0The structure definition shown at the start of this page
> =A0was taken from 4.3BSD Reno.
> -Not all fields are meaningful under Linux.
> -In Linux 2.4 only the fields
> -.IR ru_utime ,
> -.IR ru_stime ,
> -.IR ru_minflt ,
> -and
> -.I ru_majflt
> -are maintained.
> -Since Linux 2.6,
> -.I ru_nvcsw
> -and
> -.I ru_nivcsw
> -are also maintained.
> -Since Linux 2.6.22,
> -.I ru_inblock
> -and
> -.I ru_oublock
> -are also maintained.
>
> =A0See also the description of
> =A0.IR /proc/PID/stat
> --
> 1.7.1
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
