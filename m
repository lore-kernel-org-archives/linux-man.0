From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] unicode.7: update to reflect past developments
Date: Tue, 10 Jun 2014 11:39:52 +0300
Message-ID: <5396C458.2050000@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "H. Peter Anvin" <hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Markus Kuhn <mgk25-kDbDZe0LBGWFxr2TtlUqVg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

the unicode(7) page will look more modern with few small changes, please see below.

>From a3e9003950b6226b83ec319639bd8ecb9932275b Mon Sep 17 00:00:00 2001
From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date: Mon, 9 Jun 2014 17:03:38 +0300
Subject: [PATCH] unicode.7: update to reflect past developments

- drop old BUGS section, editors cope with UTF-8 ok these days,
  and perhaps the state-of-the-art is better described elsewhere
  anyway than in a man page
- drop old suggestion about avoiding combined characters
- refer to LANANA for Linux zone, add registry file reference
- drop a reference to an inactive/dead mailing list
- update some reference URLs
---
 man7/unicode.7 |   43 ++++++++-----------------------------------
 1 files changed, 8 insertions(+), 35 deletions(-)

diff --git a/man7/unicode.7 b/man7/unicode.7
index 3eb1054..2fd8407 100644
--- a/man7/unicode.7
+++ b/man7/unicode.7
@@ -213,14 +213,6 @@ and
 tells, how many positions (0\(en2) the cursor is advanced by the
 output of a character.
 .PP
-Under Linux, in general only the BMP at implementation level 1 should
-be used at the moment.
-Up to two combining characters per base
-character for certain scripts (in particular Thai) are also supported
-by some UTF-8 terminal emulators and ISO 10646 fonts (level 2), but in
-general precomposed characters should be preferred where available
-(Unicode calls this
-.BR "Normalization Form C" ).
 .SS Private area
 In the
 .BR BMP ,
@@ -232,8 +224,10 @@ range 0xe000 to 0xefff which can be used individually by any end-user
 and the Linux zone in the range 0xf000 to 0xf8ff where extensions are
 coordinated among all Linux users.
 The registry of the characters
-assigned to the Linux zone is currently maintained by H. Peter Anvin
-<Peter.Anvin-Xh+NVF5n0LLYtjvyW6yDsg@public.gmane.org>.
+assigned to the Linux zone is maintained by LANANA and the registry
+itself is
+.I Documentation/unicode.txt
+in the Linux kernel sources.
 .SS Literature
 .TP 0.2i
 *
@@ -244,7 +238,7 @@ for Standardization, Geneva, 2000.
 
 This is the official specification of
 .BR UCS .
-Available as a PDF file on CD-ROM from
+Available from
 .UR http://www.iso.ch/
 .UE .
 .TP
@@ -267,7 +261,7 @@ which improved wide and multibyte character support even further.
 *
 Unicode Technical Reports.
 .RS
-.UR http://www.unicode.org\:/unicode\:/reports/
+.UR http://www.unicode.org\:/reports/
 .UE
 .RE
 .TP
@@ -276,39 +270,18 @@ Markus Kuhn: UTF-8 and Unicode FAQ for UNIX/Linux.
 .RS
 .UR http://www.cl.cam.ac.uk\:/~mgk25\:/unicode.html
 .UE
-
-Provides subscription information for the
-.I linux-utf8
-mailing list, which is the best place to look for advice on using
-Unicode under Linux.
 .RE
 .TP
 *
 Bruno Haible: Unicode HOWTO.
 .RS
-.UR ftp://ftp.ilog.fr\:/pub\:/Users\:/haible\:/utf8\:/Unicode-HOWTO.html
+.UR http://www.tldp.org\:/HOWTO\:/Unicode-HOWTO.html
 .UE
 .RE
-.SH BUGS
-When this man page was last revised, the GNU C Library support for
-.B UTF-8
-locales was mature and XFree86 support was in an advanced state, but
-work on making applications (most notably editors) suitable for use in
-.B UTF-8
-locales was still fully in progress.
-Current general
-.B UCS
-support under Linux usually provides for CJK double-width characters
-and sometimes even simple overstriking combining characters, but
-usually does not include support for scripts with right-to-left
-writing direction or ligature substitution requirements such as
-Hebrew, Arabic, or the Indic scripts.
-These scripts are currently
-supported only in certain GUI applications (HTML viewers, word processors)
-with sophisticated text rendering engines.
 .\" .SH AUTHOR
 .\" Markus Kuhn <mgk25-kDbDZe0LBGWFxr2TtlUqVg@public.gmane.org>
 .SH SEE ALSO
+.BR locale (1),
 .BR setlocale (3),
 .BR charsets (7),
 .BR utf-8 (7)
-- 
1.7.1

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
