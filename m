From: saulery-GANU6spQydw@public.gmane.org
Subject: [patch] ipv6.7: documents SOL_IPV6 as an alternative to IPPROTO_IPV6 for socket level.
Date: Wed,  4 Mar 2015 00:20:38 +0100
Message-ID: <1425424838-17615-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 472447-forwarded-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

=46rom: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

=46ix for Debian bug #472447 reported by David Madore <david.madore@ens=
=2Efr>

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man7/ipv6.7 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man7/ipv6.7 b/man7/ipv6.7
index c4e6cac..cd1af35 100644
--- a/man7/ipv6.7
+++ b/man7/ipv6.7
@@ -195,7 +195,9 @@ IPv6 supports some protocol-specific socket options=
 that can be set with
 and read with
 .BR getsockopt (2).
 The socket option level for IPv6 is
-.BR IPPROTO_IPV6 .
+.BR IPPROTO_IPV6=20
+(or its alternative
+.BR=C2=A0SOL_IPV6 ).
 A boolean integer flag is zero when it is false, otherwise true.
 .TP
 .B IPV6_ADDRFORM
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
