From: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Subject: [PATCH] rtnetlink.7: Add info about ability to create links with
 given index
Date: Mon, 18 Feb 2013 21:14:30 +0400
Message-ID: <51226176.9020203@parallels.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Since kernel v3.7 the RTM_NEWLINK message not accepts non-zero values
in ifi_index field. Mention this fact in the respective rtneltlink.7
section.

Signed-off-by: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>

---

diff --git a/man7/rtnetlink.7 b/man7/rtnetlink.7
index ebd9107..0809026 100644
--- a/man7/rtnetlink.7
+++ b/man7/rtnetlink.7
@@ -78,7 +78,10 @@ struct ifinfomsg {
 contains the device flags, see
 .BR netdevice (7);
 .I ifi_index
-is the unique interface index,
+is the unique interface index (since kernel v3.7 it is possible to feed a non-zero
+value with the
+.B RTM_NEWLINK
+message, thus creating a link with the given ifindex);
 .I ifi_change
 is reserved for future use and should be always set to 0xFFFFFFFF.
 .na
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
