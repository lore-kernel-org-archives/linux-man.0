From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] err.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 23 Apr 2015 12:51:41 +0800
Message-ID: <1429764710-8598-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The markings match glibc markings.
markings of functions in glibc are:
- err:    MT-Safe locale
- err:    MT-Safe locale
- errx:   MT-Safe locale
- warn:   MT-Safe locale
- warnx:  MT-Safe locale
- verr:   MT-Safe locale
- verrx:  MT-Safe locale
- vwarn:  MT-Safe locale
- vwarnx: MT-Safe locale

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/err.3 | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/man3/err.3 b/man3/err.3
index 783d60a..14eb6e5 100644
--- a/man3/err.3
+++ b/man3/err.3
@@ -106,6 +106,29 @@ and
 .BR verrx ()
 functions do not return, but exit with the value of the argument
 .IR eval .
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw17 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR err (),
+.BR errx (),
+.br
+.BR warn (),
+.BR warnx (),
+.br
+.BR verr (),
+.BR verrx (),
+.br
+.BR vwarn (),
+.BR vwarnx ()
+T}	Thread safety	MT-Safe locale
+.TE
+
 .SH CONFORMING TO
 These functions are nonstandard BSD extensions.
 .\" .SH HISTORY
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
