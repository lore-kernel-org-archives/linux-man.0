From: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
Subject: [PATCH 3/5] hier.7: Specifies the optional directories from those mentioned.
Date: Sun, 15 Mar 2015 00:15:15 +0100
Message-ID: <1426374917-11484-3-git-send-email-saulery@free.fr>
References: <1426374917-11484-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426374917-11484-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man7/hier.7 | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/man7/hier.7 b/man7/hier.7
index 70945b1..df98f7e 100644
--- a/man7/hier.7
+++ b/man7/hier.7
@@ -89,7 +89,7 @@ Configuration files for the X11 window system (option=
al).
 On machines with home directories for users, these are usually beneath
 this directory, directly or not.
 The structure of this directory
-depends on local administration decisions.
+depends on local administration decisions (optional).
 .TP
 .I /lib
 This directory should hold those shared libraries that are necessary
@@ -319,20 +319,21 @@ or
 .IR /usr/man .
 .TP
 .I /usr/share/dict
-Contains the word lists used by spell checkers.
+Contains the word lists used by spell checkers (optional).
 .TP
 .I /usr/share/doc
-Documentation about installed programs.
+Documentation about installed programs (optional).
 .TP
 .I /usr/share/games
 Static data files for games in
-.IR /usr/games .
+.I /usr/games
+(optional).
 .TP
 .I /usr/share/info
-Info pages go here.
+Info pages go here (optional).
 .TP
 .I /usr/share/locale
-Locale information goes here.
+Locale information goes here (optional).
 .TP
 .I /usr/share/man
 Manual pages go here in subdirectories according to the man page secti=
ons.
@@ -348,25 +349,25 @@ Miscellaneous data that can be shared among diffe=
rent architectures of the
 same OS.
 .TP
 .I /usr/share/nls
-The message catalogs for native language support go here.
+The message catalogs for native language support go here (optional).
 .TP
 .I /usr/share/sgml
-Files for SGML and XML.
+Files for SGML and XML (optional).
 .TP
 .I /usr/share/terminfo
-The database for terminfo.
+The database for terminfo (optional).
 .TP
 .I /usr/share/tmac
-Troff macros that are not distributed with groff.
+Troff macros that are not distributed with groff (optional).
 .TP
 .I /usr/share/zoneinfo
-Files for timezone information.
+Files for timezone information (optional).
 .TP
 .I /usr/src
 Source files for different parts of the system, included with some pac=
kages
 for reference purposes.
 Don't work here with your own projects, as files
-below /usr should be read-only except when installing software.
+below /usr should be read-only except when installing software (option=
al).
 .TP
 .I /usr/src/linux
 This was the traditional place for the kernel source.
@@ -459,21 +460,22 @@ Spooled jobs for
 .BR cron (8).
 .TP
 .I /var/spool/lpd
-Spooled files for printing.
+Spooled files for printing (optional).
 .TP
 .I /var/spool/mail
 Replaced by
 .IR /var/mail .
 .TP
 .I /var/spool/mqueue
-Queued outgoing mail.
+Queued outgoing mail (optional).
 .TP
 .I /var/spool/news
-Spool directory for news.
+Spool directory for news (optional).
 .TP
 .I /var/spool/rwho
 Spooled files for
-.BR rwhod (8).
+.BR rwhod (8)
+(optional).
 .TP
 .I /var/spool/smail
 Spooled files for the
@@ -482,7 +484,8 @@ mail delivery program.
 .TP
 .I /var/spool/uucp
 Spooled files for
-.BR uucp (1).
+.BR uucp (1)
+(optional).
 .TP
 .I /var/tmp
 Like
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
