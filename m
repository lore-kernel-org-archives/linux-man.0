From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 108951] New: stat(2) missing mention of EIO
Date: Sun, 06 Dec 2015 09:45:29 +0000
Message-ID: <bug-108951-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=108951

            Bug ID: 108951
           Summary: stat(2) missing mention of EIO
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: nyh-TS7m/3hpY0sOpacJJkBjfT4kX+cae0hd@public.gmane.org
        Regression: No

I suppose that stat(2) can return EIO error if it has an error reading the
inode or one of the paths' parents. The Posix stat() manual page
(http://pubs.opengroup.org/onlinepubs/009695399/functions/stat.html) mentions
this possibility. However, the Linux stat(2) manual page is missing this
possible error.

By the way, it seems there are more system call man pages (e.g., open(2)) who
are missing mention of EIO. Most other system call man pages I looked at do
correctly mention EIO. But perhaps a more extensive exploration of all the
system calls needs to be conducted.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
