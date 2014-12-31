From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] exp10.3:ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 31 Dec 2014 14:25:44 +0800
Message-ID: <1420007144-9624-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The function exp10(), exp10f() and exp10l() are thread safe.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/exp10.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/exp10.3 b/man3/exp10.3
index d1dbb36..6ddfeac 100644
--- a/man3/exp10.3
+++ b/man3/exp10.3
@@ -72,6 +72,20 @@ For a discussion of the errors that can occur for these functions, see
 .BR exp (3).
 .SH VERSIONS
 These functions first appeared in glibc in version 2.1.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw28 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR exp10 (),
+.BR exp10f (),
+.BR exp10l ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 These functions are GNU extensions.
 .SH BUGS
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
