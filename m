From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] lround.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 26 Aug 2013 15:21:10 +0800
Message-ID: <1377501670-4247-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions lround(), lroundf(), lroundl(), llround(),
llroundf() and llroundl() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/lround.3 | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/man3/lround.3 b/man3/lround.3
index 3708455..8998def 100644
--- a/man3/lround.3
+++ b/man3/lround.3
@@ -24,7 +24,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" %%%LICENSE_END
 .\"
-.TH LROUND 3  2010-09-20 "" "Linux Programmer's Manual"
+.TH LROUND 3  2013-08-26 "" "Linux Programmer's Manual"
 .SH NAME
 lround, lroundf, lroundl, llround, llroundf, llroundl \- round to
 nearest integer, away from zero
@@ -109,6 +109,17 @@ These functions do not set
 .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6797
 .SH VERSIONS
 These functions first appeared in glibc in version 2.1.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR lround (),
+.BR lroundf (),
+.BR lroundl (),
+.BR llround (),
+.BR llroundf (),
+and
+.BR llroundl ()
+functions are thread-safe.
 .SH CONFORMING TO
 C99, POSIX.1-2001.
 .SH SEE ALSO
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
