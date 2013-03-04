From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] resolver.3: RES_DEBUG not accessible with default build
Date: Mon,  4 Mar 2013 23:45:19 +0100
Message-ID: <1362437119-28677-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

See http://bugs.debian.org/692136

For the record, it seems this has been the case in glibc since a while
committer	Roland McGrath <roland-mXXj517/zsQ@public.gmane.org>
Sat, 18 Feb 1995 01:27:10 +0000 (01:27 +0000)
commit	28f540f45bbacd939bfd07f213bcad2bf730b1bf
http://repo.or.cz/w/glibc.git/blob/28f540f45bbacd939bfd07f213bcad2bf730b1bf:/resolv/res_init.c
---
 man3/resolver.3 |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man3/resolver.3 b/man3/resolver.3
index af532f7..390d51b 100644
--- a/man3/resolver.3
+++ b/man3/resolver.3
@@ -184,7 +184,8 @@ True if
 has been called.
 .TP
 .B RES_DEBUG
-Print debugging messages.
+Print debugging messages.  This option needs glibc to be build with debugging 
+enabled, which is not the default.
 .TP
 .B RES_AAONLY
 Accept authoritative answers only.
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
