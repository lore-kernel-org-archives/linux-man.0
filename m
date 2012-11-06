From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 50151] New: glibc 2.16 included a new function
 __ppc_get_timebase
Date: Tue,  6 Nov 2012 12:33:46 +0000 (UTC)
Message-ID: <bug-50151-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=50151

           Summary: glibc 2.16 included a new function __ppc_get_timebase
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
        ReportedBy: tuliom-Igl6534fJ5VwFqzsTH5u/w@public.gmane.org
        Regression: No


Created an attachment (id=85661)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=85661)
Patch that adds the man-page for __ppc_get_timebase

glibc 2.16 included a new function to read the Time Base Register on Power
processors on the following commit:
http://sourceware.org/git/?p=glibc.git;a=commit;h=d9dc34cd569bcfe714fe8c708e58c028106e8b2e

The attached patch adds the new man-page and applies to the master branch.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
