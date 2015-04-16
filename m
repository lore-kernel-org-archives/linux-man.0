From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] clock.3: ATTRIBUTES: Note functions that is thread-safe
Date: Thu, 16 Apr 2015 12:57:27 +0800
Message-ID: <1429160247-32008-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The marking matches glibc marking.
The marking of functions in glibc is:
- clock: MT-Safe

Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/clock.3 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man3/clock.3 b/man3/clock.3
index 745754a..95f84e3 100644
--- a/man3/clock.3
+++ b/man3/clock.3
@@ -47,6 +47,19 @@ to get the number of seconds used, divide by
 If the processor time used is not available or its value cannot
 be represented, the function returns the value
 .IR (clock_t)\ \-1 .
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR clock ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 C89, C99, POSIX.1-2001.
 XSI requires that
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
