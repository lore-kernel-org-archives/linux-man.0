From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 2/5] fcntl.2: tfix
Date: Fri, 15 Sep 2017 18:41:35 +0200
Message-ID: <20170915164138.2621-2-jwilk@jwilk.net>
References: <20170915164138.2621-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170915164138.2621-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/fcntl.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/fcntl.2 b/man2/fcntl.2
index 46159ea51..8b803a0d0 100644
--- a/man2/fcntl.2
+++ b/man2/fcntl.2
@@ -1500,7 +1500,7 @@ expected lifetime of writes on a given inode or
 via a particular open file description.
 (See
 .BR open (2)
-for an explanation of open file desriptions.)
+for an explanation of open file descriptions.)
 In this context, the term "write lifetime" means
 the expected time the data will live on media, before
 being overwritten or erased.
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
