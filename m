From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] nan.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 4 Feb 2015 14:45:06 +0800
Message-ID: <1423032306-12529-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
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
 man3/nan.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/nan.3 b/man3/nan.3
index 6c9deb6..da04cba 100644
--- a/man3/nan.3
+++ b/man3/nan.3
@@ -72,6 +72,20 @@ selects one.
 On other systems it may do nothing.
 .SH VERSIONS
 These functions first appeared in glibc in version 2.1.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR nan (),
+.BR nanf (),
+.BR nanl ()
+T}	Thread safety	MT-Safe locale
+.TE
 .SH CONFORMING TO
 C99, POSIX.1-2001.
 See also IEC 559 and the appendix with
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
