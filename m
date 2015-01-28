From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] clog10.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 28 Jan 2015 14:09:34 +0800
Message-ID: <1422425374-20884-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The functions clog10(), clog10f() and clog10l() in glibc are thread safe.
It's markings match glibc markings.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/clog10.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/clog10.3 b/man3/clog10.3
index 25b1655..35214a6 100644
--- a/man3/clog10.3
+++ b/man3/clog10.3
@@ -34,6 +34,20 @@ Note that
 close to zero will cause an overflow.
 .SH VERSIONS
 These functions first appeared in glibc in version 2.1.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw30 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR clog10 (),
+.BR clog10f (),
+.BR clog10l ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 This function is a GNU extension.
 It is reserved for future use in C99.
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
