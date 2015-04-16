From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] significand.3:ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 16 Apr 2015 12:49:47 +0800
Message-ID: <1429159787-31605-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The marking matches glibc marking.
markings of functions in glibc are:
- significand: MT-Safe
- significandf: MT-Safe
- significandl: MT-Safe

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/significand.3 | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/man3/significand.3 b/man3/significand.3
index ae7ab03..2798ec6 100644
--- a/man3/significand.3
+++ b/man3/significand.3
@@ -46,6 +46,23 @@ scalb(x, (double) \-ilogb(x))
 .PP
 This function exists mainly for use in certain standardized tests
 for IEEE 754 conformance.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR significand (),
+.br
+.BR significandf (),
+.br
+.BR significandl ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 These functions are nonstandard; the
 .I double
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
