From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getgrnam.3: Modify thread-safety information
Date: Wed, 21 Jan 2015 15:24:38 +0800
Message-ID: <1421825078-10487-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

As annotation in glibc manual is more detailed, change the 
thread-safety information to be the same as glibc manual.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getgrnam.3 | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/man3/getgrnam.3 b/man3/getgrnam.3
index 7453ef7..8ac1bad 100644
--- a/man3/getgrnam.3
+++ b/man3/getgrnam.3
@@ -213,17 +213,20 @@ For an explanation of the terms used in this section, see
 .BR attributes (7).
 .TS
 allbox;
-lbw26 lb lb
+lb lb lb
 l l l.
 Interface	Attribute	Value
 T{
-.BR getgrnam (),
+.BR getgrnam ()
+T}	Thread safety	MT-Unsafe race:grnam locale
+T{
 .BR getgrgid ()
-T}	Thread safety	MT-Unsafe
+T}	Thread safety	MT-Unsafe race:grgid locale
 T{
 .BR getgrnam_r (),
+.br
 .BR getgrgid_r ()
-T}	Thread safety	MT-Safe
+T}	Thread safety	MT-Safe locale
 .TE
 .SH CONFORMING TO
 SVr4, 4.3BSD, POSIX.1-2001.
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
