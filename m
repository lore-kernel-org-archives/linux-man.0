From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] fmemopen.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 12 Mar 2015 13:33:46 +0800
Message-ID: <1426138426-3801-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
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
 man3/fmemopen.3 | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/man3/fmemopen.3 b/man3/fmemopen.3
index 824754e..4e84bf8 100644
--- a/man3/fmemopen.3
+++ b/man3/fmemopen.3
@@ -196,6 +196,23 @@ and
 were already available in glibc 1.0.x.
 .BR open_wmemstream ()
 is available since glibc 2.4.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR fopenmem (),
+.br
+.BR open_memstream (),
+.br
+.BR open_wmemstream
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 POSIX.1-2008.
 These functions are not specified in POSIX.1-2001,
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
