From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] strtoimax.3: Reformat thread-safety information
Date: Mon, 28 Jul 2014 13:38:57 +0800
Message-ID: <1406525937-26088-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/strtoimax.3 | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/man3/strtoimax.3 b/man3/strtoimax.3
index aa4f067..5eed5d6 100644
--- a/man3/strtoimax.3
+++ b/man3/strtoimax.3
@@ -56,16 +56,18 @@ is returned, and
 is set to
 .BR ERANGE .
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
-.BR strtoimax ()
-and
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw24 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR strtoimax (),
 .BR strtoumax ()
-functions are thread-safe with exceptions.
-These functions can be safely used in multithreaded applications,
-as long as
-.BR setlocale (3)
-is not called to change the locale during their execution.
+T}	Thread safety	MT-Safe locale
+.TE
 .SH CONFORMING TO
 C99, POSIX.1-2001.
 .SH SEE ALSO
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
