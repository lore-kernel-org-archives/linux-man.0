From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] nextafter.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 2 Sep 2013 11:20:58 +0800
Message-ID: <1378092058-3167-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions nextafter(), nextafterf(), nextafterl(),
nexttoward(), nexttowardf() and nexttowardl() are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/nextafter.3 | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/man3/nextafter.3 b/man3/nextafter.3
index 7619cc4..69289d8 100644
--- a/man3/nextafter.3
+++ b/man3/nextafter.3
@@ -8,7 +8,7 @@
 .\"
 .\" Based on glibc infopages
 .\"
-.TH NEXTAFTER 3 2010-09-20 "GNU" "Linux Programmer's Manual"
+.TH NEXTAFTER 3 2013-09-02 "GNU" "Linux Programmer's Manual"
 .SH NAME
 nextafter, nextafterf, nextafterl, nexttoward, nexttowardf, nexttowardl \-
 floating-point number manipulation
@@ -170,6 +170,17 @@ These functions do not set
 .IR errno .
 .\" FIXME . Is it intentional that these functions do not set errno?
 .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6799
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR nextafter (),
+.BR nextafterf (),
+.BR nextafterl (),
+.BR nexttoward (),
+.BR nexttowardf (),
+and
+.BR nexttowardl ()
+functions are thread-safe.
 .SH CONFORMING TO
 C99, POSIX.1-2001.
 This function is defined in IEC 559 (and the appendix with
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
