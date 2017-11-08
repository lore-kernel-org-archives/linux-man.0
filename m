From: Jiri Olsa <jolsa-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] perf/core: fast breakpoint modification via
 _IOC_MODIFY_BREAKPOINT
Date: Wed, 8 Nov 2017 16:12:18 +0100
Message-ID: <20171108151218.GA11018@krava>
References: <CAMmz+Y=Py0dw63tuww+Oa4rWi_Hghhs3DHmNX=Tf1Yt_JH4O+Q@mail.gmail.com>
 <20171106092305.GA16382@krava>
 <CAMmz+YkB955Na6wOMmgqZX_TxqsBh86FiLi8EXmOrg1vwm-fGA@mail.gmail.com>
 <20171108141522.GA6320@krava>
 <CAMmz+Ym4yyAAYw02EtxSG7Duv_Pkg3Z+cYrgmW5Esm8Mgdx4-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMmz+Ym4yyAAYw02EtxSG7Duv_Pkg3Z+cYrgmW5Esm8Mgdx4-w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Milind Chabbi <chabbi.milind-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Namhyung Kim <namhyung-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Andi Kleen <ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Kan Liang <kan.liang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hari Bathini <hbathini-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Sukadev Bhattiprolu <sukadev-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Jin Yao <yao.jin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Nov 08, 2017 at 07:02:22AM -0800, Milind Chabbi wrote:
> On Wed, Nov 8, 2017 at 6:15 AM, Jiri Olsa <jolsa-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > On Mon, Nov 06, 2017 at 07:04:40AM -0800, Milind Chabbi wrote:
> >> Hi Jirka,
> >>
> >> I see the tabs in my sent email, do you have suggestions on how best to
> >> send this patch so that the tabs are preserved by the email client?
> >> Can anybody else also check if they received with/without tabs?
> >>
> >> release_bp_slot/reserve_bp_slot majic is not necessary since
> >> _IOC_MODIFY_BREAKPOINT ioctl modifies an already registered breakpoint
> >> without affecting the count of breakpoints active.
> >
> > but AFAICS you allow to change the breakpoint type (bp_type)
> > and slot counts are based on the breakpoint type
> >
> > jirka
> 
> Jirka,
> I am not able to fully understand your concern.
> Can you point to a code file and line related to your observation?
> The patch is modeled after the existing modify_user_hw_breakpoint() function
> present in events/hw_breakpoint.c; don't you see this problem in that code?

the reserve_bp_slot/release_bp_slot functions manage
counts for current breakpoints based on its type

those counts are cumulated in here:
  static DEFINE_PER_CPU(struct bp_cpuinfo, bp_cpuinfo[TYPE_MAX]);

you allow to change the breakpoint type, so I'd expect
to see some code that release slot count for old type
and take new one (if it's available)

jirka
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
