From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: seccomp() SECCOMP_RET_KILL_PROCESS text for man page
Date: Sat, 18 Nov 2017 21:04:32 +0100
Message-ID: <a11b9a7a-1411-34d7-71aa-a29609729f21@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Tyler Hicks <tyhicks-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Kees,

I came up with the following text (patch below) to describe the
SECCOMP_RET_KILL_PROCESS action that you added in 4.14. Does it 
look okay?

       SECCOMP_RET_KILL_PROCESS (since Linux 4.14)
              This value results in immediate termination of the process,
              with a core dump.  The system call  is  not  executed.   By
              contrast with SECCOMP_RET_KILL_THREAD below, all threads in
              the thread group are  terminated.   (For  a  discussion  of
              thread groups, see the description of the CLONE_THREAD flag
              in clone(2).)

              The process terminates as though killed by a SIGSYS signal.
              Even  if  a  signal handler has been registered for SIGSYS,
              the handler will be ignored in this case  and  the  process
              always  terminates.  To a parent process that is waiting on
              this process (using waitpid(2) or  similar),  the  returned
              wstatus  will  indicate  that  its  child was terminated as
              though by a SIGSYS signal.

Cheers,

Michael


diff --git a/man2/seccomp.2 b/man2/seccomp.2
index 2e912940e..1b6bb2e51 100644
--- a/man2/seccomp.2
+++ b/man2/seccomp.2
@@ -399,6 +399,36 @@ returned by execution of all of the filters.
 In decreasing order of precedence,
 the values that may be returned by a seccomp filter are:
 .TP
+.BR SECCOMP_RET_KILL_PROCESS " (since Linux 4.14)"
+.\" commit 4d3b0b05aae9ee9ce0970dc4cc0fb3fad5e85945
+.\" commit 0466bdb99e8744bc9befa8d62a317f0fd7fd7421
+This value results in immediate termination of the process,
+with a core dump.
+The system call is not executed.
+By contrast with
+.BR SECCOMP_RET_KILL_THREAD
+below, all threads in the thread group are terminated.
+(For a discussion of thread groups, see the description of the
+.BR CLONE_THREAD
+flag in
+.BR clone (2).)
+.IP
+The process terminates
+.I "as though"
+killed by a
+.B SIGSYS
+signal.
+Even if a signal handler has been registered for
+.BR SIGSYS ,
+the handler will be ignored in this case and the process always terminates.
+To a parent process that is waiting on this process (using
+.BR waitpid (2)
+or similar), the returned
+.I wstatus
+will indicate that its child was terminated as though by a
+.BR SIGSYS
+signal.
+.TP
 .BR SECCOMP_RET_KILL_THREAD " (or " SECCOMP_RET_KILL )
 This value results in immediate termination of the thread
 that made the system call.

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
