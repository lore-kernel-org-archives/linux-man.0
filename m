From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 43072] New: epoll & threads
Date: Sun, 8 Apr 2012 11:49:59 GMT
Message-ID: <bug-43072-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=43072

           Summary: epoll & threads
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
        ReportedBy: arigo-SAGZdM4SFkLYtjvyW6yDsg@public.gmane.org
        Regression: No


The manpages of epoll do not mention the behavior in the presence of multiple
threads.  By trying it out, I found out that the following works: if one thread
does epoll_wait() on an epoll in which some fd was not registered at all, and
blocks; and later another thread does epoll_ctl() to add the fd; then the fd
will be reported by the original thread's epoll_wait() as soon as it meets the
condition.  This behavior is something that may be very useful in some
situations.  As far as I see, it cannot be achieved easily with select().  I
think that it should be officially mentioned in the manpages (provided it is
not an accident but works this way by design).

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
