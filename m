From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 97491] New: sendfile man page should mention short "sends"
Date: Wed, 29 Apr 2015 08:09:38 +0000
Message-ID: <bug-97491-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=97491

            Bug ID: 97491
           Summary: sendfile man page should mention short "sends"
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: gjasny-S0/GAf8tV78@public.gmane.org
        Regression: No

Hello,

Linux 3.16 (3.16.0-4-amd64 #1 SMP Debian 3.16.7-ckt4-1, glibc 2.19-18) seems to
truncate larger requests to 2G (file to file copy):

strace output:
  sendfile(4, 3, [0], 10240000000)        = 2147479552


I know one should expect this behavior from read/write calls but for sendfile
it was somehow unexpected.

Maybe you could mention that fact in the man page for sendfile?

Thanks,
Gregor

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
