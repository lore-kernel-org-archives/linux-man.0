From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch 08/11] perf_event_open.2: 4.1 add aux_watermark
Date: Wed, 14 Oct 2015 08:34:51 +0200
Message-ID: <561DF78B.7080303@gmail.com>
References: <alpine.DEB.2.20.1507231313580.3742@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.20.1507231313580.3742-6xBS8L8d439fDsnSvq7Uqyn2WXadKZNJe7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Frederic Weisbecker <fweisbec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Kaixu Xia <kaixu.xia-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>, Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, kan.liang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, markus.t.metzger-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/23/2015 07:14 PM, Vince Weaver wrote:
> 
> 
> This manpage patch relates to the addition of the aux_watermark attr
> field in the following commit:

Thanks, Vince. Applied.

Cheers,

Michael


> 	commit 1a5941312414c71dece6717da9a0fa1303127afa
> 	Author: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> 
> 	perf: Add wakeup watermark control to the AUX area
> 
> 	Signed-off-by: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> 	Signed-off-by: Peter Zijlstra (Intel) <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> 	Cc: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
> 	Cc: Frederic Weisbecker <fweisbec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 	Cc: H. Peter Anvin <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
> 	Cc: Kaixu Xia <kaixu.xia-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 	Cc: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
> 	Cc: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>
> 	Cc: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
> 	Cc: Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 	Cc: Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> 	Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> 	Cc: acme-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
> 	Cc: adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
> 	Cc: kan.liang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
> 	Cc: markus.t.metzger-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
> 	Cc: mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
> 	Link: http://lkml.kernel.org/r/1421237903-181015-10-git-send-email-alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
> 	Signed-off-by: Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 238eb62..19c5c23 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -259,6 +259,9 @@ struct perf_event_attr {
>                                     samples */
>      __s32 clockid;              /* clock to use for time fields */
>      __u64 sample_regs_intr;     /* regs to dump on samples */
> +    __u32 aux_watermark;        /* aux bytes before wakeup */
> +    __u32 __reserved_2;         /* align to u64 */
> +
>  };
>  .fi
>  .in
> @@ -357,6 +360,11 @@ is 104 corresponding to the addition of
>  .I sample_regs_intr
>  in Linux 3.19.
>  .\" commit 60e2364e60e86e81bc6377f49779779e6120977f
> +.B PERF_ATTR_SIZE_VER5
> +is 112 corresponding to the addition of
> +.I aux_watermak
> +in Linux 4.1.
> +.\" commit 1a5941312414c71dece6717da9a0fa1303127afa
>  .TP
>  .I "config"
>  This specifies which event you want, in conjunction with
> @@ -1284,6 +1292,12 @@ with
>  .BR CLOCK_MONOTONIC , CLOCK_MONOTONIC_RAW , CLOCK_REALTIME ,
>  .BR CLOCK_BOOTTIME ", and " CLOCK_TAI
>  currently supported.
> +.TP
> +.IR "aux_watermark" " (since Linux 4.1)"
> +.\" commit 1a5941312414c71dece6717da9a0fa1303127afa
> +This specifies how much data is required to trigger a
> +.B PERF_RECORD_AUX
> +sample.
>  .SS Reading results
>  Once a
>  .BR perf_event_open ()
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
