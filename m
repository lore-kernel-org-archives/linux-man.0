From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] ctermid.3: ATTRIBUTES: Note function that is thread safe with exceptions
Date: Wed, 26 Jun 2013 16:19:30 +0800
Message-ID: <1372234770-12994-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function ctermid() is thread safe with exceptions.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/ctermid.3 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/man3/ctermid.3 b/man3/ctermid.3
index 39acbec..f09c072 100644
--- a/man3/ctermid.3
+++ b/man3/ctermid.3
@@ -58,6 +58,12 @@ The symbolic constant
 is the maximum number of characters in the returned pathname.
 .SH RETURN VALUE
 The pointer to the pathname.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR ctermid ()
+function is thread-safe with exceptions.
+It is not thread-safe if called with a NULL parameter.
 .SH CONFORMING TO
 Svr4, POSIX.1-2001.
 .SH BUGS
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
