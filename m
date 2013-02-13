From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 53781] New: [PATCH] close.2: Mention a need of shutdown before
 closing socket
Date: Wed, 13 Feb 2013 13:50:00 +0000 (UTC)
Message-ID: <bug-53781-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=53781

               URL: http://thread.gmane.org/gmane.linux.man/2075
           Summary: [PATCH] close.2: Mention a need of shutdown before
                    closing socket
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
                CC: lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
        Regression: No


Created an attachment (id=93221)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=93221)
close.2.patch

Simply calling close() is not sufficient if the recv(), or read() is
blocking on another thread. That is because the recv() or read() will not be
notified that the descriptor has been closed. This can only be done via
shutdown().

This behaviour is different than on Solaris where simple close()
is sufficient to kill recv() or read() on another thread.

See attached reproducer of this problem from additional info.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
