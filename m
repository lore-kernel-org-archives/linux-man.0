From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 50421] New: proc.5: Information on oom_adj is outdated
Date: Mon, 12 Nov 2012 18:11:14 +0000 (UTC)
Message-ID: <bug-50421-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=50421

           Summary: proc.5: Information on oom_adj is outdated
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
        ReportedBy: lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No


oom_adj has been deprecated in Linux 2.6.35 (commit
51b1bd2ace1595b72956224deda349efa880b693) and removed in Linux 3.7
(01dc52ebdf472f77cca623ca693ca24cfc0f1bbe) because it was replaced with
oom_score_adj.

The reasoning can be found on
http://www.kernel.org/doc/Documentation/ABI/obsolete/proc-pid-oom_adj

Now, including this whole document is a bit too much for proc(5), but what
should be included instead?

man-pages version: 3.44

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
