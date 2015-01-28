From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] cosh.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 28 Jan 2015 14:10:20 +0800
Message-ID: <1422425420-21012-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The functions cosh(), coshf() and coshl() in glibc are thread safe.
It's markings match glibc markings.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/cosh.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/cosh.3 b/man3/cosh.3
index c71b75c..912b9b3 100644
--- a/man3/cosh.3
+++ b/man3/cosh.3
@@ -116,6 +116,20 @@ is set to
 An overflow floating-point exception
 .RB ( FE_OVERFLOW )
 is raised.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw24 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR cosh (),
+.BR coshf (),
+.BR coshl ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 C99, POSIX.1-2001.
 The variant returning
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
