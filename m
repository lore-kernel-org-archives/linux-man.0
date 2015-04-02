From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] csqrt.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 2 Apr 2015 09:40:50 +0800
Message-ID: <1427938850-27733-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
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
 man3/csqrt.3 | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/man3/csqrt.3 b/man3/csqrt.3
index 859eae6..3e34889 100644
--- a/man3/csqrt.3
+++ b/man3/csqrt.3
@@ -26,6 +26,21 @@ with a branch cut along the negative real axis.
 real number.)
 .SH VERSIONS
 These functions first appeared in glibc in version 2.1.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw27 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR csqrt (),
+.BR csqrtf (),
+.BR csqrtl ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 C99.
 .SH SEE ALSO
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
