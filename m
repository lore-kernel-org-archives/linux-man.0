From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] arp.7: minor rewording
Date: Wed, 31 Aug 2011 23:14:00 +0900
Message-ID: <4E5E41A8.80600@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi.

man-pages version: latest git repository
why: field arp_pa is not a socket, but a struct sockaddr address.


diff --git a/man7/arp.7 b/man7/arp.7
--- a/man7/arp.7
+++ b/man7/arp.7
@@ -100,7 +100,7 @@ capability or an effective UID of 0.
.I arp_pa
must be an
.B AF_INET
-socket and
+address and
.I arp_ha
must have the same type as the device which is specified in
.IR arp_dev .


And more minor patches will follow.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
