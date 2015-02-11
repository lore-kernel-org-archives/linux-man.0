From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] fopencookie.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 11 Feb 2015 14:05:53 +0800
Message-ID: <1423634753-23153-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
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
 man3/fopencookie.3 | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/man3/fopencookie.3 b/man3/fopencookie.3
index 3f83196..fa1dc96 100644
--- a/man3/fopencookie.3
+++ b/man3/fopencookie.3
@@ -242,6 +242,18 @@ returns a pointer to the new stream.
 On error, NULL is returned.
 .\" .SH ERRORS
 .\" It's not clear if errno ever gets set...
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR fopencookie ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 This function is a nonstandard GNU extension.
 .SH EXAMPLE
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
