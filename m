From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 20762] New: epoll_wait(2): upper limit to timeout
Date: Tue, 19 Oct 2010 08:17:05 GMT
Message-ID: <bug-20762-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=20762

           Summary: epoll_wait(2): upper limit to timeout
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
        ReportedBy: arnerup-UNjuZkX4dYU@public.gmane.org
        Regression: No


The timeout argument has an upper limit. Any values above that limit are
treated the same as -1, i.e. to wait indefinitely. The limit is given by:

#define EP_MAX_MSTIMEO min(1000ULL * MAX_SCHEDULE_TIMEOUT / HZ, (LONG_MAX -
999ULL) / HZ)

That is, the limit depends on the size of a long and the timer frequency.
Assuming the a long is never smaller than 32 bits and HZ never larger than
1000, the worst case is 35 minutes. I think this should be mentioned under
"BUGS".

Although this is likely to be fixed in the future
(http://lkml.org/lkml/2010/8/8/144), the problem exists in at least 2.6.14 -
2.6.35. I don't know if select(2) and poll(2) are affected.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
