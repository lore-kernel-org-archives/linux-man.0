From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] fseeko.3:ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 3 Mar 2015 16:22:52 +0800
Message-ID: <1425370972-19361-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
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
 man3/fseeko.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/fseeko.3 b/man3/fseeko.3
index 0a62edc..cdc4687 100644
--- a/man3/fseeko.3
+++ b/man3/fseeko.3
@@ -99,6 +99,20 @@ See the ERRORS in
 .BR fseek (3).
 .SH VERSIONS
 These functions are available under glibc since version 2.1.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw18 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR fseeko (),
+.BR ftello ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 SUSv2, POSIX.1-2001.
 .SH NOTES
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
