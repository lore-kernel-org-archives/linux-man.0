From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] rtnetlink.3: RTA_PAYLOAD returns int
Date: Sun, 29 Apr 2012 18:19:44 +0200
Message-ID: <1335716384-20323-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Since 2.6.11: http://lxr.linux.no/#linux+v2.6.11/include/linux/rtnetlink.h#L120
Reported-by: Nick Black <dank-URhJvLu/5VteoWH0uzbU5w@public.gmane.org>
http://bugs.debian.org/621075
---
 man3/rtnetlink.3 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man3/rtnetlink.3 b/man3/rtnetlink.3
index 027f668..afdcc2b 100644
--- a/man3/rtnetlink.3
+++ b/man3/rtnetlink.3
@@ -23,7 +23,7 @@ rtnetlink \- macros to manipulate rtnetlink messages
 .sp
 .BI "void *RTA_DATA(struct rtattr *" rta );
 .sp
-.BI "unsigned int RTA_PAYLOAD(struct rtattr *" rta );
+.BI "int RTA_PAYLOAD(struct rtattr *" rta );
 .sp
 .BI "struct rtattr *RTA_NEXT(struct rtattr *" rta \
 ", unsigned int " rtabuflen );
-- 
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
