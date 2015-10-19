From: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ptrace.2: tfix
Date: Mon, 19 Oct 2015 21:30:51 +0900
Message-ID: <1445257851-7427-1-git-send-email-namhyung@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/ptrace.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index 058893f..46eccc4 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -834,7 +834,7 @@ returns
 instead of having
 .B SIGSTOP
 signal delivered to them.
-.BR evecve (2)
+.BR execve (2)
 does not deliver an extra
 .BR SIGTRAP .
 Only a
-- 
2.6.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
