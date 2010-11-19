From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 23282] New: vsnprintf(3) example promotes code which ignores
 error return code
Date: Fri, 19 Nov 2010 02:58:11 GMT
Message-ID: <bug-23282-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=23282

           Summary: vsnprintf(3) example promotes code which ignores error
                    return code
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
        ReportedBy: graham.gower-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No


The example given in the vsnprintf(3) man page (release 3.31) attempts to be
backwards compatible with glibc < 2.0.6 by assuming that a negative return code
from vsnprintf indicates truncation.

If a negative return code is indicated for other reasons, the example will loop
until the process' virtual memory is exhausted.

Please see the following for an example of how a malicious user could
deliberately trigger this (potentially causing a denial of service).
http://my.opera.com/taviso/blog/2007/05/28/auditing-puzzle

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
