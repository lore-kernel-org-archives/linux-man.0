From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 105391] New: Deprecate readdir_r
Date: Fri, 02 Oct 2015 12:45:29 +0000
Message-ID: <bug-105391-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=105391

            Bug ID: 105391
           Summary: Deprecate readdir_r
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
        Regression: No

readdir_r should never be used because there is no way to specify the size of
the buffer.  Due to that, glibc will ensure the name is at most 255 characters
long, and fail with an error of ENAMETOOLONG if a longer name is encountered.

Before we had the ENAMETOOLONG error, the example code in the manual page (I'm
looking at the 3.81 version) would have introduced a buffer overflow.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
