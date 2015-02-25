From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getpwent.3: Add explanation for pwent
Date: Wed, 25 Feb 2015 13:17:24 +0800
Message-ID: <1424841444-18901-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getpwent.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/getpwent.3 b/man3/getpwent.3
index abcaec6..136b5ee 100644
--- a/man3/getpwent.3
+++ b/man3/getpwent.3
@@ -172,6 +172,19 @@ T{
 .BR endpwent ()
 T}	Thread safety	MT-Unsafe race:pwent locale
 .TE
+
+[[
+In the above table,
+.I pwent
+in
+.I race:pwent
+signifies that if any of the functions
+.BR setpwent (),
+.BR getpwent (),
+or
+.BR endpwent ()
+are used in parallel in different threads of a program, then data races could occur.
+]]
 .SH CONFORMING TO
 SVr4, 4.3BSD, POSIX.1-2001.
 The
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
