From: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
Subject: [PATCH] hosts.5: mention 127.0.1.1 for FQDN and IPv6 examples
Date: Thu, 12 Mar 2015 22:12:25 +0100
Message-ID: <1426194745-8406-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 562890-forwarded-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Debian bug #562890 reported by Vincent Lefevre <vincent-buymaDBGzMOsTnJN9+BGXg@public.gmane.org>

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D562890
Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man5/hosts.5 | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/man5/hosts.5 b/man5/hosts.5
index 9ec8cb2..2eaeb69 100644
--- a/man5/hosts.5
+++ b/man5/hosts.5
@@ -106,11 +106,20 @@ I just found three, from 92,
 94, and 95.
 .SH EXAMPLE
 .nf
+# The following lines are desirable for IPv4 capable hosts
 127.0.0.1       localhost
+
+# 127.0.1.1 is often used for the FQDN of the machine
+127.0.1.1       thishost.mydomain.org  thishost
 192.168.1.10    foo.mydomain.org       foo
 192.168.1.13    bar.mydomain.org       bar
 146.82.138.7    master.debian.org      master
 209.237.226.90  www.opensource.org
+
+# The following lines are desirable for IPv6 capable hosts
+::1             localhost ip6-localhost ip6-loopback
+ff02::1         ip6-allnodes
+ff02::2         ip6-allrouters
 .fi
 .SH SEE ALSO
 .BR hostname (1),
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
