From: =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>
Subject: [PATCH] resolver.3: documents missing options used by _res structure defined in resolv.h and indicates defaults options
Date: Sat,  7 Mar 2015 21:58:23 +0100
Message-ID: <1425761903-22748-1-git-send-email-saulery@free.fr>
References: <20090505194602.GA7897@cavendish.icomputing.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090505194602.GA7897-5yFI+unmBBOGLCdkNPoglKYQbZ+eox6S@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: 527136-forwarded-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, =?UTF-8?q?St=C3=A9phane=20Aulery?= <saulery-GANU6spQydw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Missing options: RES_INSECURE1, RES_INSECURE2, RES_NOALIASES, USE_INET6=
,
ROTATE, NOCHECKNAME, RES_KEEPTSIG, BLAST, USEBSTRING, NOIP6DOTINT, USE_=
EDNS0,
SNGLKUP, SNGLKUPREOP, RES_USE_DNSSEC, NOTLDQUERY, DEFAULT

Written from the glibc source and resolv.conf.5.

Debian bug #527136 reported by Jakub Wilk <ubanus-iA+eEnwkJgzk1uMJSBkQmQ@public.gmane.org> [1]

[1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D527136

Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
---
 man3/resolver.3 | 86 +++++++++++++++++++++++++++++++++++++++++++++++++=
++++----
 1 file changed, 81 insertions(+), 5 deletions(-)

diff --git a/man3/resolver.3 b/man3/resolver.3
index 19c4192..1b22708 100644
--- a/man3/resolver.3
+++ b/man3/resolver.3
@@ -204,7 +204,7 @@ implemented].
 Use TCP connections for queries rather than UDP datagrams.
 .TP
 .B RES_PRIMARY
-Query primary domain name server only.
+Query primary domain name server only. [Not currently implemented].
 .TP
 .B RES_IGNTC
 Ignore truncation errors.
@@ -238,10 +238,86 @@ domain and in parent domains.
 This option is used by
 .BR gethostbyname (3).
 [Enabled by default].
-.PP
-This list is not complete.
-You can find some other flags described in
-.BR resolv.conf (5).
+.TP
+.B RES_INSECURE1
+Accept a response from a wrong server and show it on stdout (for debug
+purpose only).
+.TP
+.B RES_INSECURE2
+Accept a response which contains a wrong query and show it on stdout (=
for
+debug purpose only).
+.TP
+.B RES_NOALIASES
+Disable usage of
+.B HOSTALIASES
+environment variable.
+.TP
+.B RES_USE_INET6
+Try a AAAA query before an A query inside the
+.BR gethostbyname ()
+function, and map IPv4 responses in IPv6 "tunneled form" if no AAAA
+records are found but an A record set exists.
+.TP
+.B RES_ROTATE
+Causes round-robin selection of name servers from among those listed. =
This
+has the effect of spreading the query load among all listed servers, r=
ather
+than having all clients try the first listed server first every time.
+.TP
+.B RES_NOCHECKNAME
+Disable the modern BIND checking of incoming hostnames and mail names
+for invalid characters such as underscore (_), non-ASCII, or control
+characters. [Not currently implemented].
+.TP
+.B RES_KEEPTSIG
+Do not strip TSIG records. [Not currently implemented].
+.TP
+.B RES_BLAST
+When resolvers want to even out the load on their nameservers, followi=
ng
+them. Note this option overrides
+.BR RES_ROTATE .
+.TP
+.B RES_USEBSTRING
+Make reverse IPv6 lookups using the bit-label format described in RFC =
2673;
+if this option is not set, then nibble format is used (since glibc 2.3=
=2E4).
+.TP
+.B RES_NOIP6DOTINT
+Use
+.I ip6.arpa
+zone in IPv6 reverse lookup instead of
+.I ip6.int
+which is deprecated since glibc 2.3.4. [Enabled by default].
+.TP
+.B RES_USE_EDNS0
+Enables support for the DNS extensions (EDNS0) described in RFC 2671 (=
since
+glibc 2.6).
+.TP
+.B RES_SNGLKUP
+By default, glibc performs IPv4 and IPv6 lookups in parallel since ver=
sion
+2.9. Some appliance DNS servers cannot handle these queries properly a=
nd
+make the requests time out. This option disables the behavior and make=
s
+glibc perform the IPv6 and IPv4 requests sequentially (at the cost of =
some
+slowdown of the resolving process) (since glibc 2.10).
+.TP
+.B RES_SNGLKUPREOP
+When
+.B RES_SNGLKUP
+option is enabled, opens a new socket for the each request.
+.TP
+.B RES_USE_DNSSEC
+Use DNSSEC with OK bit in OPT record. This option implies
+.BR RES_USE_EDNS0 .
+.TP
+.B RES_NOTLDQUERY
+Do not look up unqualified name as a TLD.
+.TP
+.B RES_DEFAULT
+Default option which implies:
+.BR RES_RECURSE ,
+.BR RES_DEFNAMES ,
+.BR RES_DNSRCH
+and
+.BR RES_NOIP6DOTINT .
+
 .SH RETURN VALUE
 The
 .BR res_init ()
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
