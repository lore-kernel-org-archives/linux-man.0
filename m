From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 23872] New: epoll_create(0) fails. Mismatch between
 implementation and manpage
Date: Sun, 28 Nov 2010 13:13:07 GMT
Message-ID: <bug-23872-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=23872

           Summary: epoll_create(0) fails. Mismatch between implementation
                    and manpage
           Product: Documentation
           Version: unspecified
    Kernel Version: 2.6.36
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: kernelbugs-pbvhy9/vjlfAiHgwPnP32rNAH6kLmebB@public.gmane.org
        Regression: No


The epoll_create manpage (current version as of 2010-11-28) contains:

SYNOPSIS
...
    int epoll_create(int size);
...
DESCRIPTION
...
    (Nowadays, size is ignored; see NOTES below.)
...
ERRORS
    EINVAL size is not positive.
...
NOTES
    Since Linux 2.6.8, the size argument is unused. ...


on the other hand, fs/eventpoll.c contains:
SYSCALL_DEFINE1(epoll_create, int, size)
{
        if (size <= 0)
                return -EINVAL;

        return sys_epoll_create1(0);
}

The size parameter is not ignored as stated in the manpage.
Please correct the manpage or remove the check inside the implementation.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
