From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] qecvt.3: Modify thread-safety information
Date: Thu, 25 Dec 2014 15:01:39 +0800
Message-ID: <1419490899-7682-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

As annotation in glibc manual is more detailed, change the
thread-safety information to be same as glibc manual.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/qecvt.3 | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/man3/qecvt.3 b/man3/qecvt.3
index 0917da9..eada632 100644
--- a/man3/qecvt.3
+++ b/man3/qecvt.3
@@ -87,13 +87,15 @@ For an explanation of the terms used in this section, see
 .BR attributes (7).
 .TS
 allbox;
-lbw16 lb lb
+lb lb lb
 l l l.
 Interface	Attribute	Value
 T{
-.BR qecvt (),
+.BR qecvt ()
+T}	Thread safety	MT-Unsafe race:qecvt
+T{
 .BR qfcvt ()
-T}	Thread safety	MT-Unsafe
+T}	Thread safety	MT-Unsafe race:qfcvt
 T{
 .BR qgcvt ()
 T}	Thread safety	MT-Safe
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
