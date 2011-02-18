From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 29362] New: flock: can return EAGAIN contrary to manpage
Date: Fri, 18 Feb 2011 10:10:01 GMT
Message-ID: <bug-29362-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=29362

           Summary: flock: can return EAGAIN contrary to manpage
           Product: Documentation
           Version: unspecified
    Kernel Version: n/a
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: petr.uzel-AlSwsSmVLrQ@public.gmane.org
        Regression: No


flock(2) manpage does not list EAGAIN as possible return value. As far as I
understand, one can assume that flock never returns EAGAIN, which is not true:

strace:
...
flock(3, LOCK_EX|LOCK_NB) = -1 EAGAIN (Resource temporarily unavailable)
...

FWIW, this was on kernel 2.6.37.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
