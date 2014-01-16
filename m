From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] small improvement for ipv6.7
Date: Thu, 16 Jan 2014 20:22:39 +0400
Message-ID: <20140116202239.2c4fba19@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

--- man-pages-git/man7/ipv6.7   2013-06-06 21:38:12.077409548 +0400
+++ /tmp/ipv6.7 2014-01-16 20:20:04.276184187 +0400
@@ -313,7 +313,9 @@
 .B IPV6_ROUTER_ALERT
 Pass forwarded packets containing a router alert hop-by-hop option to
 this socket.
-Only allowed for SOCK_RAW sockets.
+Only allowed for
+.B SOCK_RAW
+sockets.
 The tapped packets are not forwarded by the kernel, it is the
 user's responsibility to send them out again.
 Argument is a pointer to an integer.


-- 
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
