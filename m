From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] cacosh.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 28 Jan 2015 14:08:28 +0800
Message-ID: <1422425308-20695-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The functions cacosh(), cacoshf() and cacoshl() in glibc are thread safe.
It's markings match glibc markings.

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/cacosh.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/cacosh.3 b/man3/cacosh.3
index 054ea1c..7eb9cc3 100644
--- a/man3/cacosh.3
+++ b/man3/cacosh.3
@@ -38,6 +38,20 @@ One has:
 .fi
 .SH VERSIONS
 These functions first appeared in glibc in version 2.1.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw30 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR cacosh (),
+.BR cacoshf (),
+.BR cacoshl ()
+T}	Thread safety	MT-Safe
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
