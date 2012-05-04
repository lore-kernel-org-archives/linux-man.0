From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] nsswitch.conf.5: tfix
Date: Thu,  3 May 2012 23:23:39 -0400
Message-ID: <1336101819-29364-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Remove extra line committed by mistake in 7534ec
---
 man5/nsswitch.conf.5 |    1 -
 1 file changed, 1 deletion(-)

diff --git a/man5/nsswitch.conf.5 b/man5/nsswitch.conf.5
index 5f9d310..9b6f266 100644
--- a/man5/nsswitch.conf.5
+++ b/man5/nsswitch.conf.5
@@ -31,7 +31,6 @@ is used by the GNU C Library to determine
 the sources from which to obtain name-service information in
 a range of categories,
 and in what order.
-(The "
 Each category of information is identified by a database name.
 .LP
 The file is plain ASCII text, with columns separated by spaces or tab
-- 
1.7.10

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
