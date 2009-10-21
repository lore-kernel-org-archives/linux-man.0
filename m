From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 14449] New: Ambiguity in SIGSYS <-> SIGUNUSED portion of
 signal(7)
Date: Wed, 21 Oct 2009 05:34:37 GMT
Message-ID: <bug-14449-11311@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=14449

               URL: http://www.nabble.com/New-test-%3A-sniperkill---killin
                    g-processes-from-a-distance-td25986571.html
           Summary: Ambiguity in SIGSYS <-> SIGUNUSED portion of signal(7)
           Product: Documentation
           Version: unspecified
    Kernel Version: Linux orangebox 2.6.30-gentoo-r4 #1 SMP PREEMPT Sat
                    Aug 8 19:31:26 PDT 2009 x86_64 Intel(R) Core(TM)2 Quad
                    CPU Q9400 @ 2.66GHz GenuineIntel GNU/Linux
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: yaneurabeya-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
        Regression: No


Created an attachment (id=23482)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=23482)
Application driven by the sniperkill script.

signal(7) states that signal # 31 for ppc, *86, etc should result in
termination only, in the 3rd column, but the `will be SIGSYS' comment is
unnecessarily ambiguous:

       SIGUNUSED    -,31,-     Term    Unused signal (will be SIGSYS)

       SIGSYS      12,-,12     Core    Bad argument to routine (SVID)

The behavior as shown in my log for the `sniperkill' test I've recommended
adding to LTP demonstrates that the behavior for SIGUNUSED matches SIGSYS.

The documentation for SIGUNUSED should either clearly state a) that the process
will `Core'-dump, and/or the indirection should be changed such that SIGUNUSED
directly maps to SIGSYS.

I've attached the logs and test. The email to ltp-list is in the URL field.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
