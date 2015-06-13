From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 99911] New: ioperm is kept on fork
Date: Sat, 13 Jun 2015 17:36:52 +0000
Message-ID: <bug-99911-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=99911

            Bug ID: 99911
           Summary: ioperm is kept on fork
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: alexhenrie24-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No

Created attachment 179851
  --> https://bugzilla.kernel.org/attachment.cgi?id=179851&action=edit
fork-and-beep test program

`man ioperm` currently states "Permissions are not inherited by the child
created by fork(2); following a fork(2) the child must turn on those
permissions that it needs." This is not true. I do not know if it was true at
some point in the past, but ioperm is preserved across a fork at least as far
back as Linux 2.6.26.

A test program to demonstrate this behavior is attached.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
