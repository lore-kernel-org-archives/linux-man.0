From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] prctl.2: document PR_SET_PTRACER
Date: Fri, 11 Jan 2013 00:24:43 +0100
Message-ID: <CAKgNAkhDC2TP9majP=POZJYXvcft3Jvthb8wxaBbT6TLsZ4vtg@mail.gmail.com>
References: <20130110212855.GA29003@www.outflux.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130110212855.GA29003-0X9Bc/hWBUTk6RaD4rd5nQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[CC+=Pavel]

Hi Kees,

On Thu, Jan 10, 2013 at 10:28 PM, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> This documents the Yama LSM's prctl handler that allows processes to
> declare ptrace restriction exception relationships via PR_SET_PTRACER.

This is synchronicity! I was just looking  at what was undocumented in
prctl() after a conversation with Pavel and wondering about pinging
you about PR_SET_PTRACER.

Some questions/observations:

1. From the look of it, each tracee can have only one tracer, so that
PR_SET_PTRACER overwrites any previous PID, right. The text implies
that, but I'll add a few more words to make it explicit.

2. There is no PR_GET_PTRACER operation. I suppose it's not needed for
your purposes. I wonder however if it might matter for CRIU to have
PR_GET_PTRACER, hence I CC Pavel.

Your patch is applied.

Cheers,

Michael

> Signed-off-by: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  man2/prctl.2 |   18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/man2/prctl.2 b/man2/prctl.2
> index c8a4919..506c7b3 100644
> --- a/man2/prctl.2
> +++ b/man2/prctl.2
> @@ -45,9 +45,10 @@
>  .\" 2012-09-20 Kees Cook, document PR_SET_NO_NEW_PRIVS, PR_GET_NO_NEW_PRIVS
>  .\" 2012-10-25 Michael Kerrisk, Document PR_SET_TIMERSLACK and
>  .\"                             PR_GET_TIMERSLACK
> +.\" 2013-01-10 Kees Cook, document PR_SET_PTRACER
>  .\"
>  .\"
> -.TH PRCTL 2 2012-10-25 "Linux" "Linux Programmer's Manual"
> +.TH PRCTL 2 2013-01-10 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  prctl \- operations on a process
>  .SH SYNOPSIS
> @@ -270,6 +271,21 @@ Return the current value of the parent process death signal,
>  in the location pointed to by
>  .IR "(int\ *) arg2" .
>  .TP
> +.BR PR_SET_PTRACER " (since Linux 3.4)"
> +This is only meaningful when the Yama LSM is enabled and in mode 1
> +("restricted ptrace", visible via
> +.IR /proc/sys/kernel/yama/ptrace_scope ).
> +When a "ptracer process id" is passed in \fIarg2\fP, the caller is declaring
> +that the ptracer process can ptrace the current process as if it were a
> +direct process ancestor. When set to 0, this relationship is removed. When
> +set to
> +.BR PR_SET_PTRACER_ANY,
> +the ptrace restrictions introduced by Yama are effectively disabled for the
> +current process.
> +
> +For further information, see the kernel source file
> +.IR Documentation/security/Yama.txt .
> +.TP
>  .BR PR_SET_SECCOMP " (since Linux 2.6.23)"
>  .\" See http://thread.gmane.org/gmane.linux.kernel/542632
>  .\" [PATCH 0 of 2] seccomp updates
> --
> 1.7.9.5
>
> --
> Kees Cook
> Chrome OS Security



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
