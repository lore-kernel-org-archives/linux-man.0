From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 14449] Ambiguity in SIGSYS <-> SIGUNUSED portion of signal(7)
Date: Wed, 3 Feb 2010 05:55:21 GMT
Message-ID: <201002030555.o135tLhD005317@demeter.kernel.org>
References: <bug-14449-11311@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-14449-11311-V0hAGp6uBxO456/isadD/XN4h3HLQggn@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=14449


Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org




--- Comment #3 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2010-02-03 05:55:18 ---
Thanks for this report. I applied the patch below. Satisfactory?

--- a/man7/signal.7
+++ b/man7/signal.7
@@ -270,7 +270,7 @@ SIGBUS      10,7,10 Core    Bus error (bad memory access)
 SIGPOLL                Term    Pollable event (Sys V).
                        Synonym for \fBSIGIO\fP
 SIGPROF        27,27,29        Term    Profiling timer expired
-SIGSYS 12,\-,12        Core    Bad argument to routine (SVr4)
+SIGSYS 12,31,12        Core    Bad argument to routine (SVr4)
 SIGTRAP        5       Core    Trace/breakpoint trap
 SIGURG 16,23,21        Ign     Urgent condition on socket (4.2BSD)
 SIGVTALRM      26,26,28        Term    Virtual alarm clock (4.2BSD)
@@ -304,7 +304,7 @@ SIGPWR      29,30,19        Term    Power failure (System
V)
 SIGINFO        29,\-,\-                A synonym for \fBSIGPWR\fP
 SIGLOST        \-,\-,\-        Term    File lock lost
 SIGWINCH       28,28,20        Ign     Window resize signal (4.3BSD, Sun)
-SIGUNUSED      \-,31,\-        Term    Unused signal (will be \fBSIGSYS\fP)
+SIGUNUSED      \-,31,\-        Core    Synonymous with \fBSIGSYS\fP
 .TE

 (Signal 29 is
@@ -328,6 +328,13 @@ by default on those other Unix systems where it appears.
 .B SIGIO
 (which is not specified in POSIX.1-2001) is ignored by default
 on several other Unix systems.
+
+Where defined,
+.B SIGUNUSED
+is synonymous with
+.\" parisc is the only exception: SIGSYS is 12, SIGUNUSED is 31
+.B SIGSYS
+on most architectures.
 .SS "Real-time Signals"
 Linux supports real-time signals as originally defined in the POSIX.1b
 real-time extensions (and now included in POSIX.1-2001).

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
