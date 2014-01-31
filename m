From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 69771] New: crypt may return EPERM and/or EINVAL
Date: Fri, 31 Jan 2014 19:40:34 +0000
Message-ID: <bug-69771-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=69771

            Bug ID: 69771
           Summary: crypt may return EPERM and/or EINVAL
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org
        Regression: No

http://man7.org/linux/man-pages/man3/crypt.3.html

crypt(3) man page only has a description about ENOSYS. However current glibc
may return EPERM and EINVAL too.
I'd suggest to add following description

EPERM: If /proc/sys/crypto/fips_enabled is turned on and try to use weak crypt
type, such as DES.
EINVAL: salt argument has wrong format.


Thanks.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
