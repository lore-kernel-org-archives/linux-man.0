From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: ffix and tfix
Date: Wed, 30 Jan 2013 08:00:32 +0100
Message-ID: <CAKgNAkgxQGK4-EYe19+gnnkhqsdbjhx51wD6tP3U6ELZN9oiKQ@mail.gmail.com>
References: <1359509621-17767-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1359509621-17767-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Jan 30, 2013 at 2:33 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> Mainly minor formatting fixes and a few typo fixes: s/killink/killing=
/
> and s/backwards/backward/. Also a consistency fix (s/The time/Time/) =
on
> top of the s/OOM kill/OOM-kill/ ones).

Thanks David. Applied.

Cheers,

Michael


> ---
>  man5/proc.5 |   26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/man5/proc.5 b/man5/proc.5
> index 81bb3f5..30818d2 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -642,7 +642,7 @@ There is an additional factor included in the bad=
ness score: root
>  processes are given 3% extra memory over other tasks.
>
>  The amount of "allowed" memory depends on the context
> -in which the OOM killer was called.
> +in which the OOM-killer was called.
>  If it is due to the memory assigned to the allocating task's cpuset
>  being exhausted,
>  the allowed memory represents the set of mems assigned to that
> @@ -656,16 +656,16 @@ Finally, if it is due to the entire system bein=
g out of memory, the
>  allowed memory represents all allocatable resources.
>
>  The value of
> -.I /oom_score_adj
> +.I oom_score_adj
>  is added to the badness score before it
>  is used to determine which task to kill.
>  Acceptable values range from \-1000
>  (OOM_SCORE_ADJ_MIN) to +1000 (OOM_SCORE_ADJ_MAX).
> -This allows user space to control the preference for OOM killing,
> +This allows user space to control the preference for OOM-killing,
>  ranging from always preferring a certain
> -task or completely disabling it from OOM killink.
> +task or completely disabling it from OOM-killing.
>  The lowest possible value, \-1000, is
> -equivalent to disabling OOM killing entirely for that task,
> +equivalent to disabling OOM-killing entirely for that task,
>  since it will always report a badness score of 0.
>
>  Consequently, it is very simple for user space to define
> @@ -680,7 +680,7 @@ A value of \-500, on the other hand, would be rou=
ghly
>  equivalent to discounting 50% of the task's
>  allowed memory from being considered as scoring against the task.
>
> -For backwards compatibility with previous kernels,
> +For backward compatibility with previous kernels,
>  .I /proc/[pid]/oom_adj
>  can still be used to tune the badness score.
>  Its value is
> @@ -977,11 +977,13 @@ then
>  try \fIps \-l\fP to see the WCHAN field in action.)
>  .TP
>  \fInswap\fP %lu
> -(36) .\" nswap was added in 2.0
> +(36)
> +.\" nswap was added in 2.0
>  Number of pages swapped (not maintained).
>  .TP
>  \fIcnswap\fP %lu
> -(37) .\" cnswap was added in 2.0
> +(37)
> +.\" cnswap was added in 2.0
>  Cumulative \fInswap\fP for child processes (not maintained).
>  .TP
>  \fIexit_signal\fP %d (since Linux 2.1.22)
> @@ -2056,10 +2058,10 @@ that the system spent in various states:
>  (1) Time spent in user mode.
>  .TP
>  .I nice
> -(2) Time spent in user mode with low priority (nice)
> +(2) Time spent in user mode with low priority (nice).
>  .TP
>  .I system
> -(3) Time spent in system mode
> +(3) Time spent in system mode.
>  .TP
>  .I idle
>  (4) Time spent in the idle task.
> @@ -2077,7 +2079,7 @@ pseudo-file.
>  .IR irq " (since Linux 2.6.0-test4)"
>  (6) Time servicing interrupts.
>  .TP
> -.I softirq " (since Linux 2.6.0-test4)"
> +.IR softirq " (since Linux 2.6.0-test4)"
>  (7) Time servicing softirqs.
>  .TP
>  .IR steal " (since Linux 2.6.11)"
> @@ -2085,7 +2087,7 @@ pseudo-file.
>  running in a virtualized environment
>  .TP
>  .IR guest " (since Linux 2.6.24)"
> -(9) The time spent running a virtual CPU for guest
> +(9) Time spent running a virtual CPU for guest
>  operating systems under the control of the Linux kernel.
>  .\" See Changelog entry for 5e84cfde51cf303d368fcb48f22059f37b3872de
>  .TP
> --
> 1.7.10.4
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
