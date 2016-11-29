From: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: RFC: documentation of the autogroup feature [v2]
Date: Tue, 29 Nov 2016 12:46:29 +0100
Message-ID: <20161129114629.GG3092@twins.programming.kicks-ass.net>
References: <c5a9acd3-6b60-192c-312e-2777f2d537c2@gmail.com>
 <1480078973.4075.58.camel@gmx.de>
 <ca16c155-22be-df06-4f2d-4337b72381de@gmail.com>
 <1480089063.4075.80.camel@gmx.de>
 <d3d491d3-0770-d017-4f3c-43d88346835c@gmail.com>
 <20161125161810.GR3092@twins.programming.kicks-ass.net>
 <2cc53b76-668b-edf1-6aa7-e6cb5a9801e1@gmail.com>
 <af075c46-152a-0392-d33f-c7956d3c8a0b@gmail.com>
 <20161125214936.GB3045@worktop.programming.kicks-ass.net>
 <755aba1b-9bf4-0277-0628-b27e725ee2f9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <755aba1b-9bf4-0277-0628-b27e725ee2f9-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Nov 29, 2016 at 08:43:33AM +0100, Michael Kerrisk (man-pages) wrote:
> > 
> > In any case, for the case of autogroup, the behaviour has always been,
> > autogroups came quite late.
> 
> This ("the behavior has always been") isn't quite true. Yes, group
> scheduling has been around since Linux 2.6.24, but in terms of the
> semantics of the thread nice value, there was no visible change
> then, *unless* explicit action was taken to create cgroups.
> 
> The arrival of autogroups in Linux 2.6.38 was different. 
> With this feature enabled (which is the default), task

I don't think the SCHED_AUTOGROUP symbol is default y, most distros
might have default enabled it, but that's not something I can help.

> groups were implicitly created *without the user needing to
> do anything*. Thus, [two terminal windows] == [two task groups]
> and in those two terminal windows, nice(1) on a CPU-bound
> command in one terminal did nothing in terms of improving
> CPU access for a CPU-bound tasks running on the other terminal
> window.
> 
> Put more succinctly: in Linux 2.6.38, autogrouping broke nice(1)
> for many use cases.
> 
> Once I came to that simple summary it was easy to find multiple
> reports of problems from users:
> 
> http://serverfault.com/questions/405092/nice-level-not-working-on-linux
> http://superuser.com/questions/805599/nice-has-no-effect-in-linux-unless-the-same-shell-is-used
> https://www.reddit.com/r/linux/comments/1c4jew/nice_has_no_effect/
> http://stackoverflow.com/questions/10342470/process-niceness-priority-setting-has-no-effect-on-linux
> 
> Someone else quickly pointed out to me another such report:
> 
> https://bbs.archlinux.org/viewtopic.php?id=149553

Well, none of that ever got back to me, so again, nothing I could do
about that.

> And when I quickly surveyed a few more or less savvy Linux users
> in one room, most understood what nice does, but none of them knew
> about the behavior change wrought by autogroup.
> 
> I haven't looked at all of the mails in the old threads that 
> discussed the implementation of this feature, but so far none of
> those that I saw mentioned this behavior change. It's unfortunate
> that it never even got documented.

Well, when we added the feature people (most notable Linus) understood
what cgroups did. So no surprises for any of us.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
