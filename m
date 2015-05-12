From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] locale.5: document outdigit and alt_digits
Date: Tue, 12 May 2015 16:58:08 +0300
Message-ID: <555206F0.5020103@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

See e.g. fa_IR for reference.

---
 man5/locale.5 |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/man5/locale.5 b/man5/locale.5
index b7e1d15..5a540f8 100644
--- a/man5/locale.5
+++ b/man5/locale.5
@@ -244,7 +244,6 @@ in the first column.
 The following keywords are allowed:
 .\" FIXME The following LC_CTYPE keywords are not documented:
 .\"	translit_start + translit_end
-.\"	outdigit
 .\"	include
 .\"	map (to_inpunct, to_outpunct)
 .TP
@@ -437,6 +436,9 @@ which are then to be defined in the locale.
 .I charconv
 followed by a list of locale-specific character map names
 which are then to be defined in the locale.
+.TP
+.I outdigit
+followed by a list of alternate output digits for the locale.
 .PP
 The
 .B LC_CTYPE
@@ -1109,6 +1111,9 @@ Right-left from top.
 .I date_fmt
 followed by the appropriate date representation for
 .BR date (1).
+.TP
+.I alt_digits
+followed by the alternative digits used for date and time in the locale.
 .PP
 The
 .B LC_TIME
-- 
1.7.1
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
