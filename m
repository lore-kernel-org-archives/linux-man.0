From: Andrey Vagin <avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] netlink.7: add a note about  broadcast messages to multiple groups
Date: Wed, 13 Mar 2013 14:13:41 +0400
Message-ID: <1363169621-3929-1-git-send-email-avagin@openvz.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrey Vagin <avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org


Signed-off-by: Andrey Vagin <avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
---
 man7/netlink.7 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/man7/netlink.7 b/man7/netlink.7
index de955e4..7c235d8 100644
--- a/man7/netlink.7
+++ b/man7/netlink.7
@@ -346,6 +346,8 @@ or does a
 Only processes with an effective UID of 0 or the
 .B CAP_NET_ADMIN
 capability may send or listen to a netlink multicast group.
+.\" d629b836d151d43332492651dd841d32e57ebe3b
+Since Linux 2.6.13 messages can't be broadcasted to multiple groups.
 Any replies to a message received for a multicast group should be
 sent back to the sending PID and the multicast group.
 Some Linux kernel subsystems may additionally allow other users
-- 
1.7.11.7

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
