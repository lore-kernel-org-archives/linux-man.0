From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] atof.3: wfix phrasing
Date: Wed, 22 Jan 2014 17:32:46 +0800
Message-ID: <1390383166-4307-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/atof.3        | 4 ++--
 man3/atoi.3        | 4 ++--
 man3/strstr.3      | 4 ++--
 man3/strtod.3      | 4 ++--
 man3/toupper.3     | 4 ++--
 man3/towlower.3    | 4 ++--
 man3/towupper.3    | 4 ++--
 man3/wcscasecmp.3  | 4 ++--
 man3/wcsncasecmp.3 | 4 ++--
 man3/wcstoimax.3   | 4 ++--
 man3/wcswidth.3    | 4 ++--
 man3/wctrans.3     | 4 ++--
 man3/wctype.3      | 4 ++--
 man3/wcwidth.3     | 4 ++--
 14 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/man3/atof.3 b/man3/atof.3
index d900a27..f1cef73 100644
--- a/man3/atof.3
+++ b/man3/atof.3
@@ -28,7 +28,7 @@
 .\"     386BSD man pages
 .\" Modified Mon Mar 29 22:39:24 1993, David Metcalfe
 .\" Modified Sat Jul 24 21:39:22 1993, Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
-.TH ATOF 3  2013-10-08 "GNU" "Linux Programmer's Manual"
+.TH ATOF 3  2014-01-22 "GNU" "Linux Programmer's Manual"
 .SH NAME
 atof \- convert a string to a double
 .SH SYNOPSIS
@@ -61,7 +61,7 @@ The
 function is thread-safe with exceptions.
 It can be safely used in multithreaded applications, as long as
 .BR setlocale (3)
-is not called to change the locale.
+is not called to change the locale during its execution.
 .SH CONFORMING TO
 SVr4, POSIX.1-2001, 4.3BSD, C89, C99.
 .SH SEE ALSO
diff --git a/man3/atoi.3 b/man3/atoi.3
index 598650a..0cea405 100644
--- a/man3/atoi.3
+++ b/man3/atoi.3
@@ -30,7 +30,7 @@
 .\" Modified Sat Jul 24 21:38:42 1993, Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .\" Modified Sun Dec 17 18:35:06 2000, Joseph S. Myers
 .\"
-.TH ATOI 3  2013-10-14 "GNU" "Linux Programmer's Manual"
+.TH ATOI 3  2014-01-22 "GNU" "Linux Programmer's Manual"
 .SH NAME
 atoi, atol, atoll, atoq \- convert a string to an integer
 .SH SYNOPSIS
@@ -101,7 +101,7 @@ functions are thread-safe with exceptions.
 These functions can be safely used in multithreaded applications,
 as long as
 .BR setlocale (3)
-is not called to change the locale.
+is not called to change the locale during their execution.
 .SH CONFORMING TO
 SVr4, POSIX.1-2001, 4.3BSD, C99.
 C89 and
diff --git a/man3/strstr.3 b/man3/strstr.3
index c667da5..e8f82d8 100644
--- a/man3/strstr.3
+++ b/man3/strstr.3
@@ -30,7 +30,7 @@
 .\" Added history, aeb, 980113.
 .\" 2005-05-05 mtk: added strcasestr()
 .\"
-.TH STRSTR 3  2014-01-15 "GNU" "Linux Programmer's Manual"
+.TH STRSTR 3  2014-01-22 "GNU" "Linux Programmer's Manual"
 .SH NAME
 strstr, strcasestr \- locate a substring
 .SH SYNOPSIS
@@ -73,7 +73,7 @@ The
 function is thread-safe with exceptions.
 It can be safely used in multithreaded applications, as long as
 .BR setlocale (3)
-is not called to change the locale.
+is not called to change the locale during its execution.
 .SH CONFORMING TO
 The
 .BR strstr ()
diff --git a/man3/strtod.3 b/man3/strtod.3
index 43efb50..1b82a0a 100644
--- a/man3/strtod.3
+++ b/man3/strtod.3
@@ -42,7 +42,7 @@
 .\"   (michael-dcCOIfDdh9paP0f+8Gpiu5H8eBQqjErGxu+e+x4sQ7A@public.gmane.org)
 .\" Added strof, strtold, aeb, 2001-06-07
 .\"
-.TH STRTOD 3 2014-01-20 "Linux" "Linux Programmer's Manual"
+.TH STRTOD 3 2014-01-22 "Linux" "Linux Programmer's Manual"
 .SH NAME
 strtod, strtof, strtold \- convert ASCII string to floating-point numb=
er
 .SH SYNOPSIS
@@ -168,7 +168,7 @@ functions are thread-safe with exceptions.
 These functions can be safely used in multithreaded applications,
 as long as
 .BR setlocale (3)
-is not called to change the locale.
+is not called to change the locale during their execution.
 .SH CONFORMING TO
 C89 describes
 .BR strtod (),
diff --git a/man3/toupper.3 b/man3/toupper.3
index f592495..a66e01b 100644
--- a/man3/toupper.3
+++ b/man3/toupper.3
@@ -24,7 +24,7 @@
 .\"
 .\" Modified Sat Jul 24 17:45:39 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .\" Modified 2000-02-13 by Nicol=E1s Lichtmaier <nick-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
-.TH TOUPPER 3  2013-12-24 "GNU" "Linux Programmer's Manual"
+.TH TOUPPER 3  2014-01-22 "GNU" "Linux Programmer's Manual"
 .SH NAME
 toupper, tolower \- convert letter to upper or lower case
 .SH SYNOPSIS
@@ -68,7 +68,7 @@ functions are thread-safe with exceptions.
 These functions can be safely used in multithreaded applications,
 as long as
 .BR setlocale (3)
-is not called to change the locale.
+is not called to change the locale during their execution.
 .SH CONFORMING TO
 C89, C99, 4.3BSD.
 .SH BUGS
diff --git a/man3/towlower.3 b/man3/towlower.3
index 69acb49..eb9bec2 100644
--- a/man3/towlower.3
+++ b/man3/towlower.3
@@ -13,7 +13,7 @@
 .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.or=
g/online.html
 .\"   ISO/IEC 9899:1999
 .\"
-.TH TOWLOWER 3  2014-01-06 "GNU" "Linux Programmer's Manual"
+.TH TOWLOWER 3  2014-01-22 "GNU" "Linux Programmer's Manual"
 .SH NAME
 towlower \- convert a wide character to lowercase
 .SH SYNOPSIS
@@ -57,7 +57,7 @@ The
 function is thread-safe with exceptions.
 It can be safely used in multithreaded applications, as long as
 .BR setlocale (3)
-is not called to change the locale.
+is not called to change the locale during its execution.
 .SH CONFORMING TO
 C99.
 .SH NOTES
diff --git a/man3/towupper.3 b/man3/towupper.3
index b90965b..0c81d18 100644
--- a/man3/towupper.3
+++ b/man3/towupper.3
@@ -13,7 +13,7 @@
 .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.or=
g/online.html
 .\"   ISO/IEC 9899:1999
 .\"
-.TH TOWUPPER 3  2014-01-06 "GNU" "Linux Programmer's Manual"
+.TH TOWUPPER 3  2014-01-22 "GNU" "Linux Programmer's Manual"
 .SH NAME
 towupper \- convert a wide character to uppercase
 .SH SYNOPSIS
@@ -57,7 +57,7 @@ The
 function is thread-safe with exceptions.
 It can be safely used in multithreaded applications, as long as
 .BR setlocale (3)
-is not called to change the locale.
+is not called to change the locale during its execution.
 .SH CONFORMING TO
 C99.
 .SH NOTES
diff --git a/man3/wcscasecmp.3 b/man3/wcscasecmp.3
index 1c0437b..547f2e2 100644
--- a/man3/wcscasecmp.3
+++ b/man3/wcscasecmp.3
@@ -12,7 +12,7 @@
 .\"   Dinkumware C library reference http://www.dinkumware.com/
 .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.or=
g/online.html
 .\"
-.TH WCSCASECMP 3 2013-11-21 "GNU" "Linux Programmer's Manual"
+.TH WCSCASECMP 3 2014-01-22 "GNU" "Linux Programmer's Manual"
 .SH NAME
 wcscasecmp \- compare two wide-character strings, ignoring case
 .SH SYNOPSIS
@@ -87,7 +87,7 @@ The
 function is thread-safe with exceptions.
 It can be safely used in multithreaded applications, as long as
 .BR setlocale (3)
-is not called to change the locale.
+is not called to change the locale during its execution.
 .SH CONFORMING TO
 POSIX.1-2008.
 This function is not specified in POSIX.1-2001,
diff --git a/man3/wcsncasecmp.3 b/man3/wcsncasecmp.3
index 3e88dab..b1cb9ff 100644
--- a/man3/wcsncasecmp.3
+++ b/man3/wcsncasecmp.3
@@ -12,7 +12,7 @@
 .\"   Dinkumware C library reference http://www.dinkumware.com/
 .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.or=
g/online.html
 .\"
-.TH WCSNCASECMP 3 2013-11-25 "GNU" "Linux Programmer's Manual"
+.TH WCSNCASECMP 3 2014-01-22 "GNU" "Linux Programmer's Manual"
 .SH NAME
 wcsncasecmp \- compare two fixed-size wide-character strings, ignoring=
 case
 .SH SYNOPSIS
@@ -92,7 +92,7 @@ The
 function is thread-safe with exceptions.
 It can be safely used in multithreaded applications, as long as
 .BR setlocale (3)
-is not called to change the locale.
+is not called to change the locale during its execution.
 .SH CONFORMING TO
 POSIX.1-2008.
 This function is not specified in POSIX.1-2001,
diff --git a/man3/wcstoimax.3 b/man3/wcstoimax.3
index 626aa3c..4585ccb 100644
--- a/man3/wcstoimax.3
+++ b/man3/wcstoimax.3
@@ -21,7 +21,7 @@
 .\" <http://www.gnu.org/licenses/>.
 .\" %%%LICENSE_END
 .\"
-.TH WCSTOIMAX 3 2013-11-18 "" "Linux Programmer's Manual"
+.TH WCSTOIMAX 3 2014-01-22 "" "Linux Programmer's Manual"
 .SH NAME
 wcstoimax, wcstoumax \- convert wide-character string to integer
 .SH SYNOPSIS
@@ -56,7 +56,7 @@ functions are thread-safe with exceptions.
 These functions can be safely used in multithreaded applications,
 as long as
 .BR setlocale (3)
-is not called to change the locale.
+is not called to change the locale during their execution.
 .SH CONFORMING TO
 C99.
 .SH SEE ALSO
diff --git a/man3/wcswidth.3 b/man3/wcswidth.3
index 0252b1b..567fb86 100644
--- a/man3/wcswidth.3
+++ b/man3/wcswidth.3
@@ -12,7 +12,7 @@
 .\"   Dinkumware C library reference http://www.dinkumware.com/
 .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.or=
g/online.html
 .\"
-.TH WCSWIDTH 3  2013-11-18 "GNU" "Linux Programmer's Manual"
+.TH WCSWIDTH 3  2014-01-22 "GNU" "Linux Programmer's Manual"
 .SH NAME
 wcswidth \- determine columns needed for a fixed-size wide-character s=
tring
 .SH SYNOPSIS
@@ -51,7 +51,7 @@ The
 function is thread-safe with exceptions.
 It can be safely used in multithreaded applications, as long as
 .BR setlocale (3)
-is not called to change the locale.
+is not called to change the locale during its execution.
 .SH CONFORMING TO
 POSIX.1-2001.
 .SH NOTES
diff --git a/man3/wctrans.3 b/man3/wctrans.3
index 4d0a5c2..57f7744 100644
--- a/man3/wctrans.3
+++ b/man3/wctrans.3
@@ -13,7 +13,7 @@
 .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.or=
g/online.html
 .\"   ISO/IEC 9899:1999
 .\"
-.TH WCTRANS 3  2013-11-04 "GNU" "Linux Programmer's Manual"
+.TH WCTRANS 3  2014-01-22 "GNU" "Linux Programmer's Manual"
 .SH NAME
 wctrans \- wide-character translation mapping
 .SH SYNOPSIS
@@ -66,7 +66,7 @@ The
 function is thread-safe with exceptions.
 It can be safely used in multithreaded applications, as long as
 .BR setlocale (3)
-is not called to change the locale.
+is not called to change the locale during its execution.
 .SH CONFORMING TO
 C99.
 .SH NOTES
diff --git a/man3/wctype.3 b/man3/wctype.3
index 61ed00a..e9e4184 100644
--- a/man3/wctype.3
+++ b/man3/wctype.3
@@ -13,7 +13,7 @@
 .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.or=
g/online.html
 .\"   ISO/IEC 9899:1999
 .\"
-.TH WCTYPE 3  2013-11-04 "GNU" "Linux Programmer's Manual"
+.TH WCTYPE 3  2014-01-22 "GNU" "Linux Programmer's Manual"
 .SH NAME
 wctype \- wide-character classification
 .SH SYNOPSIS
@@ -78,7 +78,7 @@ The
 function is thread-safe with exceptions.
 It can be safely used in multithreaded applications, as long as
 .BR setlocale (3)
-is not called to change the locale.
+is not called to change the locale during its execution.
 .SH CONFORMING TO
 C99.
 .SH NOTES
diff --git a/man3/wcwidth.3 b/man3/wcwidth.3
index b689eed..61925c8 100644
--- a/man3/wcwidth.3
+++ b/man3/wcwidth.3
@@ -12,7 +12,7 @@
 .\"   Dinkumware C library reference http://www.dinkumware.com/
 .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.or=
g/online.html
 .\"
-.TH WCWIDTH 3  2013-11-04 "GNU" "Linux Programmer's Manual"
+.TH WCWIDTH 3  2014-01-22 "GNU" "Linux Programmer's Manual"
 .SH NAME
 wcwidth \- determine columns needed for a wide character
 .SH SYNOPSIS
@@ -49,7 +49,7 @@ The
 function is thread-safe with exceptions.
 It can be safely used in multithreaded applications, as long as
 .BR setlocale (3)
-is not called to change the locale.
+is not called to change the locale during its execution.
 .SH CONFORMING TO
 POSIX.1-2001.
=20
--=20
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
