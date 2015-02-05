From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] strxfrm.3: ATTRIBUTES: Note function that is thread-safe
Date: Thu, 5 Feb 2015 11:33:30 +0800
Message-ID: <1423107210-26431-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
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
 man3/strxfrm.3 | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/man3/strxfrm.3 b/man3/strxfrm.3
index 116a534..959f9a2 100644
--- a/man3/strxfrm.3
+++ b/man3/strxfrm.3
@@ -73,6 +73,18 @@ or more, the
 contents of
 .I dest
 are indeterminate.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR strxfrm ()
+T}	Thread safety	MT-Safe locale
+.TE
 .SH CONFORMING TO
 SVr4, 4.3BSD, C89, C99.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
