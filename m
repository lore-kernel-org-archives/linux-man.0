From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 75991] New: Clarify host.conf and resolv.conf status
Date: Mon, 12 May 2014 06:04:51 +0000
Message-ID: <bug-75991-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=75991

            Bug ID: 75991
           Summary: Clarify host.conf and resolv.conf status
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
        Regression: No

host.conf does not refer to resolv.conf at all and vice versa, it might not be
obvious by reading the man pages that host.conf is the legacy configuration
file. At least the "order" option in host.conf is completely ignored although
the man pages describes it like any other option. There was a patch to address
this sent earlier but it wasn't updated based on review and after that no
progress:

http://thread.gmane.org/gmane.linux.man/3413

Please clarify host.conf and resolv.conf relationship and status in the related
man pages, and update the description for obsolete and deprecate options as
needed.

Thanks.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
