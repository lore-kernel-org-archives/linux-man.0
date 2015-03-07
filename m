From: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
Subject: [PATCH] securetty.5: Note that the pam_securetty module also uses this file
Date: Sat,  7 Mar 2015 17:06:58 +0100
Message-ID: <1425744418-26003-1-git-send-email-saulery@free.fr>
References: <20090510105952.GA19341@nekral.nekral.homelinux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090510105952.GA19341-pDMkYksm/NDBVznEOA0nCqMXiC8k1aZu0e7PPNI6Mm0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: 528015-forwarded-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Debian Bug #528015 reported by "Nicolas FRANCOIS (Nekral)" <nicolas.fra=
ncois-Fa7rcPG4DJn7nK0/Xc0eeg@public.gmane.org>

See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D528015

This patch is a modified version of the one proposed without specific p=
art to
Debian.

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man5/securetty.5 | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/man5/securetty.5 b/man5/securetty.5
index 99f6c57..88f9fb6 100644
--- a/man5/securetty.5
+++ b/man5/securetty.5
@@ -29,17 +29,26 @@ securetty \- file which lists terminals from which =
root can log in
 .SH DESCRIPTION
 The file
 .I /etc/securetty
-is used by (some versions of)
-.BR login (1).
-The file contains the device names of terminal lines
+contains the names of terminals
 (one per line, without leading
 .IR /dev/ )
+which are considered secure for the transmission of certain authentica=
tion
+tokens.
+.P
+It is used by (some versions of)
+.BR login (1)
+to restrict the terminals
 on which root is allowed to login.
 See
 .BR login.defs (5)
 if you use the shadow suite.
+.P
+On PAM enabled systems, it is used for the same purpose by
+.BR pam_securetty (8)
+to restrict the terminals on which empty passwords are accepted.
 .SH FILES
 .I /etc/securetty
 .SH SEE ALSO
 .BR login (1),
-.BR login.defs (5)
+.BR login.defs (5),
+.BR pam_securetty (8)
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
