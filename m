From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: locale.5: refer to existing locales for encoding details
Date: Mon, 7 Aug 2017 12:24:03 +0300
Message-ID: <fa7e937e-c7da-ec76-d223-e99f6f491956@redhat.com>
Reply-To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Fabian <mfabian-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rafal Luzynski <digitalfreak-cEmE2lDo5IzOujdQFTu3xwC/G2K4zDHf@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

Mike and Rafał (CC'ed) were recently named as glibc localedata
maintainers [1] and after that there's been active development on
this front, including discussion whether it would be ok to use
ASCII or some other encoding as values for actual locate data.

Since I don't think it would make sense to try to have different
explanation for each glibc version on the locale(5) man page, I'm
proposing that we apply the below patch so that we refer to existing
locale definition files in general and not spell out the exact format
or any certain locale as a definitive guideline.

If the situation changes in the future or new a new convention meant
to last forever is created then perhaps Mike and Rafał can provide an
update then as needed.

1) https://sourceware.org/ml/libc-alpha/2017-07/msg00477.html
2) https://sourceware.org/ml/libc-alpha/2017-07/msg00807.html

---
 man5/locale.5 | 51 ++++++++++-----------------------------------------
 1 file changed, 10 insertions(+), 41 deletions(-)

diff --git a/man5/locale.5 b/man5/locale.5
index 3fff4f1..4816796 100644
--- a/man5/locale.5
+++ b/man5/locale.5
@@ -68,19 +68,9 @@ where a
 .I copy
 statement can be followed by locale-specific rules and selected overrides.
 .PP
-When defining a category from scratch, all field descriptors and strings
-should be defined as Unicode code points in angle brackets, unless
-otherwise stated below.
-For example, "€" is to be presented as "<U20AC>", "%a" as
-"<U0025><U0061>", and "Monday" as
-"<U0053><U0075><U006E><U0064><U0061><U0079>".
-Values defined as Unicode code points must be in double quotes, plain
-number values are not quoted (but
-.BR LC_CTYPE
-and
-.BR LC_COLLATE
-follow special formatting, see the system-provided locale files for
-examples).
+When defining a locale or a category from scratch, an existing system-
+provided locale definition file should be used as a reference to follow
+common glibc conventions.
 .SS Locale category sections
 The following category sections are defined by POSIX:
 .IP * 3
@@ -121,7 +111,6 @@ The definition starts with the string
 in the first column.

 The following keywords are allowed:
-.\" From localedata/locales/uk_UA
 .TP
 .I postal_fmt
 followed by a string containing field descriptors that define
@@ -209,7 +198,7 @@ followed by the two-letter abbreviation of the
country (ISO 3166).
 followed by the three-letter abbreviation of the country (ISO 3166).
 .TP
 .I country_num
-followed by the numeric country code as plain numbers (ISO 3166).
+followed by the numeric country code (ISO 3166).
 .TP
 .I country_car
 followed by the international licence plate country code.
@@ -422,8 +411,6 @@ Each mapping is a pair of a lowercase and an
uppercase letter
 separated with a
 .B ,
 and enclosed in parentheses.
-The members of the list are separated
-with semicolons.
 .TP
 .I tolower
 followed by a list of mappings from uppercase to lowercase
@@ -569,8 +556,6 @@ The definition starts with the string
 .I LC_IDENTIFICATION
 in the first column.

-The values in this category are defined as plain strings.
-
 The following keywords are allowed:
 .TP
 .I title
@@ -697,16 +682,6 @@ The definition starts with the string
 .I LC_MONETARY
 in the first column.

-Values for
-.IR int_curr_symbol ,
-.IR currency_symbol ,
-.IR mon_decimal_point ,
-.IR mon_thousands_sep ,
-.IR positive_sign ,
-and
-.IR negative_sign
-are defined as Unicode code points, the others as plain numbers.
-
 The following keywords are allowed:
 .TP
 .I int_curr_symbol
@@ -910,7 +885,6 @@ The allowed keywords are as follows:
 followed by a string containing field descriptors that define
 the format used for names in the locale.
 The following field descriptors are recognized:
-.\" From localedata/locales/uk_UA
 .RS
 .TP 4
 %f
@@ -998,8 +972,8 @@ followed by the string that will be used as a group
separator
 when formatting numeric quantities.
 .TP
 .I grouping
-followed by a sequence of integers as plain numbers separated by
-semicolons that describe the formatting of numeric quantities.
+followed by a sequence of integers separated by semicolons
+that describe the formatting of numeric quantities.
 .IP
 Each integer specifies the number of digits in a group.
 The first integer defines the size of the group immediately
@@ -1019,8 +993,6 @@ The definition starts with the string
 .I LC_PAPER
 in the first column.

-Values in this category are defined as plain numbers.
-
 The following keywords are allowed:
 .TP
 .I height
@@ -1044,7 +1016,6 @@ The following keywords are allowed:
 followed by a string that contains field descriptors that identify
 the format used to dial international numbers.
 The following field descriptors are recognized:
-.\" From localedata/locales/uk_UA
 .RS
 .TP 4
 %a
@@ -1232,7 +1203,7 @@ descriptor (see
 followed by the alternative digits used for date and time in the locale.
 .TP
 .I week
-followed by a list of three values as plain numbers:
+followed by a list of three values separated by semicolons:
 The number of days in a week (by default 7),
 a date of beginning of the week (by default corresponds to Sunday),
 and the minimal length of the first week in year (by default 4).
@@ -1249,7 +1220,7 @@ followed by the number of the first day from the
 list to be shown in calendar applications.
 The default value of
 .B 1
-(plain number) corresponds to either Sunday or Monday depending
+corresponds to either Sunday or Monday depending
 on the value of the second
 .I week
 list item.
@@ -1260,13 +1231,11 @@ followed by the number of the first working day
from the
 .I day
 list.
 The default value is
-.BR 2
-(plain number).
+.BR 2 .
 See NOTES.
 .TP
 .I cal_direction
-.\" From localedata/locales/uk_UA
-followed by a plain number value that indicates the direction for the
+followed by a number value that indicates the direction for the
 display of calendar dates, as follows:
 .RS
 .TP 4

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
