From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 42793] New: [down_trylock() in semaphore.c] The word "mutex"
 was used instead of "semaphore"
Date: Fri, 17 Feb 2012 20:12:34 GMT
Message-ID: <bug-42793-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=42793

           Summary: [down_trylock() in semaphore.c] The word "mutex" was
                    used instead of "semaphore"
           Product: Documentation
           Version: unspecified
    Kernel Version: 3.2.6
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: ramsja.n-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
                CC: ramsja.n-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No


At line# 121, the word "mutex" was used by mistake.

The correct description should be as below.

Returns 0 if the semaphore has been acquired successfully or 1 if it it cannot
be acquired.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
