From: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Subject: [PATCH 1/3] strcpy.3: Reference strdup(3)
Date: Mon, 25 May 2009 22:43:47 +0100
Message-ID: <1243287829-2704-1-git-send-email-mark@pogo.org.uk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man3/strcpy.3 |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/man3/strcpy.3 b/man3/strcpy.3
index 8fd2c1d..2b4d8ba 100644
--- a/man3/strcpy.3
+++ b/man3/strcpy.3
@@ -30,7 +30,7 @@
 .\" 2007-06-15, Marc Boyer <marc.boyer-oUYRw6/Rnm9Wj0EZb7rXcA@public.gmane.org> + mtk
 .\"     Improve discussion of strncpy().
 .\"
-.TH STRCPY 3  2009-02-04 "GNU" "Linux Programmer's Manual"
+.TH STRCPY 3  2009-05-09 "GNU" "Linux Programmer's Manual"
 .SH NAME
 strcpy, strncpy \- copy a string
 .SH SYNOPSIS
@@ -136,6 +136,7 @@ in ways that may make the impossible possible.
 .BR memccpy (3),
 .BR memcpy (3),
 .BR memmove (3),
+.BR strdup (3),
 .BR strpcpy (3),
 .BR wcscpy (3),
 .BR wcsncpy (3)
-- 
1.6.2.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
