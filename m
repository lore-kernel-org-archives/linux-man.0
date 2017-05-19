From: Ruben Kerkhof <ruben-pkfekA+zf0jEimEGZCN+oA@public.gmane.org>
Subject: [PATCH] tcp.7: tfix
Date: Fri, 19 May 2017 11:46:48 +0200
Message-ID: <20170519094648.3137-1-ruben@rubenkerkhof.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ruben Kerkhof <ruben-pkfekA+zf0jEimEGZCN+oA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Ruben Kerkhof <ruben-pkfekA+zf0jEimEGZCN+oA@public.gmane.org>
---
 man7/tcp.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/tcp.7 b/man7/tcp.7
index 67dbed49a..2a1ad135f 100644
--- a/man7/tcp.7
+++ b/man7/tcp.7
@@ -423,7 +423,7 @@ option.
 .\" Since 2.4.0-test7
 Enable RFC\ 2883 TCP Duplicate SACK support.
 .TP
-.IR tcp_ecn " (Integer; default: se below; since Linux 2.4)"
+.IR tcp_ecn " (Integer; default: see below; since Linux 2.4)"
 .\" Since 2.4.0-test7
 Enable RFC\ 3168 Explicit Congestion Notification.
 
-- 
2.13.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
