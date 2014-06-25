From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] gamma.3: ATTRIBUTES: Note functions that are not thread-safe
Date: Wed, 25 Jun 2014 10:07:34 +0800
Message-ID: <1403662054-6863-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions gamma(), gammaf() and gammal() are not thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/gamma.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/gamma.3 b/man3/gamma.3
index 98df97b..2f953c9 100644
--- a/man3/gamma.3
+++ b/man3/gamma.3
@@ -62,6 +62,20 @@ See
 .SH ERRORS
 See
 .BR lgamma (3).
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw27 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR gamma (),
+.BR gammaf (),
+.BR gammal ()
+T}	Thread safety	MT-Unsafe
+.TE
 .SH CONFORMING TO
 Because of historical variations in behavior across systems,
 this function is not specified in any standard.
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
