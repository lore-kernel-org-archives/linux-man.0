From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 1/3] syscalls.2: tfix
Date: Thu, 30 Jun 2016 13:25:16 +0200
Message-ID: <1467285918-6408-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/syscalls.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/syscalls.2 b/man2/syscalls.2
index 3ebb916..6610631 100644
--- a/man2/syscalls.2
+++ b/man2/syscalls.2
@@ -818,7 +818,7 @@ on i386 one finds
 .IR old_select ()
 and
 .IR old_mmap ()
-(routines that use a pointer to a
+(routines that use a pointer to an
 argument block) instead.
 These days passing five arguments
 is not a problem any more, and there is a
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
