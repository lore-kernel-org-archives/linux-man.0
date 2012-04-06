From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 43061] New: resolver.3 man page: RES_DEBUG option has effect
 only if libresolv compiled with DEBUG defined
Date: Fri, 6 Apr 2012 22:39:40 GMT
Message-ID: <bug-43061-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=43061

               URL: http://man7.org/linux/man-pages/man3/resolver.3.html
           Summary: resolver.3 man page: RES_DEBUG option has effect only
                    if libresolv compiled with DEBUG defined
           Product: Documentation
           Version: unspecified
    Kernel Version: n/a
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: kernelbugs-a6y0ucgZPWpWk0Htik3J/w@public.gmane.org
        Regression: No


The resolver.3 man page's description of the available _res.options flag says:

RES_DEBUG
              Print debugging messages.

However, from looking at the libresolv source, I get the impression that if the
library was not compiled with "DEBUG" defined then the RES_DEBUG option is
silently ignored.  

Since it appears to be fairly common for the library to be compiled without
DEBUG, it seems worth adding a note to the man page mentioning that RES_DEBUG
will be ignored in that situation.

(As far as I can tell from the build logs, both Debian and Ubuntu build the
eglibc packages without DEBUG defined.  Is there any easy way to tell on a
given running system the whether libresolv was build with or without DEBUG
defined?)

It might also be worth mentioning the compile-time issue on the resolv.conf.5
page (in the paragraph for the "debug" option).

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
