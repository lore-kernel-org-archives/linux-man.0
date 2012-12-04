From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH 1/2] man-pages.7: Add description of "ATTRIBUTES"
Date: Tue, 4 Dec 2012 15:49:02 +0800
Message-ID: <1354607342-5199-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

"ATTRIBUTES" section gives the information of thread-safety.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man7/man-pages.7 | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/man7/man-pages.7 b/man7/man-pages.7
index b21de1d..8533cfb 100644
--- a/man7/man-pages.7
+++ b/man7/man-pages.7
@@ -25,7 +25,7 @@
 .\" 2007-05-30 created by mtk, using text from old man.7 plus
 .\" rewrites and additional text.
 .\"
-.TH MAN-PAGES 7 2012-10-21 "Linux" "Linux Programmer's Manual"
+.TH MAN-PAGES 7 2012-12-04 "Linux" "Linux Programmer's Manual"
 .SH NAME
 man-pages \- conventions for writing Linux man pages
 .SH SYNOPSIS
@@ -181,6 +181,7 @@ ERRORS             [Typically only in Sections 2, 3]
 ENVIRONMENT
 FILES
 VERSIONS           [Normally only in Sections 2, 3]
+ATTRIBUTES         [Normally only in Sections 2, 3]
 CONFORMING TO
 NOTES
 BUGS
@@ -342,6 +343,21 @@ The
 manual page also provides information about kernel versions
 in which various system calls first appeared.
 .TP
+.B ATTRIBUTES
+For Section 2 and 3 manual pages, this section gives a
+number of attributes, e.g.,
+.RS
+.TS
+allbox;
+c.
+thread-safety
+reentrant/non-reentrant
+async-signal-safety
+cancelation safety
+.TE
+.RE
+.TP
+.sp
 .B CONFORMING TO
 describes any standards or conventions that relate to the function
 or command described by the manual page.
-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
