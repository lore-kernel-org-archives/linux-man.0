From: Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] malloc_usable_size.3: ATTRIBUTES: Note function that is
 thread-safe
Date: Tue, 10 Jun 2014 16:46:08 +0800
Message-ID: <1402389968.1169.9.camel@fedora>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "mtk.manpages" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: aoliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, carlos <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The function malloc_usable_size() is thread safe.

Signed-off-by: Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/malloc_usable_size.3 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man3/malloc_usable_size.3 b/man3/malloc_usable_size.3
index 5b06a65..e3313bc 100644
--- a/man3/malloc_usable_size.3
+++ b/man3/malloc_usable_size.3
@@ -45,6 +45,11 @@ the block of allocated memory pointed to by
 If
 .I ptr
 is NULL, 0 is returned.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR malloc_usable_size ()
+function is thread-safe.
 .SH CONFORMING TO
 This function is a GNU extension.
 .SH NOTES
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
