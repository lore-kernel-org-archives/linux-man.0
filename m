From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 99901] New: iopl is lost on fork and execve
Date: Sat, 13 Jun 2015 17:36:08 +0000
Message-ID: <bug-99901-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=99901

            Bug ID: 99901
           Summary: iopl is lost on fork and execve
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: alexhenrie24-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No

Created attachment 179841
  --> https://bugzilla.kernel.org/attachment.cgi?id=179841&action=edit
iopl3 test program

`man iopl` currently states "Permissions are inherited by fork(2) and
execve(2)." This is not true. iopl has never been preserved across fork or
execve on x64 kernels,[1] and it has not been preserved across those syscalls
on x86 kernels since Linux 3.7.[2] There are no plans to change the current
behavior for either architecture.[3-6]

A test program to demonstrate this behavior is attached.

[1]
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/x86/kernel/process_64.c
[2]
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/arch/x86/kernel/process_32.c?id=6783eaa2e1253fbcbe2c2f6bb4c843abf1343caf
[3] https://lkml.org/lkml/2015/5/11/1054
[4] https://lkml.org/lkml/2015/5/12/55
[5] https://lkml.org/lkml/2015/5/12/537
[6] https://lkml.org/lkml/2015/5/12/545

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
