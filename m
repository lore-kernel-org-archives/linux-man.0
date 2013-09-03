From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 60836] New: Non-existing inode-max documented
Date: Tue, 03 Sep 2013 09:36:19 +0000
Message-ID: <bug-60836-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60836

            Bug ID: 60836
           Summary: Non-existing inode-max documented
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

Created attachment 107391
  --> https://bugzilla.kernel.org/attachment.cgi?id=107391&action=edit
Drop references to prehistoric /proc/sys/fs/inode-max

Both Linux man pages and kernel's Documentation/sysctl/fs.txt document
/proc/sys/fs/inode-max which was gone in early 2.3 (~14 years ago).

My patch proposal for man pages attached, however I'm uncertain how preshrink
works these days so please double check before applying.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
