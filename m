From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] tsearch.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 4 Feb 2015 13:04:18 +0800
Message-ID: <1423026258-10938-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The functions' markings match glibc markings.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/tsearch.3 | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/man3/tsearch.3 b/man3/tsearch.3
index cd9d0ad..1de3050 100644
--- a/man3/tsearch.3
+++ b/man3/tsearch.3
@@ -187,6 +187,27 @@ also
 return NULL if
 .IR rootp
 was NULL on entry.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR tsearch (),
+.BR tfind (),
+.br
+.BR tdelete ()
+T}	Thread safety	MT-Safe race:rootp
+T{
+.BR twalk ()
+T}	Thread safety	MT-Safe race:root
+T{
+.BR tdestroy ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 SVr4, POSIX.1-2001.
 The function
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
