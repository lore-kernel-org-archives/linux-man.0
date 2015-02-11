From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] ecvt_r.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 11 Feb 2015 13:14:46 +0800
Message-ID: <1423631686-21642-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
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
 man3/ecvt_r.3 | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/man3/ecvt_r.3 b/man3/ecvt_r.3
index d0fab32..2f31e61 100644
--- a/man3/ecvt_r.3
+++ b/man3/ecvt_r.3
@@ -85,6 +85,22 @@ and
 .BR qecvt (3).
 .SH RETURN VALUE
 These functions return 0 on success, and \-1 otherwise.
++.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw20 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR ecvt_r (),
+.BR fcvt_r (),
+.br
+.BR qecvt_r (),
+.BR qfcvt_r ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 These functions are GNU extensions.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
