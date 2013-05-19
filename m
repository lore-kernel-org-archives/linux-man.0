From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] resolv.conf.5: explain how to set empty domain
Date: Sun, 19 May 2013 16:38:43 +0200
Message-ID: <1368974323-2764-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

See http://bugs.debian.org/463575
---
 man5/resolv.conf.5 |    1 +
 1 file changed, 1 insertion(+)

diff --git a/man5/resolv.conf.5 b/man5/resolv.conf.5
index 716b345..9f2f3f9 100644
--- a/man5/resolv.conf.5
+++ b/man5/resolv.conf.5
@@ -63,6 +63,7 @@ until a maximum number of retries are made.)
 \fBdomain\fP Local domain name.
 Most queries for names within this domain can use short names
 relative to the local domain.
+If set to \(aq.\(aq, the root domain is considered.
 If no \fBdomain\fP entry is present, the domain is determined
 from the local hostname returned by
 .BR gethostname (2);
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
