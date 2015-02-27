From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] strverscmp.3: Add FIXME
Date: Fri, 27 Feb 2015 10:01:25 +0800
Message-ID: <1425002485-31808-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/strverscmp.3 | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/man3/strverscmp.3 b/man3/strverscmp.3
index 241065d..ec6449f 100644
--- a/man3/strverscmp.3
+++ b/man3/strverscmp.3
@@ -97,6 +97,13 @@ l l l.
 Interface	Attribute	Value
 T{
 .BR strverscmp ()
+.\" FIXME: the following marking is different from which in glibc manual.
+.\" strverscmp: MT-Safe locale
+.\" glibc manual says strverscmp should have marking locale because it calls
+.\" isdigit() multiple times and isdigit() uses locale variable.
+.\" But isdigit() has two implementations. With different compiling conditions,
+.\" we may call isdigit() in macro, then strverscmp() should not have locale
+.\" problem.
 T}	Thread safety	MT-Safe
 .TE
 .SH CONFORMING TO
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
