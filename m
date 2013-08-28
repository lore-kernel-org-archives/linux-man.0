From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 60807] New: not all the pages are encoded using utf-8
Date: Wed, 28 Aug 2013 13:38:03 +0000
Message-ID: <bug-60807-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60807

            Bug ID: 60807
           Summary: not all the pages are encoded using utf-8
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: cs.wzpan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No

I found that not all the pages are encoded using utf-8. It may cause problems
once we try to parse them.

These files are:

* man3/fflush.3
* man3/toupper.3
* man3/updwtmp.3
* man3/encrypt.3
* man3/lockf.3
* man3/rand.3
* man3/fclose.3
* man3/strtok.3
* man2/close.2
* man2/getdomainname.2
* man2/madvise.2
* man2/umask.2
* man2/sysinfo.2
* man2/getrlimit.2
* man5/utmp.5
* man7/cp1251.7
* man7/iso_8859-2.7
* man7/armscii-8.7
* man7/suffixes.7
* man7/iso_8859-4.7
* man7/iso_8859-8.7
* man7/iso_8859-16.7
* man7/hier.7
* man7/iso_8859-13.7
* man7/koi8-u.7
* man7/environ.7
* man7/iso_8859-15.7
* man7/iso_8859-9.7
* man7/iso_8859-11.7
* man7/iso_8859-14.7
* man7/iso_8859-10.7
* man7/iso_8859-6.7
* man7/iso_8859-1.7
* man7/iso_8859-7.7
* man7/koi8-r.7
* man7/iso_8859-5.7
* man7/iso_8859-3.7

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
