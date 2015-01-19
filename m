From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] drand48.3: Modify thread-safety information
Date: Mon, 19 Jan 2015 14:32:12 +0800
Message-ID: <1421649132-22952-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
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
 man3/drand48.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/drand48.3 b/man3/drand48.3
index adf4f06..bb0710d 100644
--- a/man3/drand48.3
+++ b/man3/drand48.3
@@ -262,7 +262,7 @@ T{
 .BR seed48 (),
 .BR lcong48 ()
 T}	Thread safety	T{
-MT-Unsafe
+MT-Unsafe race:drand48
 T}
 .TE
 .ad
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
