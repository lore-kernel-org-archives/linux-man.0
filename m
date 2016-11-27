From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 1/2] ptrace.2: tfix
Date: Sun, 27 Nov 2016 14:34:02 +0100
Message-ID: <20161127133403.9319-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/ptrace.2 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index bd76099..0ff73fa 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -1600,7 +1600,7 @@ Note that all mentions
 apply equally to
 .BR PTRACE_SYSEMU_SINGLESTEP.
 .LP
-However, even if the tracee is was continued using
+However, even if the tracee was continued using
 .BR PTRACE_SYSCALL
 , it is not guaranteed that the next stop will be a syscall-exit-stop.
 Other possibilities are that the tracee may stop in a
@@ -1702,7 +1702,7 @@ always followed by syscall-exit-stop,
 stop, or the tracee's death;
 no other kinds of ptrace-stop can occur in between.
 However, note that seccomp stops (see below) can cause syscall-exit-stops,
-without preceeding syscall-entry-stops.
+without preceding syscall-entry-stops.
 If seccomp is in use, care needs
 to be taken not to misinterpret such stops as syscall-entry-stops.
 .LP
@@ -1781,7 +1781,7 @@ will cause syscall-exit-stops,
 the system call number may be changed and any other modified registers
 are visible to the to-be-executed system call as well).
 Note that there may be,
-but need not have been a preceeding syscall-entry-stop.
+but need not have been a preceding syscall-entry-stop.
 
 After a
 .BR PTRACE_EVENT_SECCOMP
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
