From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] mbrlen.3: ATTRIBUTES: Note function that is thread safe with exceptions
Date: Wed, 29 May 2013 17:35:11 +0800
Message-ID: <1369820111-7081-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function mbrlen() is thread safe with exceptions.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/mbrlen.3 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/man3/mbrlen.3 b/man3/mbrlen.3
index da50230..882ffdb 100644
--- a/man3/mbrlen.3
+++ b/man3/mbrlen.3
@@ -66,6 +66,12 @@ and sets \fIerrno\fP to \fBEILSEQ\fP, if an invalid multibyte sequence was
 encountered.
 It returns \fI(size_t)\ \-2\fP if it couldn't parse a complete multibyte
 character, meaning that \fIn\fP should be increased.
+.SH ATTRIBUTES
+.SS Multithreading(see pthreads(7))
+The
+.BR mbrlen ()
+function is thread-safe with exceptions.
+It is not thread-safe if called with a NULL \fIps\fP parameter.
 .SH CONFORMING TO
 C99.
 .SH NOTES
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
