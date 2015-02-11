From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] fopen.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 11 Feb 2015 13:54:59 +0800
Message-ID: <1423634099-22581-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The markings match glibc markings.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/fopen.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/fopen.3 b/man3/fopen.3
index 14364a4..57e4c95 100644
--- a/man3/fopen.3
+++ b/man3/fopen.3
@@ -243,6 +243,20 @@ for any of the errors specified for the routines
 .BR fclose (3),
 and
 .BR fflush (3).
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw28 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR fopen (),
+.BR fdopen (),
+.BR freopen ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 The
 .BR fopen ()
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
