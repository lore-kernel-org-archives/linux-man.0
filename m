From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 94141] New: man page for dl_iterate_phdr() does not mention
 current-executable-first iteration pattern
Date: Mon, 02 Mar 2015 19:14:04 +0000
Message-ID: <bug-94141-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=94141

            Bug ID: 94141
           Summary: man page for dl_iterate_phdr() does not mention
                    current-executable-first iteration pattern
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: sque-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
        Regression: No

When I was using dl_iterate_phdr(), I noticed that the currently running
executable wasn't showing up by name. And the first object visited by the
iteration was unnamed.

According to this Stack Overflow page, the first object will always be the
current executable:
http://stackoverflow.com/questions/8875876/getting-the-elf-header-of-the-main-executable

But I didn't find any mention of this behavior in the official documentation:
http://linux.die.net/man/3/dl_iterate_phdr

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
