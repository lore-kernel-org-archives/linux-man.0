From: saulery-GANU6spQydw@public.gmane.org
Subject: [patch] shutdown.2: POSIX compliant since version 3.7-rc1
Date: Thu, 26 Feb 2015 11:38:51 +0100
Message-ID: <1424947131-4034-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

=46rom: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man2/shutdown.2 | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/man2/shutdown.2 b/man2/shutdown.2
index ab39cfd..2174de3 100644
--- a/man2/shutdown.2
+++ b/man2/shutdown.2
@@ -102,14 +102,11 @@ respectively, and are defined in
 .I <sys/socket.h>
 since glibc-2.1.91.
 .SH BUGS
-As currently implemented,
-checks for the validity of
-.I how
-are done in domain-specific code, and not all domains perform these ch=
ecks.
-.\" FIXME .
-.\" https://bugzilla.kernel.org/show_bug.cgi?id=3D47111
-Most notably, UNIX domain sockets simply ignore invalid values;
-this may change in the future.
+This implementation is POSIX compliant since version 3.7-rc1. Previous=
ly, UNIX
+domain and DECnet sockets simply ignored invalid values of
+.IR how ,
+due to a domain-specific code. Applications that used invalid values t=
o
+circumvent this lack should be corrected.
 .SH SEE ALSO
 .BR connect (2),
 .BR socket (2),
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
