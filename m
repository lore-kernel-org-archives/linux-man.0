From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: [Patch V2]  add strerror_l(3) to strerror(3)
Date: Sat, 01 Mar 2014 11:41:28 +0100
Message-ID: <5311B958.9050002@bfs.de>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi list,
There is a lot of documentation missing for localisation functions.
This patch adds strerror_l() to the strerror(3) page.

This version should fix a few typos that came with the last version.
Thx to Stefan Puiu for reporting.

re,
 wh

--- /usr/local/share/man/man3/strerror.3	2014-02-11 09:20:17.000000000 +0100
+++ strerror.3	2014-03-01 11:32:27.000000000 +0100
@@ -50,6 +50,10 @@
 .sp
 .BI "char *strerror_r(int " errnum ", char *" buf ", size_t " buflen );
             /* GNU-specific */
+.sp
+.B #include <locale.h>
+.sp
+.BI "char *strerror_l(int " errnum, " locale_t " loc );
 .fi
 .sp
 .in -4n
@@ -133,6 +137,11 @@
 .I errnum
 is unknown).
 The string always includes a terminating null byte (\(aq\\0\(aq).
+
+To get an error message in a specific locale you need
+.BR strerror_l ()
+it takes an additional argument that defines to locale in what the message is returned.
+The function is thread-safe.
 .SH RETURN VALUE
 The
 .BR strerror ()
@@ -180,6 +189,8 @@
 .LP
 The
 .BR strerror_r ()
+and
+.BR strerror_l ()
 function is thread-safe.
 .SH CONFORMING TO
 .BR strerror ()
@@ -210,6 +221,41 @@
 .B EINVAL
 if the error number is unknown.
 C99 and POSIX.1-2008 require the return value to be non-NULL.
+.sp
+.BR strerror_l ()
+is a POSIX.1-2008 requirement, but available as GNU-specific function
+at least since glibc 2.6.1.
+.SH EXAMPLE
+The program below demonstrates the use of the
+.BR strerror* ()
+functions. The first line of output should be
+.I strerror_l(13)=Permission denied
+the others should print this in a locale as specified by
+.B LANG
+variable.
+.nf
+
+#include <stdio.h>
+#include <string.h>
+#include <locale.h>
+
+int main()
+{
+  int e=13;    // errornumber
+  char buf[255];
+  locale_t loc;
+
+  setlocale(LC_ALL, "");
+  loc = newlocale (LC_MESSAGES_MASK, "C", NULL);
+  printf("strerror_l(13)=%s\\n",strerror_l(e,loc));
+  freelocale (loc);
+  // this will be translated automaticly
+  printf("strerror(13)=%s\\n",strerror(e));
+  strerror_r(e,buf,sizeof(buf)-1);
+  printf("strerror_r(13)=%s\\n",buf);
+  return 0;
+}
+.fi
 .SH SEE ALSO
 .BR err (3),
 .BR errno (3),

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
