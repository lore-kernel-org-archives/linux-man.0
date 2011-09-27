From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] stpcpy(3)/stpncpy(3): add POSIX.1-2008 standard info
Date: Tue, 27 Sep 2011 14:52:55 -0400
Message-ID: <1317149575-16752-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Update the "CONFORMING TO" sections of these functions to mention that it
is now part of the POSIX.1-2008 standard.  Also link in stpncpy(3) from
the strncpy(3) man page.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man3/stpcpy.3  |    9 +++++----
 man3/stpncpy.3 |    2 +-
 man3/strcpy.3  |    1 +
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/man3/stpcpy.3 b/man3/stpcpy.3
index 40b951a..16e849b 100644
--- a/man3/stpcpy.3
+++ b/man3/stpcpy.3
@@ -64,10 +64,10 @@ returns a pointer to the \fBend\fP of the string
 \fIdest\fP (that is, the address of the terminating null byte)
 rather than the beginning.
 .SH "CONFORMING TO"
-This function is not part of the C or POSIX.1 standards, and is
-not customary on UNIX systems, but is not a GNU invention either.
-Perhaps it comes from MS-DOS.
-Nowadays, it is also present on the BSDs.
+This function was added to POSIX.1-2008. Before that, it was not part of
+the C or POSIX.1 standards, nor customary on UNIX systems, but was not a
+GNU invention either. Perhaps it came from MS-DOS. It is also present on
+the BSDs.
 .SH EXAMPLE
 For example, this program uses
 .BR stpcpy ()
@@ -100,6 +100,7 @@ This function may overrun the buffer
 .BR memccpy (3),
 .BR memcpy (3),
 .BR memmove (3),
+.BR stpncpy (3),
 .BR strcpy (3),
 .BR string (3),
 .BR wcpcpy (3)
diff --git a/man3/stpncpy.3 b/man3/stpncpy.3
index b4f78d8..04ec7c8 100644
--- a/man3/stpncpy.3
+++ b/man3/stpncpy.3
@@ -62,7 +62,7 @@ returns a pointer to the terminating null
 in \fIdest\fP, or, if \fIdest\fP is not null-terminated,
 \fIdest + n\fP.
 .SH "CONFORMING TO"
-This function is a GNU extension.
+This function was added to POSIX.1-2008. Before that, it was a GNU extension.
 .SH "SEE ALSO"
 .BR strncpy (3),
 .BR wcpncpy (3)
diff --git a/man3/strcpy.3 b/man3/strcpy.3
index e79451d..ce72ad8 100644
--- a/man3/strcpy.3
+++ b/man3/strcpy.3
@@ -138,6 +138,7 @@ in ways that may make the impossible possible.
 .BR memcpy (3),
 .BR memmove (3),
 .BR stpcpy (3),
+.BR stpncpy (3),
 .BR strdup (3),
 .BR string (3),
 .BR wcscpy (3),
-- 
1.7.6.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
