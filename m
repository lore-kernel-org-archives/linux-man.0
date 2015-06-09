From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] strfmon.3: document strfmon_l(3)
Date: Tue, 09 Jun 2015 17:18:36 +0300
Message-ID: <5576F5BC.3010300@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

please find below an attempt to describe strfmon_l(3).

http://pubs.opengroup.org/onlinepubs/9699919799/functions/strfmon.html
---
 man3/strfmon.3   |   33 ++++++++++++++++++++++++++++++---
 man3/strfmon_l.3 |    1 +
 2 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 man3/strfmon_l.3

diff --git a/man3/strfmon.3 b/man3/strfmon.3
index 4964b36..1fcfbf0 100644
--- a/man3/strfmon.3
+++ b/man3/strfmon.3
@@ -23,23 +23,46 @@
 .\"
 .TH STRFMON 3  2015-03-02 "Linux" "Linux Programmer's Manual"
 .SH NAME
-strfmon \- convert monetary value to a string
+strfmon, strfmon_l \- convert monetary value to a string
 .SH SYNOPSIS
+.nf
 .B #include <monetary.h>
 .sp
 .BI "ssize_t strfmon(char *" s ", size_t " max ", const char *" format ,
 .B "...);"
+
+.BI "ssize_t strfmon_l(char *" s ", size_t " max ", locale_t " locale ", 
+.B const char *" format , "...);"
+.fi
 .SH DESCRIPTION
 The
 .BR strfmon ()
-function formats the specified amounts
-according to the format specification
+function formats the specified monetary amount
+according to the current locale
+and format specification
 .I format
 and places the
 result in the character array
 .I s
 of size
 .IR max .
+
+The
+.BR strfmon_l ()
+function performs the same task,
+but uses
+the locale specified by
+.IR locale .
+The behavior of
+.BR strfmon_l ()
+is undefined if
+.I locale
+is the special locale object
+.BR LC_GLOBAL_LOCALE
+(see
+.BR duplocale (3))
+or is not a valid locale object handle.
+
 .PP
 Ordinary characters in
 .I format
@@ -146,6 +169,9 @@ Interface	Attribute	Value
 T{
 .BR strfmon ()
 T}	Thread safety	MT-Safe locale
+T{
+.BR strfmon_l ()
+T}	Thread safety	MT-Safe
 .TE
 
 .SH CONFORMING TO
@@ -186,6 +212,7 @@ and Portuguese locales yield
 [ **1234$57Esc] [ **1.234$57PTE ]
 .in
 .SH SEE ALSO
+.BR duplocale (3),
 .BR setlocale (3),
 .BR sprintf (3),
 .BR locale (7)
diff --git a/man3/strfmon_l.3 b/man3/strfmon_l.3
new file mode 100644
index 0000000..cdbc310
--- /dev/null
+++ b/man3/strfmon_l.3
@@ -0,0 +1 @@
+.so man3/strfmon.3

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
