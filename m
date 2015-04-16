From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] insque.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 16 Apr 2015 13:03:06 +0800
Message-ID: <1429160586-32623-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

>From research, We think insque() and remque() are thread-safe.
But, there is not markings of insque() and remque() in glibc document.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/insque.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/insque.3 b/man3/insque.3
index 546759b..eb57355 100644
--- a/man3/insque.3
+++ b/man3/insque.3
@@ -96,6 +96,20 @@ The
 .BR remque ()
 function removes the element pointed to by \fIelem\fP from the
 doubly-linked list.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR insque (),
+.BR remque ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
