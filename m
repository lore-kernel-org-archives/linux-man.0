From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] proc.5: tfix
Date: Sat, 20 Oct 2012 15:44:58 -0400
Message-ID: <1350762298-6184-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man5/proc.5 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 5337160..5312314 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -2036,7 +2036,7 @@ The minimum value that can be assigned to this file is the system page size.
 .IR /proc/sys/fs/protected_hardlinks " (since Linux 3.6)"
 .\" commit 800179c9b8a1e796e441674776d11cd4c05d61d7
 When the value in this file is 0,
-no restrictions are placed the creation of hard links
+no restrictions are placed on the creation of hard links
 (i.e., this is the historical behaviour before Linux 3.6).
 When the value in this file is 1,
 a hard link can be created to a target file
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
