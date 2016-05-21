From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 118671] New: mkfifo(3) & mknod(3) and EPERM
Date: Sat, 21 May 2016 19:50:54 +0000
Message-ID: <bug-118671-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=118671

            Bug ID: 118671
           Summary: mkfifo(3) & mknod(3) and EPERM
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: low
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: nyh-TS7m/3hpY0sOpacJJkBjfT4kX+cae0hd@public.gmane.org
        Regression: No

The mkfifo(3) manual page explains several possible errno settings for mkfifo()
failures, but fails to mention one: EPERM.
For example, I am getting this error when trying to create a named pipe in a
directory mounted on CIFS (Windows share):

    $ mkfifo a
    mkfifo: cannot create fifo 'a': Operation not permitted

It appears that mknod(3) also gets the same error (EPERM) when trying to create
a FIFO on a CIFS-mounted directory. Here, the manual page does mention EPERM,
but it says it can only happen when the file type is *not* FIFO, but this is
apparently not the whole story - it seems mknod() can fail with EPERM also on
FIFO, if the filesystem does not support fifos. By the way, it can also fail
with EPERM when trying to create other special files if the filesystem doesn't
support them - even if the user has every possible permissions.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
