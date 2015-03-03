From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] hypot.3:ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 3 Mar 2015 15:52:20 +0800
Message-ID: <1425369140-18179-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
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
 man3/hypot.3 | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/man3/hypot.3 b/man3/hypot.3
index 77488cc..5c67c4e 100644
--- a/man3/hypot.3
+++ b/man3/hypot.3
@@ -155,6 +155,21 @@ for this case.
 .\" FIXME . Is it intentional that these functions do not set errno?
 .\" They do set errno for the overflow case.
 .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6795
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw27 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR hypot (),
+.BR hypotf (),
+.BR hypotl ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 C99, POSIX.1-2001.
 The variant returning
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
