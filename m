From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] fcloseall.3: ATTRIBUTES: Note function that is not thread-safe
Date: Wed, 15 May 2013 10:26:44 +0800
Message-ID: <1368584804-8358-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function fcloseall() is not thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/fcloseall.3 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man3/fcloseall.3 b/man3/fcloseall.3
index 001bd99..6c41ceb 100644
--- a/man3/fcloseall.3
+++ b/man3/fcloseall.3
@@ -52,6 +52,11 @@ This function returns 0 if all files were successfully closed;
 on error,
 .B EOF
 is returned.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR fcloseall ()
+does not lock the streams, so it is not thread-safe.
 .SH CONFORMING TO
 This function is a GNU extension.
 .SH SEE ALSO
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
