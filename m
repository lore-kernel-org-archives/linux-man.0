From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] finite.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 22 Jul 2013 14:58:53 +0800
Message-ID: <1374476333-7199-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions finite(), finitef(), finitel(), isinf(), isinff(),
isinfl(), isnan(), isnanf() and isnanl() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/finite.3 | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/man3/finite.3 b/man3/finite.3
index a308fd2..72b8646 100644
--- a/man3/finite.3
+++ b/man3/finite.3
@@ -22,7 +22,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH FINITE 3  2008-08-05 "" "Linux Programmer's Manual"
+.TH FINITE 3  2013-07-22 "" "Linux Programmer's Manual"
 .SH NAME
 finite, finitef, finitel, isinf, isinff, isinfl, isnan, isnanf, isnanl \-
 BSD floating-point classification functions
@@ -109,6 +109,20 @@ functions return 1 if
 is positive infinity, \-1 if
 .I x
 is negative infinity, and 0 otherwise.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR finite (),
+.BR finitef (),
+.BR finitel (),
+.BR isinf (),
+.BR isinff (),
+.BR isinfl (),
+.BR isnan (),
+.BR isnanf (),
+and
+.BR isnanl ()
+functions are thread-safe.
 .SH NOTES
 Note that these functions are obsolete.
 C99 defines macros
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
