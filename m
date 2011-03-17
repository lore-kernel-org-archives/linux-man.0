From: Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] strerror: improve strerror_r description
Date: Thu, 17 Mar 2011 16:26:35 -0600
Message-ID: <1300400795-9123-1-git-send-email-eblake@redhat.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---

POSIX requires that perror() not modify the static storage
returned by strerror().  POSIX 2008 and C99 both require that
strerror() never return NULL (a strerror() that always
returns "" for all inputs is valid for C99, but not for POSIX).

http://sourceware.org/bugzilla/show_bug.cgi?id=12204
documents glibc's change to come into compliance with POSIX
regarding strerror_r return value.  The GNU strerror_r use
of buf was confusing - I ended up writing a test program that
proves that buf is unused for valid errnum, but contains
truncated "unknown message" for out-of-range errnum.

See also http://austingroupbugs.net/view.php?id=382

 man3/strerror.3 |   18 +++++++++++-------
 1 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/man3/strerror.3 b/man3/strerror.3
index 37fc95d..8928a1e 100644
--- a/man3/strerror.3
+++ b/man3/strerror.3
@@ -71,10 +71,10 @@ code passed in the argument \fIerrnum\fP, possibly using the
 part of the current locale to select the appropriate language.
 This string must not be modified by the application, but may be
 modified by a subsequent call to
-.BR perror (3)
-or
 .BR strerror ().
-No library function will modify this string.
+No other library function, including
+.BR perror (3),
+will modify this string.

 The
 .BR strerror_r ()
@@ -84,7 +84,7 @@ but is
 thread safe.
 This function is available in two versions:
 an XSI-compliant version specified in POSIX.1-2001
-(available since glibc 2.3.4),
+(available since glibc 2.3.4, but not compliant until glibc 2.13),
 and a GNU-specific version (available since glibc 2.0).
 The XSI-compliant version is provided with the feature test macros
 settings shown in the SYNOPSIS;
@@ -120,7 +120,9 @@ then at most
 .I buflen
 bytes are stored (the string may be truncated if
 .I buflen
-is too small) and the string always includes a terminating null byte.
+is too small and
+.I errnum
+is unknown).  The string always includes a terminating null byte.
 .SH "RETURN VALUE"
 The
 .BR strerror ()
@@ -133,9 +135,10 @@ or an "Unknown error nnn" message if the error number is unknown.
 The XSI-compliant
 .BR strerror_r ()
 function returns 0 on success;
-on error, \-1 is returned and
+on error, glibc 2.13 returns a positive error number, while
+older versions returned \-1 and set
 .I errno
-is set to indicate the error.
+indicate the error instead.
 .SH ERRORS
 .TP
 .B EINVAL
@@ -165,6 +168,7 @@ On some systems,
 .\" e.g., Solaris 8, HP-UX 11
 .BR strerror ()
 returns NULL if the error number is unknown.
+POSIX.1-2008 requires the result to be non-NULL for all inputs.
 On other systems,
 .\" e.g., FreeBSD 5.4, Tru64 5.1B
 .BR strerror ()
-- 
1.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
