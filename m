From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] charmap.5: update to match current glibc
Date: Wed, 04 Jun 2014 08:53:18 +0300
Message-ID: <538EB44E.1050101@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Jochen Hein <Hein-SVAqIv1tV6Auki3NsKDZl5HjxUfvIkdz@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

charmap(5) hadn't been updated for years, let's make it helpful again.

>From 925c36aefc0a46ce1892039a95fa9a0151018705 Mon Sep 17 00:00:00 2001
From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date: Mon, 2 Jun 2014 16:37:43 +0300
Subject: [PATCH] charmap.5: update to match current glibc

charmap(5) was outdated, bring it to closer to reality by fixing
syntax description to match current glibc code and practices, add
missing options, remove obsolete comments and references, and
remove now incorrect examples.
---
 man5/charmap.5 |  156 +++++++++++++++++++++++++-------------------------------
 1 files changed, 70 insertions(+), 86 deletions(-)

diff --git a/man5/charmap.5 b/man5/charmap.5
index cc95f4a..9b78fca 100644
--- a/man5/charmap.5
+++ b/man5/charmap.5
@@ -1,5 +1,3 @@
-.\" This file is part of locale(1) which displays the settings of the
-.\" current locale.
 .\" Copyright (C) 1994  Jochen Hein (Hein-SVAqIv1tV6Auki3NsKDZl5HjxUfvIkdz@public.gmane.org)
 .\"
 .\" %%%LICENSE_START(GPLv2+_SW_3_PARA)
@@ -18,112 +16,98 @@
 .\" <http://www.gnu.org/licenses/>.
 .\" %%%LICENSE_END
 .\"
-.TH CHARMAP 5 1994-11-28 "" "Linux User Manual"
+.TH CHARMAP 5 2014-06-02 "GNU" "Linux Programmer's Manual"
 .SH NAME
-charmap \- character symbols to define character encodings
+charmap \- characters to define character sets
 .SH DESCRIPTION
-A character set description (charmap) defines a character set of
-available characters and their encodings.
-All supported character
-sets should have the
-.B portable character set
-as a proper subset.
-.\" Not true anymore:
-.\" The portable character set is defined in the file
-.\" .I /usr/lib/nls/charmap/POSIX
-.\" .I /usr/share/i18n/charmap/POSIX
-.\" for reference purposes.
+A character set description (charmap) defines all available characters
+and their encodings in a character set.
+All ISO C compliant character sets should have
+the ASCII character set as a proper subset.
 .SS Syntax
-The charmap file starts with a header, that may consist of the
+The charmap file starts with a header that may consist of the
 following keywords:
 .TP
-.I <codeset>
-is followed by the name of the codeset.
+.I <code_set_name>
+is followed by the name of the character map.
+.TP
+.I <comment_char>
+is followed by a character that will be used as the comment character
+for the rest of the file.
+It defaults to the number sign (#).
+.TP
+.I <escape_char>
+is followed by a character that should be used as the escape character
+for the rest of the file to mark characters that should be interpreted
+in a special way.
+It defaults to the backslash (\\).
 .TP
 .I <mb_cur_max>
-is followed by the max number of bytes for a multibyte-character.
-Multibyte characters are currently not supported.
-The default value
-is 1.
+is followed by the maximum number of bytes for a character.
+The default value is 1.
 .TP
 .I <mb_cur_min>
-is followed by the min number of bytes for a character.
-This
-value must be less than or equal than
-.BR mb_cur_max .
+is followed by the minimum number of bytes for a character.
+This value must be less than or equal than
+.IR mb_cur_max .
 If not specified, it defaults to
-.BR mb_cur_max .
-.TP
-.I <escape_char>
-is followed by a character that should be used as the
-escape-character for the rest of the file to mark characters that
-should be interpreted in a special way.
-It defaults to
-the backslash (
-.B \\\\
-).
-.TP
-.I <comment_char>
-is followed by a character that will be used as the
-comment-character for the rest of the file.
-It defaults to the
-number sign (
-.B #
-).
+.IR mb_cur_max .
 .PP
-The charmap-definition itself starts with the keyword
+The character set definition section starts with the keyword
 .B CHARMAP
-in column 1.
+in the first column.

 The following lines may have one of the two following forms to
-define the character-encodings:
+define the character set:
 .TP
-.I <symbolic-name> <encoding> <comments>
-This form defines exactly one character and its encoding.
+.I <character> <byte-sequence> <comment>
+This form defines exactly one character and its byte sequence,
+.I <comment>
+being optional.
 .TP
-.I <symbolic-name>...<symbolic-name> <encoding> <comments>
-This form defines a couple of characters.
-This is useful only for
-multibyte-characters, which are currently not implemented.
+.I <character>..<character> <byte-sequence> <comment>
+This form defines a character range and its byte sequence,
+.I <comment>
+being optional.
 .PP
-The last line in a charmap-definition file must contain
-.B END CHARMAP.
-.SS Symbolic names
-A
-.B symbolic name
-for a character contains only characters of the
-.B portable character set.
-The name itself is enclosed between angle brackets.
-Characters following an
-.B <escape_char>
-are interpreted as itself; for example, the sequence
-.B "<\\\\\\\\\\\\>>"
-represents the symbolic name
-.B "\\\\>"
-enclosed in angle brackets.
-.SS Character encoding
-The
-encoding may be in each of the following three forms:
-.TP
-.I <escape_char>d<number>
-with a decimal number
+The character set definition section ends with the string
+.IR "END CHARMAP" .
+.PP
+The character set definition section may optionally be followed by a
+section to define widths of characters.
+.PP
+The width section starts with the keyword
+.B WIDTH
+in the first column.
+
+The following lines may have one of the two following forms to
+define the widths of the characters:
 .TP
-.I <escape_char>x<number>
-with a hexadecimal number
+.I <character> <width>
+This form defines the width of exactly one character.
 .TP
-.I <escape_char><number>
-with an octal number.
-.\" FIXME comments
-.\" FIXME char ... char
+.I <character>...<character> <width>
+This form defines the width for all the characters in the range.
+.PP
+The width definition section ends with the string
+.IR "END WIDTH" .
 .SH FILES
-.I /usr/share/i18n/charmaps/*
-.\" .SH AUTHOR
-.\" Jochen Hein (jochen.hein-JaLWT6YIeqAVwOsi8Avp+rNAH6kLmebB@public.gmane.org)
+.TP
+.I /usr/share/i18n/charmaps
+Usual default character map path.
 .SH CONFORMING TO
 POSIX.2.
+.SH EXAMPLE
+The Euro sign is defined as follows in the
+.I UTF\-8
+charmap:
+.PP
+.nf
+<U20AC>     /xe2/x82/xac
+.fi
 .SH SEE ALSO
+.BR iconv (1),
 .BR locale (1),
 .BR localedef (1),
-.BR localeconv (3),
-.BR setlocale (3),
-.BR locale (5)
+.BR locale (5),
+.BR charsets (7)
--
1.7.1

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
