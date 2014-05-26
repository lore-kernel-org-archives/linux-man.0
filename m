From: Marko Myllynen <myllynen@redhat.com>
Subject: [PATCH] locale.5: document glibc conventions regarding days and week
Date: Mon, 26 May 2014 08:51:06 +0300
Message-ID: <5382D64A.9020404@redhat.com>
Reply-To: myllynen@redhat.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <libc-locales-return-2926-gclgl-libc-locales=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-locales-unsubscribe-gclgl-libc-locales=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-locales-subscribe@sourceware.org>
List-Post: <mailto:libc-locales@sourceware.org>
List-Help: <mailto:libc-locales-help@sourceware.org>, <http://sourceware.org/lists.html#faqs>
Sender: libc-locales-owner@sourceware.org
To: "mtk.manpages" <mtk.manpages@gmail.com>
Cc: Petr Baudis <pasky@ucw.cz>, GNU C Library <libc-alpha@sourceware.org>, linux-man@vger.kernel.org, libc-locales@sourceware.org
List-Id: linux-man@vger.kernel.org

Hi,

let's document glibc de facto current interpretation of handling weekdays also on the locale(5) man page, based on Petr's research in the past, currently documented in the glibc Locales wiki page.

>From fc28ef135148e0b6c6546666422cc9999e64bfc3 Mon Sep 17 00:00:00 2001
From: Marko Myllynen <myllynen@redhat.com>
Date: Mon, 26 May 2014 08:42:23 +0300
Subject: [PATCH] locale.5: document glibc conventions regarding days and week

Based on existing practice and glibc community wiki page at

https://sourceware.org/glibc/wiki/Locales
---
 man5/locale.5 |   69 +++++++++++++++++++++++++++++++++++++++++++-------------
 1 files changed, 53 insertions(+), 16 deletions(-)

diff --git a/man5/locale.5 b/man5/locale.5
index 2ad8e59..1b0f57d 100644
--- a/man5/locale.5
+++ b/man5/locale.5
@@ -966,14 +966,14 @@ followed by a list of abbreviated names of the days of the week.
 The list starts with the first day of the week
 as specified by
 .I week
-(Sunday by default).
+(Sunday by default). See NOTES.
 .TP
 .I day
 followed by a list of names of the days of the week.
 The list starts with the first day of the week
 as specified by
 .I week
-(Sunday by default).
+(Sunday by default). See NOTES.
 .TP
 .I abmon
 followed by a list of abbreviated month names.
@@ -1011,16 +1011,7 @@ Regarding the start of the week,
 shall be used for Sunday and
 .B 19971201
 shall be used for Monday.
-Thus, countries using
-.B 19971130
-should have local Sunday name as the first day in the
-.I day
-list,
-while countries using
-.B 19971201
-should have Monday translation as the first item in the
-.I day
-list.
+See NOTES.
 .TP
 .IR first_weekday " (since glibc 2.2)"
 followed by the number of the first day from the
@@ -1031,12 +1022,12 @@ The default value of
 corresponds to either Sunday or Monday depending
 on the value of the second
 .I week
-list item.
+list item. See NOTES.
 .TP
 .IR first_workday " (since glibc 2.2)"
 followed by the number of the first working day from the
 .I day
-list.
+list. See NOTES.
 .TP
 .I cal_direction
 .\" from localedata/locales/uk_UA
@@ -1067,10 +1058,56 @@ definition ends with the string
 \(em database for the current locale setting of that category
 .br
 /usr/lib/nls/charmap/* \(em charmap-files
+.SH NOTES
+The collective GNU C library community wisdom regarding
+.IR day ,
+.IR week ,
+and
+.I first_weekday
+states at
+https://sourceware.org/glibc/wiki/Locales
+the following:
+.PP
+The value of the second
+.I week
+list item specifies the base of the
+.I day
+list.
+.PP
+.I first_weekday
+specifies the offset of the first day-of-week in the
+.I day
+list.
+.PP
+For compatibility reasons, all glibc locales should set the value of the
+second
+.I week
+list item to
+.B 19971130
+(Sunday) and base the
+.I day
+list appropriately, and set
+.I first_weekday
+to
+.B 1
+or
+.BR 2 ,
+depending on whether the week actually starts on Sunday or Monday
+for the locale.
+.PP
+Thus, a locale which week starts on Monday
+.I first_weekday
+and
+.I first_workday
+should be set to
+.B 2
+and
+.I abday
+and
+.I day
+should have the locale representation of Sunday as the first list item.
 .SH CONFORMING TO
 POSIX.2, ISO/IEC 14652.
-.SH BUGS
-This manual page isn't complete.
 .\" .SH AUTHOR
 .\" Jochen Hein (Hein@Student.TU-Clausthal.de)
 .SH SEE ALSO
--
1.7.1

Thanks,

-- 
Marko Myllynen
