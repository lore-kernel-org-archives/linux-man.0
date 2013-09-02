From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] nextafter.3: tfix
Date: Mon, 2 Sep 2013 11:31:02 +0800
Message-ID: <1378092662-4207-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/nextafter.3 | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/man3/nextafter.3 b/man3/nextafter.3
index 69289d8..5548908 100644
--- a/man3/nextafter.3
+++ b/man3/nextafter.3
@@ -69,7 +69,10 @@ or
 .ad b
 .SH DESCRIPTION
 The
-.BR nextafter ()
+.BR nextafter (),
+.BR nextafterf (),
+and
+.BR nextafterl ()
 functions return the next representable floating-point value following
 .I x
 in the direction of
@@ -89,8 +92,11 @@ the functions return
 .IR y .
 
 The
-.BR nexttoward ()
-functions do the same as the
+.BR nexttoward (),
+.BR nexttowardf (),
+and
+.BR nexttowardl ()
+functions do the same as the corresponding
 .BR nextafter ()
 functions, except that they have a
 .I "long double"
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
