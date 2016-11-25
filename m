From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: RFC: documentation of the autogroup feature [v2]
Date: Fri, 25 Nov 2016 16:04:25 +0100
Message-ID: <ca16c155-22be-df06-4f2d-4337b72381de@gmail.com>
References: <41d802dc-873a-ff02-17ff-93ce50f3e925@gmail.com>
 <1479901185.4306.38.camel@gmx.de>
 <327586fa-4672-d070-0ded-850654586273@gmail.com>
 <1479915229.4306.106.camel@gmx.de>
 <7513b0a5-c5d0-3a92-5849-995af22601e4@gmail.com>
 <1479921075.4306.153.camel@gmx.de>
 <c5a9acd3-6b60-192c-312e-2777f2d537c2@gmail.com>
 <1480078973.4075.58.camel@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1480078973.4075.58.camel@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Galbraith <efault@gmx.de>
Cc: mtk.manpages@gmail.com, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@kernel.org>, linux-man <linux-man@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-man@vger.kernel.org

Hi Mike,

On 11/25/2016 02:02 PM, Mike Galbraith wrote:
> On Thu, 2016-11-24 at 22:41 +0100, Michael Kerrisk (man-pages) wrote:
> 
>>        Suppose  that  there  are two autogroups competing for the same
>>        CPU.  The first group contains ten CPU-bound processes  from  a
>>        kernel build started with make -j10.  The other contains a sin‐
>>        gle CPU-bound process: a video player.   The  effect  of  auto‐
>>        grouping  is  that the two groups will each receive half of the
>>        CPU cycles.  That is, the video player will receive 50% of  the
>>        CPU  cycles,  rather  just 9% of the cycles, which would likely
>>        lead to degraded video playback.  Or to put things another way:
>>        an  autogroup  that  contains  a large number of CPU-bound pro‐
>>        cesses does not end up overwhelming the CPU at the  expense  of
>>        the other jobs on the system.
> 
> I'd say something more wishy-washy here, like cycles are distributed
> fairly across groups and leave it at that, 

I see where you want to go, but the problem is that the word "fair"
will invoke different interpretations for different people. So, I
think one does need to be a little more concrete.

> as your detailed example is
> incorrect due to SMP fairness 

Well, I was trying to exclude SMP from the discussion by saying
"competing for the same CPU". Here I was meaning that we involve
taskset(1) to confine everyone to the same CPU. Then, I think
my example is correct. (I did some light testing before writing
that text.) But I guess my meaning wasn't clear enough, and
it is a slightly contrived scenario anyway. I'll add some words
to clarify my example, and also add something to say that the
situation is more complex on an SMP system. Something like
the following:

       Suppose that there are two autogroups competing for the  same  CPU
       (i.e., presume either a single CPU system or the use of taskset(1)
       to confine all the processes to the same CPU on  an  SMP  system).
       The  first  group  contains  ten CPU-bound processes from a kernel
       build started with make -j10.  The other contains  a  single  CPU-
       bound process: a video player.  The effect of autogrouping is that
       the two groups will each receive half of the CPU cycles.  That is,
       the  video  player will receive 50% of the CPU cycles, rather than
       just 9% of the cycles, which would likely lead to  degraded  video
       playback.  The situation on an SMP system is more complex, but the
       general effect is the same: the scheduler distributes  CPU  cycles
       across  task  groups  such that an autogroup that contains a large
       number of CPU-bound processes does not end up hoffing  CPU  cycles
       at the expense of the other jobs on the system.

> (which I don't like much because [very
> unlikely] worst case scenario renders a box sized group incapable of
> utilizing more that a single CPU total).  For example, if a group of
> NR_CPUS size competes with a singleton, load balancing will try to give
> the singleton a full CPU of its very own.  If groups intersect for
> whatever reason on say my quad lappy, distribution is 80/20 in favor of
> the singleton.

Thanks for the additional info. Good for educating me, but I think
you'll agree it's more than we need for the man page.

>>        ┌─────────────────────────────────────────────────────┐
>>        │FIXME                                                │
>>        ├─────────────────────────────────────────────────────┤
>>        │How do the nice value of  a  process  and  the  nice │
>>        │value of an autogroup interact? Which has priority?  │
>>        │                                                     │
>>        │It  *appears*  that the autogroup nice value is used │
>>        │for CPU distribution between task groups,  and  that │
>>        │the  process nice value has no effect there.  (I.e., │
>>        │suppose two  autogroups  each  contain  a  CPU-bound │
>>        │process,  with  one  process  having nice==0 and the │
>>        │other having nice==19.  It appears  that  they  each │
>>        │get  50%  of  the CPU.)  It appears that the process │
>>        │nice value has effect only with respect to  schedul‐ │
>>        │ing  relative to other processes in the *same* auto‐ │
>>        │group.  Is this correct?                             │
>>        └─────────────────────────────────────────────────────┘
> 
> Yup, entity nice level affects distribution among peer entities.

Huh! I only just learned about this via my experiments while
investigating autogroups. 

How long have things been like this? Always? (I don't think
so.) Since the arrival of CFS? Since the arrival of
autogrouping? (I'm guessing not.) Since some other point?
(When?)

It seems to me that this renders the traditional process
nice pretty much useless. (I bet I'm not the only one who'd 
be surprised by the current behavior.)

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
