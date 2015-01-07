From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] malloc.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 7 Jan 2015 16:30:32 +0800
Message-ID: <1420619432-15954-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The function malloc(), free(), calloc() and realloc() are thread safe.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/malloc.3 | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/man3/malloc.3 b/man3/malloc.3
index 2684982..5e4132d 100644
--- a/man3/malloc.3
+++ b/man3/malloc.3
@@ -168,6 +168,21 @@ is returned.
 If
 .BR realloc ()
 fails, the original block is left untouched; it is not freed or moved.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw38 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR malloc (),
+.BR free (),
+.BR calloc (),
+.BR realloc ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 C89, C99.
 .SH NOTES
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
