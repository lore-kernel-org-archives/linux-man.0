From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] siginterrupt.3: tfix missing dot
Date: Tue, 11 Jun 2013 21:59:30 +0200
Message-ID: <1370980770-25405-2-git-send-email-spaillard@debian.org>
References: <1370980770-25405-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370980770-25405-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/siginterrupt.3 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/siginterrupt.3 b/man3/siginterrupt.3
index 56a8b91..bdf8b21 100644
--- a/man3/siginterrupt.3
+++ b/man3/siginterrupt.3
@@ -73,7 +73,7 @@ amount of data transferred.
 .SH RETURN VALUE
 The
 .BR siginterrupt ()
-function returns 0 on success
+function returns 0 on success.
 It returns \-1 if the
 signal number
 .I sig
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
