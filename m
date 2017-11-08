From: Milind Chabbi <chabbi.milind-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] perf/core: fast breakpoint modification via _IOC_MODIFY_BREAKPOINT
Date: Wed, 8 Nov 2017 08:59:22 -0800
Message-ID: <CAMmz+Y=eq=S+gZaRefVUrfB7LDRVfD5UdpkfQXS0zvnHdNt0XA@mail.gmail.com>
References: <CAMmz+Y=Py0dw63tuww+Oa4rWi_Hghhs3DHmNX=Tf1Yt_JH4O+Q@mail.gmail.com>
 <20171106092305.GA16382@krava> <CAMmz+YkB955Na6wOMmgqZX_TxqsBh86FiLi8EXmOrg1vwm-fGA@mail.gmail.com>
 <20171108141522.GA6320@krava> <CAMmz+Ym4yyAAYw02EtxSG7Duv_Pkg3Z+cYrgmW5Esm8Mgdx4-w@mail.gmail.com>
 <20171108151218.GA11018@krava> <CAMmz+Y=PJ2kFf9mqoQDJY32VjpCQBCCuWOiHNXR3mSEzotSS_w@mail.gmail.com>
 <20171108155741.GA12627@krava>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171108155741.GA12627@krava>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jiri Olsa <jolsa-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Milind Chabbi <chabbi.milind-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Namhyung Kim <namhyung-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Andi Kleen <ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Kan Liang <kan.liang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hari Bathini <hbathini-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Sukadev Bhattiprolu <sukadev-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Jin Yao <yao.jin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Nov 8, 2017 at 7:57 AM, Jiri Olsa <jolsa-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> On Wed, Nov 08, 2017 at 07:51:10AM -0800, Milind Chabbi wrote:
>> On Wed, Nov 8, 2017 at 7:12 AM, Jiri Olsa <jolsa-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>>
>> > > I am not able to fully understand your concern.
>> > > Can you point to a code file and line related to your observation?
>> > > The patch is modeled after the existing modify_user_hw_breakpoint() function
>> > > present in events/hw_breakpoint.c; don't you see this problem in that code?
>> >
>> > the reserve_bp_slot/release_bp_slot functions manage
>> > counts for current breakpoints based on its type
>> >
>> > those counts are cumulated in here:
>> >   static DEFINE_PER_CPU(struct bp_cpuinfo, bp_cpuinfo[TYPE_MAX]);
>> >
>> > you allow to change the breakpoint type, so I'd expect
>> > to see some code that release slot count for old type
>> > and take new one (if it's available)
>> >
>> > jirka
>>
>>
>> Why is this not a concern for modify_user_hw_breakpoint() function?
>
> I don't know ;-)
>
> jirka


Jirka,

I carefully looked at bp_cpuinfo[] and nr_slots[] data structures.
nr_slots[] is an array of length two (one slot of TYPE_INST and
another for TYPE_DATA).
The accounting "thinks" that there is one limit on the number of
instruction breakpoints and another limit on the number of data
breakpoints.
The assumption is clearly broken; for example, on x86 there exists a
limit on the *total* number of all breakpoints disregarding their kind
and the code has failed to capture this aspect.

As such, modify_user_hw_breakpoint() makes no attempt to keep the
counts correct. Instead, it simply tries to change and install a new
breakpoint and fails if the hardware disallows.
This can lead to a situation where, say on x86, someone creates 4
TYPE_DATA breakpoints, then changes one of them to TYPE_INS via
modify_user_hw_breakpoint() and then releases the TYPE_INS breakpoint.
Since the accounting still thinks that there are four TYPE_DATA
breakpoints, it will disallow creating a new TYPE_DATA breakpoint,
although there is place for one TYPE_DATA breakpoint.

This convinces me that the problem and the solution are outside of
this current patch.
Do you agree?

-Milind
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
