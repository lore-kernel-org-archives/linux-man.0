From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: RFC [v2]: documenting autogroup, group scheduling, and interactions
 with nice
Date: Tue, 29 Nov 2016 18:04:14 +0100
Message-ID: <a059c579-a532-fc2d-7db5-16f918ce2f79@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Mike and others,

This is my second version of an attempt to document the autogroup that
you added in 2.6.38. As well as reworking nd extending the autogroup
text, in this round I've added text describing group scheduling, and
also noted the changes (somewhat surprising for users) that implicit
autogrouping brought about for the operation of the nice(1) command.
Could you please take a look, and let me know if anything needs fixing.

Cheers,

Michael


For the sched(7) man page:

   The autogroup feature
       Since  Linux  2.6.38, the kernel provides a feature known as auto‐
       grouping to improve interactive desktop performance in the face of
       multiprocess,  CPU-intensive  workloads such as building the Linux
       kernel with large numbers of parallel build processes  (i.e.,  the
       make(1) -j flag).

       This  feature  operates  in conjunction with the CFS scheduler and
       requires a kernel that is configured with  CONFIG_SCHED_AUTOGROUP.
       On  a  running system, this feature is enabled or disabled via the
       file /proc/sys/kernel/sched_autogroup_enabled; a value of  0  dis‐
       ables  the  feature,  while  a value of 1 enables it.  The default
       value in this file is 1, unless the kernel  was  booted  with  the
       noautogroup parameter.

       A  new  autogroup is created created when a new session is created
       via setsid(2); this happens, for example, when a new terminal win‐
       dow  is  started.   A  new process created by fork(2) inherits its
       parent's autogroup membership.  Thus, all of the  processes  in  a
       session  are members of the same autogroup.  An autogroup is auto‐
       matically destroyed when the last process in the group terminates.

       When autogrouping is enabled, all of the members of  an  autogroup
       are  placed  in  the  same kernel scheduler "task group".  The CFS
       scheduler employs an algorithm that equalizes the distribution  of
       CPU  cycles across task groups.  The benefits of this for interac‐
       tive desktop performance can be described via the following  exam‐
       ple.

       Suppose  that  there are two autogroups competing for the same CPU
       (i.e., presume either a single CPU system or the use of taskset(1)
       to  confine  all  the processes to the same CPU on an SMP system).
       The first group contains ten CPU-bound  processes  from  a  kernel
       build  started  with  make -j10.  The other contains a single CPU-
       bound process: a video player.  The effect of autogrouping is that
       the two groups will each receive half of the CPU cycles.  That is,
       the video player will receive 50% of the CPU cycles,  rather  than
       just  9%  of the cycles, which would likely lead to degraded video
       playback.  The situation on an SMP system is more complex, but the
       general  effect  is the same: the scheduler distributes CPU cycles
       across task groups such that an autogroup that  contains  a  large
       number  of  CPU-bound processes does not end up hogging CPU cycles
       at the expense of the other jobs on the system.

       A process's autogroup (task group) membership can  be  viewed  via
       the file /proc/[pid]/autogroup:

           $ cat /proc/1/autogroup
           /autogroup-1 nice 0

       This  file  can also be used to modify the CPU bandwidth allocated
       to an autogroup.  This is done by writing a number in  the  "nice"
       range  to the file to set the autogroup's nice value.  The allowed
       range is from +19 (low priority) to -20 (high priority).  (Writing
       values  outside  of  this  range  causes write(2) to fail with the
       error EINVAL.)

       The autogroup nice setting has the same  meaning  as  the  process
       nice value, but applies to distribution of CPU cycles to the auto‐
       group as a whole, based on the relative nice values of other auto‐
       groups.  For a process inside an autogroup, the CPU cycles that it
       receives will be a product of the autogroup's nice value (compared
       to  other  autogroups)  and  the process's nice value (compared to
       other processes in the same autogroup.

       The use of the cgroups(7) CPU controller  to  place  processes  in
       cgroups  other  than  the  root CPU cgroup overrides the effect of
       autogrouping.

       The autogroup feature groups only processes scheduled  under  non-
       real-time policies (SCHED_OTHER, SCHED_BATCH, and SCHED_IDLE).  It
       does not group processes scheduled under  real-time  and  deadline
       policies.   Those  processes  are scheduled according to the rules
       described earlier.

   The nice value and group scheduling
       When scheduling non-real-time  processes  (i.e.,  those  scheduled
       under  the SCHED_OTHER, SCHED_BATCH, and SCHED_IDLE policies), the
       CFS scheduler employs a technique known as "group scheduling",  if
       the  kernel was configured with the CONFIG_FAIR_GROUP_SCHED option
       (which is typical).

       Under group scheduling, threads are scheduled  in  "task  groups".
       Task  groups  have  a  hierarchical relationship, rooted under the
       initial task group on the system, known as the "root task  group".
       Task groups are formed in the following circumstances:

       *  All of the threads in a CPU cgroup form a task group.  The par‐
          ent of this task group is the task group of  the  corresponding
          parent cgroup.

       *  If  autogrouping  is  enabled, then all of the threads that are
          (implicitly) placed in an autogroup (i.e., the same session, as
          created by setsid(2)) form a task group.  Each new autogroup is
          thus a separate task group.  The root task group is the  parent
          of all such autogroups.

       *  If  autogrouping  is enabled, then the root task group consists
          of all processes in the root CPU cgroup that were not otherwise
          implicitly placed into a new autogroup.

       *  If  autogrouping is disabled, then the root task group consists
          of all processes in the root CPU cgroup.

       *  If group scheduling was disabled (i.e., the kernel was  config‐
          ured  without  CONFIG_FAIR_GROUP_SCHED),  then  all of the pro‐
          cesses on the system are notionally placed  in  a  single  task
          group.

       Under  group  scheduling,  a thread's nice value has an effect for
       scheduling decisions only relative to other threads  in  the  same
       task group.  This has some surprising consequences in terms of the
       traditional semantics of the nice value on UNIX systems.  In  par‐
       ticular,  if  autogrouping is enabled (which is the default), then
       employing setpriority(2) or nice(1) on a  process  has  an  effect
       only  for  scheduling  relative to other processes executed in the
       same session (typically: the same terminal window).

       Conversely, for two processes that are (for example) the sole CPU-
       bound  processes  in  different sessions (e.g., different terminal
       windows, each of whose jobs are  tied  to  different  autogroups),
       modifying the nice value of the process in one of the sessions has
       no effect in terms of the scheduler's decisions  relative  to  the
       process in the other session.


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
