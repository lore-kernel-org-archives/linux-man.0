From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 67291] New: Confusing/wrong description of CLOCK_*_CPUTIME_ID
Date: Wed, 18 Dec 2013 15:53:35 +0000
Message-ID: <bug-67291-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=67291

            Bug ID: 67291
           Summary: Confusing/wrong description of CLOCK_*_CPUTIME_ID
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: nyh-TS7m/3hpY0sOpacJJkBjfT4kX+cae0hd@public.gmane.org
        Regression: No

clock_gettime(2) mention CLOCK_PROCESS_CPUTIME_ID and CLOCK_THREAD_CPUTIME_ID,
but fail to mention the most important thing: That they measure "CPU time" as
defined by Posix (see
http://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap03.html#tag_03
), i.e., they measure not wall-clock time but rather the amount of time the
thread or process actually ran on the CPU.

Worse, clock_gettime(2) contains several confusing, or perhaps even wrong,
statements about these clocks:

1. At one point it says "CLOCK_PROCESS_CPUTIME_ID:            High-resolution
per-process timer from the CPU.". The phrase "from the CPU" seems to imply some
CPU feature (e.g., TSC) is used, rather than to correctly suggest that CPU time
(i.e., execution time) is being measured.

2. Another paragraph says "The CLOCK_PROCESS_CPUTIME_ID and
CLOCK_THREAD_CPUTIME_ID clocks are realized on many platforms using timers from
the  CPUs  (TSC on i386, AR.ITC on Itanium).  These registers may differ
between CPUs and as a consequence these clocks may return bogus  results if a
process is migrated to another CPU.". Is this really correct? Why would Linux
have any trouble accounting the processes's runtime (using the current cpu's
TSC) before migrating?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
