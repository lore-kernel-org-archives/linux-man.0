From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getpwnam.3: Modify thread-safety information
Date: Wed, 21 Jan 2015 15:18:20 +0800
Message-ID: <1421824700-9558-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
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
 man3/getpwnam.3 | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/man3/getpwnam.3 b/man3/getpwnam.3
index 7e85b57..14d7ac3 100644
--- a/man3/getpwnam.3
+++ b/man3/getpwnam.3
@@ -219,17 +219,20 @@ For an explanation of the terms used in this section, see
 .BR attributes (7).
 .TS
 allbox;
-lbw26 lb lb
+lb lb lb
 l l l.
 Interface	Attribute	Value
 T{
-.BR getpwnam (),
+.BR getpwnam ()
+T}	Thread safety	MT-Unsafe race:pwnam locale
+T{
 .BR getpwuid ()
-T}	Thread safety	MT-Unsafe
+T}	Thread safety	MT-Unsafe race:pwuid locale
 T{
 .BR getpwnam_r (),
+.br
 .BR getpwuid_r ()
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
