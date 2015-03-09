From: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
Subject: [PATCH] ipv6.7: SOL_IPV6 and other SOL_* options socket are not portable
Date: Mon,  9 Mar 2015 14:04:53 +0100
Message-ID: <1425906293-12161-1-git-send-email-saulery@free.fr>
References: <54F6A535.3030103@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54F6A535.3030103-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

=46ix for Debian bug #472447 reported by David Madore <david.madore@ens=
=2Efr>

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D472447
Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man7/ipv6.7 | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/man7/ipv6.7 b/man7/ipv6.7
index c4e6cac..16c760b 100644
--- a/man7/ipv6.7
+++ b/man7/ipv6.7
@@ -393,6 +393,18 @@ Programs that assume that all address types can be=
 stored safely in a
 need to be changed to use
 .I struct sockaddr_storage
 for that instead.
+.PP
+.BR SOL_IP ,
+.BR SOL_IPV6 ,
+.B SOL_ICMPV6
+and other
+.BR SOL_ *
+socket options are not portable
+variants of
+.BR IPPROTO_ *.
+For more information, see
+.BR ip (7),
+glibc and kernel headers.
 .SH BUGS
 The IPv6 extended API as in RFC\ 2292 is currently only partly
 implemented;
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
