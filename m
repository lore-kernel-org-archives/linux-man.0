From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getfsent.3: Modify thread-safety information
Date: Thu, 29 Jan 2015 11:39:59 +0800
Message-ID: <1422502799-12796-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
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
 man3/getfsent.3 | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/man3/getfsent.3 b/man3/getfsent.3
index 12c883a..892cf9c 100644
--- a/man3/getfsent.3
+++ b/man3/getfsent.3
@@ -117,16 +117,21 @@ For an explanation of the terms used in this section, see
 .BR attributes (7).
 .TS
 allbox;
-lbw35 lb lb
+lb lb lbw24
 l l l.
 Interface	Attribute	Value
 T{
-.BR setfsent (),
-.BR getfsent (),
 .BR endfsent (),
+.br
+.BR setfsent ()
+T}	Thread safety	MT-Unsafe race:fsent
+T{
+.BR getfsent (),
+.br
 .BR getfsspec (),
+.br
 .BR getfsfile ()
-T}	Thread safety	MT-Unsafe
+T}	Thread safety	MT-Unsafe race:fsent locale
 .TE
 .SH CONFORMING TO
 These functions are not in POSIX.1-2001.
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
