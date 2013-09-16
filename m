From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 61511] New: scanf man page is misleading re out-of-range
 integer conversions
Date: Mon, 16 Sep 2013 20:04:25 +0000
Message-ID: <bug-61511-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=61511

            Bug ID: 61511
           Summary: scanf man page is misleading re out-of-range integer
                    conversions
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: arequipeno-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No

Unless I'm missing it, the scanf man page doesn't really specifically address
the result of an out-of-range integer conversion -- e.g.
sscanf("9999999999999999999999999999999", "%d", &i).

The ERRORS section, however, says this:

 ERANGE The result of an integer conversion would exceed the size that
              can be stored in the corresponding integer type.

This is definitely *not* the behavior that I'm seeing.  Instead, sscanf is
returning 1 and -1 is assigned to i.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
