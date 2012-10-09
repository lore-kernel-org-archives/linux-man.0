From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 48641] New: splice can return EAGAIN
Date: Tue,  9 Oct 2012 10:28:07 +0000 (UTC)
Message-ID: <bug-48641-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=48641

           Summary: splice can return EAGAIN
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
        ReportedBy: quae-l4MFkWPWeOkX2WXlbB3fKg@public.gmane.org
        Regression: No


`splice (2)` can return EAGAIN, this is not mentioned in the man pages.

Example strace output:

    pipe([4, 5])                            = 0
    splice(4, NULL, 1, NULL, 5, SPLICE_F_NONBLOCK) = -1 EAGAIN (Resource
temporarily unavailable)


I run Arch Linux, the date at the bottom of the man page is: 2012-05-04

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
