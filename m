From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 1/3] getaddrinfo.3: tfix
Date: Sun, 28 Feb 2016 01:32:39 +0100
Message-ID: <1456619561-613-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man3/getaddrinfo.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/getaddrinfo.3 b/man3/getaddrinfo.3
index 7bf815a..f924cdf 100644
--- a/man3/getaddrinfo.3
+++ b/man3/getaddrinfo.3
@@ -232,7 +232,7 @@ for IPv4 addresses,
 .BR IN6ADDR_ANY_INIT
 for IPv6 address).
 The wildcard address is used by applications (typically servers)
-that intend to accept connections on any of the hosts's network addresses.
+that intend to accept connections on any of the host's network addresses.
 If
 .I node
 is not NULL, then the
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
