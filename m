From: bugme-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 12098] New: various man pages give incorrect _XOPEN_SOURCE define
Date: Mon, 24 Nov 2008 23:04:56 -0800 (PST)
Message-ID: <bug-12098-11311@http.bugzilla.kernel.org/>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=12098

           Summary: various man pages give incorrect _XOPEN_SOURCE define
           Product: Documentation
           Version: unspecified
     KernelVersion: N/A
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: crimsun-NvWE5tsZCrFbyg9Ma2u3fg@public.gmane.org


Latest working kernel version: N/A
Earliest failing kernel version: N/A
Distribution: Ubuntu 9.04
Hardware Environment: N/A
Software Environment: man-pages 3.13
Problem Description: Forwarded from Ubuntu #181673
(https://bugs.launchpad.net/ubuntu/+source/manpages/+bug/181673).  Steve
Bellovin reports that "#define _XOPEN_SOURCE" is incorrectly given for various
man pages (e.g., bsd_signal, confstr, crypt, encrypt, getdate, grantpt,
ptsname, strptime, swab, unlockpt, wcwidth) instead of "#define _XOPEN_SOURCE
600".

Steps to reproduce: Inspect the man page for any of above given examples.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
