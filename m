From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ipv6.7: ffix
Date: Thu,  1 Nov 2012 21:19:09 -0400
Message-ID: <1351819149-17794-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/ipv6.7 |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man7/ipv6.7 b/man7/ipv6.7
index 5caa3ce..f558505 100644
--- a/man7/ipv6.7
+++ b/man7/ipv6.7
@@ -187,7 +187,9 @@ Argument is a pointer to boolean.
 Set delivery of the
 .B IPV6_PKTINFO
 control message on incoming datagrams.
-Such control messages contain a struct in6_pktinfo, as per RFC 3542.
+Such control messages contain a
+.IR "struct in6_pktinfo" ,
+as per RFC 3542.
 Only allowed for
 .B SOCK_DGRAM
 or
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
