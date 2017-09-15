From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 4/5] fallocate.2: tfix
Date: Fri, 15 Sep 2017 18:41:37 +0200
Message-ID: <20170915164138.2621-4-jwilk@jwilk.net>
References: <20170915164138.2621-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170915164138.2621-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/fallocate.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/fallocate.2 b/man2/fallocate.2
index 9314a128c..d3d310dee 100644
--- a/man2/fallocate.2
+++ b/man2/fallocate.2
@@ -382,7 +382,7 @@ or
 but the file referred to by
 .I fd
 is not a regular file.
-.\" There was a inconsistency in 3.15-rc1, that should be resolved so that all
+.\" There was an inconsistency in 3.15-rc1, that should be resolved so that all
 .\" filesystems use this error for this case. (Tytso says ex4 will change.)
 .\" http://thread.gmane.org/gmane.comp.file-systems.xfs.general/60485/focus=5521
 .\" From: Michael Kerrisk (man-pages <mtk.manpages@...>
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
