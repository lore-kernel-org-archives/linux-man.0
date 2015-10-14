From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch 11/11] perf_event_open.2: add possibility of EBUSY error
Date: Wed, 14 Oct 2015 08:47:39 +0200
Message-ID: <561DFA8B.1040306@gmail.com>
References: <alpine.DEB.2.20.1507231316050.3742@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.20.1507231316050.3742-6xBS8L8d439fDsnSvq7Uqyn2WXadKZNJe7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Frederic Weisbecker <fweisbec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Kaixu Xia <kaixu.xia-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>, Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, kan.liang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, markus.t.metzger-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/23/2015 07:16 PM, Vince Weaver wrote:
> 
> Linux 4.1 added the possibility of perf_event_open() returning
> EBUSY if an existing exclusive event controls the PMU.

Thanks, Vince. Applied.

Cheers,

Michael


> This was introduced by the following commit:
> 
> 	commit bed5b25ad9c8a2f5d735ef0bc746ec870c01c1b0
> 	Author: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> 	Date:   Fri Jan 30 12:31:06 2015 +0200
> 
> 	perf: Add a pmu capability for "exclusive" events
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
> 
> Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index b3cd93f..3d03786 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -2911,6 +2911,11 @@ the cgroup file descriptor in
>  .I pid
>  is not valid.
>  .TP
> +.BR EBUSY " (since Linux 4.1)"
> +.\" bed5b25ad9c8a2f5d735ef0bc746ec870c01c1b0
> +Returned if another event already has exclusive
> +access to the PMU.
> +.TP
>  .B EFAULT
>  Returned if the
>  .I attr
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
