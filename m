From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 60602] New: clock_gettime(): Note on SMP systems outdated ?
Date: Mon, 22 Jul 2013 14:07:38 +0000
Message-ID: <bug-60602-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60602

            Bug ID: 60602
           Summary: clock_gettime(): Note on SMP systems outdated ?
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org
        Regression: No

Hi!

On the manpage of clock_gettime() there is a note for SMP systems. You can see
it here for example: http://man7.org/linux/man-pages/man2/clock_gettime.2.html.
Also, in my debian stable system there is the same note (manpages-dev 3.44-1).

The note says:

       If the CPUs in an SMP system have different clock sources then
       there is no way to maintain a correlation between the timer
       registers since each CPU will run at a slightly different
       frequency.  If that is the case then clock_getcpuclockid(0)
       will return ENOENT to signify this condition.  The two clocks
       will then be useful only if it can be ensured that a process
       stays on a certain CPU.


Looking at clock_getcpuclockid() manpage, you can see that it takes two
parameters. So, doing exactly "clock_getcpuclockid(0)" does not work. Also,
ENOENT is not a documented error code. And if you interpret the zero as the pid
param to clock_getcpuclockid(), it doesn't seem to check if it's SMP safe
either. There is even a note on clock_getcpuclockid() that clearly says:

       Calling  clock_gettime(2)  with  the  clock  ID  obtained  by
       a call to clock_getcpuclockid() with a pid of 0, is the same
       as using the clock ID CLOCK_PROCESS_CPUTIME_ID.


So there is no reason to think it will fail on systems where clock_gettime() is
not SMP safe, I think.

I tried to check the code used for clock_gettime() with CLOCK_THREAD_CPUTIME_ID
as a clock in x86/x86_64 and see if I can get any clue.

On arch x86 clock_gettime uses VDSO, but for this clock type it fallsback to a
syscall. And following the code, clock_gettime() seems to be implemented on
kernel/posix-cpu-timers.c,
with thread_cpu_clock_get(). It then calls posix_cpu_clock_get() with
THREAD_CLOCK as param.

THREAD_CLOCK is, basically (following all the macros):
        (0 << 3) | 0010 | 0100 ==> 1000 | 0010 | 0100 ==> 1110

The call to CPUCLOCK_WHICH inside posix_cpu_clock_get(), then, does (keep in 
mind 1110 is the value for THREAD_CLOCK):

        1110 & 0011 ==> 0010 ==> 2

Then CPUCLOCK_SCHED is used in the switch and task_sched_runtime() is used to 
calculate it. The code for task_sched_runtime() is in kernel/sched/core.c so I
think it is SMP safe, as is in the scheduler. And it *seem* to use ns precision
as the comment on do_task_delta_exec() says.


So, on one hand, I don't understand the note on SMP systems and I think if it's
clarified would be better. And, on the other, maybe it's outdated and is SMP
safe now (on archs that uses kernel/posix-cpu-timers.c for the implementation)
?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
