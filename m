From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 55371] New: printf: a conversion specifier doesn't necessarily
 ask for an argument
Date: Sun, 17 Mar 2013 16:48:57 +0000 (UTC)
Message-ID: <bug-55371-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=55371

           Summary: printf: a conversion specifier doesn't necessarily ask
                    for an argument
           Product: Documentation
           Version: unspecified
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: chealer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No


The format string of printf is quite complicated, and while its documentation
is extensive, it has a bit too many errors and needs some cleanup for
comprehensibility.

In particular, man 3 printf contains:

By default, the arguments are used in the order given, where each '*' and each
conversion specifier asks for the next argument (and it is an error if
insufficiently many arguments are given).

This is inexact, as "%" is defined as a conversion specifier and doesn't
consume any argument.

It's also unclear in that sentence what "next argument" refers to. And "*"
hasn't been introduced at that point, so that part is hard to follow ("*" is
defined in section The precision).

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
