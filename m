From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] opendir.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 11 Feb 2015 14:01:09 +0800
Message-ID: <1423634469-22922-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The markings match glibc markings.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/opendir.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/opendir.3 b/man3/opendir.3
index d5bf3e3..575da78 100644
--- a/man3/opendir.3
+++ b/man3/opendir.3
@@ -115,6 +115,19 @@ Insufficient memory to complete the operation.
 .SH VERSIONS
 .BR fdopendir ()
 is available in glibc since version 2.4.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw22 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR opendir (),
+.BR fdopendir ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 .BR opendir ()
 is present on SVr4, 4.3BSD, and specified in POSIX.1-2001.
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
