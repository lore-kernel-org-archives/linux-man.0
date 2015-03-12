From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] gcvt.3: ATTRIBUTES: Note function that is thread-safe
Date: Thu, 12 Mar 2015 13:55:20 +0800
Message-ID: <1426139720-4268-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The marking matches glibc marking.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/gcvt.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/gcvt.3 b/man3/gcvt.3
index e65a293..9d283b8 100644
--- a/man3/gcvt.3
+++ b/man3/gcvt.3
@@ -74,6 +74,19 @@ The
 .BR gcvt ()
 function returns the address of the string pointed to
 by \fIbuf\fP.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR gcvt ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 Marked as LEGACY in POSIX.1-2001.
 POSIX.1-2008 removes the specification of
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
