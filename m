From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] toascii.3: wfix
Date: Mon, 23 Dec 2013 18:05:04 +0800
Message-ID: <1387793104-28580-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/toascii.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/toascii.3 b/man3/toascii.3
index e632cf5..ed59ec9 100644
--- a/man3/toascii.3
+++ b/man3/toascii.3
@@ -61,7 +61,7 @@ SVr4, BSD, POSIX.1-2001.
 POSIX.1-2008 marks
 .BR toascii ()
 as obsolete,
-noting that it cannot be use portably in a localized application.
+noting that it cannot be used portably in a localized application.
 .SH BUGS
 Many people will be unhappy if you use this function.
 This function will convert accented letters into random characters.
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
