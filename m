From: Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] gets: note that glibc 2.16 has removed the definition of gets()
Date: Fri, 12 Jul 2013 09:42:48 -0700
Message-ID: <1373647368-12099-1-git-send-email-shawnlandden@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/gets.3 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man3/gets.3 b/man3/gets.3
index 85747ef..bd65b9c 100644
--- a/man3/gets.3
+++ b/man3/gets.3
@@ -162,7 +162,9 @@ it is extremely dangerous to use.
 It has been used to break computer security.
 Use
 .BR fgets ()
-instead.
+instead. glibc 2.16 does not define
+.BR gets ()
+.
 .PP
 It is not advisable to mix calls to input functions from the
 .I stdio
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
