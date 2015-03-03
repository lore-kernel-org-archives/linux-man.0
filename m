From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] strdup.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 3 Mar 2015 17:32:25 +0800
Message-ID: <1425375145-21506-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The marking matches glibc marking.

---
 man3/strdup.3 | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/man3/strdup.3 b/man3/strdup.3
index 49e94dc..59adc25 100644
--- a/man3/strdup.3
+++ b/man3/strdup.3
@@ -120,6 +120,23 @@ set to indicate the cause of the error.
 .TP
 .B ENOMEM
 Insufficient memory available to allocate duplicate string.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw31 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR strdup (),
+.BR strndup (),
+.BR strdupa (),
+.br
+.BR strndupa ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 .\" 4.3BSD-Reno, not (first) 4.3BSD.
 .BR strdup ()
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
