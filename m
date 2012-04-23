From: James Hunt <james.hunt-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] strchr(3) and memchr(3) should explain behaviour when character
 'c' is '\0'.
Date: Mon, 23 Apr 2012 14:47:49 +0100
Message-ID: <4F955D85.60001@ubuntu.com>
References: <4ED4A955.8020507@ubuntu.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050404060607000104010106"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4ED4A955.8020507-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------050404060607000104010106
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Repost as I think the original (2011-11-29) may have fallen through the cracks....

Originally reported as:

	https://bugzilla.kernel.org/show_bug.cgi?id=42042

PROBLEM
-------

strchr(3) and memchr(3) do not explain the behaviour if the character to search
for is specified as a null byte ('\0'). According to my copy of Harbison
and Steele, since the terminator is considered part of the string, a call such
as:

  strchr("hello", '\0')

... will return the address of the terminating null in the specified string.

RATIONALE
---------

strchr(3) and memchr(3) are inconsistent with index(3) which states:

  "The terminating NULL character is considered to be a part of the strings."

Adding such a note to strchr(3) and memchr(3) is also important since it is not
unreasonable to assume that strchr() will return NULL in this scenario. This
leads to code like the following which is guaranteed to fail should
get_a_char() return '\0':

  char string[] = "hello, world";
  int c = get_a_char();

  if (! strchr(string, c))
    fprintf(stderr, "failed to find character in string\n");


TEST PROGRAM
------------

The attached test program demonstrates the behaviour of strchr, strrchr, memchr, strchrnul, and
strstr. Test program has run successfully on:

- Ubuntu Natty (11.04) system with libc6 version 2.13-0ubuntu13 (egcs).
- Fedora 15 system with glibc version 2.13.90-9.

Note further that the The BSD folk already have this behaviour documented in their man pages:

http://www.freebsd.org/cgi/man.cgi?query=strchr&apropos=0&sektion=0&manpath=FreeBSD+8.2-RELEASE&arch=default&format=html

PATCH
-----

Patch applies against latest version of man-pages git repository.

An alternative to the provided patch for strchr.3 only would be to simply add the following to
strchr.3 (taken from the FreeBSD man page):

	The terminating null character is considered part of the string;
	therefore if c is `\0', the functions locate the terminating `\0'.

However, note that the FreeBSD man page for memchr.3 also omits to explain the behaviour should c be
'\0'. This appears to be because the FreeBSD man pages are based upon the POSIX specification
document which is similarly vague upon this point.

Kind regards,

James
--
James Hunt
____________________________________
http://upstart.ubuntu.com/cookbook
http://upstart.ubuntu.com/cookbook/upstart_cookbook.pdf


--------------050404060607000104010106
Content-Type: text/x-csrc;
 name="test_strchr.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="test_strchr.c"

/*
 * Program to show how various string handling calls behave when given a nul ('\0') to find in a
 * string.
 *
 * Author: James Hunt (james.hunt-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org)
 */

/* for strchrnul() */
#define _GNU_SOURCE

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdarg.h>
#include <assert.h>

int
main(int argc, char *argv[])
{
  size_t len;
  char c;
  char *sp;
  char string[] = "foo bar. Hello, world!";

  len = strlen(string);
  fprintf(stderr, "string='%s' (len=%d, start=%p, end=%p ['%c'], nul=%p ['%c'])\n\n",
      string, (int)len,
      string,
      string+len-1,
      *(string+len-1),
      string+len,
      *(string+len));

  c  = 'f';
  sp = "f";
  fprintf(stderr, "strchr     ('%s', '%c')              returned %p\n", string, c, strchr(string, c));
  fprintf(stderr, "memchr     ('%s', '%c', strlen(s))   returned %p\n", string, c, memchr(string, c, strlen(string)));
  fprintf(stderr, "memchr     ('%s', '%c', 1+strlen(s)) returned %p\n", string, c, memchr(string, c, 1+strlen(string)));
  fprintf(stderr, "strrchr    ('%s', '%c')              returned %p\n", string, c, strrchr(string, c));
  fprintf(stderr, "strchrnul  ('%s', '%c')              returned %p\n", string, c, strchrnul(string, c));
  fprintf(stderr, "strstr     ('%s', '%s')              returned %p\n", string, sp, strstr(string, sp));

  fputc ('\n', stderr);

  c  = 'o';
  sp = "o";
  fprintf(stderr, "strchr     ('%s', '%c')              returned %p\n", string, c, strchr(string, c));
  fprintf(stderr, "memchr     ('%s', '%c', strlen(s))   returned %p\n", string, c, memchr(string, c, strlen(string)));
  fprintf(stderr, "memchr     ('%s', '%c', 1+strlen(s)) returned %p\n", string, c, memchr(string, c, 1+strlen(string)));
  fprintf(stderr, "strrchr    ('%s', '%c')              returned %p\n", string, c, strrchr(string, c));
  fprintf(stderr, "strchrnul  ('%s', '%c')              returned %p\n", string, c, strchrnul(string, c));
  fprintf(stderr, "strstr     ('%s', '%s')              returned %p\n", string, sp, strstr(string, sp));

  fputc ('\n', stderr);

  c  = '!';
  sp = "!";
  fprintf(stderr, "strchr     ('%s', '%c')              returned %p\n", string, c, strchr(string, c));
  fprintf(stderr, "memchr     ('%s', '%c', strlen(s))   returned %p\n", string, c, memchr(string, c, strlen(string)));
  fprintf(stderr, "memchr     ('%s', '%c', 1+strlen(s)) returned %p\n", string, c, memchr(string, c, 1+strlen(string)));
  fprintf(stderr, "strrchr    ('%s', '%c')              returned %p\n", string, c, strrchr(string, c));
  fprintf(stderr, "strchrnul  ('%s', '%c')              returned %p\n", string, c, strchrnul(string, c));
  fprintf(stderr, "strstr     ('%s', '%s')              returned %p\n", string, sp, strstr(string, sp));

  fputc ('\n', stderr);

  c  = '\0';
  sp = "";
  fprintf(stderr, "strchr     ('%s', '%c')              returned %p\n", string, c, strchr(string, c));
  fprintf(stderr, "memchr     ('%s', '%c', strlen(s))   returned %p\n", string, c, memchr(string, c, strlen(string)));
  fprintf(stderr, "memchr     ('%s', '%c', 1+strlen(s)) returned %p\n", string, c, memchr(string, c, 1+strlen(string)));
  fprintf(stderr, "strrchr    ('%s', '%c')              returned %p\n", string, c, strrchr(string, c));
  fprintf(stderr, "strchrnul  ('%s', '%c')              returned %p\n", string, c, strchrnul(string, c));
  fprintf(stderr, "strstr     ('%s', '%s')              returned %p\n", string, sp, strstr(string, sp));
  sp = "\0";
  fprintf(stderr, "strstr     ('%s', '%s')              returned %p\n", string, sp, strstr(string, sp));

  /* XXX: not valid calls */
#if 0
  fprintf(stderr, "strstr     (NULL, '%s') returned %p\n", "X", strstr(NULL, "X"));
  fprintf(stderr, "strstr     (NULL, '%s') returned %p\n", "\0", strstr(NULL, "\0"));
  fprintf(stderr, "strstr     ('%s', NULL) returned %p\n", string, strstr(string, NULL));
  /* XXX: core dumps */
#endif

  fputc ('\n', stderr);

  c  = 'Z';
  sp = "Z";
  fprintf(stderr, "strchr     ('%s', '%c')              returned %p\n", string, c, strchr(string, c));
  fprintf(stderr, "memchr     ('%s', '%c', strlen(s))   returned %p\n", string, c, memchr(string, c, strlen(string)));
  fprintf(stderr, "memchr     ('%s', '%c', 1+strlen(s)) returned %p\n", string, c, memchr(string, c, 1+strlen(string)));
  fprintf(stderr, "strrchr    ('%s', '%c')              returned %p\n", string, c, strrchr(string, c));
  fprintf(stderr, "strchrnul  ('%s', '%c')              returned %p\n", string, c, strchrnul(string, c));
  fprintf(stderr, "strstr     ('%s', '%s')              returned %p\n", string, sp, strstr(string, sp));

  exit(EXIT_SUCCESS);
}


--------------050404060607000104010106
Content-Type: text/x-diff;
 name="0001-Explain-behaviour-of-memchr-strchr-when-searching-fo.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-Explain-behaviour-of-memchr-strchr-when-searching-fo.pa";
 filename*1="tch"

>From 7f4c2265f6ca97b0d11cfb8eb242ffd0a6ec03bb Mon Sep 17 00:00:00 2001
From: James Hunt <james.hunt-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Date: Tue, 29 Nov 2011 09:32:38 +0000
Subject: Explain behaviour of memchr+strchr when searching for null byte.

---
 man3/memchr.3 |   21 +++++++++++++++++++++
 man3/strchr.3 |    7 +++++++
 2 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/man3/memchr.3 b/man3/memchr.3
index af8f314..873ea48 100644
--- a/man3/memchr.3
+++ b/man3/memchr.3
@@ -109,6 +109,27 @@ The
 .BR rawmemchr ()
 function returns a pointer to the matching byte, if one is found.
 If no matching byte is found, the result is unspecified.
+.SH NOTES
+If \fIn\fP is large enough to include the null byte (\(aq\\0\(aq) at the
+end of \fIs\fP and the character \fIc\fP is specified as the null byte,
+.BR memchr ()
+behaves like 
+.BR strchr (3) "" ","
+returning a pointer to the null byte at the end of \fIs\fP rather than
+NULL.
+.in +4n
+.nf
+
+char str[] = "abc";
+char *p;
+
+/* will set \(aqp\(aq to NULL */
+p = memchr(str, \(aq\\0\(aq, strlen(str));
+
+/* will set \(aqp\(aq to address of terminating null of \(aqstr\(aq */
+p = memchr(str, \(aq\\0\(aq, strlen(str) + 1);
+.fi
+.in
 .SH VERSIONS
 .BR rawmemchr ()
 first appeared in glibc in version 2.1.
diff --git a/man3/strchr.3 b/man3/strchr.3
index b2ecfef..8ff2906 100644
--- a/man3/strchr.3
+++ b/man3/strchr.3
@@ -72,6 +72,13 @@ and
 .BR strrchr ()
 functions return a pointer to
 the matched character or NULL if the character is not found.
+.PP
+If the character \fIc\fP is specified as the null byte (\(aq\\0\(aq),
+.BR strchr ()
+and
+.BR strrchr ()
+return a pointer to address of the null byte at the end of \fIs\fP,
+rather than NULL.
 
 The
 .BR strchrnul ()
-- 
1.7.5.4



--------------050404060607000104010106--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
