From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 80541] New: man pages for unimplemented functions provoke name
 clash
Date: Thu, 17 Jul 2014 21:37:00 +0000
Message-ID: <bug-80541-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=80541

            Bug ID: 80541
           Summary: man pages for unimplemented functions provoke name
                    clash
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: j.wuttke-97/bSmCnXvjoK6nBLMlh1Q@public.gmane.org
        Regression: No

A page like cerf(3), which says "not yet in glibc, as at version 2.12",
provokes a name clash if some other library provides the missing
implementation.

The rpm package managers reacts to such name clash by suggesting to uninstall
libc, which is no clever resolution.

I suggest to resolve this problem by moving man pages of unimplemented
functions to manual section 7, so that they can peacefully coexist in the
shadow of section 3 pages provided by more specific libraries.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
