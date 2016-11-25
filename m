From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: RFC: documentation of the autogroup feature [v2]
Date: Fri, 25 Nov 2016 17:08:44 +0100
Message-ID: <d3d491d3-0770-d017-4f3c-43d88346835c@gmail.com>
References: <41d802dc-873a-ff02-17ff-93ce50f3e925@gmail.com>
 <1479901185.4306.38.camel@gmx.de>
 <327586fa-4672-d070-0ded-850654586273@gmail.com>
 <1479915229.4306.106.camel@gmx.de>
 <7513b0a5-c5d0-3a92-5849-995af22601e4@gmail.com>
 <1479921075.4306.153.camel@gmx.de>
 <c5a9acd3-6b60-192c-312e-2777f2d537c2@gmail.com>
 <1480078973.4075.58.camel@gmx.de>
 <ca16c155-22be-df06-4f2d-4337b72381de@gmail.com>
 <1480089063.4075.80.camel@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480089063.4075.80.camel-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 11/25/2016 04:51 PM, Mike Galbraith wrote:
> On Fri, 2016-11-25 at 16:04 +0100, Michael Kerrisk (man-pages) wrote:
> 
>>>>        ┌─────────────────────────────────────────────────────┐
>>>>        │FIXME                                                │
>>>>        ├─────────────────────────────────────────────────────┤
>>>>        │How do the nice value of  a  process  and  the  nice │
>>>>        │value of an autogroup interact? Which has priority?  │
>>>>        │                                                     │
>>>>        │It  *appears*  that the autogroup nice value is used │
>>>>        │for CPU distribution between task groups,  and  that │
>>>>        │the  process nice value has no effect there.  (I.e., │
>>>>        │suppose two  autogroups  each  contain  a  CPU-bound │
>>>>        │process,  with  one  process  having nice==0 and the │
>>>>        │other having nice==19.  It appears  that  they  each │
>>>>        │get  50%  of  the CPU.)  It appears that the process │
>>>>        │nice value has effect only with respect to  schedul‐ │
>>>>        │ing  relative to other processes in the *same* auto‐ │
>>>>        │group.  Is this correct?                             │
>>>>        └─────────────────────────────────────────────────────┘
>>>
>>> Yup, entity nice level affects distribution among peer entities.
>>
>> Huh! I only just learned about this via my experiments while
>> investigating autogroups. 
>>
>> How long have things been like this? Always? (I don't think
>> so.) Since the arrival of CFS? Since the arrival of
>> autogrouping? (I'm guessing not.) Since some other point?
>> (When?)
> 
> Always.  Before CFS there just were no non-peers :)

Well that's one way of looking at it. So, the change 
that I'm talking about came in 2.6.32 with CFS then?

>> It seems to me that this renders the traditional process
>> nice pretty much useless. (I bet I'm not the only one who'd 
>> be surprised by the current behavior.)
> 
> Yup, group scheduling is not a single edged sword, those don't exist. 
>  Box wide nice loss is not the only thing that can bite you, fairness,
> whether group or task oriented cuts both ways.

Understood. But again I'll say, I bet a lot of old-time users
(and maybe many newer) would be surprised by the fact that 
nice(1) / setpriority(2) have effectively been rendered no-ops
in many use cases. At the very least, it'd have been nice
if someone had sent a man pages patch or at least a note...

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
