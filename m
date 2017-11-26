From: Jiri Olsa <jolsa-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] perf/core: fast breakpoint modification via
 _IOC_MODIFY_BREAKPOINT
Date: Sun, 26 Nov 2017 20:31:33 +0100
Message-ID: <20171126193132.GA7595@krava>
References: <20171108151218.GA11018@krava>
 <CAMmz+Y=PJ2kFf9mqoQDJY32VjpCQBCCuWOiHNXR3mSEzotSS_w@mail.gmail.com>
 <20171108155741.GA12627@krava>
 <CAMmz+Y=eq=S+gZaRefVUrfB7LDRVfD5UdpkfQXS0zvnHdNt0XA@mail.gmail.com>
 <20171109074658.GC14419@krava>
 <20171109131233.GA2942@krava>
 <CAMmz+Ykdf+bpA=ARSAYd3xp7U+BDWVmf1iW3SKW=ZVDBSmUSEg@mail.gmail.com>
 <CAMmz+YmhGXPQ_KydpPTLbPDQW-6G_wxrnAz2UYqSwqQJHBN_5Q@mail.gmail.com>
 <20171113074644.GA18733@krava>
 <CAMmz+Y=95ffwgSbLSXoAPOrdQXVQftZNJFjoH=kjpGkZ2u2LYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMmz+Y=95ffwgSbLSXoAPOrdQXVQftZNJFjoH=kjpGkZ2u2LYw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Milind Chabbi <chabbi.milind-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Namhyung Kim <namhyung-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Andi Kleen <ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Kan Liang <kan.liang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hari Bathini <hbathini-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Sukadev Bhattiprolu <sukadev-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Jin Yao <yao.jin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Nov 13, 2017 at 12:02:56AM -0800, Milind Chabbi wrote:
> SNIP
> 
> On Sun, Nov 12, 2017 at 11:46 PM, Jiri Olsa <jolsa-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> 
> > but you closed fd4 before openning fd5..?
> 
> Yes, that is correct. I closed fd4. The reason is by closing fd4, we
> are having a total of 3 hardware breakpoints active, but we are making
> the software counting in the kernel think that four TYPE_DATA
> breakpoints active. The counting should have disallowed us from
> creating fd5 as per the following logic in the kernel:
> 
> static int __reserve_bp_slot(struct perf_event *bp)
> 
> {
>  ....
> 
>         /* Flexible counters need to keep at least one slot */
>         if (slots.pinned + (!!slots.flexible) > nr_slots[type])
>                 return -ENOSPC;
> ....
> }

So the issue is with the cpu pinned breakpoints, because we keep
their slot counts for both breakpoint types. For task breakpoints
we dont keep the slot count, we just count it every time we need it.

The issue will not expose on x86, because both breakpoint types
share same slot count (CONFIG_HAVE_MIXED_BREAKPOINTS_REGS).

I'm seeing the issue on arm machine (with 4 watchpoints and 6 breakpoints)

creating 4 watchpoints:
	2028  perf_event_open(0xffffdb232bd0, -1, 0, -1, PERF_FLAG_FD_CLOEXEC) = 3
	2028  perf_event_open(0xffffdb232c40, -1, 0, -1, PERF_FLAG_FD_CLOEXEC) = 4
	2028  perf_event_open(0xffffdb232cb0, -1, 0, -1, PERF_FLAG_FD_CLOEXEC) = 5
	2028  perf_event_open(0xffffdb232d20, -1, 0, -1, PERF_FLAG_FD_CLOEXEC) = 6

changing last one to breakpoint:
	2028  ioctl(6, _IOC(_IOC_WRITE, 0x24, 0x0a, 0x08), 0xffffdb232e08) = 0

and trying to create one more watchpoint:
	2028  perf_event_open(0xffffdb232d90, -1, 0, -1, PERF_FLAG_FD_CLOEXEC) = -1 ENOSPC (No space left on device)

after this, we have slot counts:
	get_bp_info(0, TYPE_DATA)->cpu_pinned = 4
	get_bp_info(0, TYPE_INST)->cpu_pinned = 0

now when we close all of it:
	close(3)
	close(4)
	close(5)
	close(6)

we get the slot counts messed up, because fd 6 has different type now:
	get_bp_info(0, TYPE_DATA)->cpu_pinned = 1
	get_bp_info(0, TYPE_INST)->cpu_pinned = -1


I put together some fix and put it in here:
  https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
  perf/bp

if you could please run your tests on it, and if it's all
good I'll post it

thanks,
jirka
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
