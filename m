From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] clearenv.3: ATTRIBUTES: Note function that is not thread-safe
Date: Thu, 18 Jun 2015 13:36:48 +0800
Message-ID: <1434605811-18306-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The marking matches glibc marking.
The marking of functions in glibc is:
- clearenv: MT-Unsafe const:env

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/clearenv.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/clearenv.3 b/man3/clearenv.3
index 7a3d57a..101fdef 100644
--- a/man3/clearenv.3
+++ b/man3/clearenv.3
@@ -56,6 +56,19 @@ value on failure.
 .\" Glibc info and the Watcom C library document "a nonzero value".
 .SH VERSIONS
 Available since glibc 2.0.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR clearenv ()
+T}	Thread safety	MT-Unsafe const:env
+.TE
+
 .SH CONFORMING TO
 Various UNIX variants (DG/UX, HP-UX, QNX, ...).
 POSIX.9 (bindings for FORTRAN77).
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
