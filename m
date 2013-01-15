From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 52741] New: getnameinfo man page has inappropriate text copied
 from getaddrinfo
Date: Tue, 15 Jan 2013 14:50:30 +0000 (UTC)
Message-ID: <bug-52741-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=52741

           Summary: getnameinfo man page has inappropriate text copied
                    from getaddrinfo
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
        ReportedBy: bigpeteb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No


As of release 3.43 on 2012-08-05, the man page for getnameinfo(3) contains the
following in its first paragraph:

"It combines the functionality of gethostbyaddr(3) and getservbyport(3),  but 
unlike those functions, getaddrinfo(3) is reentrant and allows programs to
eliminate IPv4-versus-IPv6 dependencies."

This text is identical to what's in getaddrinfo(3).  It seems someone copied it
but didn't rewrite it to describe the functions that getnameinfo(3) is intended
to replace.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
