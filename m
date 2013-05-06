From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] crypt.3: ATTRIBUTES: Note function that is not thread-safe
Date: Mon, 6 May 2013 16:03:11 +0800
Message-ID: <1367827391-3564-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function crypt() is not thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/crypt.3 | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/man3/crypt.3 b/man3/crypt.3
index ca52b92..ed02440 100644
--- a/man3/crypt.3
+++ b/man3/crypt.3
@@ -160,6 +160,15 @@ function was not implemented, probably because of U.S.A. export restrictions.
 .\" .PP
 .\" Making encrypted data computed using crypt() publicly available has
 .\" to be considered insecure for the given reasons.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR crypt ()
+function is not thread-safe.
+.LP
+The
+.BR crypt_r ()
+function is thread-safe.
 .SH CONFORMING TO
 .BR crypt ():
 SVr4, 4.3BSD, POSIX.1-2001.
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
