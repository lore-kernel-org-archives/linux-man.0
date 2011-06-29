From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 38542] New: single-request-reopen option needs to be documented
 in resolv.conf
Date: Wed, 29 Jun 2011 20:05:48 GMT
Message-ID: <bug-38542-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=38542

           Summary: single-request-reopen option needs to be documented in
                    resolv.conf
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
        ReportedBy: erinn.looneytriggs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No


This option was introduced here:
http://sourceware.org/ml/libc-alpha/2009-10/msg00063.html

However, there appears to be no documentation for it. Folks are going to be
looking for this as they deploy systems behind firewalls and end up with delays
due to DNS, see here:
http://www.linuxquestions.org/questions/showthread.php?p=4399340#post4399340

So if you could please document the option, I at least would greatly appreciate
it.

Thanks,

-Erinn

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
