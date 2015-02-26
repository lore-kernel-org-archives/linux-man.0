From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] lio_listio.3: ATTRIBUTES: Note function that is thread-safe
Date: Thu, 26 Feb 2015 10:46:04 +0800
Message-ID: <1424918764-8934-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

It's marking matches glibc marking.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/lio_listio.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/lio_listio.3 b/man3/lio_listio.3
index d7acceb..6b0f9c8 100644
--- a/man3/lio_listio.3
+++ b/man3/lio_listio.3
@@ -202,6 +202,19 @@ then none of the I/O operations has been initiated.
 The
 .BR lio_listio ()
 function is available since glibc 2.1.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR lio_listio ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 POSIX.1-2001, POSIX.1-2008.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
