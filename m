From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getgrent.3: Modify thread-safety information
Date: Tue, 10 Feb 2015 15:54:23 +0800
Message-ID: <1423554863-26245-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
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
 man3/getgrent.3 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man3/getgrent.3 b/man3/getgrent.3
index f3240aa..21d4759 100644
--- a/man3/getgrent.3
+++ b/man3/getgrent.3
@@ -168,16 +168,16 @@ For an explanation of the terms used in this section, see
 .BR attributes (7).
 .TS
 allbox;
-lbw22 lb lb
+lbw11 lb lbw41
 l l l.
 Interface	Attribute	Value
 T{
 .BR getgrent ()
-T}	Thread safety	MT-Unsafe
+T}	Thread safety	MT-Unsafe race:grent race:grentbuf locale
 T{
 .BR setgrent (),
 .BR endgrent ()
-T}	Thread safety	MT-Safe
+T}	Thread safety	MT-Unsafe race:grent locale
 .TE
 .SH CONFORMING TO
 SVr4, 4.3BSD, POSIX.1-2001.
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
