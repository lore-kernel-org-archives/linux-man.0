From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ip.7: tfix
Date: Wed, 10 Sep 2014 17:38:32 -0400
Message-ID: <1410385112-1976-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/ip.7 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man7/ip.7 b/man7/ip.7
index 2f18015..94b5519 100644
--- a/man7/ip.7
+++ b/man7/ip.7
@@ -1006,17 +1006,17 @@ the port number in a socket address is specified as 0 when calling
 is called on a stream socket that was not previously bound;
 .IP *
 .BR connect (2)
-was called on a socket that was not not previously bound;
+was called on a socket that was not previously bound;
 .IP *
 .BR sendto (2)
-is called on a datagram socket that was not not previously bound.
+is called on a datagram socket that was not previously bound.
 .RE
 .IP
 Allocation of ephemeral ports starts with the first number in
 .IR ip_local_port_range
 and ends with the second number.
 If the range of ephemeral ports is exhausted,
-then the relevant system call returns an error (but see BUGS)
+then the relevant system call returns an error (but see BUGS).
 .IP
 Note that the port range in
 .IR ip_local_port_range
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
