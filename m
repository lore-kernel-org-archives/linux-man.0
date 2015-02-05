From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] realpath.3: ATTRIBUTES: Note function that is thread-safe
Date: Thu, 5 Feb 2015 13:05:21 +0800
Message-ID: <1423112721-27315-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
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
 man3/realpath.3 | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/man3/realpath.3 b/man3/realpath.3
index 6a9d200..0d5ae84 100644
--- a/man3/realpath.3
+++ b/man3/realpath.3
@@ -132,6 +132,18 @@ The named file does not exist.
 .TP
 .B ENOTDIR
 A component of the path prefix is not a directory.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR realpath ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 4.4BSD, POSIX.1-2001.
 
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
