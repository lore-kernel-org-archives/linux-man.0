From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 15223] New: Mention security in the manpages for strcat, scanf,
 and getopt
Date: Thu, 4 Feb 2010 09:51:31 GMT
Message-ID: <bug-15223-11311@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=15223

           Summary: Mention security in the manpages for strcat, scanf,
                    and getopt
           Product: Documentation
           Version: unspecified
    Kernel Version: Linux man-pages 3.23
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: enhancement
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: jasonspiro4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No


Thanks for all the hard work you put in on maintaining kernel documentation.

The manpages for strcat[1], scanf[2], and getopt[3] don't mention the fact that
using those functions can lead to buffer overflow security exploits.  The
Secure Programming HOWTO section about C/C++[4] explains how to avoid such
exploits when using these functions.

Please add a "BUGS" or "SECURITY" section to those functions' manpages, which
talks about security.

^  [1].  http://www.kernel.org/doc/man-pages/online/pages/man3/strcat.3.html
^  [2].  http://www.kernel.org/doc/man-pages/online/pages/man3/scanf.3.html
^  [3].  http://www.kernel.org/doc/man-pages/online/pages/man3/getopt.3.html
^  [4]. 
http://www.dwheeler.com/secure-programs/Secure-Programs-HOWTO/dangers-c.html

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
