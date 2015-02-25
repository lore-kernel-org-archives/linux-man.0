From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] envz_add.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 25 Feb 2015 16:46:50 +0800
Message-ID: <1424854010-21517-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
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
 man3/envz_add.3 | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/man3/envz_add.3 b/man3/envz_add.3
index 417bcb7..b0d4b76 100644
--- a/man3/envz_add.3
+++ b/man3/envz_add.3
@@ -115,6 +115,26 @@ All envz functions that do memory allocation have a return type of
 and return 0 for success, and
 .B ENOMEM
 if an allocation error occurs.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw27 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR envz_add (),
+.BR envz_entry (),
+.br
+.BR envz_get (),
+.BR envz_merge (),
+.br
+.BR envz_remove (),
+.BR envz_strip ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 These functions are a GNU extension.
 Handle with care.
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
