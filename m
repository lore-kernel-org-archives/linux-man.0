From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] locale.5: describe the formats of values
Date: Mon, 20 Oct 2014 08:25:27 +0300
Message-ID: <54449CC7.7090206@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

locale(5) described what a locale should define but didn't spell out ho=
w (in what format). The patch below attempts to address this, it also h=
as few trivial additional enhancements.

---

Reference to locale(7) for category descriptions.

Clarify first_workday in NOTES a bit.

Add upstream BZ reference for two missing LC_ADDRESS fields.
---
 man5/locale.5 |   73 ++++++++++++++++++++++++++++++++++++++++++-------=
--------
 1 files changed, 54 insertions(+), 19 deletions(-)

diff --git a/man5/locale.5 b/man5/locale.5
index 5bdb728..80e23ff 100644
--- a/man5/locale.5
+++ b/man5/locale.5
@@ -1,3 +1,4 @@
+'\" t -*- coding: UTF-8 -*-
 .\" Copyright (C) 1994  Jochen Hein (Hein-SVAqIv1tV6Auki3NsKDZl5HjxUfvIkdz@public.gmane.org)
 .\" Copyright (C) 2008  Petr Baudis (pasky-AlSwsSmVLrQ@public.gmane.org)
 .\" Copyright (C) 2014 Michael Kerrisk <mtk@manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
@@ -54,7 +55,22 @@ can be defined from scratch.
 If the category should be copied,
 the only valid keyword in the definition is
 .B copy
-followed by the name of the locale which should be copied.
+followed by the name of the locale in double quotes which should be
+copied.
+.PP
+When defining a category from scratch, all field descriptors and strin=
gs
+should be defined as Unicode code points in angle brackets, unless
+otherwise stated below.
+For example, "=80" is to be presented as "<U20AC>", "%a" as
+"<U0025><U0061>", and "Monday" as
+"<U0053><U0075><U006E><U0064><U0061><U0079>".
+Values defined as Unicode code points must be in double quotes, plain
+number values are not quoted (but
+.BR LC_CTYPE
+and
+.BR LC_COLLATE
+follow special formatting, see system provided locale files for
+examples).
 .SS Locale category sections
 The following category sections are defined by POSIX:
 .IP * 3
@@ -84,6 +100,11 @@ the GNU C library supports the following nonstandar=
d categories:
 .B LC_PAPER
 .IP *
 .B LC_TELEPHONE
+.PP
+See
+.BR locale (7)
+for more detailed description of each category.
+
 .SS LC_ADDRESS
 The definition starts with the string
 .B LC_ADDRESS
@@ -106,6 +127,8 @@ The following field descriptors are recognized:
 .\" .B LC_NAME
 .\" .I name_fmt
 .\" keyword.
+.\"
+.\" https://sourceware.org/bugzilla/show_bug.cgi?id=3D16983
 .TP
 %a
 Care of person, or organization.
@@ -146,6 +169,8 @@ Country designation, from the <country_post> keywor=
d.
 .\"	 BUG: %l escape sequence from ISO/IEC 14652:2002 is not
 .\"	supported by glibc
 .\" Local township within town or city.
+.\"
+.\" https://sourceware.org/bugzilla/show_bug.cgi?id=3D16983
 .TP
 %z
 Zip number, postal code.
@@ -182,13 +207,13 @@ followed by the two-letter abbreviation of the co=
untry (ISO 3166).
 followed by the three-letter abbreviation of the country (ISO 3166).
 .TP
 .I country_num
-followed by the numeric country code (ISO 3166).
+followed by the numeric country code as plain numbers (ISO 3166).
 .TP
 .I country_car
 followed by the code for the country car number.
 .TP
 .I country_isbn
-followed by the ISBN code (for books).
+followed by the ISBN code as plain numbers (for books).
 .TP
 .I lang_name
 followed by the language name in the language of the current document.
@@ -412,12 +437,7 @@ The
 definition ends with the string
 .IR "END LC_CTYPE" .
 .SS LC_COLLATE
-.\" FIXME The description of LC_COLLATE lacks a lot of details
-The
-.B LC_COLLATE
-category defines the rules for collating characters.
-Due to
-limitations of libc not all POSIX-options are implemented.
+Due to limitations of glibc not all POSIX-options are implemented.
=20
 The definition starts with the string
 .B LC_COLLATE
@@ -458,12 +478,12 @@ The
 definition ends with the string
 .IR "END LC_COLLATE" .
 .SS LC_IDENTIFICATION
-This category contains meta-information about the locale definition.
-
 The definition starts with the string
 .B LC_IDENTIFICATION
 in the first column.
=20
+The values in this category are defined as plain strings.
+
 The following keywords are allowed:
 .TP
 .I title
@@ -586,6 +606,16 @@ The definition starts with the string
 .B LC_MONETARY
 in the first column.
=20
+Values for
+.IR int_curr_symbol ,
+.IR currency_symbol ,
+.IR mon_decimal_point ,
+.IR mon_thousands_sep ,
+.IR positive_sign ,
+and
+.IR negative_sign
+are defined as Unicode code points, the others as plain numbers.
+
 The following keywords are allowed:
 .TP
 .I int_curr_symbol
@@ -877,8 +907,8 @@ followed by the string that will be used as a group=
 separator
 when formatting numeric quantities.
 .TP
 .I grouping
-followed by a sequence of integers separated by semicolons that
-describe the formatting of numeric quantities.
+followed by a sequence of integers as plain numbers separated by=20
+semicolons that describe the formatting of numeric quantities.
 .IP
 Each integer specifies the number of digits in a group.
 The first integer defines the size of the group immediately
@@ -898,6 +928,8 @@ The definition starts with the string
 .B LC_PAPER
 in the first column.
=20
+Values in this category are defined as plain numbers.
+
 The following keywords are allowed:
 .TP
 .I height
@@ -1020,7 +1052,7 @@ followed by the appropriate time format when usin=
g 12h clock format.
 This should be left empty for locales not using AM/PM convention.
 .TP
 .I week
-followed by a list of three values:
+followed by a list of three values as plain numbers:
 The number of days in a week (by default 7),
 a date of beginning of the week (by default corresponds to Sunday),
 and the minimal length of the first week in year (by default 4).
@@ -1037,7 +1069,7 @@ followed by the number of the first day from the
 list to be shown in calendar applications.
 The default value of
 .B 1
-corresponds to either Sunday or Monday depending
+(plain number) corresponds to either Sunday or Monday depending
 on the value of the second
 .I week
 list item.
@@ -1048,12 +1080,13 @@ followed by the number of the first working day=
 from the
 .I day
 list.
 The default value is
-.BR 2 .
+.BR 2=20
+(plain number).
 See NOTES.
 .TP
 .I cal_direction
 .\" from localedata/locales/uk_UA
-followed by a value that indicates the direction for the
+followed by a plain number value that indicates the direction for the
 display of calendar dates, as follows:
 .RS
 .TP
@@ -1122,12 +1155,14 @@ and
 .I day
 lists appropriately, and set
 .I first_weekday
+and
+.I first_workday
 to
 .B 1
 or
 .BR 2 ,
-depending on whether the week actually starts on Sunday or Monday
-for the locale.
+depending on whether the week and work week actually starts on Sunday =
or
+Monday for the locale.
 .SH BUGS
 This manual page isn't complete.
 .\" .SH AUTHOR
--=20
1.7.1


--=20
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
