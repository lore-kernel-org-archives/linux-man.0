From: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: RFC: documentation of the autogroup feature [v2]
Date: Fri, 25 Nov 2016 14:02:53 +0100
Message-ID: <1480078973.4075.58.camel@gmx.de>
References: <41d802dc-873a-ff02-17ff-93ce50f3e925@gmail.com>
         <1479901185.4306.38.camel@gmx.de>
         <327586fa-4672-d070-0ded-850654586273@gmail.com>
         <1479915229.4306.106.camel@gmx.de>
         <7513b0a5-c5d0-3a92-5849-995af22601e4@gmail.com>
         <1479921075.4306.153.camel@gmx.de>
         <c5a9acd3-6b60-192c-312e-2777f2d537c2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c5a9acd3-6b60-192c-312e-2777f2d537c2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, 2016-11-24 at 22:41 +0100, Michael Kerrisk (man-pages) wrote:

>        Suppose  that  there  are two autogroups competing for the same
>        CPU.  The first group contains ten CPU-bound processes  from  a
>        kernel build started with make -j10.  The other contains a sin‐
>        gle CPU-bound process: a video player.   The  effect  of  auto‐
>        grouping  is  that the two groups will each receive half of the
>        CPU cycles.  That is, the video player will receive 50% of  the
>        CPU  cycles,  rather  just 9% of the cycles, which would likely
>        lead to degraded video playback.  Or to put things another way:
>        an  autogroup  that  contains  a large number of CPU-bound pro‐
>        cesses does not end up overwhelming the CPU at the  expense  of
>        the other jobs on the system.

I'd say something more wishy-washy here, like cycles are distributed
fairly across groups and leave it at that, as your detailed example is
incorrect due to SMP fairness (which I don't like much because [very
unlikely] worst case scenario renders a box sized group incapable of
utilizing more that a single CPU total).  For example, if a group of
NR_CPUS size competes with a singleton, load balancing will try to give
the singleton a full CPU of its very own.  If groups intersect for
whatever reason on say my quad lappy, distribution is 80/20 in favor of
the singleton.

>        ┌─────────────────────────────────────────────────────┐
>        │FIXME                                                │
>        ├─────────────────────────────────────────────────────┤
>        │How do the nice value of  a  process  and  the  nice │
>        │value of an autogroup interact? Which has priority?  │
>        │                                                     │
>        │It  *appears*  that the autogroup nice value is used │
>        │for CPU distribution between task groups,  and  that │
>        │the  process nice value has no effect there.  (I.e., │
>        │suppose two  autogroups  each  contain  a  CPU-bound │
>        │process,  with  one  process  having nice==0 and the │
>        │other having nice==19.  It appears  that  they  each │
>        │get  50%  of  the CPU.)  It appears that the process │
>        │nice value has effect only with respect to  schedul‐ │
>        │ing  relative to other processes in the *same* auto‐ │
>        │group.  Is this correct?                             │
>        └─────────────────────────────────────────────────────┘

Yup, entity nice level affects distribution among peer entities.

	-Mike
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
