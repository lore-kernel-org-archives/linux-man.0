From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 40852] New: select(2): document action of close()'ing a fd
 during a select()
Date: Wed, 10 Aug 2011 13:28:25 GMT
Message-ID: <bug-40852-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=40852

           Summary: select(2): document action of close()'ing a fd during
                    a select()
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
        ReportedBy: fillods-iA+eEnwkJgzk1uMJSBkQmQ@public.gmane.org
        Regression: No


I had a hard time figuring out what is the Linux's expected behavior of
select() syscall when a file descriptor is close()'d in the meantime. The man
page 3.27-1ubuntu2 lacks this piece of information. This is on Ubuntu 11.04.

Like many other OS, I would have expect select() to bail out on Linux, but it
is not the case. When some other thread close() a file descriptor currently
watched by select(), Linux does not make the select() syscall to return with
errno=EBADF, it simply ignores it and does not return.
Please note that this behavior is undefined in POSIX. 

IMO, this has to be appropriately documented in the select(2) man page.

Maybe something like "The select() system call never returns if a file
descriptor is closed in the meantime. This behavior is undefined in POSIX".[3]

Rem: this case is not to be confused with a file that has already been closed
before calling select().

Background:

[1]
http://stackoverflow.com/questions/543541/what-does-select2-do-if-you-close2-a-file-descriptor-in-a-separate-thread/543595#543595

[2] http://lkml.indiana.edu/hypermail/linux/kernel/0106.0/0768.html

[3]
https://lists.linux-foundation.org/pipermail/bugme-new/2003-April/008335.html

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
