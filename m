From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] utimensat.2: wfix
Date: Wed, 8 Nov 2017 16:28:42 +0900
Message-ID: <f3d2044a-140c-1fb2-e398-0195feaa6ae5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-GB
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The name of the second argument is "pathname".

---
 man2/utimensat.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/utimensat.2 b/man2/utimensat.2
index ec03463a1..d61b43e96 100644
--- a/man2/utimensat.2
+++ b/man2/utimensat.2
@@ -483,7 +483,7 @@ utimensat(fd, NULL, times, 0);
 Note, however, that the glibc wrapper for
 .BR utimensat ()
 disallows passing NULL as the value for
-.IR file :
+.IR pathname :
 the wrapper function returns the error
 .IR EINVAL
 in this case.
-- 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
