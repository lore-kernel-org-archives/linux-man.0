From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] addseverity.3: ATTRIBUTES: Note function is thread-safe
Date: Wed, 7 Jan 2015 11:03:18 +0800
Message-ID: <1420599798-25292-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The function addseverity() is thread safe.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/addseverity.3 | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/man3/addseverity.3 b/man3/addseverity.3
index 5e8cc06..a047293 100644
--- a/man3/addseverity.3
+++ b/man3/addseverity.3
@@ -57,6 +57,18 @@ nonexistent or default severity class.
 .SH VERSIONS
 .BR addseverity ()
 is provided in glibc since version 2.1.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR addseverity ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 This function is not specified in the X/Open Portability Guide
 although the
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
