From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] sln.8: tfix
Date: Sun, 24 Feb 2013 22:35:29 -0400
Message-ID: <1361759729-5816-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man8/sln.8 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man8/sln.8 b/man8/sln.8
index ef7e143..5902b1b 100644
--- a/man8/sln.8
+++ b/man8/sln.8
@@ -43,7 +43,7 @@ The command-line has two forms.
 In the first form, it creates
 .I dest
 as a new symbolic link to
-.IR dest .
+.IR source .
 
 In the second form,
 .I filelist
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
