From: Ruben Kerkhof <ruben-pkfekA+zf0jEimEGZCN+oA@public.gmane.org>
Subject: [PATCH] readdir_r(3): fix reference to readdir(3)
Date: Sat, 27 Aug 2016 12:20:39 +0200
Message-ID: <20160827102039.15524-1-ruben@rubenkerkhof.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ruben Kerkhof <ruben-pkfekA+zf0jEimEGZCN+oA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/readdir_r.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/readdir_r.3 b/man3/readdir_r.3
index 45c67d0..7181857 100644
--- a/man3/readdir_r.3
+++ b/man3/readdir_r.3
@@ -62,7 +62,7 @@ and returns it in the caller-allocated buffer pointed to by
 For details of the
 .IR dirent
 structure, see
-.BR readir (3).
+.BR readdir (3).
 
 A pointer to the returned buffer is placed in
 .IR *result ;
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
