From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getgrent.3: Add explanation for grent
Date: Wed, 25 Feb 2015 13:17:12 +0800
Message-ID: <1424841432-18853-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getgrent.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/getgrent.3 b/man3/getgrent.3
index 7a39198..00d90ea 100644
--- a/man3/getgrent.3
+++ b/man3/getgrent.3
@@ -183,6 +183,19 @@ T{
 .BR endgrent ()
 T}	Thread safety	MT-Unsafe race:grent locale
 .TE
+
+[[
+In the above table,
+.I grent
+in
+.I race:grent
+signifies that if any of the functions
+.BR setgrent (),
+.BR getgrent (),
+or
+.BR endgrent ()
+are used in parallel in different threads of a program, then data races could occur.
+]]
 .SH CONFORMING TO
 SVr4, 4.3BSD, POSIX.1-2001.
 .SH SEE ALSO
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
