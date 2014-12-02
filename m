From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] atan2.3:ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 2 Dec 2014 17:17:03 +0800
Message-ID: <1417511823-24946-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The function atan2(), atan2f() and atan2l() are thread safe.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/atan2.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/atan2.3 b/man3/atan2.3
index ab2efd6..40ef2c9 100644
--- a/man3/atan2.3
+++ b/man3/atan2.3
@@ -163,6 +163,20 @@ is positive infinity, +pi/4 (\-pi/4) is returned.
 No errors occur.
 .\" POSIX.1 documents an optional underflow error
 .\" glibc 2.8 does not do this.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw28 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR atan2 (),
+.BR atan2f (),
+.BR atan2l ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 C99, POSIX.1-2001.
 The variant returning
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
