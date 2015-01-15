From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] stdarg.3: Modify thread-safety information
Date: Thu, 15 Jan 2015 12:00:49 +0800
Message-ID: <1421294449-22289-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

As annotation in glibc manual is more detailed, change the 
thread-safety information to be the same as glibc manual.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/stdarg.3 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man3/stdarg.3 b/man3/stdarg.3
index 0adbff8..62dc1f5 100644
--- a/man3/stdarg.3
+++ b/man3/stdarg.3
@@ -236,10 +236,12 @@ l l l.
 Interface	Attribute	Value
 T{
 .BR va_start (),
-.BR va_arg (),
 .BR va_end (),
 .BR va_copy ()
 T}	Thread safety	MT-Safe
+T{
+.BR va_arg ()
+T}	Thread safety	MT-Safe race:ap
 .TE
 .SH CONFORMING TO
 The
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
