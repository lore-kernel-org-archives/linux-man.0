From: Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] iconv.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 11 Jun 2014 15:14:50 +0800
Message-ID: <1402470890.20654.12.camel@fedora>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "mtk.manpages" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: aoliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, carlos <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?=E5=BD=AD=E6=B5=B7=E6=B6=9B?= <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The function iconv() is thread safe.

Reviewed-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Signed-off-by: Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/iconv.3 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man3/iconv.3 b/man3/iconv.3
index 39455d2..365ee8a 100644
--- a/man3/iconv.3
+++ b/man3/iconv.3
@@ -139,6 +139,11 @@ An invalid multibyte sequence has been encountered in the input.
 An incomplete multibyte sequence has been encountered in the input.
 .SH VERSIONS
 This function is available in glibc since version 2.1.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR iconv ()
+function is thread-safe.
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
