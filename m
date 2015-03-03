From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] fseek.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 3 Mar 2015 16:49:37 +0800
Message-ID: <1425372577-20155-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
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
 man3/fseek.3 | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/man3/fseek.3 b/man3/fseek.3
index a01cf35..eecf139 100644
--- a/man3/fseek.3
+++ b/man3/fseek.3
@@ -166,6 +166,24 @@ for any of the errors specified for the routines
 .BR lseek (2),
 and
 .BR malloc (3).
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw27 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR fseek (),
+.BR ftell (),
+.BR rewind (),
+.br
+.BR fgetpos (),
+.BR fsetpos ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 C89, C99.
 .SH SEE ALSO
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
