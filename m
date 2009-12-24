From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 14870] New: FUTEX_FD was removed already. man description shold
 be removed too.
Date: Thu, 24 Dec 2009 07:29:23 GMT
Message-ID: <bug-14870-11311@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=14870

           Summary: FUTEX_FD was removed already. man description shold be
                    removed too.
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
        ReportedBy: kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org
        Regression: No


following commit was removed FUTEX_FD implementation.

    commit 82af7aca56c67061420d618cc5a30f0fd4106b80
    Author: Eric Sesterhenn <snakebyte-Mmb7MZpHnFY@public.gmane.org>
    Date:   Fri Jan 25 10:40:46 2008 +0100

    Removal of FUTEX_FD

    Since FUTEX_FD was scheduled for removal in June 2007 lets remove it.

    Google Code search found no users for it and NGPT was abandoned in 2003
    according to IBM.  futex.h is left untouched to make sure the id does
    not get reassigned.  Since queue_me() has no users left it is commented
    out to avoid a warning, i didnt remove it completely since it is part of
    the internal api (matching unqueue_me())

    Signed-off-by: Eric Sesterhenn <snakebyte-Mmb7MZpHnFY@public.gmane.org>
    Signed-off-by: Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org> (removed rest)
    Acked-by: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
    Signed-off-by: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>

but the man page of futex
(http://www.kernel.org/doc/man-pages/online/pages/man2/futex.2.html) still have
following explanation. It should be removed too, I think.

       FUTEX_FD (present up to and including Linux 2.6.25)
              To support asynchronous wakeups, this operation associates a file
              descriptor with a futex.  If another process executes a
FUTEX_WAKE, the
              process will receive the signal number that was passed in val. 
The
              calling process must close the returned file descriptor after
use.  The
              arguments timeout, uaddr2 and val3 are ignored.

              To prevent race conditions, the caller should test if the futex
has
              been upped after FUTEX_FD returns.

              Because it was inherently racy, FUTEX_FD has been removed from
Linux
              2.6.26 onwards.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
