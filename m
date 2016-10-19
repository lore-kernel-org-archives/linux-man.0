From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: Re: [patch] perf_event_open.2: PERF_RECORD_SWITCH support
Date: Wed, 19 Oct 2016 11:14:33 -0400 (EDT)
Message-ID: <alpine.DEB.2.20.1610191111090.16261@macbook-air>
References: <alpine.DEB.2.20.1610181320290.10811@macbook-air> <15d30ad2-2937-febe-d6c9-b8dded4642d8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <15d30ad2-2937-febe-d6c9-b8dded4642d8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Arnaldo Carvalho de Melo <acme-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, 19 Oct 2016, Michael Kerrisk (man-pages) wrote:

> > diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> > index 68b99bb..04a0cf5 100644
> > +.B PERF_RECORD_SWITCH_CPU_WIDE
> > +records when sampling in cpu-wide mode.
> > +This functionality is in addition to existing tracepoint and
> > +software events for measuring context switches.
> > +The advantage of this method is that it will give full
> 
> s/give full/give a full/
> 
> ok?
> 
> > +information event with strict
> > +.I perf_event_paranoid
> > +settings.

What I meant to say was 

"it will give full information *even* with strict perf_event_paranoid 
settings"

Maybe saying something like "despite strict settings" would be better 
wording.

not sure how I missed that typo, apparently my fingers are used to typing 
"event" too much.

Vince

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
