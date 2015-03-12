From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] iconv_open.3: ATTRIBUTES: Note function that is thread-safe
Date: Thu, 12 Mar 2015 10:55:55 +0800
Message-ID: <1426128955-1118-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The marking matches glibc marking.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/iconv_open.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/iconv_open.3 b/man3/iconv_open.3
index eac79ad..0d709a7 100644
--- a/man3/iconv_open.3
+++ b/man3/iconv_open.3
@@ -102,6 +102,19 @@ is not supported by the
 implementation.
 .SH VERSIONS
 This function is available in glibc since version 2.1.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR iconv_open ()
+T}	Thread safety	MT-Safe locale
+.TE
+
 .SH CONFORMING TO
 UNIX98, POSIX.1-2001.
 .SH SEE ALSO
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
