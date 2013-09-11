From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 61171] New: adjtimex(2): incomplete description of the struct
 timex
Date: Wed, 11 Sep 2013 17:56:57 +0000
Message-ID: <bug-61171-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=61171

            Bug ID: 61171
           Summary: adjtimex(2): incomplete description of the struct
                    timex
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: matwey.kornilov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No

Hi,

I am using 3.46 release of man-pages under openSUSE 12.3.

man adjtimex(2) says that struct timex has a member:

struct timeval time; /* current time (read-only) */

implying that timeval has two fields: seconds and microseconds (as it described
in many places, for instance GLIBC documentation). This misinforms people, and
explicit behavior must be reported.

Inspection of kernel/time/ntp.c (as for linux 3.7) demonstrates that the second
field timex.time.tv_usec may contain nanoseconds instead of microseconds. When
timex.status STA_NANO flag is not set, this field contains microseconds, as one
expects.

The previous is still also true for timex.offset which is stated to be in units
of usec. Units of offset also depend on STA_NANO flag.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
