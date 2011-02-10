From: Christian Franke <nobody-e83xkrq8dvbLvtPRa3sz4w@public.gmane.org>
Subject: [PATCH] ipv6.7: fix description of IPV6_PKTINFO
Date: Thu, 10 Feb 2011 02:37:00 +0100
Message-ID: <20110210013700.GA17765@ts2server.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

  IPV6_PKTINFO takes a struct in6_pktinfo as argument, not an int,
  see linux/net/ipv6/ipv6_sockglue.c
---
 man7/ipv6.7 |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/man7/ipv6.7 b/man7/ipv6.7
index 1e3b4c6..5b0482c 100644
--- a/man7/ipv6.7
+++ b/man7/ipv6.7
@@ -192,7 +192,18 @@ Only allowed for
 or
 .B SOCK_RAW
 sockets.
-Argument is a pointer to a boolean value in an integer.
+Argument is an
+.I in6_pktinfo
+structure.
+.sp
+.in +4n
+.nf
+struct in6_pktinfo {
+    struct in6_addr ipi6_addr;  /* src/dst IPv6 address */
+    unsigned int ipi6_ifindex;  /* interface index */
+};
+.fi
+.in
 .TP
 .nh
 .B IPV6_RTHDR, IPV6_AUTHHDR, IPV6_DSTOPTS, IPV6_HOPOPTS, IPV6_FLOWINFO, IPV6_HOPLIMIT
-- 
1.7.2.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
