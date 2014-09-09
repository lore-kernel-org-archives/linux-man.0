From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] qecvt.3: Reformat thread-safety information
Date: Tue, 9 Sep 2014 11:25:54 +0800
Message-ID: <1410233154-31954-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/qecvt.3 | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/man3/qecvt.3 b/man3/qecvt.3
index ea50203..0917da9 100644
--- a/man3/qecvt.3
+++ b/man3/qecvt.3
@@ -83,16 +83,21 @@ See
 and
 .BR gcvt (3).
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
-.BR qecvt ()
-and
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw16 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR qecvt (),
 .BR qfcvt ()
-functions are not thread-safe.
-.LP
-The
+T}	Thread safety	MT-Unsafe
+T{
 .BR qgcvt ()
-function is thread-safe.
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 SVr4.
 Not seen in most common UNIX implementations,
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
