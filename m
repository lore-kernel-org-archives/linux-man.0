From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] log1p.3: ATTRIBUTES: Note functions that are thread-safe
Date: Fri, 28 Feb 2014 13:59:45 +0800
Message-ID: <1393567185-32369-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions log1p(), log1pf() and log1pl() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/log1p.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/log1p.3 b/man3/log1p.3
index 0d114b5..2884512 100644
--- a/man3/log1p.3
+++ b/man3/log1p.3
@@ -26,7 +26,7 @@
 .\"
 .\" Modified 2002-07-27 by Walter Harms
 .\" 	(walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
-.TH LOG1P 3   2010-09-20 "" "Linux Programmer's Manual"
+.TH LOG1P 3   2014-02-28 "" "Linux Programmer's Manual"
 .SH NAME
 log1p, log1pf, log1pl \-  logarithm of 1 plus argument
 .SH SYNOPSIS
@@ -139,6 +139,14 @@ These functions do not set
 .\" FIXME . Is it intentional that these functions do not set errno?
 .\" log(), log2(), log10() do set errno
 .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6792
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR log1p (),
+.BR log1pf (),
+and
+.BR log1pl ()
+functions are thread-safe.
 .SH CONFORMING TO
 C99, POSIX.1-2001.
 .\" BSD
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
