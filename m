From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: RFC: documentation of the autogroup feature [v2]
Date: Tue, 29 Nov 2016 08:43:33 +0100
Message-ID: <755aba1b-9bf4-0277-0628-b27e725ee2f9@gmail.com>
References: <7513b0a5-c5d0-3a92-5849-995af22601e4@gmail.com>
 <1479921075.4306.153.camel@gmx.de>
 <c5a9acd3-6b60-192c-312e-2777f2d537c2@gmail.com>
 <1480078973.4075.58.camel@gmx.de>
 <ca16c155-22be-df06-4f2d-4337b72381de@gmail.com>
 <1480089063.4075.80.camel@gmx.de>
 <d3d491d3-0770-d017-4f3c-43d88346835c@gmail.com>
 <20161125161810.GR3092@twins.programming.kicks-ass.net>
 <2cc53b76-668b-edf1-6aa7-e6cb5a9801e1@gmail.com>
 <af075c46-152a-0392-d33f-c7956d3c8a0b@gmail.com>
 <20161125214936.GB3045@worktop.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161125214936.GB3045-IIpfhp3q70z/8w/KjCw3T+5/BudmfyzbbVWyRVo5IupeoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Peter,

On 11/25/2016 10:49 PM, Peter Zijlstra wrote:
> On Fri, Nov 25, 2016 at 09:54:05PM +0100, Michael Kerrisk (man-pages) wrote:
>> So, part of what I was struggling with was what you meant by cfs-cgroup.
>> Do you mean the CFS bandwidth control features added in Linux 3.2?
> 
> Nope, /me digs around for a bit... around here I suppose:
> 
>  68318b8e0b61 ("Hook up group scheduler with control groups")

Thanks. The pieces are starting to fall into place now.

> 68318b8e0b61 v2.6.24-rc1~151
> 
> But I really have no idea what that looked like.
> 
> In any case, for the case of autogroup, the behaviour has always been,
> autogroups came quite late.

This ("the behavior has always been") isn't quite true. Yes, group
scheduling has been around since Linux 2.6.24, but in terms of the
semantics of the thread nice value, there was no visible change
then, *unless* explicit action was taken to create cgroups.

The arrival of autogroups in Linux 2.6.38 was different. 
With this feature enabled (which is the default), task
groups were implicitly created *without the user needing to
do anything*. Thus, [two terminal windows] == [two task groups]
and in those two terminal windows, nice(1) on a CPU-bound
command in one terminal did nothing in terms of improving
CPU access for a CPU-bound tasks running on the other terminal
window.

Put more succinctly: in Linux 2.6.38, autogrouping broke nice(1)
for many use cases.

Once I came to that simple summary it was easy to find multiple
reports of problems from users:

http://serverfault.com/questions/405092/nice-level-not-working-on-linux
http://superuser.com/questions/805599/nice-has-no-effect-in-linux-unless-the-same-shell-is-used
https://www.reddit.com/r/linux/comments/1c4jew/nice_has_no_effect/
http://stackoverflow.com/questions/10342470/process-niceness-priority-setting-has-no-effect-on-linux

Someone else quickly pointed out to me another such report:

https://bbs.archlinux.org/viewtopic.php?id=149553

And when I quickly surveyed a few more or less savvy Linux users
in one room, most understood what nice does, but none of them knew
about the behavior change wrought by autogroup.

I haven't looked at all of the mails in the old threads that 
discussed the implementation of this feature, but so far none of
those that I saw mentioned this behavior change. It's unfortunate
that it never even got documented.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
