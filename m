From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 23072] New: preadv(2) and pwritev(2) lack man pages, pread64(2)
 and pwrite64(2) aren't mentioned on their man pages
Date: Wed, 17 Nov 2010 14:58:30 GMT
Message-ID: <bug-23072-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=23072

           Summary: preadv(2) and pwritev(2) lack man pages, pread64(2)
                    and pwrite64(2) aren't mentioned on their man pages
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
        ReportedBy: abacabadabacaba-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No


System calls preadv(2) and pwritev(2) are provided by Linux kernel, and glibc
has wrappers for them, but there are no corresponding man pages.

Man pages for pread64(2) and pwrite64(2) redirect to pread(2) man page.
However, these system calls aren't mentioned on that man page.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
