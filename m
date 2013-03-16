From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] random.4: tfix
Date: Sat, 16 Mar 2013 16:44:27 -0400
Message-ID: <1363466668-21087-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man4/random.4 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man4/random.4 b/man4/random.4
index c9b4a33..7e1aa30 100644
--- a/man4/random.4
+++ b/man4/random.4
@@ -265,7 +265,7 @@ struct rand_pool_info {
 .IP
 Here
 .I entropy_count
-is the value added to (or subtracted from) from the entropy count, and
+is the value added to (or subtracted from) the entropy count, and
 .I buf
 is the buffer of size
 .I buf_size
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
