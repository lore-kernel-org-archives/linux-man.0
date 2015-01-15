From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getdate.3: Modify thread-safety information
Date: Thu, 15 Jan 2015 10:02:39 +0800
Message-ID: <1421287359-13158-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
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
 man3/getdate.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/getdate.3 b/man3/getdate.3
index 11db129..0c9fb32 100644
--- a/man3/getdate.3
+++ b/man3/getdate.3
@@ -203,10 +203,10 @@ l l l.
 Interface	Attribute	Value
 T{
 .BR getdate ()
-T}	Thread safety	MT-Unsafe
+T}	Thread safety	MT-Unsafe race:getdate env locale
 T{
 .BR getdate_r ()
-T}	Thread safety	MT-Safe
+T}	Thread safety	MT-Safe env locale
 .TE
 .SH CONFORMING TO
 POSIX.1-2001.
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
