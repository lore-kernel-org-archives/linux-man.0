From: =?UTF-8?q?Mattias=20Andr=C3=A9e?= <maandree-UNjuZkX4dYU@public.gmane.org>
Subject: [PATCH] recvmmsg.2: tfix
Date: Wed, 14 Feb 2018 13:35:56 +0100
Message-ID: <20180214123556.13033-1-maandree@kth.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Mattias=20Andr=C3=A9e?= <maandree-UNjuZkX4dYU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

recvmmsq -> recvmmsg

Signed-off-by: Mattias Andrée <maandree-UNjuZkX4dYU@public.gmane.org>
---
 man2/recvmmsg.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/recvmmsg.2 b/man2/recvmmsg.2
index f20ce00a8..4aee1dc11 100644
--- a/man2/recvmmsg.2
+++ b/man2/recvmmsg.2
@@ -185,7 +185,7 @@ but then no further datagrams are received, the call will block forever.
 If an error occurs after at least one message has been received,
 the call succeeds, and returns the number of messages received.
 The error code is expected to be returned on a subsequent call to
-.BR recvmmsq ().
+.BR recvmmsg ().
 In the current implementation, however, the error code can be overwritten
 in the meantime by an unrelated network event on a socket,
 for example an incoming ICMP packet.
-- 
2.11.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
