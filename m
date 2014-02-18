From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 70801] New: ptrace PEEKDATA API is incorrect
Date: Tue, 18 Feb 2014 19:31:30 +0000
Message-ID: <bug-70801-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=70801

            Bug ID: 70801
           Summary: ptrace PEEKDATA API is incorrect
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: ahh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
        Regression: No

ptrace(2) manual gives us the API:

       PTRACE_PEEKTEXT, PTRACE_PEEKDATA
              Read a word at the address addr in the tracee's memory,
              returning the word as the result of the ptrace() call.  Linux
              does not have separate text and data address spaces, so these
              two requests are currently equivalent.  (data is ignored.)

checking kernel/ptrace.c gives us:

int ptrace_request(struct task_struct *child, long request,
           unsigned long addr, unsigned long data)
{
 ...
    switch (request) {
    case PTRACE_PEEKTEXT:
    case PTRACE_PEEKDATA:
        return generic_ptrace_peekdata(child, addr, data);


int generic_ptrace_peekdata(struct task_struct *tsk, unsigned long addr,
                unsigned long data)
{
    unsigned long tmp;
    int copied;

    copied = access_process_vm(tsk, addr, &tmp, sizeof(tmp), 0);
    if (copied != sizeof(tmp))
        return -EIO;
    return put_user(tmp, (unsigned long __user *)data);
}

So clearly data is _not_ ignored and the word is _not_ returned as the result
of ptrace.  I also verified that various working ptrace calls in fact use the
API as the kernel has it, not the man page.

This wants a relatively simple fix itself, but it does _not_ fill me with
confidence as to the accuracy of the man page for the other requests; I
strongly suggest you audit them for accuracy (sadly I don't have time to do
this myself.)  Just a thought.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
