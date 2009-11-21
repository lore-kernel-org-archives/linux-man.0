From: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Subject: [PATCH 2/2] string.3: Reference stpcpy(3)
Date: Sat, 21 Nov 2009 21:18:47 +0000
Message-ID: <1258838327-31762-2-git-send-email-mark@pogo.org.uk>
References: <alpine.NEB.2.01.0911212052050.25031@jrf.vwaro.pbz>
 <1258838327-31762-1-git-send-email-mark@pogo.org.uk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1258838327-31762-1-git-send-email-mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This function is a variant of strcpy(3). Even though it is lesser-used
it appears at the top alphabetically because of its unusual name.

Signed-off-by: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
---
 man3/string.3 |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/man3/string.3 b/man3/string.3
index 89d60e1..1fa71b8 100644
--- a/man3/string.3
+++ b/man3/string.3
@@ -27,7 +27,7 @@
 .\" Modified Sun Jul 25 10:54:31 1993, Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .TH STRING 3  1993-04-09 "" "Linux Programmer's Manual"
 .SH NAME
-strcasecmp, strcat, strchr, strcmp, strcoll, strcpy, strcspn,
+stpcpy, strcasecmp, strcat, strchr, strcmp, strcoll, strcpy, strcspn,
 strdup, strfry, strlen, strncat, strncmp, strncpy, strncasecmp, strpbrk,
 strrchr, strsep, strspn, strstr, strtok, strxfrm, index, rindex
 \- string operations
@@ -45,6 +45,8 @@ strrchr, strsep, strspn, strstr, strtok, strxfrm, index, rindex
 .sp
 .B #include <string.h>
 .sp
+.BI "char *stpcpy(char *" dest ", const char *" src );
+.sp
 .BI "char *strcat(char *" dest ", const char *" src );
 .sp
 .BI "char *strchr(const char *" s ", int " c );
@@ -90,6 +92,7 @@ See the individual man pages for descriptions of each function.
 .SH "SEE ALSO"
 .BR index (3),
 .BR rindex (3),
+.BR stpcpy (3),
 .BR strcasecmp (3),
 .BR strcat (3),
 .BR strchr (3),
-- 
1.6.5.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
