From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] strnlen.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 25 Feb 2014 16:28:38 +0800
Message-ID: <1393316918-10889-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function strnlen() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/strnlen.3 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man3/strnlen.3 b/man3/strnlen.3
index 7548f59..b994743 100644
--- a/man3/strnlen.3
+++ b/man3/strnlen.3
@@ -10,7 +10,7 @@
 .\" References consulted:
 .\"   GNU glibc-2 source code and manual
 .\"
-.TH STRNLEN 3  2012-05-10 "GNU" "Linux Programmer's Manual"
+.TH STRNLEN 3  2014-02-25 "GNU" "Linux Programmer's Manual"
 .SH NAME
 strnlen \- determine the length of a fixed-size string
 .SH SYNOPSIS
@@ -68,6 +68,11 @@ if there is no null byte (\(aq\\0\(aq) among the first
 .I maxlen
 bytes pointed to by
 .IR s .
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR strnlen ()
+function is thread-safe.
 .SH CONFORMING TO
 POSIX.1-2008.
 .SH SEE ALSO
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
