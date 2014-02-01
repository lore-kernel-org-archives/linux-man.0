From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] tcp.7: tfix
Date: Sat,  1 Feb 2014 18:37:37 -0400
Message-ID: <1391294257-25320-2-git-send-email-taffit@debian.org>
References: <1391294257-25320-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391294257-25320-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/tcp.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/tcp.7 b/man7/tcp.7
index 9cd7206..4ec3894 100644
--- a/man7/tcp.7
+++ b/man7/tcp.7
@@ -1060,7 +1060,7 @@ This option, like many others, will be inherited by the socket returned by
 .BR accept (2),
 if it was set on the listening socket.
 
-Further details on the user timeout" feature can be found in
+Further details on the user timeout feature can be found in
 RFC\ 793 and RFC\ 5482 ("TCP User Timeout Option").
 .TP
 .BR TCP_WINDOW_CLAMP " (since Linux 2.4)"
-- 
1.9.rc1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
