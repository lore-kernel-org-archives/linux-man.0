From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] catan.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 4 Feb 2015 13:55:20 +0800
Message-ID: <1423029320-11638-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The functions catan(), catanf() and catanl() are thread safe.
Their markings match glibc markings.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/catan.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/catan.3 b/man3/catan.3
index 13e1023..ee4fbe9 100644
--- a/man3/catan.3
+++ b/man3/catan.3
@@ -33,6 +33,20 @@ One has:
 .fi
 .SH VERSIONS
 These functions first appeared in glibc in version 2.1.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw28 lb lb
+l l l.
+Interface  Attribute   Value
+T{
+.BR catan (),
+.BR catanf (),
+.BR catanl ()
+T} Thread safety   MT-Safe
+.TE
 .SH CONFORMING TO
 C99.
 .SH EXAMPLE
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
