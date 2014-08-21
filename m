From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] iconv.1: document gconv path for debian-based os
Date: Thu, 21 Aug 2014 22:14:52 +0200
Message-ID: <1408652092-18400-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man1/iconv.1 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/man1/iconv.1 b/man1/iconv.1
index 54e2655..fd14f0a 100644
--- a/man1/iconv.1
+++ b/man1/iconv.1
@@ -171,6 +171,9 @@ directories.
 .I /usr/lib/gconv
 Usual default gconv module path.
 .TP
+.I /usr/lib/$(dpkg-architecture -qDEB_HOST_MULTIARCH)/gconv
+Default gconv module path on recent systems based on Debian.
+.TP
 .I /usr/lib/gconv/gconv-modules
 Usual system default gconv module configuration file.
 .TP
-- 
2.1.0.rc1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
