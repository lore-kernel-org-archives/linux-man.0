From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] fputws.3: ATTRIBUTES: Note function that is thread-safe
Date: Thu, 12 Mar 2015 11:08:35 +0800
Message-ID: <1426129715-1698-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
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
 man3/fputws.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/fputws.3 b/man3/fputws.3
index 8584949..3f17794 100644
--- a/man3/fputws.3
+++ b/man3/fputws.3
@@ -40,6 +40,19 @@ The
 function returns a
 nonnegative integer if the operation was
 successful, or \-1 to indicate an error.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR fputws ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 C99, POSIX.1-2001.
 .SH NOTES
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
