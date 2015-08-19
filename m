From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 103181] New: Some definitions are not available in sys/ptrace.h
Date: Wed, 19 Aug 2015 20:50:59 +0000
Message-ID: <bug-103181-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=103181

            Bug ID: 103181
           Summary: Some definitions are not available in sys/ptrace.h
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: low
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: philglva-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No

Ptrace(2) describes some 'request' macro, as PTRACE_GETSIGMASK or
PTRACE_SETSIGMASK, which are not defined in the header ("sys/ptrace.h")
indicated in the synopsis.

However, these macros are defined in "linux/ptrace.h" but I haven't found any
inclusion of this header is "sys/ptrace.h".

I checked this fact on Arch Linux (4.1.3-1-ARCH) and Ubuntu
(3.16.0-43-generic).

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
