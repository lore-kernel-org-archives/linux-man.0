From: Jiri Olsa <jolsa-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] perf/core: fast breakpoint modification via
 _IOC_MODIFY_BREAKPOINT
Date: Mon, 13 Nov 2017 08:46:44 +0100
Message-ID: <20171113074644.GA18733@krava>
References: <20171108141522.GA6320@krava>
 <CAMmz+Ym4yyAAYw02EtxSG7Duv_Pkg3Z+cYrgmW5Esm8Mgdx4-w@mail.gmail.com>
 <20171108151218.GA11018@krava>
 <CAMmz+Y=PJ2kFf9mqoQDJY32VjpCQBCCuWOiHNXR3mSEzotSS_w@mail.gmail.com>
 <20171108155741.GA12627@krava>
 <CAMmz+Y=eq=S+gZaRefVUrfB7LDRVfD5UdpkfQXS0zvnHdNt0XA@mail.gmail.com>
 <20171109074658.GC14419@krava>
 <20171109131233.GA2942@krava>
 <CAMmz+Ykdf+bpA=ARSAYd3xp7U+BDWVmf1iW3SKW=ZVDBSmUSEg@mail.gmail.com>
 <CAMmz+YmhGXPQ_KydpPTLbPDQW-6G_wxrnAz2UYqSwqQJHBN_5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMmz+YmhGXPQ_KydpPTLbPDQW-6G_wxrnAz2UYqSwqQJHBN_5Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Milind Chabbi <chabbi.milind-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Namhyung Kim <namhyung-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Andi Kleen <ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Kan Liang <kan.liang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hari Bathini <hbathini-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Sukadev Bhattiprolu <sukadev-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Jin Yao <yao.jin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sun, Nov 12, 2017 at 11:09:23AM -0800, Milind Chabbi wrote:
>  ,
> 
> On Thu, Nov 9, 2017 at 10:59 AM, Milind Chabbi <chabbi.milind-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > SNIP
> >
> > On Thu, Nov 9, 2017 at 5:12 AM, Jiri Olsa <jolsa-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> >>
> >>
> >> how about something like below (untested)
> >>
> >> looks like there's no irq caller for modify_user_hw_breakpoint,
> >> so we should be fine with locking nr_bp_mutex
> >>
> >> jirka
> >>
> >>
> >> ---
> >> diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
> >> index 3f8cb1e14588..f062b68399ea 100644
> >> --- a/kernel/events/hw_breakpoint.c
> >> +++ b/kernel/events/hw_breakpoint.c
> >> @@ -448,6 +448,8 @@ int modify_user_hw_breakpoint(struct perf_event *bp, struct perf_event_attr *att
> >>         else
> >>                 perf_event_disable(bp);
> >>
> >> +       release_bp_slot(bp);
> >> +
> >>         bp->attr.bp_addr = attr->bp_addr;
> >>         bp->attr.bp_type = attr->bp_type;
> >>         bp->attr.bp_len = attr->bp_len;
> >> @@ -455,9 +457,9 @@ int modify_user_hw_breakpoint(struct perf_event *bp, struct perf_event_attr *att
> >>         if (attr->disabled)
> >>                 goto end;
> >>
> >> -       err = validate_hw_breakpoint(bp);
> >> +       err = reserve_bp_slot(bp);
> >>         if (!err)
> >> -               perf_event_enable(bp);
> >> +               err = validate_hw_breakpoint(bp);
> >>
> >>         if (err) {
> >>                 bp->attr.bp_addr = old_addr;
> >> @@ -469,6 +471,7 @@ int modify_user_hw_breakpoint(struct perf_event *bp, struct perf_event_attr *att
> >>                 return err;
> >>         }
> >>
> >> +       perf_event_enable(bp);
> >>  end:
> >>         bp->attr.disabled = attr->disabled;
> >>
> >
> > We can do this accounting only if bp->attr.bp_type != attr->bp_type.
> >
> > -Milind
> 
> 
> Jirka,
> 
> Neither of us seems to fully understand the convoluted logic used in
> breakpoint counting.

yea, I was hoping some of the guys would take over ;-)

the problem I have with the patch above is that we could
fail to reserve the slot at the end, which is not what
the caller might expect

> 
> I tested the following sequence on an x86 machine, which has four
> debug registers (without your suggested patch for counting
> correction).
> 
> fd1 = perf_event_open(...); //BP_TYPE= HW_BREAKPOINT_RW @ ADDR1
> fd2 = perf_event_open(...); //BP_TYPE= HW_BREAKPOINT_RW @ ADDR2
> fd3 = perf_event_open(...); //BP_TYPE= HW_BREAKPOINT_RW @ ADDR3
> fd4 = perf_event_open(...); //BP_TYPE= HW_BREAKPOINT_RW @ ADDR4
> ioctl(fd4, MODIFY, ...); // change fd4 to BP_TYPE= HW_BREAKPOINT_X @ ADDR5
> close(fd4);
> fd5 = perf_event_open(); //BP_TYPE=RW @ ADDR6
> 
> We expected fd5 to fail because four BP_TYPE=TYPE_DATA are in use as
> per the accounting, but in reality, fd5 was successfully opened.

but you closed fd4 before openning fd5..?

> 
> Is the accounting accidentally working on x86?
> Is there another architecture where TYPE_DATA and TYPE_INS are counted
> differently?

[jolsa@krava linux-perf]$ grep -r HAVE_MIXED_BREAKPOINTS_REGS arch/*
arch/Kconfig:config HAVE_MIXED_BREAKPOINTS_REGS
arch/sh/Kconfig:        select HAVE_MIXED_BREAKPOINTS_REGS
arch/x86/Kconfig:       select HAVE_MIXED_BREAKPOINTS_REGS

I'll try to check on it this week

jirka
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
