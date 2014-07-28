From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] strtod.3: Reformat thread-safety information
Date: Mon, 28 Jul 2014 15:13:10 +0800
Message-ID: <1406531590-30824-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/strtod.3 | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/man3/strtod.3 b/man3/strtod.3
index 1b82a0a..4216e17 100644
--- a/man3/strtod.3
+++ b/man3/strtod.3
@@ -158,17 +158,19 @@ is stored in
 .B ERANGE
 Overflow or underflow occurred.
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
 .BR strtod (),
 .BR strtof (),
-and
 .BR strtold ()
-functions are thread-safe with exceptions.
-These functions can be safely used in multithreaded applications,
-as long as
-.BR setlocale (3)
-is not called to change the locale during their execution.
+T}	Thread safety	MT-Safe locale
+.TE
 .SH CONFORMING TO
 C89 describes
 .BR strtod (),
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
