From: Jan Engelhardt <jengelh-nopoi9nDyk+ELgA04lAiVw@public.gmane.org>
Subject: log*.3: add cross-references to other-base logarithmic functions
Date: Fri, 16 Oct 2009 12:48:45 +0200 (CEST)
Message-ID: <alpine.LSU.2.00.0910161248010.6221@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


parent 576b0bccd1d120880c5d3bbf252c8ac66245103a ()
commit c351c2b325fd365da02e8437053fc2d2b5e7d69a
Author: Jan Engelhardt <jengelh-nopoi9nDyk+ELgA04lAiVw@public.gmane.org>
Date:   Fri Oct 16 12:47:56 2009 +0200

log*.3: add cross-references to other-base logarithmic functions

Signed-off-by: Jan Engelhardt <jengelh-nopoi9nDyk+ELgA04lAiVw@public.gmane.org>
---
 man3/log.3   |    2 ++
 man3/log10.3 |    2 ++
 man3/log2.3  |    2 ++
 3 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/man3/log.3 b/man3/log.3
index d0426c2..8a41306 100644
--- a/man3/log.3
+++ b/man3/log.3
@@ -133,5 +133,7 @@ exception.
 .SH "SEE ALSO"
 .BR cbrt (3),
 .BR clog (3),
+\fBlog2\fP(3),
+\fBlog10\fP(3),
 .BR log1p (3),
 .BR sqrt (3)
diff --git a/man3/log10.3 b/man3/log10.3
index 5528d94..a6dcca3 100644
--- a/man3/log10.3
+++ b/man3/log10.3
@@ -88,4 +88,6 @@ SVr4, 4.3BSD, C89.
 .BR cbrt (3),
 .BR clog10 (3),
 .BR exp10 (3),
+\fBlog\fP(3),
+\fBlog2\fP(3),
 .BR sqrt (3)
diff --git a/man3/log2.3 b/man3/log2.3
index 6a86b9a..8e10fed 100644
--- a/man3/log2.3
+++ b/man3/log2.3
@@ -90,4 +90,6 @@ SVr4, 4.3BSD, C89.
 .SH "SEE ALSO"
 .BR cbrt (3),
 .BR clog2 (3),
+\fBlog\fP(3),
+\fBlog10\fP(3),
 .BR sqrt (3)
-- 
# Created with git-export-patch
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
