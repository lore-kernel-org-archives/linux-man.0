From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ptrace.2: ffix
Date: Tue,  3 Sep 2013 22:21:47 -0400
Message-ID: <1378261307-19248-1-git-send-email-taffit@debian.org>
References: <1378259828-12785-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378259828-12785-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/ptrace.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index 7ad5ce8..f9118bf 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -1095,7 +1095,7 @@ then it is definitely a group-stop.
 killed the tracee.)
 .LP
 If tracee was attached using
-.IR PTRACE_SEIZE ,
+.BR PTRACE_SEIZE ,
 group-stop is indicated by
 .BR PTRACE_EVENT_STOP :
 .IR "status>>16 == PTRACE_EVENT_STOP" .
-- 
1.8.4.rc3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
