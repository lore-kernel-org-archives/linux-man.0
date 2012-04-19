From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] prctl.2, proc.5: proposal to reflect http://lwn.net/Articles/484162
Date: Thu, 19 Apr 2012 15:38:20 +1200
Message-ID: <CAKgNAki4z9ENTVmirLqtZEo4ca5AVL63cuP6N1b166PeXshdyw@mail.gmail.com>
References: <1333702969-28795-1-git-send-email-dmitry.antipov@linaro.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1333702969-28795-1-git-send-email-dmitry.antipov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Antipov <dmitry.antipov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: linux-man@vger.kernel.org

Dmitry,

Thanks for this patch. Would you be willing to revise it a little to
add some words about the *purpose* of timer slack.

Thanks

Michael


On Fri, Apr 6, 2012 at 9:02 PM, Dmitry Antipov
<dmitry.antipov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Document PR_GET_TIMERSLACK and PR_SET_TIMERSLACK for prctl (2).
> Document /proc/sys/kernel/timer_slack for proc (5).
>
> Signed-off-by: Dmitry Antipov <dmitry.antipov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> =A0man2/prctl.2 | =A0 15 +++++++++++++++
> =A0man5/proc.5 =A0| =A0 =A04 ++++
> =A02 files changed, 19 insertions(+), 0 deletions(-)
>
> diff --git a/man2/prctl.2 b/man2/prctl.2
> index effad2a..dcf803f 100644
> --- a/man2/prctl.2
> +++ b/man2/prctl.2
> @@ -378,6 +378,21 @@ Return the current per-process machine check kil=
l policy.
> =A0All unused
> =A0.BR prctl ()
> =A0arguments must be zero.
> +.TP
> +.BR PR_GET_TIMERSLACK " (since Linux 2.6.28)"
> +Return the current per-thread high-resolution timers slack, in nanos=
econds.
> +.TP
> +.BR PR_SET_TIMERSLACK " (since Linux 2.6.28)"
> +Set the current per-thread high-resolution timers slack. If arg2 is =
less than or
> +equal to zero, system-wide default value is restored. The system-wid=
e default can
> +be read and set by /proc/sys/kernel/timer_slack (see
> +.BR proc (5)).
> +Otherwise, if arg2 is less than or equal to HRTIMER_MAX_SLACK (which=
 is a kernel
> +constant defined in include/linux/hrtimer.h), this value is set up a=
s a new slack.
> +Slack is not inherited across
> +.BR fork (2);
> +new process initially uses system-wide default slack, and new thread=
 inherits
> +it's slack from the group leader.
> =A0.SH "RETURN VALUE"
> =A0On success,
> =A0.BR PR_GET_DUMPABLE ,
> diff --git a/man5/proc.5 b/man5/proc.5
> index 54ccdd8..0493b6b 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -2407,6 +2407,10 @@ date behind it indicates the time the kernel w=
as built.
> =A0This file specifies the system-wide limit on the number of
> =A0threads (tasks) that can be created on the system.
> =A0.TP
> +.IR /proc/sys/kernel/timer_slack
> +This file specifies the system-wide default slack for
> +high-resolution timers, in nanoseconds.
> +.TP
> =A0.IR /proc/sys/kernel/zero-paged " (PowerPC only) "
> =A0This file
> =A0contains a flag.
> --
> 1.7.7.6
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
