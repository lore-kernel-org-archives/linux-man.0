From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Subject: [PATCH] locale.7: improve LOCPATH description
Date: Mon, 20 Oct 2014 08:23:17 +0300
Message-ID: <54449C45.4010907@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


LOCPATH is ignored by privileged programs.

Add locale archive references.

Add FILES section.

---
 man7/locale.7 |   22 ++++++++++++++++------
 1 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/man7/locale.7 b/man7/locale.7
index 6270739..3fb2ad3 100644
--- a/man7/locale.7
+++ b/man7/locale.7
@@ -330,17 +330,20 @@ The following environment variable is used by
 .BR newlocale (3)
 and
 .BR setlocale (3),
-and thus affects all localized programs:
+and thus affects all unprivileged localized programs:
 .TP
 .B LOCPATH
 A list of pathnames, separated by colons (\(aq:\(aq),
 that should be used to find locale data.
-If this variable is set, only the individual locale data files from
+If this variable is set, only the individual compiled locale data files
+from
 .I LOCPATH
-and the system default locale data path are used; any available locale
-archives are not used. The individual locale data files are searched
-under subdirectories which depend on the currently used locale. For
-example, when
+and the system default locale data path are used;
+any available locale archives are not used (see
+.BR localedef (1)).
+The individual compiled locale data files are searched under
+subdirectories which depend on the currently used locale.
+For example, when
 .I en_GB.UTF-8
 is used for a category, the following subdirectories are searched for,
 in this order:
@@ -351,6 +354,13 @@ in this order:
 .IR en.utf8 ,
 and
 .IR en .
+.SH FILES
+.TP
+.I /usr/lib/locale/locale-archive
+Usual default locale archive location.
+.TP
+.I /usr/lib/locale
+Usual default path for compiled individual locale files.
 .SH CONFORMING TO
 POSIX.1-2001.
 .\"
-- 
1.7.1

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
