From: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Subject: [patch], ptrace(2): Unnecessary escape before ">"
Date: Sun, 6 May 2012 20:02:17 +0000
Message-ID: <20120506200217.GA1004@rhi.hi.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Package: man-pages
Version: 3.40
Severity: minor
Tags: patch

  From "groff -ww ..." (or "man --warnings=w ...":

<standard input>:758: warning: escape character ignored before `>'

  Also periods (full stop) in ellipises "protected" with "\&".

  Patch:

--- ptrace.2	2012-04-26 22:58:36.000000000 +0000
+++ ptrace.2.new	2012-05-06 01:13:38.000000000 +0000
@@ -76,7 +76,7 @@
 Ptrace commands are always sent to
 a specific tracee using a call of the form
 
-    ptrace(PTRACE_foo, pid, ...)
+    ptrace(PTRACE_foo, pid, \&...\&)
 
 where
 .I pid
@@ -752,7 +752,7 @@
 .I WSTOPSIG(status)
 macro can't be used to perform this examination,
 because it returns the value
-.IR "(status\>>8)\ &\ 0xff" .)
+.IR "(status>>8)\ &\ 0xff" .)
 .SS Signal-delivery-stop
 When a (possibly multithreaded) process receives any signal except
 .BR SIGKILL ,
@@ -1507,14 +1507,14 @@
 .LP
 .nf
 *** we get syscall-enter-stop in thread 1: **
-PID1 execve("/bin/foo", "foo" <unfinished ...>
+PID1 execve("/bin/foo", "foo" <unfinished \&...\&>
 *** we issue PTRACE_SYSCALL for thread 1 **
 *** we get syscall-enter-stop in thread 2: **
-PID2 execve("/bin/bar", "bar" <unfinished ...>
+PID2 execve("/bin/bar", "bar" <unfinished \&...\&>
 *** we issue PTRACE_SYSCALL for thread 2 **
 *** we get PTRACE_EVENT_EXEC for PID0, we issue PTRACE_SYSCALL **
 *** we get syscall-exit-stop for PID0: **
-PID0 <... execve resumed> )             = 0
+PID0 <...\& execve resumed> )             = 0
 .fi
 .LP
 If the

-- 
Bjarni I. Gislason
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
