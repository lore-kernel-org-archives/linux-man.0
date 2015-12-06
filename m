From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 10/19] icmp.7: tfix
Date: Sun,  6 Dec 2015 19:47:23 +0100
Message-ID: <1449427652-3585-10-git-send-email-jwilk@jwilk.net>
References: <1449427652-3585-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449427652-3585-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man7/icmp.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/icmp.7 b/man7/icmp.7
index 6c23415..05e1adf 100644
--- a/man7/icmp.7
+++ b/man7/icmp.7
@@ -161,7 +161,7 @@ sent to prevent loops when a packet has crossed too many hops.
 .TP
 .IR ping_group_range " (two integers; default: see below; since Linux 2.6.39)"
 Range of the group IDs (minimum and maximum group IDs, inclusive)
-ithat are allowed to create ICMP Echo sockets.
+that are allowed to create ICMP Echo sockets.
 The default is "1 0", which
 means no group is allowed to create ICMP Echo sockets.
 .SH VERSIONS
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
