From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] packet.7: ffix
Date: Thu, 30 Jan 2014 18:46:20 -0400
Message-ID: <1391121980-11427-1-git-send-email-taffit@debian.org>
References: <1391098082-22061-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391098082-22061-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/packet.7 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man7/packet.7 b/man7/packet.7
index ed15631..1d3f222 100644
--- a/man7/packet.7
+++ b/man7/packet.7
@@ -107,7 +107,9 @@ flag is passed to
 the real length of the packet on the wire is always returned,
 even when it is longer than the buffer.
 .SS Address types
-The sockaddr_ll is a device independent physical layer address.
+The
+.I sockaddr_ll
+is a device independent physical layer address.
 
 .in +4n
 .nf
-- 
1.9.rc1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
