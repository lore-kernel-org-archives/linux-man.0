From: Colin McCabe <cmccabe-VL1tVIhH15PQjUSlxSEPGw@public.gmane.org>
Subject: Re: [PATCH] clarify the multithreaded behavior of ioprio_set
Date: Mon, 23 Jul 2012 13:15:27 -0700
Message-ID: <CA+qbEUOu1WzSshxOL-EXOpsg82oV_aX_7EOhhL_SqsKYFzwRXw@mail.gmail.com>
References: <1338849830-30588-1-git-send-email-cmccabe@alumni.cmu.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1338849830-30588-1-git-send-email-cmccabe-VL1tVIhH15PQjUSlxSEPGw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Colin Patrick McCabe <cmccabe-VL1tVIhH15PQjUSlxSEPGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

ping

On Mon, Jun 4, 2012 at 3:43 PM, Colin McCabe <cmccabe-VL1tVIhH15PQjUSlxSEPGw@public.gmane.org> wrote:
> From: Colin Patrick McCabe <cmccabe-VL1tVIhH15PQjUSlxSEPGw@public.gmane.org>
>
> Signed-off-by: Colin McCabe <cmccabe-VL1tVIhH15PQjUSlxSEPGw@public.gmane.org>
> ---
>  man2/ioprio_set.2 |   25 ++++++++++++++++++++++---
>  1 files changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/man2/ioprio_set.2 b/man2/ioprio_set.2
> index 37b4dc1..807c655 100644
> --- a/man2/ioprio_set.2
> +++ b/man2/ioprio_set.2
> @@ -36,13 +36,13 @@ The
>  and
>  .BR ioprio_set ()
>  system calls respectively get and set the I/O scheduling class and
> -priority of one or more processes.
> +priority of one or more threads.
>
>  The
>  .I which
>  and
>  .I who
> -arguments identify the process(es) on which the system
> +arguments identify the thead(s) on which the system
>  calls operate.
>  The
>  .I which
> @@ -52,7 +52,7 @@ is interpreted, and has one of the following values:
>  .TP
>  .B IOPRIO_WHO_PROCESS
>  .I who
> -is a process ID identifying a single process.
> +is a process ID or thread ID identifying a single process or thread.
>  .TP
>  .B IOPRIO_WHO_PGRP
>  .I who
> @@ -186,6 +186,25 @@ kernel 2.6.13.
>  .SH "CONFORMING TO"
>  These system calls are Linux-specific.
>  .SH NOTES
> +Two or more processes or threads can share an I/O context.  This will be the
> +case when
> +.BR clone (2)
> +was called with the
> +.B CLONE_IO
> +flag.
> +
> +However, by default, the distinct threads of a process will
> +.B not
> +share the same I/O context.  This means that if you want to change the I/O
> +priority of all threads in a process, you may need to call
> +.BR ioprio_set()
> +on all of the threads.  The thread ID you would need for this operation is that
> +which is returned by
> +.BR gettid(),
> +not
> +.BR pthread_self()
> +or another userspace API.
> +
>  Glibc does not provide wrapper for these system calls; call them using
>  .BR syscall (2).
>
> --
> 1.7.7
>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
