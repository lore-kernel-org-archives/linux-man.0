From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/3] ptrace.2: another ffix
Date: Fri, 23 Mar 2012 19:32:15 -0400
Message-ID: <1332545535-8094-1-git-send-email-taffit@debian.org>
References: <1332472329-31499-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1332472329-31499-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/ptrace.2 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index 62f4458..0d6ec68 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -1458,7 +1458,7 @@ First, it enables
 .B PTRACE_EVENT_EXEC
 stop,
 which occurs before
-.BR execve(2)
+.BR execve (2)
 returns.
 In this stop, the tracer can use
 .B PTRACE_GETEVENTMSG
-- 
1.7.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
