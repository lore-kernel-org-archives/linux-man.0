From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: locale.5: Complete LC_COLLATE
Date: Tue, 26 Apr 2016 22:55:51 +0300
Message-ID: <571FC7C7.1070402@redhat.com>
Reply-To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Mike Fabian <mfabian-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

Here's the first attempt to (almost) complete the locale.5 manual page
by documenting all (but perhaps one) of the missing LC_COLLATE keywords.

I think the LC_COLLATE section is still not enough to be used as the
only source when writing collation rules from scratch but perhaps
that's not even needed, it could be also thought that the section 5
pages merely describe the format used in the files. Naturally more
information could be added later on top of this patch.

Few notes:

- AFAICS coll_weight_max is not used anywhere in glibc
- I'm not aware of any C library implementation on Linux (for which
this manual page would be relevant) which would implement the POSIX
options not supported by glibc
- the glibc specific script keyword could still be documented

Sources:

http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap07.html
http://www.open-std.org/jtc1/SC22/WG20/docs/n972-14652ft.pdf

PS. A couple of unrelated comment clean-ups slipped in as well, sorry
about those.

---
 man5/locale.5 | 45 +++++++++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/man5/locale.5 b/man5/locale.5
index e451798..ad2aac0 100644
--- a/man5/locale.5
+++ b/man5/locale.5
@@ -114,14 +114,14 @@ the GNU C library supports the following nonstandard categories:
 See
 .BR locale (7)
 for a more detailed description of each category.
-.\"
+
 .SS LC_ADDRESS
 The definition starts with the string
 .I LC_ADDRESS
 in the first column.
 
 The following keywords are allowed:
-.\" Thanks to the kind folk who wrote localedata/locales/uk_UA
+.\" From localedata/locales/uk_UA
 .TP
 .I postal_fmt
 followed by a string containing field descriptors that define
@@ -494,20 +494,20 @@ The
 definition ends with the string
 .IR "END LC_CTYPE" .
 .SS LC_COLLATE
-Due to limitations of glibc not all POSIX-options are implemented.
+Note that glibc does not support all POSIX-defined options,
+only the options described below are supported (as of glibc 2.23).
 
 The definition starts with the string
 .I LC_COLLATE
 in the first column.
 
 The following keywords are allowed:
-.\" FIXME The following LC_COLLATE keywords are not documented:
-.\" 	reorder-after
-.\" 	reorder-end
-.\" 	reorder-sections-after
-.\" 	reorder-sections-end
+.\" FIXME The following glibc LC_COLLATE keywords are not documented:
 .\" 	script
-.\" 	symbol-equivalence
+.TP
+.I coll_weight_max
+followed by the number representing used collation levels.
+This keyword is recognized but ignored by glibc.
 .TP
 .I collating-element
 followed by the definition of a collating-element symbol
@@ -516,8 +516,25 @@ representing a multicharacter collating element.
 .I collating-symbol
 followed by the definition of a collating symbol
 that can be used in collation order statements.
+.TP
+.I reorder-after
+followed by a redefinition of a collation rule.
+.TP
+.I reorder-end
+marks the end of the redefinition of a collation rule.
+.TP
+.I section
+followed by a section of collation order statements.
+.TP
+.I section-symbol
+followed by a section symbol representing a set of collation order
+statements.
+.TP
+.I symbol-equivalence
+followed by a collating-symbol to be equivalent to another defined
+collating-symbol.
 .PP
-The order-definition starts with a line:
+The collation rule definition starts with a line:
 .TP
 .I order_start
 followed by a list of keywords chosen from
@@ -525,8 +542,8 @@ followed by a list of keywords chosen from
 .BR backward ,
 or
 .BR position .
-The order definition consists of lines that describe the order
-and is terminated with the keyword
+The order definition consists of lines that describe the collation
+order and is terminated with the keyword
 .IR order_end .
 .PP
 The
@@ -878,7 +895,7 @@ The allowed keywords are as follows:
 followed by a string containing field descriptors that define
 the format used for names in the locale.
 The following field descriptors are recognized:
-.\" From localedata/locales/uk_UA:
+.\" From localedata/locales/uk_UA
 .RS
 .TP 4
 %f
@@ -1233,7 +1250,7 @@ The default value is
 See NOTES.
 .TP
 .I cal_direction
-.\" from localedata/locales/uk_UA
+.\" From localedata/locales/uk_UA
 followed by a plain number value that indicates the direction for the
 display of calendar dates, as follows:
 .RS

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
