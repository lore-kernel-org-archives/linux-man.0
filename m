From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] locale.7: LC_CTYPE determines transliteration rules on glibc
 systems
Date: Tue, 12 May 2015 16:57:49 +0300
Message-ID: <555206DD.3070804@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


---
 man7/locale.7 |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/man7/locale.7 b/man7/locale.7
index 954d8cc..18e9cfe 100644
--- a/man7/locale.7
+++ b/man7/locale.7
@@ -95,6 +95,12 @@ the German sharp s is sorted as "ss".
 This category determines the interpretation of byte sequences as characters
 (e.g., single versus multibyte characters), character classifications
 (e.g., alphabetic or digit), and the behavior of character classes.
+On glibc systems this category also determines
+the character transliteration rules
+for
+.BR iconv (1)
+and
+.BR iconv (3).
 It changes the behavior of the character handling and
 classification functions, such as
 .BR isupper (3)
@@ -366,10 +372,12 @@ POSIX.1-2001.
 .\"
 .\" The GNU gettext functions are specified in LI18NUX2000.
 .SH SEE ALSO
+.BR iconv (1),
 .BR locale (1),
 .BR localedef (1),
 .BR catopen (3),
 .BR gettext (3),
+.BR iconv (3),
 .BR localeconv (3),
 .BR mbstowcs (3),
 .BR newlocale (3),
-- 
1.7.1
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
