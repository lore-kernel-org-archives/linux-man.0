From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getdtablesize.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 11 Jun 2014 17:15:44 +0800
Message-ID: <1402478144-25758-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function getdtablesize() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getdtablesize.3 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man3/getdtablesize.3 b/man3/getdtablesize.3
index ba5c221..f42a15b 100644
--- a/man3/getdtablesize.3
+++ b/man3/getdtablesize.3
@@ -66,6 +66,11 @@ On Linux,
 can return any of the errors described for
 .BR getrlimit (2);
 see NOTES below.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR getdtablesize ()
+function is thread-safe.
 .SH CONFORMING TO
 SVr4, 4.4BSD (the
 .BR getdtablesize ()
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
