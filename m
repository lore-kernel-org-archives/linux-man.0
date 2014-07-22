From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] strtoul.3: Reformat thread-safety information
Date: Tue, 22 Jul 2014 11:19:57 +0800
Message-ID: <1405999197-26831-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/strtoul.3 | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/man3/strtoul.3 b/man3/strtoul.3
index 60649cc..b4266d3 100644
--- a/man3/strtoul.3
+++ b/man3/strtoul.3
@@ -163,17 +163,19 @@ to
 in case
 no conversion was performed (no digits seen, and 0 returned).
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw32 lb lb
+l l l.
+Interface	Attribute	Value
+T{
 .BR strtoul (),
 .BR strtoull (),
-and
 .BR strtouq ()
-functions are thread-safe with exceptions.
-These functions can be safely used in multithreaded applications,
-as long as
-.BR setlocale (3)
-is not called to change the locale during their execution.
+T}	Thread safety	MT-Safe locale
+.TE
 .SH CONFORMING TO
 .BR strtoul ()
 conforms to SVr4, C89, C99, and POSIX-2001, and
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
