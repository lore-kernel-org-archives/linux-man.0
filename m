From: James Hunt <james.hunt-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ptrace.2: Explain behaviour should ptrace tracer call execve
Date: Thu, 13 Sep 2012 22:03:47 +0100
Message-ID: <50524A33.2030600@ubuntu.com>
Reply-To: james.hunt-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020703030604090805010700"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------020703030604090805010700
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

This behaviour was verified by reading the kernel source and confirming
the behaviour using a test program.

Applies to latest git repo.

Kind regards,

James.
--
James Hunt
____________________________________
http://upstart.ubuntu.com/cookbook
http://upstart.ubuntu.com/cookbook/upstart_cookbook.pdf

--------------020703030604090805010700
Content-Type: text/x-patch;
 name="0001-Explain-behaviour-should-ptrace-tracer-call-execve.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-Explain-behaviour-should-ptrace-tracer-call-execve.patc";
 filename*1="h"

>From 44d1bffe6dfbaeaae3e0bafb7ec626eb362f97e2 Mon Sep 17 00:00:00 2001
From: James Hunt <james.hunt-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Date: Thu, 13 Sep 2012 21:53:18 +0100
Subject: Explain behaviour should ptrace tracer call execve.

---
 man2/ptrace.2 |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index c45e569..d051358 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -1660,6 +1660,9 @@ In Linux kernels before 2.6.26,
 .BR init (8),
 the process with PID 1, may not be traced.
 .LP
+A tracees parent continues to be the tracer even if that tracer calls
+.BR execve (2).
+.LP
 The layout of the contents of memory and the USER area are
 quite operating-system- and architecture-specific.
 The offset supplied, and the data returned,
-- 
1.7.9.5


--------------020703030604090805010700--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
