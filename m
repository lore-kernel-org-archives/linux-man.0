From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] posix_fallocate.3, prctl.2, sigaction.2, sysconf.3,
 tzset.3: minor rewording
Date: Thu, 8 Sep 2011 17:26:40 +0200
Message-ID: <CAKgNAkiYk4gqEzV5GGQLDzbdpT4A1-ztxfGmTQMUMJ94TfZRrQ@mail.gmail.com>
References: <4E5E4FFD.7020806@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E5E4FFD.7020806-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Seonghun,

Thanks for these reports. Best to split patches for unrelated pages.

2011/8/31 Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> man-pages version: latest git repository
> why: Clarify description by rewording. Fix some typos.
>
>
> diff --git a/man3/posix_fallocate.3 b/man3/posix_fallocate.3
> --- a/man3/posix_fallocate.3
> +++ b/man3/posix_fallocate.3
> @@ -94,7 +94,7 @@ referred to by
> .TP
> .B ESPIPE
> .I fd
> -refers to a pipe of file descriptor.
> +refers to a pipe.

Applied.

> .SH VERSIONS
> .BR posix_fallocate ()
> is available since glibc 2.1.94.
> diff --git a/man2/prctl.2 b/man2/prctl.2
> --- a/man2/prctl.2
> +++ b/man2/prctl.2
> @@ -157,7 +157,7 @@ in the location pointed to by
> .TP
> .BR PR_SET_FPEXC " (since Linux 2.4.21, 2.5.32, only on PowerPC)"
> Set floating-point exception mode to \fIarg2\fP.
> -Pass \fBPR_FP_EXC_SW_ENABLE\fP to use FPEXC for FP exception enables,
> +Pass \fBPR_FP_EXC_SW_ENABLE\fP to use FPEXC for FP exception enabled,

I believe the existing text is correct (consistent with kernel
comment). No change.

> \fBPR_FP_EXC_DIV\fP for floating-point divide by zero,
> \fBPR_FP_EXC_OVF\fP for floating-point overflow,
> \fBPR_FP_EXC_UND\fP for floating-point underflow,
> diff --git a/man2/sigaction.2 b/man2/sigaction.2
> --- a/man2/sigaction.2
> +++ b/man2/sigaction.2
> @@ -297,7 +297,7 @@ In addition, signals sent with
> .BR sigqueue (2)
> fill in
> .IR si_int " and " si_ptr
> -with the values specified by the sender the signal;
> +with the values specified by the sender of the signal;

Applied.

> see
> .BR sigqueue (2)
> for more details.
> diff --git a/man3/sysconf.3 b/man3/sysconf.3
> --- a/man3/sysconf.3
> +++ b/man3/sysconf.3
> @@ -254,7 +254,7 @@ parentheses by
> .BR expr (1).
> .TP
> .BR LINE_MAX " - " _SC_LINE_MAX
> -The maximum length of a utility's input line length, either from
> +The maximum length of a utility's input line, either from

Applied.

> standard input or from a file.
> This includes length for a trailing
> newline.
> diff --git a/man3/tzset.3 b/man3/tzset.3
> --- a/man3/tzset.3
> +++ b/man3/tzset.3
> @@ -156,7 +156,7 @@ runs from the first Sunday in October to the third
> Sunday in March,
> and the changeovers happen at the default time of 02:00:00:
> .nf
>
> - TZ="NZST-12.00:00NZDT-13:00:00,M10.1.0,M3.3.0"
> + TZ="NZST-12:00:00NZDT-13:00:00,M10.1.0,M3.3.0"

Applied.

> .fi
> .PP
> The third format specifies that the timezone information should be read

Thanks!

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
