From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] resolver.3: documents missing options used by _res structure
 defined in resolv.h and indicates defaults options
Date: Sun, 08 Mar 2015 09:20:18 +0100
Message-ID: <54FC0642.6050800@gmail.com>
References: <20090505194602.GA7897@cavendish.icomputing.pl> <1425761903-22748-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425761903-22748-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, 527136-forwarded-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi St=C3=A9phane,

Good stuff. See comments below. Coud you amend and resubmit.

On 03/07/2015 09:58 PM, St=C3=A9phane Aulery wrote:
> Missing options: RES_INSECURE1, RES_INSECURE2, RES_NOALIASES, USE_INE=
T6,
> ROTATE, NOCHECKNAME, RES_KEEPTSIG, BLAST, USEBSTRING, NOIP6DOTINT, US=
E_EDNS0,
> SNGLKUP, SNGLKUPREOP, RES_USE_DNSSEC, NOTLDQUERY, DEFAULT
>=20
> Written from the glibc source and resolv.conf.5.
>=20
> Debian bug #527136 reported by Jakub Wilk <ubanus-iA+eEnwkJgzk1uMJSBkQmQ@public.gmane.org> [1]
>=20
> [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D527136
>=20
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man3/resolver.3 | 86 +++++++++++++++++++++++++++++++++++++++++++++++=
++++++----
>  1 file changed, 81 insertions(+), 5 deletions(-)
>=20
> diff --git a/man3/resolver.3 b/man3/resolver.3
> index 19c4192..1b22708 100644
> --- a/man3/resolver.3
> +++ b/man3/resolver.3
> @@ -204,7 +204,7 @@ implemented].
>  Use TCP connections for queries rather than UDP datagrams.
>  .TP
>  .B RES_PRIMARY
> -Query primary domain name server only.
> +Query primary domain name server only. [Not currently implemented].

New sentence on new source line please. And (many) other instances belo=
w.

>  .TP
>  .B RES_IGNTC
>  Ignore truncation errors.
> @@ -238,10 +238,86 @@ domain and in parent domains.
>  This option is used by
>  .BR gethostbyname (3).
>  [Enabled by default].
> -.PP
> -This list is not complete.
> -You can find some other flags described in
> -.BR resolv.conf (5).
> +.TP
> +.B RES_INSECURE1
> +Accept a response from a wrong server and show it on stdout (for deb=
ug

s/stdout/standard output/
And other instances below.

> +purpose only).
> +.TP
> +.B RES_INSECURE2
> +Accept a response which contains a wrong query and show it on stdout=
 (for
> +debug purpose only).
> +.TP
> +.B RES_NOALIASES
> +Disable usage of
> +.B HOSTALIASES
> +environment variable.
> +.TP
> +.B RES_USE_INET6
> +Try a AAAA query before an A query inside the

s/a AAAA/an AAAA/

> +.BR gethostbyname ()
> +function, and map IPv4 responses in IPv6 "tunneled form" if no AAAA
> +records are found but an A record set exists.
> +.TP
> +.B RES_ROTATE
> +Causes round-robin selection of name servers from among those listed=
=2E This

New sentence on new source line please.

> +has the effect of spreading the query load among all listed servers,=
 rather
> +than having all clients try the first listed server first every time=
=2E
> +.TP
> +.B RES_NOCHECKNAME
> +Disable the modern BIND checking of incoming hostnames and mail name=
s
> +for invalid characters such as underscore (_), non-ASCII, or control
> +characters. [Not currently implemented].
> +.TP
> +.B RES_KEEPTSIG
> +Do not strip TSIG records. [Not currently implemented].
> +.TP
> +.B RES_BLAST
> +When resolvers want to even out the load on their nameservers, follo=
wing
> +them.=20

I do not understand that last sentence. Could you clarify please.

> Note this option overrides
> +.BR RES_ROTATE .
> +.TP
> +.B RES_USEBSTRING
> +Make reverse IPv6 lookups using the bit-label format described in RF=
C 2673;
> +if this option is not set, then nibble format is used (since glibc 2=
=2E3.4).

Does the "(since glibc 2.3.4)" apply to the option, or to the
"then nibble format is used"? It's not clear. If the former, then write

=2EBR RES_USEBSTRING " (since glibc 2.3.4)"

If the latter, then write

"then (since glibc 2.3.4) nibble format is used".

> +.TP
> +.B RES_NOIP6DOTINT
> +Use
> +.I ip6.arpa
> +zone in IPv6 reverse lookup instead of
> +.I ip6.int

s/.I ip6.int./IR ip6.int ,/

> +which is deprecated since glibc 2.3.4. [Enabled by default].
> +.TP
> +.B RES_USE_EDNS0
> +Enables support for the DNS extensions (EDNS0) described in RFC 2671=
 (since
> +glibc 2.6).

I think above, we want:

=2ETP
=2EBR RES_USE_EDNS0 " (since glibc 2.6)"

(This is the usual way that man-pages documents the release version=20
for options.)

> +.TP
> +.B RES_SNGLKUP
> +By default, glibc performs IPv4 and IPv6 lookups in parallel since v=
ersion
> +2.9. Some appliance DNS servers cannot handle these queries properly=
 and
> +make the requests time out. This option disables the behavior and ma=
kes
> +glibc perform the IPv6 and IPv4 requests sequentially (at the cost o=
f some
> +slowdown of the resolving process) (since glibc 2.10).

=2ETP
=2EBR RES_SNGLKUP " (since glibc 2.10)"

?

> +.TP
> +.B RES_SNGLKUPREOP
> +When
> +.B RES_SNGLKUP
> +option is enabled, opens a new socket for the each request.
> +.TP
> +.B RES_USE_DNSSEC
> +Use DNSSEC with OK bit in OPT record. This option implies
> +.BR RES_USE_EDNS0 .
> +.TP
> +.B RES_NOTLDQUERY
> +Do not look up unqualified name as a TLD.

s/TLD/top-level domain (TLD)/

> +.TP
> +.B RES_DEFAULT
> +Default option which implies:
> +.BR RES_RECURSE ,
> +.BR RES_DEFNAMES ,
> +.BR RES_DNSRCH
> +and
> +.BR RES_NOIP6DOTINT .
> +
>  .SH RETURN VALUE
>  The
>  .BR res_init ()

Thanks,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
