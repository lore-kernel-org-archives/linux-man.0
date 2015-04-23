From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 97161] New: bootparam(7): 'debug' parameter: reference to
 <linux/kernel.h> for information on log levels is misleading.
Date: Thu, 23 Apr 2015 17:07:58 +0000
Message-ID: <bug-97161-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=97161

            Bug ID: 97161
           Summary: bootparam(7): 'debug' parameter: reference to
                    <linux/kernel.h> for information on log levels is
                    misleading.
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: a.c.kalker-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No

The section on the 'debug' parameter refers the user to <linux/kernel.h> for
more information on kernel log levels, however, that file contains neither a
description of console_loglevel nor nor a description of the various log
levels.

The closest I can find is <include/linux/kern_levels.h>, which defines the
various log levels but doesn't explain console_loglevel, Also, it only exists
in recent kernels, version 3.5 and up.
Another candidate would be <include/linux/printk.h>, which does define
console_loglevel but doesn't explain the individual log levels.

Perhaps both references (<include/linux/printk.h>,
<include/linux/kern_levels.h>) could be included?

Kind regards,

Alain

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
