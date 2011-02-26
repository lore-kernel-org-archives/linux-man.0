From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 29972] New: Possibly bad EBADF error description in fsync(2)
Date: Sat, 26 Feb 2011 23:49:30 GMT
Message-ID: <bug-29972-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=29972

           Summary: Possibly bad EBADF error description in fsync(2)
           Product: Documentation
           Version: unspecified
    Kernel Version: N/A
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: jimenezrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No


The man-page of fsync(2) has the next error description:
    EBADF  fd is not a valid file descriptor open for writing.

This man-page says nothing about if fsync(2) works correctly on a file
descriptor open with O_RDONLY, but it seems to work without any problem. So
that description induce to think that O_WRONLY or O_RDWR must be used.

The Open Group Base Specifications says nothing about in what mode the file
must be open. And the EBADF error description also says nothing about not being
open in writing mode
(http://pubs.opengroup.org/onlinepubs/009695399/functions/fsync.html).


In conclusion, as far as I know, the next code snippet is correct and seems to
work correctly in my machine with regular files and directories:
    fd = open(path, O_RDONLY);
    fsync(fd);

So the EBADF error description in man pages from fsync(2) is confusing, maybe
it should be something like:
    EBADF  fd is not a valid file descriptor.


I'm using Ubuntu 10.10 with Linux man-pages 3.24.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
