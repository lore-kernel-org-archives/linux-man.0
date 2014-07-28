From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] strtol.3: Reformat thread-safety information
Date: Mon, 28 Jul 2014 12:09:53 +0800
Message-ID: <1406520593-21738-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/strtol.3 | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/man3/strtol.3 b/man3/strtol.3
index db3c8da..2e9a9b1 100644
--- a/man3/strtol.3
+++ b/man3/strtol.3
@@ -159,17 +159,19 @@ to
 in case
 no conversion was performed (no digits seen, and 0 returned).
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw29 lb lb
+l l l.
+Interface	Attribute	Value
+T{
 .BR strtol (),
 .BR strtoll (),
-and
 .BR strtoq ()
-functions are thread-safe with exceptions.
-These functions can be safely used in multithreaded applications,
-as long as
-.BR setlocale (3)
-is not called to change the locale during their execution.
+T}	Thread safety	MT-Safe locale
+.TE
 .SH CONFORMING TO
 .BR strtol ()
 conforms to SVr4, 4.3BSD, C89, C99, and POSIX.1-2001, and
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
