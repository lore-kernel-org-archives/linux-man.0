From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] localeconv.3: Add description of the function is not thread-safe
Date: Tue, 12 Mar 2013 18:43:20 +0800
Message-ID: <1363085000-6967-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function localeconv() returns a pointer to a structure which might be
overwritten by subsequent calls to localeconv() or by calls to setlocale(),
so it is not thread-safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/localeconv.3 | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/man3/localeconv.3 b/man3/localeconv.3
index 9a776f8..20f1942 100644
--- a/man3/localeconv.3
+++ b/man3/localeconv.3
@@ -21,7 +21,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" License.
 .\" Modified Sat Jul 24 19:01:20 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
-.TH LOCALECONV 3  1993-04-25 "GNU" "Linux Programmer's Manual"
+.TH LOCALECONV 3  2013-03-12 "GNU" "Linux Programmer's Manual"
 .SH NAME
 localeconv \- get numeric formatting information
 .SH SYNOPSIS
@@ -47,6 +47,12 @@ Programs may also use the functions
 and
 .BR strfmon (3),
 which behave according to the actual locale in use.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR localeconv ()
+function is not thread-safe, since it returns a pointer to a structure which
+might be overwritten by subsequent calls.
 .SH CONFORMING TO
 C89, C99.
 .SH BUGS
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
