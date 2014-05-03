From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 75431] New: posix_fadvise(2): wrong param name?
Date: Sat, 03 May 2014 19:04:16 +0000
Message-ID: <bug-75431-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=75431

            Bug ID: 75431
           Summary: posix_fadvise(2): wrong param name?
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: low
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: pub08-knl-Hke7B/fnggLYtjvyW6yDsg@public.gmane.org
        Regression: No

In posix_fadvise(2), under "Architecture-specific variants", it says:
       [Due to register-alignment issues,]
       ... the call signature of posix_fadvise() shown in
       the SYNOPSIS would force a register to be wasted as padding between
       the fd and len arguments.

Should it say "offset" instead of "len" in the last line of that quoted bit?

Rationale: the SYNOPSIS shows a call signature of:
       int posix_fadvise(int fd, off_t offset, off_t len, int advice);
in which:
  - fd and len aren't adjacent
  - it's between a shorter value followed by a longer one that I'd expect
alignment padding to be needed, and the only pair where that occurs is (fd,
offset)

CAVEAT: I'm not familiar with either the syscall or the specific alignment
issues in question, so my guess about this is just that -- a deduced guess, NOT
specific knowledge.  So don't make the change on my say-so; please verify it
first!

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
