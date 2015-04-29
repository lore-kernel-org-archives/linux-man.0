From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 97511] New: Document vm.overcommit_memory=2 interaction with
 mmap/mprotect/madvise
Date: Wed, 29 Apr 2015 15:15:29 +0000
Message-ID: <bug-97511-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=97511

            Bug ID: 97511
           Summary: Document vm.overcommit_memory=2 interaction with
                    mmap/mprotect/madvise
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
        Regression: No

For mmap and MAP_NORESERVE:

In vm.overcommit_memory=2, private mappings still count towards the commit
limit, despite what the flag name might imply.

For mmap and PROT_NONE:

Mappings created with this protection flag do not count towards the commit
limit in vm.overcommit_memory=2 mode.  mprotect can subsequently be used to
change the flags of (parts of) the mapping, to allocate memory as needed, at
which point mprotect may fail with ENOMEM.

For mprotect and madvise:

mprotect/madvise cannot be used to mark a previously allocated memory region as
unallocated, but reserved, and not have it count towards the
vm.overcommit_memory=2 limit.  Instead, use mmap with MAP_FIXED and a PROT_NONE
memory area, which will mark the region as unused.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
