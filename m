From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] stdio_ext.3: Modify thread-safety information
Date: Wed, 4 Feb 2015 09:51:30 +0800
Message-ID: <1423014690-8475-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Change the thread safety information to be the same as glibc.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/stdio_ext.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/stdio_ext.3 b/man3/stdio_ext.3
index bdf6194..7c3754b 100644
--- a/man3/stdio_ext.3
+++ b/man3/stdio_ext.3
@@ -143,7 +143,7 @@ T{
 .br
 .BR __fpurge (),
 .BR __fsetlocking ()
-T}	Thread safety	MT-Unsafe
+T}	Thread safety	MT-Safe race:stream
 T{
 .BR __flbf (),
 .BR __freadable (),
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
