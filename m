From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 53661] New: [PATCH] Update nscd.conf(5) man page
Date: Mon, 11 Feb 2013 17:41:44 +0000 (UTC)
Message-ID: <bug-53661-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=53661

           Summary: [PATCH] Update nscd.conf(5) man page
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
        ReportedBy: pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
        Regression: No


Created an attachment (id=93131)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=93131)
man-pages-nscd-conf.patch

This patch updates the nscd.conf(5) man page with following changes:

 * added missing valid services (services and netgroup)
 * added many default values for options
 * reordered options according to the nscd.conf file (logical order)
 * added 2 missing options: max-db-size and auto-propagate

All changes are based on nscd.conf file [1] and source code for nscd [2] (e.g.
nscd.h for default vaules, etc.)

Original email for this update can be found here [3], however patch attached to
this bugzilla is newer.


[1] http://sourceware.org/git/?p=glibc.git;a=blob;f=nscd/nscd.conf;hb=HEAD
[2] http://sourceware.org/git/?p=glibc.git;a=tree;f=nscd;hb=HEAD
[3] http://thread.gmane.org/gmane.linux.man/2970

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
