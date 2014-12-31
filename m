From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] y0.3:ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 31 Dec 2014 15:34:53 +0800
Message-ID: <1420011293-14923-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The function y0(), y1f() ynl() and so on are thread safe.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/y0.3 | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/man3/y0.3 b/man3/y0.3
index a1b7dd6..a2808c1 100644
--- a/man3/y0.3
+++ b/man3/y0.3
@@ -227,6 +227,30 @@ is not set for this case.
 An overflow floating-point exception
 .RB ( FE_OVERFLOW )
 is raised.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR y0 (),
+.BR y0f (),
+.BR y0l ()
+T}	Thread safety	MT-Safe
+T{
+.BR y1 (),
+.BR y1f (),
+.BR y1l ()
+T}	Thread safety	MT-Safe
+T{
+.BR yn (),
+.BR ynf (),
+.BR ynl ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 The functions returning
 .I double
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
