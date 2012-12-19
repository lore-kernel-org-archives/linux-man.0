From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 51811] New: POSIX now guarantees proper permissions for mkstemp
Date: Wed, 19 Dec 2012 09:47:01 +0000 (UTC)
Message-ID: <bug-51811-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=51811

           Summary: POSIX now guarantees proper permissions for mkstemp
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
        ReportedBy: fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
        Regression: No


POSIX 2008 says this:

| The mkstemp() function shall create the file, and obtain a file descriptor
for 
| it, as if by a call to:
|
|   open(filename, O_RDWR|O_CREAT|O_EXCL, S_IRUSR|S_IWUSR)

So the warning about permissions is probably obsolete by now.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
