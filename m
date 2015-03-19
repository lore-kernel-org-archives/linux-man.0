From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] lgamma.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 19 Mar 2015 13:23:07 +0800
Message-ID: <1426742587-32262-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The markings match glibc markings.

---
 man3/lgamma.3 | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/man3/lgamma.3 b/man3/lgamma.3
index 26859c1..fabdda0 100644
--- a/man3/lgamma.3
+++ b/man3/lgamma.3
@@ -155,6 +155,28 @@ An overflow floating-point exception
 is raised.
 .\" glibc (as at 2.8) also supports an inexact
 .\" exception for various cases.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw24 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR lgamma (),
+.BR lgammaf (),
+.br
+.BR lgammal ()
+T}	Thread safety	MT-Safe race:signgam
+T{
+.BR lgamma_r (),
+.BR lgammaf)r (),
+.br
+.BR lgammal_r ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 The
 .BR lgamma ()
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
