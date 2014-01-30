From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] packet.7: ffix
Date: Thu, 30 Jan 2014 12:08:02 -0400
Message-ID: <1391098082-22061-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/packet.7 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man7/packet.7 b/man7/packet.7
index 3d06fb2..ed15631 100644
--- a/man7/packet.7
+++ b/man7/packet.7
@@ -327,8 +327,8 @@ Create a memory-mapped ring buffer for asynchronous packet reception.
 The packet socket reserves a contiguous region of application address
 space, lays it out into an array of packet slots and copies packets
 (up to
-.IR tp_snaplen
-) into subsequent slots.
+.IR tp_snaplen )
+into subsequent slots.
 Each packet is preceded by a metadata structure similar to
 .IR tpacket_auxdata .
 The protocol fields encode the offset to the data
@@ -409,7 +409,7 @@ fields of this call are ignored.
 If an address is passed using
 .BR sendto (2)
 or
-.BR sendmsg (2) ,
+.BR sendmsg (2),
 then that overrides the socket default.
 On successful transmission, the socket resets the slot to
 .BR TP_STATUS_AVAILABLE .
-- 
1.9.rc1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
