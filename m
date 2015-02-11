From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] backtrace.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 11 Feb 2015 10:36:12 +0800
Message-ID: <1423622172-18488-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
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
 man3/backtrace.3 | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/man3/backtrace.3 b/man3/backtrace.3
index 1b21794..7018f12 100644
--- a/man3/backtrace.3
+++ b/man3/backtrace.3
@@ -140,6 +140,22 @@ on error, NULL is returned.
 and
 .BR backtrace_symbols_fd ()
 are provided in glibc since version 2.1.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw22 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR backtrace (),
+.br
+.BR backtrace_symbols (),
+.br
+.BR backtrace_symbols_fd ()
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
