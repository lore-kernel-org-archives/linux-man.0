From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 16031] New: slabinfo description inaccurate (out of date?)
Date: Sat, 22 May 2010 21:45:01 GMT
Message-ID: <bug-16031-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=16031

           Summary: slabinfo description inaccurate (out of date?)
           Product: Documentation
           Version: unspecified
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: bfields-uC3wQj2KruNg9hUCZPvPmw@public.gmane.org
        Regression: No


"man slabinfo" claims, for example, that the fifth column is "the  number  of 
pages with at least one active object", when /proc/slabinfo on my (2.6.32)
machine uses it for number of objects per slab.  Presumably the format it
describes is outdated (example shows version 1.1, current is 2.1).

This is from Ubuntu (Lucid)'s 3.23-1.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
