From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: RFC: documentation of the autogroup feature
Date: Tue, 22 Nov 2016 16:59:06 +0100
Message-ID: <41d802dc-873a-ff02-17ff-93ce50f3e925@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Galbraith <efault@gmx.de>
Cc: mtk.manpages@gmail.com, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@kernel.org>, linux-man <linux-man@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-man@vger.kernel.org

Hello Mike and others,

The autogroup feature that you added in 2.6.38 remains poorly 
documented, so I took a stab at adding some text to the sched(7) 
manual page. There are still a few pieces to be fixed, and you 
may also see some other pieces that should be added. Could I 
ask you to take a look at the text below?

Cheers,

Michael

   The autogroup feature
       Since Linux 2.6.38, the kernel  provides  a  feature  known  as
       autogrouping  to improve interactive desktop performance in the
       face of multiprocess CPU-intensive workloads such  as  building
       the Linux kernel with large numbers of parallel build processes
       (i.e., the make(1) -j flag).

       This feature operates in conjunction with the CFS scheduler and
       requires  a  kernel  that is configured with CONFIG_SCHED_AUTO‐
       GROUP.  On a running system, this feature is  enabled  or  dis‐
       abled  via the file /proc/sys/kernel/sched_autogroup_enabled; a
       value of 0 disables the feature, while a value of 1 enables it.
       The  default  value  in  this  file is 1, unless the kernel was
       booted with the noautogroup parameter.

       When  autogrouping  is  enabled,  processes  are  automatically
       placed  into  "task groups" for the purposes of scheduling.  In
       the current implementation, a new task group is created when  a
       new  session is created via setsid(2), as happens, for example,
       when a new terminal window is created.  A task group  is  auto‐
       matically  destroyed  when the last process in the group termi‐
       nates.



       ┌─────────────────────────────────────────────────────┐
       │FIXME                                                │
       ├─────────────────────────────────────────────────────┤
       │The following is a little vague. Does it need to  be │
       │made more precise?                                   │
       └─────────────────────────────────────────────────────┘
       The CFS scheduler employs an algorithm that distributes the CPU
       across task groups.  As a result of this  algorithm,  the  pro‐
       cesses  in task groups that contain multiple CPU-intensive pro‐
       cesses are in effect disfavored by the scheduler.

       A process's autogroup (task group) membership can be viewed via
       the file /proc/[pid]/autogroup:

           $ cat /proc/1/autogroup
           /autogroup-1 nice 0

       This  file  can  also be used to modify the CPU bandwidth allo‐
       cated to a task group.  This is done by writing a number in the
       "nice"  range  to  the file to set the task group's nice value.
       The allowed range is from +19 (low priority) to -20 (high  pri‐
       ority).   Note that all values in this range cause a task group
       to be further disfavored by the scheduler, with  -20  resulting
       in  the  scheduler  mildy  disfavoring  the  task group and +19
       greatly disfavoring it.


       ┌─────────────────────────────────────────────────────┐
       │FIXME                                                │
       ├─────────────────────────────────────────────────────┤
       │Regarding the previous paragraph...  My tests  indi‐ │
       │cate  that writing *any* value to the autogroup file │
       │causes the task group to get a lower priority.  This │
       │somewhat surprised me, since I assumed (based on the │
       │parallel with the process nice(2) value) that  nega‐ │
       │tive  values  might  boost the task group's priority │
       │above a task group whose autogroup file had not been │
       │touched.                                             │
       │                                                     │
       │Is this the expected behavior? I presume it is...    │
       │                                                     │
       │But  then there's a small surprise in the interface. │
       │Suppose that the value 0 is written to the autogroup │
       │file, then this results in the task group being sig‐ │
       │nificantly disfavored. But, the nice  value  *shown* │
       │in  the  autogroup  file  will be the same as if the │
       │file had not been modified. So, the user has no  way │
       │of discovering the difference. That seems odd.  Am I │
       │missing something?                                   │
       └─────────────────────────────────────────────────────┘



       ┌─────────────────────────────────────────────────────┐
       │FIXME                                                │
       ├─────────────────────────────────────────────────────┤
       │Is the following correct? Does the statement need to │
       │be  more  precise? (E.g., in precisely which circum‐ │
       │stances does the use of cgroups override autogroup?) │
       └─────────────────────────────────────────────────────┘
       The use of the cgroups(7) CPU controller overrides  the  effect
       of autogrouping.


       ┌─────────────────────────────────────────────────────┐
       │FIXME                                                │
       ├─────────────────────────────────────────────────────┤
       │What  needs to be said about autogroup and real-time │
       │tasks?                                               │
       └─────────────────────────────────────────────────────┘


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
