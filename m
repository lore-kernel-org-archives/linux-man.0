From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] localeconv.3: Add description of the function is not thread-safe
Date: Thu, 23 Dec 2010 17:10:29 +0800
Message-ID: <4D131205.5050403@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

The function "localeconv" returns a pointer to a structure which might be
overwritten by subsequent calls to `localeconv' or by calls to `setlocale',
so it is not thread-safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/localeconv.3 |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/man3/localeconv.3 b/man3/localeconv.3
index 7b6a1da..86b2624 100644
--- a/man3/localeconv.3
+++ b/man3/localeconv.3
@@ -21,7 +21,7 @@
 .\" the source, must acknowledge the copyright and authors of this work.
 .\" License.
 .\" Modified Sat Jul 24 19:01:20 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
-.TH LOCALECONV 3  1993-04-25 "GNU" "Linux Programmer's Manual"
+.TH LOCALECONV 3  2010-12-23 "GNU" "Linux Programmer's Manual"
 .SH NAME
 localeconv \- get numeric formatting information
 .SH SYNOPSIS
@@ -47,6 +47,13 @@ Programs may also use the functions
 and
 .BR strfmon (3),
 which behave according to the actual locale in use.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR localeconv ()
+function is not thread-safe, since it returns a pointer to a structure which
+might be overwritten by subsequent calls to `localeconv' or by calls to
+`setlocale'.
 .SH "CONFORMING TO"
 C89, C99.
 .SH BUGS
-- 
1.7.0.1


-- 
Best Regards,
Peng Haitao

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
