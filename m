From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ptrace.2: tfix
Date: Sun,  3 Feb 2013 22:57:40 -0400
Message-ID: <1359946661-14700-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/ptrace.2 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index b137da3..4320de2 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -306,7 +306,7 @@ If a tracer sets this flag, a
 .B SIGKILL
 signal will be sent to every tracee if the tracer exits.
 This option is useful for ptrace jailers that
-want to ensure that tracees can never escape the trcer's control.
+want to ensure that tracees can never escape the tracer's control.
 
 .TP
 .BR PTRACE_O_TRACECLONE " (since Linux 2.5.46)"
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
