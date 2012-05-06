From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] fopen.3: tfix
Date: Sun,  6 May 2012 19:10:29 -0400
Message-ID: <1336345829-22237-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Introduced in 4d9edb6 and afd6f6.
---
 man3/fopen.3 |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/man3/fopen.3 b/man3/fopen.3
index 820b4ff..b84fe9c 100644
--- a/man3/fopen.3
+++ b/man3/fopen.3
@@ -327,11 +327,9 @@ If that operation is a wide-character operation,
 the stream is marked wide-oriented,
 and functions to convert to the coded character set are loaded.
 .SH BUGS
-In versions of glibc before
-.SH BUGS
 When parsing for individual flag characters in
 .IR mode
-(i.e., the characters preceding the "ccs" specification"),
+(i.e., the characters preceding the "ccs" specification),
 the glibc implementation of
 .\" FIXME http://sourceware.org/bugzilla/show_bug.cgi?id=12685
 .BR fopen ()
@@ -343,7 +341,7 @@ to 7 (or, in glibc versions before 2.14, to 6,
 which was not enough to include possible specifications such as "rb+cmxe").
 The current implementation of
 .BR fdopen ()
-parses at most 5 characters in in
+parses at most 5 characters in
 .IR mode .
 .SH "SEE ALSO"
 .BR open (2),
-- 
1.7.10

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
