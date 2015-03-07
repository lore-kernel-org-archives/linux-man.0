From: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
Subject: [PATCH] host.conf.5, hosts.5, resolv.conf.5: Cross references of these pages.
Date: Sat,  7 Mar 2015 22:31:16 +0100
Message-ID: <1425763876-23539-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: 298259-forwarded-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Debian bug #298259 reported by Paul E Condon <pecondon-JqTeAeaDHbgYGKtr5sm4Aw@public.gmane.org=
>

See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D298259

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man5/host.conf.5   | 4 +++-
 man5/hosts.5       | 2 ++
 man5/resolv.conf.5 | 4 +++-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/man5/host.conf.5 b/man5/host.conf.5
index a07e85f..9ff2ed3 100644
--- a/man5/host.conf.5
+++ b/man5/host.conf.5
@@ -202,6 +202,8 @@ The
 file is the modern way of controlling the order of host lookups.
 .SH SEE ALSO
 .BR gethostbyname (3),
-.BR nsswitch.conf (5)
+.BR hosts (5),
+.BR nsswitch.conf (5),
+.BR resolv.conf (5),
 .BR hostname (7),
 .BR named (8)
diff --git a/man5/hosts.5 b/man5/hosts.5
index aca5a43..9ec8cb2 100644
--- a/man5/hosts.5
+++ b/man5/hosts.5
@@ -114,6 +114,8 @@ I just found three, from 92,
 .fi
 .SH SEE ALSO
 .BR hostname (1),
+.BR host.conf (5),
+.BR resolv.conf (5),
 .BR resolver (3),
 .BR resolver (5),
 .BR hostname (7),
diff --git a/man5/resolv.conf.5 b/man5/resolv.conf.5
index 4eb6c73..1777c8a 100644
--- a/man5/resolv.conf.5
+++ b/man5/resolv.conf.5
@@ -300,8 +300,10 @@ in the first column are treated as comments.
 .I <resolv.h>
 .SH SEE ALSO
 .BR gethostbyname (3),
+.BR host.conf (5),
+.BR hosts (5),
 .BR resolver (3),
-.BR nsswitch.conf (5)
+.BR nsswitch.conf (5),
 .BR hostname (7),
 .BR named (8)
 .br
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
