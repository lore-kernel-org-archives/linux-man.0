From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 66571] New: epoll_wait has it wrong about timeout and EINTR
Date: Thu, 05 Dec 2013 08:05:59 +0000
Message-ID: <bug-66571-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=66571

            Bug ID: 66571
           Summary: epoll_wait has it wrong about timeout and EINTR
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: low
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: jonas-p4BucIDcVy3iH4Lt12DN6A@public.gmane.org
        Regression: No

The epoll_wait(2) man page says:

"EINTR  The call was interrupted by a signal handler before either any
        of the requested events occurred or the timeout expired; see
        signal(7)."

Looking at the code of the kernel, EINTR is only returned when there is a
pending signal. If the timeout expires, it will simply return without an error.

Simply removing the "or the timeout expired" part should be enough.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
