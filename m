From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] byteorder.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 8 Apr 2014 09:05:39 +0800
Message-ID: <1396919139-10710-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions htonl(), htons(), ntohl() and ntohs() are thread
safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/byteorder.3 | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/man3/byteorder.3 b/man3/byteorder.3
index 0781fd5..930755a 100644
--- a/man3/byteorder.3
+++ b/man3/byteorder.3
@@ -29,7 +29,7 @@
 .\" Modified Sat Jul 24 21:29:05 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .\" Modified Thu Jul 26 14:06:20 2001 by Andries Brouwer (aeb-rh8NL+sEX9E@public.gmane.org)
 .\"
-.TH BYTEORDER 3  2009-01-15 "GNU" "Linux Programmer's Manual"
+.TH BYTEORDER 3  2014-04-08 "GNU" "Linux Programmer's Manual"
 .SH NAME
 htonl, htons, ntohl, ntohs \- convert values between host and network
 byte order
@@ -73,6 +73,15 @@ from network byte order to host byte order.
 On the i386 the host byte order is Least Significant Byte first,
 whereas the network byte order, as used on the Internet, is Most
 Significant Byte first.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR htonl (),
+.BR htons (),
+.BR ntohl (),
+and
+.BR ntohs ()
+functions are thread-safe.
 .SH CONFORMING TO
 POSIX.1-2001.
 
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
