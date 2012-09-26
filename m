From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] quotactl.2: tfix
Date: Wed, 26 Sep 2012 15:03:32 -0400
Message-ID: <1348686212-26265-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/quotactl.2 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/quotactl.2 b/man2/quotactl.2
index c5fae5d..9b7430e 100644
--- a/man2/quotactl.2
+++ b/man2/quotactl.2
@@ -141,7 +141,7 @@ as follows:
 .nf
 
 /* uint64_t is an unsigned 64\-bit integer;
-   uint32_t is an unsigned 32-\bit integer */
+   uint32_t is an unsigned 32\-bit integer */
 
 struct dqblk {          /* Definition since Linux 2.4.22 */
     uint64_t dqb_bhardlimit;   /* absolute limit on disk
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
