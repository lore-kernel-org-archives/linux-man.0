From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] catgets.3: wfix phrasing
Date: Mon, 9 Jun 2014 13:09:36 +0800
Message-ID: <1402290576-19793-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/catgets.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/catgets.3 b/man3/catgets.3
index 3101300..4171129 100644
--- a/man3/catgets.3
+++ b/man3/catgets.3
@@ -74,7 +74,7 @@ function is thread-safe.
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-These functions are available only in libc.so.4.4.4c and above.
+The function is available only in libc.so.4.4.4c and above.
 The Jan 1987 X/Open Portability Guide specifies a more subtle
 error return:
 .I message
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
