From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 19812] New: two issues in unix(7)
Date: Wed, 6 Oct 2010 21:11:05 GMT
Message-ID: <bug-19812-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19812

           Summary: two issues in unix(7)
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
        ReportedBy: mzxreary-uLTowLwuiw4b1SvskN2V4Q@public.gmane.org
        Regression: No


There are two smaller issues in the unix(7) man page:

1) The part about "pathname" sockets suggests usage of sizeof(sa_family_t) +
strlen(sun_path) + 1 for calculating the sockaddr size. Due to
alignment/padding this is probably not a good idea. Instead, one should use
offsetof(struct sockaddr_un, sun_path) + strlen() + 1 or something like that.

2) The part about "abstract" sockets is misleading as it suggests that the
sockaddr returned by getsockname() would necessarily have the size of
sizeof(struct sockaddr), which however is not the case: getsockname() returns
exactly the sockaddr size that was passed in on bind(). In particular, two
sockets that are bound to the same sockaddr but different sizes are completely
independant.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
