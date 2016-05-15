From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 118241] New: clone(2) gives wrong prototype for raw system call
Date: Sun, 15 May 2016 18:45:15 +0000
Message-ID: <bug-118241-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=118241

            Bug ID: 118241
           Summary: clone(2) gives wrong prototype for raw system call
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: b7.10110111-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No

clone(2) man gives the following prototype for the raw system call:

long clone(unsigned long flags, void *child_stack,
           void *ptid, void *ctid,
           struct pt_regs *regs);

But actual kernel never seems to take `struct pt_regs* regs` as an argument.
Instead it takes `struct user_desc* tls`. See the definitions of clone in
kernel/fork.c. None of the #if branches have anything resembling `struct
pt_regs`, but all do have `tls`.
You can see another evidence of this in arch/x86/entry/entry_64_compat.S:

* The 32-bit clone ABI is: clone(..., int tls_val, int *child_tidptr).
* The 64-bit clone ABI is: clone(..., int *child_tidptr, int tls_val).

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
