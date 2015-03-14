From: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
Subject: [PATCH 4/5] hier.7: SGML and XML directories are separated in FHS 2.3
Date: Sun, 15 Mar 2015 00:15:16 +0100
Message-ID: <1426374917-11484-4-git-send-email-saulery@free.fr>
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
 man7/hier.7 | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/man7/hier.7 b/man7/hier.7
index df98f7e..70ada3c 100644
--- a/man7/hier.7
+++ b/man7/hier.7
@@ -76,7 +76,7 @@ in
 .IR /opt .
 .TP
 .I /etc/sgml
-This directory contains the configuration files for SGML and XML (opti=
onal).
+This directory contains the configuration files for SGML (optional).
 .TP
 .I /etc/skel
 When a new user account is created, files from this directory are
@@ -85,6 +85,9 @@ usually copied into the user's home directory.
 .I /etc/X11
 Configuration files for the X11 window system (optional).
 .TP
+.I /etc/xml
+This directory contains the configuration files for XML (optional).
+.TP
 .I /home
 On machines with home directories for users, these are usually beneath
 this directory, directly or not.
@@ -352,7 +355,7 @@ same OS.
 The message catalogs for native language support go here (optional).
 .TP
 .I /usr/share/sgml
-Files for SGML and XML (optional).
+Files for SGML (optional).
 .TP
 .I /usr/share/terminfo
 The database for terminfo (optional).
@@ -360,6 +363,9 @@ The database for terminfo (optional).
 .I /usr/share/tmac
 Troff macros that are not distributed with groff (optional).
 .TP
+.I /usr/share/xml
+Files for XML (optional).
+.TP
 .I /usr/share/zoneinfo
 Files for timezone information (optional).
 .TP
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
