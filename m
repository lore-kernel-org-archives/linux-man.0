From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: patch:strerror_l
Date: Tue, 08 Oct 2013 19:02:03 +0200
Message-ID: <52543A8B.5050107@bfs.de>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090307030405050204010501"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------090307030405050204010501
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

hi list,
while testing i notice that strerror is missing the desciption of the locale variant.
that patch fixes the problem.

re,
 wh

--------------090307030405050204010501
Content-Type: text/x-patch;
 name="strerror.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="strerror.diff"

--- strerror.3.org	2013-09-19 13:50:48.000000000 +0200
+++ strerror.3	2013-09-19 15:00:10.000000000 +0200
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
+To get an error message in a given locale you need
+.BR strerror_l ()
+it takes an additional arument that defines to locale in what the message is returned.
+The function is thread-safe.
 .SH RETURN VALUE
 The
 .BR strerror ()
@@ -180,6 +189,8 @@
 .LP
 The
 .BR strerror_r ()
+and
+.BR strerror_r ()
 function is thread-safe.
 .SH CONFORMING TO
 .BR strerror ()
@@ -210,6 +221,39 @@
 .B EINVAL
 if the error number is unknown.
 C99 and POSIX.1-2008 require the return value to be non-NULL.
+.sp
+.BR strerror_l ()
+is a POSIX.1-2008 requirement, but available as GNU-specific function
+atleast since glibc 2.6.1.
+.SH EXAMPLE
+The program below demonstrates the use of the 
+.BR strerror* ()
+functions. The first line should be 
+.I sterror_l(13)=Permission denied
+the others should print this in a locale specific version.
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
+  printf("sterror_l(13)=%s\\n",strerror_l(e,loc));
+  freelocale (loc);
+  // this will be translated automaticly  
+  printf("sterror(13)=%s\\n",strerror(e));
+  strerror_r(e,buf,sizeof(buf)-1);
+  printf("sterror(13)=%s\\n",buf); 
+  return 0;
+}
+.fi
 .SH SEE ALSO
 .BR err (3),
 .BR errno (3),

--------------090307030405050204010501--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
