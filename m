From: Mike Galbraith <efault@gmx.de>
Subject: Re: RFC: documentation of the autogroup feature
Date: Wed, 23 Nov 2016 12:39:45 +0100
Message-ID: <1479901185.4306.38.camel@gmx.de>
References: <41d802dc-873a-ff02-17ff-93ce50f3e925@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <41d802dc-873a-ff02-17ff-93ce50f3e925@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@kernel.org>, linux-man <linux-man@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-man@vger.kernel.org

On Tue, 2016-11-22 at 16:59 +0100, Michael Kerrisk (man-pages) wrote:

>        ┌─────────────────────────────────────────────────────┐
>        │FIXME                                                │
>        ├─────────────────────────────────────────────────────┤
>        │The following is a little vague. Does it need to  be │
>        │made more precise?                                   │
>        └─────────────────────────────────────────────────────┘
>        The CFS scheduler employs an algorithm that distributes the CPU
>        across task groups.  As a result of this  algorithm,  the  pro‐
>        cesses  in task groups that contain multiple CPU-intensive pro‐
>        cesses are in effect disfavored by the scheduler.

Mmmm, they're actually equalized (modulo smp fairness goop), but I see
what you mean.

>        A process's autogroup (task group) membership can be viewed via
>        the file /proc/[pid]/autogroup:
> 
>            $ cat /proc/1/autogroup
>            /autogroup-1 nice 0
> 
>        This  file  can  also be used to modify the CPU bandwidth allo‐
>        cated to a task group.  This is done by writing a number in the
>        "nice"  range  to  the file to set the task group's nice value.
>        The allowed range is from +19 (low priority) to -20 (high  pri‐
>        ority).   Note that all values in this range cause a task group
>        to be further disfavored by the scheduler, with  -20  resulting
>        in  the  scheduler  mildy  disfavoring  the  task group and +19
>        greatly disfavoring it.

Group nice levels exactly work the same as task nice levels, ie
negative nice increases share, positive nice decreases it relative to
the default nice 0.

>        ┌─────────────────────────────────────────────────────┐
>        │FIXME                                                │
>        ├─────────────────────────────────────────────────────┤
>        │Regarding the previous paragraph...  My tests  indi‐ │
>        │cate  that writing *any* value to the autogroup file │
>        │causes the task group to get a lower priority.

(patchlet.. I'd prefer to whack the knob, but like the on/off switch,
it may be in use, so I guess we're stuck with it)

>        ┌─────────────────────────────────────────────────────┐
>        │FIXME                                                │
>        ├─────────────────────────────────────────────────────┤
>        │Is the following correct? Does the statement need to │
>        │be  more  precise? (E.g., in precisely which circum‐ │
>        │stances does the use of cgroups override autogroup?) │
>        └─────────────────────────────────────────────────────┘
>        The use of the cgroups(7) CPU controller overrides  the  effect
>        of autogrouping.

Correct, autogroup defers to cgroups.  Perhaps mention that moving a
task back to the root task group will result in the autogroup again
taking effect.

>        ┌─────────────────────────────────────────────────────┐
>        │FIXME                                                │
>        ├─────────────────────────────────────────────────────┤
>        │What  needs to be said about autogroup and real-time │
>        │tasks?                                               │
>        └─────────────────────────────────────────────────────┘

That it does not group realtime tasks, they are auto-deflected to the
root task group.

	-Mike
