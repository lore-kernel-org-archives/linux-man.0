From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 14411] New: pselect man page Linux notes appear to be out of
 date
Date: Thu, 15 Oct 2009 09:14:22 GMT
Message-ID: <bug-14411-11311@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=14411

           Summary: pselect man page Linux notes appear to be out of date
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
        ReportedBy: mac-6JwzNyXSCK3QT0dZR+AlfA@public.gmane.org
        Regression: No


man-pages-3.23 man2/select.2 contains the following text in its BUGS section:

Since version 2.1, glibc has provided an emulation of pselect() that is
implemented using sigprocmask(2) and select().  This implementation remains
vulnerable to the very race condition that pselect() was designed to prevent.

It would appear that glibc added support in January 2006 for the real pselect
syscall which presumably doesn't suffer from these race conditions.

References:

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=9f72949f679df06021c9e43886c9191494fdb007
$glibc/sysdeps/unix/sysv/linux/pselect.c
$glibc/ChangeLog.16

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
