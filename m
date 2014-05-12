From: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: SCHED_DEADLINE, sched_getscheduler(), and sched_getparam()
Date: Mon, 12 May 2014 14:24:52 +0200
Message-ID: <20140512122452.GB13467@laptop.programming.kicks-ass.net>
References: <CAKgNAkiA23kAFyXQkFV4z0aUE+y5K7AFNwRW+4LqwAyVj=tQtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkiA23kAFyXQkFV4z0aUE+y5K7AFNwRW+4LqwAyVj=tQtQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Juri Lelli <juri.lelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dario Faggioli <raistlin-k2GhghHVRtY@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, May 12, 2014 at 02:09:58PM +0200, Michael Kerrisk (man-pages) wrote:
> Hi Peter,
> 
> Looking at the code of sched_getparam() and sched_setscheduler() (to
> see what might need to land in the man pagea with respect to
> SCHED_DEADLINE changes), I see that the former fails (EINVAL) if the
> target is a SCHED_DEADLINE process, while the latter succeeds
> (returning SCHED_DEADLINE).
> 
> The sched_setscheduler() seems fine, but what's the rationale for
> having sched_getparam() fail in this case, rather than just returning
> a sched_priority of zero (since sched_priority is in any case unused,
> as for SCHED_OTHER, right)? My point is that the change seems to
> needlessly break applications that employ sched_getparam(). Maybe I am
> missing something...

s/setscheduler/getscheduler/ ?

I'm a proponent of fail hard instead of fail silently and muddle on.

And while we can fully and correctly return sched_getscheduler() we
cannot do so for sched_getparam().

Returning sched_param::sched_priority == 0 for DEADLINE would also break
the symmetry between sched_setparam() and sched_getparam(), both will
fail for SCHED_DEADLINE.


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
