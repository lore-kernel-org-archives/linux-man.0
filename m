From: Moritz.Struebe-jNDFPZUTrfT6U6xlzOR6HsSSVFg4/55HhC4ANOJQIlc@public.gmane.org
Subject: [PATCH] string.3: Add short description of the functions
Date: Wed,  4 Dec 2013 13:03:30 +0100
Message-ID: <1386158610-41816-1-git-send-email-Moritz.Struebe@informatik.uni-erlangen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Moritz=20'Morty'=20Str=C3=BCbe?= <morty-hi6Y0CQ0nG0@public.gmane.org>
List-Id: linux-man@vger.kernel.org

=46rom: Moritz 'Morty' Str=C3=BCbe <morty-hi6Y0CQ0nG0@public.gmane.org>

It is helpful to have a short description about what the different
functions in string.h do.

Signed-off-by: Moritz 'Morty' Str=C3=BCbe <morty-hi6Y0CQ0nG0@public.gmane.org>
---
 man3/string.3 |  159 +++++++++++++++++++++++++++++++++++++++++++++++--=
--------
 1 file changed, 133 insertions(+), 26 deletions(-)

diff --git a/man3/string.3 b/man3/string.3
index b180a50..5e27a65 100644
--- a/man3/string.3
+++ b/man3/string.3
@@ -34,58 +34,165 @@ strdup, strfry, strlen, strncat, strncmp, strncpy,=
 strncasecmp, strpbrk,
 strrchr, strsep, strspn, strstr, strtok, strxfrm, index, rindex
 \- string operations
 .SH SYNOPSIS
-.nf
 .B #include <strings.h>
-.sp
+.TP
 .BI "int strcasecmp(const char *" s1 ", const char *" s2 );
-.sp
+Compares
+.I s1
+and
+.I s2
+ignoring the case.
+.TP
 .BI "int strncasecmp(const char *" s1 ", const char *" s2 ", size_t " =
n );
-.sp
+Compares the first
+.I n
+characters of
+.I s1
+and=20
+.I s2=20
+ignoring the case.
+.TP
 .BI "char *index(const char *" s ", int " c );
-.sp
+Returns the first occurrence of
+.I c=20
+in
+.IR s .
+.TP
 .BI "char *rindex(const char *" s ", int " c );
-.sp
+Returns the last occurrence of
+.I c
+in
+.IR s .
+.TP
+.TP
 .B #include <string.h>
-.sp
+.TP
+.TP
 .BI "char *stpcpy(char *" dest ", const char *" src );
-.sp
+Copy a string from
+.I src
+to
+.IR dest .
+.TP
 .BI "char *strcat(char *" dest ", const char *" src );
-.sp
+Concatenate
+.I src
+to
+.IR dest .
+.TP
 .BI "char *strchr(const char *" s ", int " c );
-.sp
+Find the first occurence of
+.I c
+in
+.IR s .
+.TP
 .BI "int strcmp(const char *" s1 ", const char *" s2 );
-.sp
+Compare
+.I s1
+with
+.IR s2.
+.TP
 .BI "int strcoll(const char *" s1 ", const char *" s2 );
-.sp
+Compare
+.I s1
+with
+.I s2
+using the current locale.
+.TP
 .BI "char *strcpy(char *" dest ", const char *" src );
-.sp
+Copy
+.I src
+to
+.IR dst .
+.TP
 .BI "size_t strcspn(const char *" s ", const char *" reject );
-.sp
+Calculate the length of the initial segment of
+.I s
+which does not contain
+.IR reject .
+.TP
 .BI "char *strdup(const char *" s );
-.sp
+Copy
+.I s
+to memory allocated using
+.IR malloc (3).
+.TP
 .BI "char *strfry(char *" string );
-.sp
+Randomly swap the characters in
+.IR string.
+.TP
 .BI "size_t strlen(const char *" s );
-.sp
+Calculate the length of
+.IR s .
+.TP
 .BI "char *strncat(char *" dest ", const char *" src ", size_t " n );
-.sp
+Copy at most
+.I n
+characters from
+.I src
+to
+.IR dest .
+.TP
 .BI "int strncmp(const char *" s1 ", const char *" s2 ", size_t " n );
-.sp
+Compare at most
+.I n
+bytes of
+.I s1
+and
+.IR s2.
+.TP
 .BI "char *strncpy(char *" dest ", const char *" src ", size_t " n );
-.sp
+Copy at most
+.I n
+bytes
+from
+.I src
+to
+.IR dst .
+.TP
 .BI "char *strpbrk(const char *" s ", const char *" accept );
-.sp
+Return the first occurrence of
+.I s
+in
+.IR accept .
+.TP
 .BI "char *strrchr(const char *" s ", int " c );
-.sp
+Return the first occurrence of
+.I s
+in
+.IR c .
+.TP
 .BI "char *strsep(char **" stringp ", const char *" delim );
-.sp
+Tokenise
+.I stringp
+at=20
+.IR delim .
+.TP
 .BI "size_t strspn(const char *" s ", const char *" accept );
-.sp
+Calculate the size of the starting segment in
+.I s
+that consists of
+.IR accept .
+.TP
 .BI "char *strstr(const char *" haystack ", const char *" needle );
-.sp
+Find the first occurrence of
+.I needle
+in=20
+.IR haystack .
+.TP
 .BI "char *strtok(char *" s ", const char *" delim );
-.sp
+Tokenize=20
+.I s
+at=20
+.IR delim .
+.TP
 .BI "size_t strxfrm(char *" dest ", const char *" src ", size_t " n );
+Transforms
+.I src
+to the current locale and copies the first
+.I n
+characters to=20
+.IR dest .
 .fi
 .SH DESCRIPTION
 The string functions perform string operations on null-terminated
--=20
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
