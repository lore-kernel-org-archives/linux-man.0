From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] man-pages.7: pfix
Date: Mon, 27 Jan 2014 18:53:07 -0400
Message-ID: <1390863188-8704-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/man-pages.7 | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/man7/man-pages.7 b/man7/man-pages.7
index 3fa232d..5430297 100644
--- a/man7/man-pages.7
+++ b/man7/man-pages.7
@@ -621,7 +621,7 @@ system port
 T}
 real-time	T{
 realtime,
-real-time
+real time
 T}
 run time	runtime
 saved set-group-ID	T{
@@ -646,7 +646,8 @@ username	user name
 zeros	zeroes
 .TE
 .ad
-.PP See also the discussion
+.PP
+See also the discussion
 .IR "Hyphenation of attributive compounds"
 below.
 .SS Terms to avoid
@@ -744,7 +745,7 @@ Em-dashes should be written
 surrounding spaces.
 .SS Hyphenation of attributive compounds
 Compound terms should be hyphenated when used attributively
-(i.e., to qualify a following noun) Some examples:
+(i.e., to qualify a following noun). Some examples:
 
     32-bit value
     command-line argument
@@ -795,7 +796,7 @@ and the former is probably what you want.
 Where a real minus character is required (e.g., for numbers such as \-1,
 or when writing options that have a leading dash, such as in
 .IR "ls\ \-l"),
-use the following form in the man page source
+use the following form in the man page source:
 
     \\-
 
@@ -841,7 +842,7 @@ Example programs should be laid out according to Kernighan and
 Ritchie style, with 4-space indents.
 (Avoid the use of TAB characters in source code!)
 .IP *
-For consistency, all example programs should terminate using either of;
+For consistency, all example programs should terminate using either of:
 
      exit(EXIT_SUCCESS);
      exit(EXIT_FAILURE);
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
