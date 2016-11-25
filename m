From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: RFC: documentation of the autogroup feature [v2]
Date: Fri, 25 Nov 2016 17:33:23 +0100
Message-ID: <c0f61369-9601-0c90-8b85-61e75e4f4e82@gmail.com>
References: <41d802dc-873a-ff02-17ff-93ce50f3e925@gmail.com>
 <1479901185.4306.38.camel@gmx.de>
 <327586fa-4672-d070-0ded-850654586273@gmail.com>
 <1479915229.4306.106.camel@gmx.de>
 <7513b0a5-c5d0-3a92-5849-995af22601e4@gmail.com>
 <1479921075.4306.153.camel@gmx.de>
 <c5a9acd3-6b60-192c-312e-2777f2d537c2@gmail.com>
 <1480078973.4075.58.camel@gmx.de>
 <ca16c155-22be-df06-4f2d-4337b72381de@gmail.com>
 <20161125160456.GP3092@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161125160456.GP3092-ndre7Fmf5hadTX5a5knrm8zTDFooKrT+cvkQGrU6aU0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Peter,

On 11/25/2016 05:04 PM, Peter Zijlstra wrote:
> On Fri, Nov 25, 2016 at 04:04:25PM +0100, Michael Kerrisk (man-pages) wrote:
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
> Ever since cfs-cgroup, 

Okay. That begs the question still though.

> this is a fundamental design point of cgroups,
> and has therefore always been the case for autogroups (as that is
> nothing more than an application of the cgroup code).

Understood. 

>> It seems to me that this renders the traditional process
>> nice pretty much useless. (I bet I'm not the only one who'd 
>> be surprised by the current behavior.)
> 
> Its really rather fundamental to how the whole hierarchical things
> works.
> 
> CFS is a weighted fair queueing scheduler; this means each entity
> receives:
> 
>                w_i
>   dt_i = dt --------
> 	    \Sum w_j
> 
> 
> 		CPU
> 	  ______/ \______
> 	 /    |     |	 \
>       A     B     C     D
> 
> 
> So if each entity {A,B,C,D} has equal weight, then they will receive
> equal time. Explicitly, for C you get:
> 
> 
>                       w_C
>   dt_C = dt -----------------------
>             (w_A + w_B + w_C + w_D)
> 
> 
> Extending this to a hierarchy, we get:
> 
> 
> 		CPU
> 	  ______/ \______
> 	 /    |     |	 \
>       A     B     C     D
> 	           / \
> 		  E   F
> 
> Where C becomes a 'server' for entities {E,F}. The weight of C does not
> depend on its child entities. This way the time of {E,F} becomes a
> straight product of their ratio with C. That is; the whole thing
> becomes, where l denotes the level in the hierarchy and i an
> entity on that level:
> 
>                  l      w_g,i
>   dt_l,i = dt \Prod  ----------
>                 g=0  \Sum w_g,j
> 
> 
> Or more concretely, for E:
> 
>                       w_E
>   dt_1,E = dt_0,C -----------
>                   (w_E + w_F)
> 
>                         w_C               w_E
>          = dt ----------------------- -----------
>               (w_A + w_B + w_C + w_D) (w_E + w_F)
> 
> 
> And this 'trivially' extends to SMP, with the tricky bit being that the
> sums over all entities end up being machine wide, instead of per CPU,
> which is a real and royal pain for performance.

Okay -- you're really quite the ASCII artist. And somehow,
I think you needed to compose the mail in LaTeX. But thanks
for the detail. It's helpful, for me at least.

> Note that this property, where the weight of the server entity is
> independent from its child entities is a desired feature. Without that
> it would be impossible to control the relative weights of groups, and
> that is the sole parameter of the WFQ model.
> 
> It is also why Linus so likes autogroups, each session competes equally
> amongst one another.

I get it. But, the behavior changes for the process nice value are
undocumented, and they should be documented. I understand
what the behavior change was. But not yet when.

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
