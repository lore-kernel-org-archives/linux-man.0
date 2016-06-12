From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 120061] New: unix.7: Extend notes about ignored permissions for
 UNIX domain sockets
Date: Sun, 12 Jun 2016 10:54:14 +0000
Message-ID: <bug-120061-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=120061

            Bug ID: 120061
           Summary: unix.7: Extend notes about ignored permissions for
                    UNIX domain sockets
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: carstengrohmann-Mmb7MZpHnFY@public.gmane.org
        Regression: No

Hello,

the missing permissions check is tracked as CVE-1999-1402 and it looks like
that this issue is already fixed in current version of the mentioned systems.

Thereby I suggest a small update of the related statement.

Current:
Connecting to the socket object requires read/write permission. This behavior
differs from many BSD-derived systems which ignore permissions for Unix
sockets. Portable programs should not rely on this feature for security.

New:
Connecting to the socket object requires read/write permission. The access
permissions for a UNIX domain socket are ignored in Solaris 2.x and SunOS 4.x,
and other BSD-based operating systems before 4.4 (CVE-1999-1402). Portable
programs should not rely on this feature for security.

Thanks,
Carsten

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
