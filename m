From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] strstr.3: Reformat thread-safety information
Date: Mon, 28 Jul 2014 15:18:05 +0800
Message-ID: <1406531885-31082-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/strstr.3 | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/man3/strstr.3 b/man3/strstr.3
index e8f82d8..babb562 100644
--- a/man3/strstr.3
+++ b/man3/strstr.3
@@ -63,17 +63,20 @@ but ignores the case of both arguments.
 These functions return a pointer to the beginning of the
 located substring, or NULL if the substring is not found.
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
 .BR strstr ()
-function is thread-safe.
-.LP
-The
+T}	Thread safety	MT-Safe
+T{
 .BR strcasestr ()
-function is thread-safe with exceptions.
-It can be safely used in multithreaded applications, as long as
-.BR setlocale (3)
-is not called to change the locale during its execution.
+T}	Thread safety	MT-Safe locale
+.TE
 .SH CONFORMING TO
 The
 .BR strstr ()
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
