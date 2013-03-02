From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ptrace.2: wfix
Date: Fri,  1 Mar 2013 22:40:41 -0400
Message-ID: <1362192041-7538-1-git-send-email-taffit@debian.org>
References: <1362191753-6287-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1362191753-6287-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/ptrace.2 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index 9d1133c..a685049 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -214,7 +214,7 @@ some modifications to the USER area are disallowed.
 .TP
 .BR PTRACE_GETREGS ", " PTRACE_GETFPREGS
 Read the tracee's general-purpose or floating-point registers,
-respectively, to the address
+respectively, at the address
 .I data
 in the tracer.
 See
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
