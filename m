From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 76851] New: inotify_rm_watch(2) unspecified behavior
Date: Sat, 24 May 2014 20:35:24 +0000
Message-ID: <bug-76851-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=76851

            Bug ID: 76851
           Summary: inotify_rm_watch(2) unspecified behavior
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: junk.jsmith+kernel.org-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No

The inotify interface leaves unspecified what happens to potentially "pending"
watch events (i.e., caught by the kernel but not yet read()) after an
inotify_rm_watch() call.

IN_IGNORE flagged events *allow* inotify_rm_watch() calls to be monitored
asynchronously, but it is not stated whether triggering actions between a most
recent read() and an inotify_rm_watch() call *require* all other watch events
to be handled so when users key map inotify_event wd fields to local objects.

Similarly, a conservative user would need to keep a queue of removed objects
formerly associated with a watch descriptor if it is assumed possible that the
kernel can both deliver events on an rm'd wd and reuse wds before the last
pertinent event has been read.

If the purpose of IN_IGNORE being generated on the watch removal is to protect
against poll/blocking-read vs. inotify_rm_watch() races, it should be plainly
stated. Likewise, if it is needed for safely reacting to "stale" events, this
should be explained. I believe that the current language of inotify_rm_watch(2)
and the read(2) section of inotify(7) leave both interpretations defensible,
which is sub-optimal.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
