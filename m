From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] send.2: tfix
Date: Sun,  8 Jun 2014 18:37:31 +0400
Message-ID: <1402238251-6758-1-git-send-email-yuray@komyakino.ru>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/send.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/send.2 b/man2/send.2
index c0ee0cf..8051198 100644
--- a/man2/send.2
+++ b/man2/send.2
@@ -262,7 +262,7 @@ The
 field is used on an unconnected socket to specify the target
 address for a datagram.
 It points to a buffer containing the address; the
-.I msg_name
+.I msg_namelen
 field should be set to the size of the address.
 For a connected socket, these fields should be specified as NULL and 0,
 respectively.
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
