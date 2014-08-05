From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] strcat.3: Reformat thread-safety information
Date: Tue, 5 Aug 2014 16:59:05 +0800
Message-ID: <1407229145-32717-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/strcat.3 | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/man3/strcat.3 b/man3/strcat.3
index 813ce03..9d8be2a 100644
--- a/man3/strcat.3
+++ b/man3/strcat.3
@@ -128,12 +128,18 @@ and
 functions return a pointer to the resulting string
 .IR dest .
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
-.BR strcat ()
-and
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw19 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR strcat (),
 .BR strncat ()
-functions are thread-safe.
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 SVr4, 4.3BSD, C89, C99.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
