From: Nikos Mavrogiannopoulos <nmav-c5N7Ur/I1ocdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ioctl_list.2: SIOCADDRT accepts in6_rtmsg in INET6 protocol
Date: Thu, 16 Apr 2015 14:52:13 +0300
Message-ID: <1429185133.443.1.camel@gnutls.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Signed-off-by: Nikos Mavrogiannopoulos <nmav-c5N7Ur/I1ocdnm+yROfE0A@public.gmane.org>
---
 man2/ioctl_list.2 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/man2/ioctl_list.2 b/man2/ioctl_list.2
index ba993a1..1507d3c 100644
--- a/man2/ioctl_list.2
+++ b/man2/ioctl_list.2
@@ -904,6 +904,7 @@ the protocol:
     Most protocols      const struct rtentry *
     AX.25               const struct ax25_route *
     NET/ROM             const struct nr_route_struct *
+    INET6               const struct in6_rtmsg *
 
 .fi
 .B SIOCGIFCONF
-- 
2.1.0



--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
