From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] system.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 9 Jun 2014 13:29:58 +0800
Message-ID: <1402291798-21368-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The function system() is thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/system.3 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man3/system.3 b/man3/system.3
index 1a2e678..bf1d764 100644
--- a/man3/system.3
+++ b/man3/system.3
@@ -107,6 +107,11 @@ and so on).
 .PP
 .BR system ()
 does not affect the wait status of any other children.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR system ()
+function is thread-safe.
 .SH CONFORMING TO
 C89, C99, POSIX.1-2001.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
