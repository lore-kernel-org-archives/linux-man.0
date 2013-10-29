From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] erfc.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 29 Oct 2013 14:01:13 +0800
Message-ID: <1383026473-30216-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions erfc(), erfcf() and erfcl() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/erfc.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/erfc.3 b/man3/erfc.3
index 708a1ee..800794d 100644
--- a/man3/erfc.3
+++ b/man3/erfc.3
@@ -23,7 +23,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH ERFC 3  2010-09-20 "GNU" "Linux Programmer's Manual"
+.TH ERFC 3  2013-10-29 "GNU" "Linux Programmer's Manual"
 .SH NAME
 erfc, erfcf, erfcl \- complementary error function
 .SH SYNOPSIS
@@ -119,6 +119,14 @@ These functions do not set
 .IR errno .
 .\" FIXME . Is it intentional that these functions do not set errno?
 .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6785
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR erfc (),
+.BR erfcf (),
+and
+.BR erfcl ()
+functions are thread-safe.
 .SH CONFORMING TO
 C99, POSIX.1-2001.
 The variant returning
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
