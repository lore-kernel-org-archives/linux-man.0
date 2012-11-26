From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] exec(3): fix indentation of execvpe args
Date: Mon, 26 Nov 2012 04:14:01 -0500
Message-ID: <1353921241-28068-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man3/exec.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/exec.3 b/man3/exec.3
index e997807..617ec5c 100644
--- a/man3/exec.3
+++ b/man3/exec.3
@@ -58,7 +58,7 @@ execl, execlp, execle, execv, execvp, execvpe \- execute a file
 .br
 .BI "int execvpe(const char *" file ", char *const " argv "[],"
 .br
-.BI "           char *const " envp "[]);"
+.BI "            char *const " envp "[]);"
 .sp
 .in -4n
 Feature Test Macro Requirements for glibc (see
-- 
1.7.12.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
