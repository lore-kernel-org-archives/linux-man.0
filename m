From: bugme-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 11060] New: man2/getrusage.2 does not explain RUSAGE_THREAD
Date: Wed,  9 Jul 2008 02:14:53 -0700 (PDT)
Message-ID: <bug-11060-11311@http.bugzilla.kernel.org/>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=11060

           Summary: man2/getrusage.2 does not explain RUSAGE_THREAD
           Product: Documentation
           Version: unspecified
     KernelVersion: v2.6.25-6070-g679c9cd
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: knikanth-l3A5Bk7waGM@public.gmane.org
                CC: sripathik-xthvdsQ13ZrQT0dZR+AlfA@public.gmane.org, roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org


commit 679c9cd4acc2cf2872171813752eab3320273339 v2.6.25-6070-g679c9cd adds
RUSAGE_THREAD option to getrusage which is not documented in man pages


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
