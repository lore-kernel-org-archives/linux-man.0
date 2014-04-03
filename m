From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] locale.5: various minor fixes
Date: Thu,  3 Apr 2014 19:15:37 -0400
Message-ID: <1396566937-26334-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

Please find attach various minor fixes:
- consistency fixes;
- punctuation fixes;
- typo fixes;
- format fixes;
- usage fix;
- American spelling convention.

Regards

David
---
 man5/locale.5 | 38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/man5/locale.5 b/man5/locale.5
index cb09900..e699088 100644
--- a/man5/locale.5
+++ b/man5/locale.5
@@ -85,10 +85,8 @@ the GNU C library supports the following nonstandard categories:
 .IP *
 .B LC_TELEPHONE
 .SS LC_ADDRESS
-The definition for the
+The definition starts with the string
 .B LC_ADDRESS
-category starts with the string
-.I LC_ADDRESS
 in the first column.
 
 The following keywords are allowed:
@@ -170,7 +168,7 @@ entity.
 .TP
 .I country_name
 followed by the country name in the language of the current document
-(e.g., "Deutschland for the
+(e.g., "Deutschland" for the
 .IR de_DE
 locale).
 .TP
@@ -203,17 +201,15 @@ followed by the three-letter abbreviation of the language (ISO 639-2).
 .TP
 .I lang_lib
 followed by the three-letter abbreviation of the language for
-library use (ISO 639-2)
+library use (ISO 639-2).
 .PP
 The
 .B LC_ADDRESS
 definition ends with the string
 .IR "END LC_ADDRESS" .
 .SS LC_CTYPE
-The definition for the
+The definition starts with the string
 .B LC_CTYPE
-category starts with the string
-.I LC_CTYPE
 in the first column.
 
 The following keywords are allowed:
@@ -470,7 +466,7 @@ in the first column.
 The following keywords are allowed:
 .TP
 .I title
-followed by the title of ths locale document
+followed by the title of the locale document
 (e.g., "Maori language locale for New Zealand").
 .TP
 .I source
@@ -492,7 +488,7 @@ followed by the telephone number (in international format)
 of the organization that maintains this document.
 .TP
 .I fax
-followed by the FAX number (in international format)
+followed by the fax number (in international format)
 of the organization that maintains this document.
 .TP
 .I language
@@ -529,7 +525,7 @@ a string that identifies this locale category definition,
 a semicolon, and
 .IP *
 one of the
-.I LC_*
+.BI LC_ *
 identifiers.
 .PP
 The
@@ -569,7 +565,7 @@ in the first column.
 The following keywords are allowed:
 .TP
 .I measurement
-folowed by number identifying the standard used for measurement.
+followed by number identifying the standard used for measurement.
 The following values are recognized:
 .RS
 .TP
@@ -911,7 +907,7 @@ The following field descriptors are recognized:
 .RS
 .TP
 %a
-Area code without nationwide prefix (the prefix is often "0").
+Area code without nationwide prefix (the prefix is often "00").
 .TP
 %A
 Area code including nationwide prefix.
@@ -926,7 +922,7 @@ Extension (to local number).
 Country code.
 .TP
 %C
-Alternate carrier service code used for dialling abroad.
+Alternate carrier service code used for dialing abroad.
 .TP
 %t
 If the preceding field descriptor resulted in an empty string,
@@ -936,7 +932,7 @@ then the empty string, otherwise a space character.
 .I tel_dom_fmt
 followed by a string that contains field descriptors that identify
 the format used to dial domestic numbers.
-The recognized field descriptrs are the same as for
+The recognized field descriptors are the same as for
 .IR tel_int_fmt .
 .TP
 .I int_select
@@ -1040,14 +1036,14 @@ followed by a value that indicates the direction for the
 display of calendar dates, as follows:
 .RS
 .TP
-1
-left-right from top
+.B 1
+Left-right from top.
 .TP
-2
-top-down from left
+.B 2
+Top-down from left.
 .TP
-3
-right-left from top
+.B 3
+Right-left from top.
 .RE
 .TP
 .I date_fmt
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
