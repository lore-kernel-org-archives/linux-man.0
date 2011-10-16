From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sched_rr_get_interval.2: update Linux notes
Date: Sun, 16 Oct 2011 07:08:44 +0200
Message-ID: <CAKgNAki=QhVtHnw55jZNWa4tDf5Yd2CAJsPju=ApcpYSMVKgTg@mail.gmail.com>
References: <4E942B24.2080608@ladisch.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E942B24.2080608-P6GI/4k7KOmELgA04lAiVw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Clemens Ladisch <clemens-P6GI/4k7KOmELgA04lAiVw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Clemens,

Thanks once again for this patch. See my notes below.

On Tue, Oct 11, 2011 at 1:40 PM, Clemens Ladisch <clemens-P6GI/4k7KOmELgA04lAiVw@public.gmane.org> w=
rote:
> Signed-off-by: Clemens Ladisch <clemens-P6GI/4k7KOmELgA04lAiVw@public.gmane.org>
>
> --- a/man2/sched_rr_get_interval.2
> +++ b/man2/sched_rr_get_interval.2
> @@ -98,18 +98,24 @@
> =A0.\" for SCHED_RR processes. =A0For RR processes the timeslice is a=
lways
> =A0.\" DEF_TIMESLICE, or 0.1 secs.
> =A0.\" Was the following really true for older kernels?
> -.\" Must build a 2.6.8 kernel and retest, and rewrite the following =
text
> -.\" appropriately.
> +.\" It is again true for at least Linux 2.6.12, but stopped in 2.6.2=
4.

(At this point, I think we can simply drop these source code comments
altogether. Your patch supplied the needed details.)

> =A0POSIX does not specify any mechanism for controlling the size of t=
he
> =A0round-robin time quantum.
> =A0However, Linux provides a (nonportable) method of doing this.
> -The quantum can be controlled by adjusting the process's nice value =
(see
> +The quantum of both
> +.B SCHED_RR
> +and
> +.B SCHED_OTHER
> +processes can be controlled by adjusting the process's nice value (s=
ee

I don't really want to document the SCHED_OTHER detail here. This page
is about SCHED_RR processes. The point about SCHED_OTHER is an
implementation detail that isn't relevant to SCHED_RR.

> =A0.BR setpriority (2)).
> =A0Assigning a negative (i.e., high) nice value results in a longer q=
uantum;
> =A0assigning a positive (i.e., low) nice value results in a shorter q=
uantum.
> =A0The default quantum is 0.1 seconds;
> =A0the degree to which changing the nice value affects the
> =A0quantum has varied somewhat across kernel versions.
> +Since Linux 2.6.24, the
> +.B SCHED_RR
> +quantum cannot be modified.

Here's the goodies!

> =A0.\" .SH BUGS
> =A0.\" As of Linux 1.3.81
> =A0.\" .BR sched_rr_get_interval ()

So, I tweaked your patch somewhat, and applied the patch below for
man-pages-3.36.

Cheers,

Michael

--- a/man2/sched_rr_get_interval.2
+++ b/man2/sched_rr_get_interval.2
@@ -102,16 +102,9 @@ is available define
 in
 .IR <unistd.h> .
 .SS Linux Notes
-.\" FIXME
-.\" From at least Linux 2.6.9, the following is no longer true
-.\" for SCHED_RR processes.  For RR processes the timeslice is always
-.\" DEF_TIMESLICE, or 0.1 secs.
-.\" Was the following really true for older kernels?
-.\" Must build a 2.6.8 kernel and retest, and rewrite the following te=
xt
-.\" appropriately.
 POSIX does not specify any mechanism for controlling the size of the
 round-robin time quantum.
-However, Linux provides a (nonportable) method of doing this.
+Older Linux kernels provide a (nonportable) method of doing this.
 The quantum can be controlled by adjusting the process's nice value (s=
ee
 .BR setpriority (2)).
 Assigning a negative (i.e., high) nice value results in a longer quant=
um;
@@ -119,6 +112,11 @@ assigning a positive (i.e., low) nice value
results in a shorter quantum.
 The default quantum is 0.1 seconds;
 the degree to which changing the nice value affects the
 quantum has varied somewhat across kernel versions.
+Since Linux 2.6.24,
+.\" commit a4ec24b48ddef1e93f7578be53270f0b95ad666c
+the
+.BR SCHED_RR
+quantum cannot be modified.
 .\" .SH BUGS
 .\" As of Linux 1.3.81
 .\" .BR sched_rr_get_interval ()

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
