From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] re_comp.3: ATTRIBUTES: Note functions that are not thread-safe
Date: Mon, 20 May 2013 13:36:52 +0800
Message-ID: <1369028212-12123-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions re_comp() and re_exec() are not thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/re_comp.3 | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/man3/re_comp.3 b/man3/re_comp.3
index b1c3295..ca4ef64 100644
--- a/man3/re_comp.3
+++ b/man3/re_comp.3
@@ -63,6 +63,13 @@ otherwise it returns a pointer to an appropriate error message.
 
 .BR re_exec ()
 returns 1 for a successful match, zero for failure.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR re_comp ()
+and
+.BR re_exec ()
+functions are not thread-safe.
 .SH CONFORMING TO
 4.3BSD.
 .SH NOTES
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
