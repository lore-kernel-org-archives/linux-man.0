From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: RFC: documentation of the autogroup feature [v2]
Date: Thu, 24 Nov 2016 22:41:29 +0100
Message-ID: <c5a9acd3-6b60-192c-312e-2777f2d537c2@gmail.com>
References: <41d802dc-873a-ff02-17ff-93ce50f3e925@gmail.com>
 <1479901185.4306.38.camel@gmx.de>
 <327586fa-4672-d070-0ded-850654586273@gmail.com>
 <1479915229.4306.106.camel@gmx.de>
 <7513b0a5-c5d0-3a92-5849-995af22601e4@gmail.com>
 <1479921075.4306.153.camel@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479921075.4306.153.camel@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Galbraith <efault@gmx.de>
Cc: mtk.manpages@gmail.com, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@kernel.org>, linux-man <linux-man@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-man@vger.kernel.org

Hi Mike,

I reworked the text on autogroups, and in the process learned
something/have another question. Could you tell me if anything 
in the below needs fixing/improving, and also let me know about
the FIXME?

Thanks,

Michael

   The autogroup feature
       Since Linux 2.6.38, the kernel  provides  a  feature  known  as
       autogrouping  to improve interactive desktop performance in the
       face of multiprocess, CPU-intensive workloads such as  building
       the Linux kernel with large numbers of parallel build processes
       (i.e., the make(1) -j flag).

       This feature operates in conjunction with the CFS scheduler and
       requires  a  kernel  that is configured with CONFIG_SCHED_AUTO‐
       GROUP.  On a running system, this feature is  enabled  or  dis‐
       abled  via the file /proc/sys/kernel/sched_autogroup_enabled; a
       value of 0 disables the feature, while a value of 1 enables it.
       The  default  value  in  this  file is 1, unless the kernel was
       booted with the noautogroup parameter.

       A new autogroup is created created when a new session  is  cre‐
       ated  via setsid(2); this happens, for example, when a new ter‐
       minal window is started.  A  new  process  created  by  fork(2)
       inherits  its  parent's autogroup membership.  Thus, all of the
       processes in a session are members of the same  autogroup.   An
       autogroup  is  automatically destroyed when the last process in
       the group terminates.

       When autogrouping is enabled, all of the members  of  an  auto‐
       group  are  placed  in  the same kernel scheduler "task group".
       The CFS scheduler employs an algorithm that equalizes the  dis‐
       tribution  of  CPU  cycles across task groups.  The benefits of
       this for interactive desktop performance can be  described  via
       the following example.

       Suppose  that  there  are two autogroups competing for the same
       CPU.  The first group contains ten CPU-bound processes  from  a
       kernel build started with make -j10.  The other contains a sin‐
       gle CPU-bound process: a video player.   The  effect  of  auto‐
       grouping  is  that the two groups will each receive half of the
       CPU cycles.  That is, the video player will receive 50% of  the
       CPU  cycles,  rather  just 9% of the cycles, which would likely
       lead to degraded video playback.  Or to put things another way:
       an  autogroup  that  contains  a large number of CPU-bound pro‐
       cesses does not end up overwhelming the CPU at the  expense  of
       the other jobs on the system.

       A process's autogroup (task group) membership can be viewed via
       the file /proc/[pid]/autogroup:

           $ cat /proc/1/autogroup
           /autogroup-1 nice 0

       This file can also be used to modify the  CPU  bandwidth  allo‐
       cated to an autogroup.  This is done by writing a number in the
       "nice" range to the file to set  the  autogroup's  nice  value.
       The  allowed range is from +19 (low priority) to -20 (high pri‐
       ority), and the setting has the same effect  as  modifying  the
       nice  level  via getpriority(2).  (For a discussion of the nice
       value, see getpriority(2).)


       ┌─────────────────────────────────────────────────────┐
       │FIXME                                                │
       ├─────────────────────────────────────────────────────┤
       │How do the nice value of  a  process  and  the  nice │
       │value of an autogroup interact? Which has priority?  │
       │                                                     │
       │It  *appears*  that the autogroup nice value is used │
       │for CPU distribution between task groups,  and  that │
       │the  process nice value has no effect there.  (I.e., │
       │suppose two  autogroups  each  contain  a  CPU-bound │
       │process,  with  one  process  having nice==0 and the │
       │other having nice==19.  It appears  that  they  each │
       │get  50%  of  the CPU.)  It appears that the process │
       │nice value has effect only with respect to  schedul‐ │
       │ing  relative to other processes in the *same* auto‐ │
       │group.  Is this correct?                             │
       └─────────────────────────────────────────────────────┘

       The use of the cgroups(7) CPU controller overrides  the  effect
       of autogrouping.

       The  autogroup feature does not group processes that are sched‐
       uled under a real-time and deadline policies.  Those  processes
       are scheduled according to the rules described earlier.


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
