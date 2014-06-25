From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] wcstoimax.3: Reformat thread-safety information
Date: Wed, 25 Jun 2014 14:49:45 +0800
Message-ID: <1403678985-24245-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/wcstoimax.3 | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/man3/wcstoimax.3 b/man3/wcstoimax.3
index 4585ccb..eede904 100644
--- a/man3/wcstoimax.3
+++ b/man3/wcstoimax.3
@@ -47,16 +47,18 @@ and
 .IR uintmax_t ,
 respectively.
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
-.BR wcstoimax ()
-and
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw24 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR wcstoimax (),
 .BR wcstoumax ()
-functions are thread-safe with exceptions.
-These functions can be safely used in multithreaded applications,
-as long as
-.BR setlocale (3)
-is not called to change the locale during their execution.
+T}	Thread safety	MT-Safe locale
+.TE
 .SH CONFORMING TO
 C99.
 .SH SEE ALSO
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
