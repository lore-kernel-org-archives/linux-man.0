From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] man-pages.7: Add description of "ATTRIBUTES"
Date: Tue, 12 Mar 2013 18:41:35 +0800
Message-ID: <1363084895-6690-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

"ATTRIBUTES" section can mention thread safety, cancellation safety and async-cancel-safety.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man7/man-pages.7 | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/man7/man-pages.7 b/man7/man-pages.7
index fd1ae37..ae87525 100644
--- a/man7/man-pages.7
+++ b/man7/man-pages.7
@@ -25,7 +25,7 @@
 .\" 2007-05-30 created by mtk, using text from old man.7 plus
 .\" rewrites and additional text.
 .\"
-.TH MAN-PAGES 7 2013-02-24 "Linux" "Linux Programmer's Manual"
+.TH MAN-PAGES 7 2013-03-12 "Linux" "Linux Programmer's Manual"
 .SH NAME
 man-pages \- conventions for writing Linux man pages
 .SH SYNOPSIS
@@ -184,6 +184,7 @@ ERRORS             [Typically only in Sections 2, 3]
 .\" SECURITY,
 ENVIRONMENT
 FILES
+ATTRIBUTES         [Normally only in Sections 2, 3]
 VERSIONS           [Normally only in Sections 2, 3]
 CONFORMING TO
 NOTES
@@ -324,6 +325,28 @@ as the base.
 .\" section).
 .\" However, please include security information somewhere!
 .TP
+.B ATTRIBUTES
+A summary of various attributes of the function(s) documented on this page,
+broken into subsections.
+The following subsections are defined:
+.sp
+.RS
+.TP
+.B "Multithreading (see pthreads(7))"
+This subsection notes attributes relating to multithreaded applications:
+.RS
+.IP * 3
+Whether the function is thread-safe.
+.IP *
+Whether the function is a cancellation point.
+.IP *
+Whether the function is async-cancel-safe.
+.RE
+.IP
+Details of these attributes can be found in
+.BR pthreads (7).
+.RE
+.TP
 .B VERSIONS
 A brief summary of the Linux kernel or glibc versions where a
 system call or library function appeared,
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
