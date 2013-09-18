From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] des_crypt.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 18 Sep 2013 14:59:05 +0800
Message-ID: <1379487545-27711-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions ecb_crypt(), cbc_crypt() and des_setparity() are
thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/des_crypt.3 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/man3/des_crypt.3 b/man3/des_crypt.3
index 2694a58..f673424 100644
--- a/man3/des_crypt.3
+++ b/man3/des_crypt.3
@@ -11,7 +11,7 @@
 .\" can be distributed under GPL.
 .\" %%%LICENSE_END
 .\"
-.TH DES_CRYPT 3  2007-05-18 "" "Linux Programmer's Manual"
+.TH DES_CRYPT 3  2013-09-18 "" "Linux Programmer's Manual"
 .SH NAME
 des_crypt, ecb_crypt, cbc_crypt, des_setparity, DES_FAILED \- fast
 DES encryption
@@ -131,6 +131,14 @@ is false only for the first two statuses.
 .SH VERSIONS
 These routines are present in libc 4.6.27 and later, and in
 glibc 2.1 and later.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR ecb_crypt (),
+.BR cbc_crypt (),
+and
+.BR des_setparity ()
+functions are thread-safe.
 .SH CONFORMING TO
 4.3BSD.
 Not in POSIX.1-2001.
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
