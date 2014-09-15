From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] fcntl.2: pfix
Date: Sun, 14 Sep 2014 22:25:21 -0400
Message-ID: <1410747921-16888-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/fcntl.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/fcntl.2 b/man2/fcntl.2
index 77892a2..59f22ce 100644
--- a/man2/fcntl.2
+++ b/man2/fcntl.2
@@ -475,7 +475,7 @@ in most respects identical to the traditional record locks described above.
 This lock type is Linux-specific,
 and available since Linux 3.15.
 For an explanation of open file descriptions, see
-.BR open (2)
+.BR open (2).
 
 The principal difference between the two lock types
 is that whereas traditional record locks
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
