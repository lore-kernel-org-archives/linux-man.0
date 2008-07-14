From: bugme-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 11084] New: make pdfdocs target fails
Date: Mon, 14 Jul 2008 05:20:00 -0700 (PDT)
Message-ID: <bug-11084-11311@http.bugzilla.kernel.org/>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=11084

           Summary: make pdfdocs target fails
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
        ReportedBy: max-U9r9yeDMy7A@public.gmane.org


Latest working kernel version:
Earliest failing kernel version: 2.6.18
Distribution:
Hardware Environment:
Software Environment: Debian Etch, Debian Lenny
Problem Description:
Errors out on Documentation/DocBook/kernel-hacking.pdf, which seems the first
doc to get produced.
This got reported to the Debian tracking system long time ago:
http://bugs.debian.org/425250
the last time i reproduced it was 2.6.25 and didn't see changes for it since.
reporting it as i saw new Documentation Maintainers coming up, thanks. -maks

Steps to reproduce:
make pdfdocs


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
