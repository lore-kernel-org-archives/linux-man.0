From: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [patch 05/10] perf_event_open.2: aux_{head,tail,offset,size}
 support
Date: Thu, 16 Apr 2015 20:55:59 +0200
Message-ID: <20150416185559.GC23123@twins.programming.kicks-ass.net>
References: <alpine.DEB.2.11.1504161414590.15181@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.11.1504161414590.15181-6xBS8L8d439fDsnSvq7Uqyn2WXadKZNJe7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Frederic Weisbecker <fweisbec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Kaixu Xia <kaixu.xia-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>, Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, kan.liang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, markus.t.metzger-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Apr 16, 2015 at 02:15:52PM -0400, Vince Weaver wrote:
> +.I aux_size
> +needs to be set to the desired buffer size.
> +The desired offset and size must be page aligned.

I think we also require the size to be a power of two.

> +These values are then passed to mmap in order to map the AUX buffer.
> +Pages in the AUX buffer are included as part of the user mlock
> +rlimit as well as the
> +.I perf_event_mlock_kb
> +allowance.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
