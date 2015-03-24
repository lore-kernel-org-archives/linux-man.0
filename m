From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 95421] New: Outdated documentation on posix_fadvise?
Date: Tue, 24 Mar 2015 13:02:55 +0000
Message-ID: <bug-95421-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=95421

            Bug ID: 95421
           Summary: Outdated documentation on posix_fadvise?
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: maik-pC6eOnvJXUcJGwgDXS7ZQA@public.gmane.org
        Regression: No

http://man7.org/linux/man-pages/man2/posix_fadvise.2.html suggests that
POSIX_FADV_DONTNEED has no effect on dirty pages. However, if I'm reading
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/mm/fadvise.c?id=v3.19#n115
correctly, it will in fact schedule dirty pages for writeout if the underlying
device is not already congested.

Can you please verify actual behavior and update the manpage if indicated?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
