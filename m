From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] exit.3: ATTRIBUTES: Note function that is not thread-safe
Date: Fri, 3 May 2013 17:18:14 +0800
Message-ID: <1367572694-21931-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function exit() is not thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/exit.3 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man3/exit.3 b/man3/exit.3
index 51163e4..5e607b1 100644
--- a/man3/exit.3
+++ b/man3/exit.3
@@ -87,6 +87,11 @@ termination, respectively.
 The
 .BR exit ()
 function does not return.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR exit ()
+uses a global variable that is not protected, so it is not thread-safe.
 .SH CONFORMING TO
 SVr4, 4.3BSD, POSIX.1-2001, C89, C99.
 .SH NOTES
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
