From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: charmap.5: clarify keyword syntax
Date: Mon, 13 Jun 2016 10:20:05 +0300
Message-ID: <575E5EA5.6050707@redhat.com>
Reply-To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

The patch below updates charmap.5 to match the syntax all the glibc
charmap files are using currently.

---
 man5/charmap.5 | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/man5/charmap.5 b/man5/charmap.5
index 31e3cb4..f43d5a5 100644
--- a/man5/charmap.5
+++ b/man5/charmap.5
@@ -49,9 +49,9 @@ The default value is 1.
 .I <mb_cur_min>
 is followed by the minimum number of bytes for a character.
 This value must be less than or equal than
-.IR mb_cur_max .
+.IR <mb_cur_max> .
 If not specified, it defaults to
-.IR mb_cur_max .
+.IR <mb_cur_max> .
 .PP
 The character set definition section starts with the keyword
 .I CHARMAP
@@ -60,14 +60,14 @@ in the first column.
 The following lines may have one of the two following forms to
 define the character set:
 .TP
-.I <character> <byte-sequence> <comment>
+.I <character> byte-sequence comment
 This form defines exactly one character and its byte sequence,
-.I <comment>
+.I comment
 being optional.
 .TP
-.I <character>..<character> <byte-sequence> <comment>
+.I <character>..<character> byte-sequence comment
 This form defines a character range and its byte sequence,
-.I <comment>
+.I comment
 being optional.
 .PP
 The character set definition section ends with the string
@@ -77,7 +77,7 @@ The character set definition section may optionally be followed by a
 section to define widths of characters.
 .PP
 The
-.B WIDTH_DEFAULT
+.I WIDTH_DEFAULT
 keyword can be used to define the default width for all characters
 not explicitly listed.
 The default character width is 1.
@@ -89,10 +89,10 @@ in the first column.
 The following lines may have one of the two following forms to
 define the widths of the characters:
 .TP
-.I <character> <width>
+.I <character> width
 This form defines the width of exactly one character.
 .TP
-.I <character>...<character> <width>
+.I <character>...<character> width
 This form defines the width for all the characters in the range.
 .PP
 The width definition section ends with the string
@@ -109,7 +109,7 @@ The Euro sign is defined as follows in the
 charmap:
 .PP
 .nf
-<U20AC>     /xe2/x82/xac
+<U20AC>     /xe2/x82/xac EURO SIGN
 .fi
 .SH SEE ALSO
 .BR iconv (1),

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
