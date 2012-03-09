From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 42892] New: Man page bug for mmap2(2)
Date: Fri, 9 Mar 2012 03:13:58 GMT
Message-ID: <bug-42892-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=42892

           Summary: Man page bug for mmap2(2)
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
        ReportedBy: kevinogorman4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No


Created an attachment (id=72559)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=72559)
Program to discover partitions that got lost.

Using the mmap2(2) man page to write code results in an error, possibly because
of missing includes.  In any event, no definition of mmap2 is seen when I use 
gcc -E.  The result is compilation without a prototype.

It happens that compilation succeeds, but linking fails for lack of a library
containing mmap2.

This is Ubuntu 11.04, kernel 2.6.38, and man page dated 2008-04-22, from
release 3.27 of the man-pages project.

Source code is attached.  It's a single source file, intended to be a program
to discover partitions that got lost.  It is incomplete and may be buggy, but I
cannot debug this version until mmap2 works for me.

It looks to me as if there needs to be two things added to the synopsis:
  a cc line showing a non glibc library.
  a #include line showing an additional header.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
