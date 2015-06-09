From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] locale.5: remove the FIXME for timezone
Date: Tue, 09 Jun 2015 17:19:14 +0300
Message-ID: <5576F5E2.7050301@redhat.com>
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

the timezone of LC_TIME is not in POSIX, only 6 (out of ~300)
glibc locales define it, the glibc code comment below from
glibc.git/programs/ld-time.c seems to suggest it's not a good
idea, and there's been a proposal in upstream [1] to remove the
existing timezone definitions from glibc locales so I think
it's actually better to leave this one undocumented:

/* XXX We don't perform any tests on the timezone value since this is
   simply useless, stupid $&$!@...  */

1) https://sourceware.org/ml/libc-alpha/2015-06/msg00098.html

Move the remaining LC_COLLATE FIXMEs together while at it.

---
 man5/locale.5 |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/man5/locale.5 b/man5/locale.5
index 2a2edc1..556c745 100644
--- a/man5/locale.5
+++ b/man5/locale.5
@@ -512,6 +512,10 @@ in the first column.
 
 The following keywords are allowed:
 .\" FIXME The following LC_COLLATE keywords are not documented:
+.\" 	reorder-after
+.\" 	reorder-end
+.\" 	reorder-sections-after
+.\" 	reorder-sections-end
 .\" 	script
 .\" 	symbol-equivalence
 .TP
@@ -534,11 +538,6 @@ or
 The order definition consists of lines that describe the order
 and is terminated with the keyword
 .IR order_end .
-.\" FIXME The following LC_COLLATE keywords are not documented:
-.\" 	reorder-after
-.\" 	reorder-end
-.\" 	reorder-sections-after
-.\" 	reorder-sections-end
 .PP
 The
 .B LC_COLLATE
@@ -1073,7 +1072,6 @@ The following keywords are allowed:
 .\"	era_d_fmt
 .\"	era_d_t_fmt
 .\"	era_t_fmt
-.\"	timezone
 .TP
 .I abday
 followed by a list of abbreviated names of the days of the week.

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
