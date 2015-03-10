From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] resolver.3: documents missing options used by _res structure
 defined in resolv.h and indicates defaults options
Date: Tue, 10 Mar 2015 07:12:32 +0100
Message-ID: <54FE8B50.7040307@gmail.com>
References: <54FD6CC3.1000706@gmail.com> <1425933851-16360-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425933851-16360-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, 527136-forwarded-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/09/2015 09:44 PM, St=C3=A9phane Aulery wrote:
> Missing options: RES_INSECURE1, RES_INSECURE2, RES_NOALIASES, USE_INE=
T6,
> ROTATE, NOCHECKNAME, RES_KEEPTSIG, BLAST, USEBSTRING, NOIP6DOTINT, US=
E_EDNS0,
> SNGLKUP, SNGLKUPREOP, RES_USE_DNSSEC, NOTLDQUERY, DEFAULT
>=20
> Written from the glibc source and resolv.conf.5.

Thanks St=C3=A9phane! Applied.

Cheers,

Michael


> Debian bug #527136 reported by Jakub Wilk <ubanus-iA+eEnwkJgzk1uMJSBkQmQ@public.gmane.org>
>=20
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D527136
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man3/resolver.3 | 99 +++++++++++++++++++++++++++++++++++++++++++++++=
+++++-----
>  1 file changed, 91 insertions(+), 8 deletions(-)
>=20
> diff --git a/man3/resolver.3 b/man3/resolver.3
> index 19c4192..06704b1 100644
> --- a/man3/resolver.3
> +++ b/man3/resolver.3
> @@ -197,19 +197,20 @@ which is not the default.
>  Accept authoritative answers only.
>  .BR res_send ()
>  continues until
> -it finds an authoritative answer or returns an error.  [Not currentl=
y
> -implemented].
> +it finds an authoritative answer or returns an error.
> +[Not currently implemented].
>  .TP
>  .B RES_USEVC
>  Use TCP connections for queries rather than UDP datagrams.
>  .TP
>  .B RES_PRIMARY
>  Query primary domain name server only.
> +[Not currently implemented].
>  .TP
>  .B RES_IGNTC
>  Ignore truncation errors.
> -Don't retry with TCP.  [Not currently
> -implemented].
> +Don't retry with TCP.
> +[Not currently implemented].
>  .TP
>  .B RES_RECURSE
>  Set the recursion desired bit in queries.
> @@ -238,10 +239,92 @@ domain and in parent domains.
>  This option is used by
>  .BR gethostbyname (3).
>  [Enabled by default].
> -.PP
> -This list is not complete.
> -You can find some other flags described in
> -.BR resolv.conf (5).
> +.TP
> +.B RES_INSECURE1
> +Accept a response from a wrong server and show it on standard output
> +(for debug purpose only).
> +.TP
> +.B RES_INSECURE2
> +Accept a response which contains a wrong query and show it on standa=
rd
> +output (for debug purpose only).
> +.TP
> +.B RES_NOALIASES
> +Disable usage of
> +.B HOSTALIASES
> +environment variable.
> +.TP
> +.B RES_USE_INET6
> +Try an AAAA query before an A query inside the
> +.BR gethostbyname ()
> +function, and map IPv4 responses in IPv6 "tunneled form" if no AAAA =
records
> +are found but an A record set exists.
> +.TP
> +.B RES_ROTATE
> +Causes round-robin selection of name servers from among those listed=
=2E
> +This has the effect of spreading the query load among all listed ser=
vers,
> +rather than having all clients try the first listed server first eve=
ry
> +time.
> +.TP
> +.B RES_NOCHECKNAME
> +Disable the modern BIND checking of incoming hostnames and mail name=
s
> +for invalid characters such as underscore (_), non-ASCII,
> +or control characters.
> +[Not currently implemented].
> +.TP
> +.B RES_KEEPTSIG
> +Do not strip TSIG records.
> +[Not currently implemented].
> +.TP
> +.B RES_BLAST
> +Send each query simultaneously and recursively to all servers.
> +Note this option overrides
> +.BR RES_ROTATE .
> +.TP
> +.BR RES_USEBSTRING " (since glibc 2.3.4)"
> +Make reverse IPv6 lookups using the bit-label format described in RF=
C 2673;
> +if this option is not set, then nibble format is used.
> +.TP
> +.B RES_NOIP6DOTINT
> +Use
> +.I ip6.arpa
> +zone in IPv6 reverse lookup instead of
> +.IR ip6.int ,
> +which is deprecated since glibc 2.3.4.
> +[Enabled by default].
> +.TP
> +.BR RES_USE_EDNS0 " (since glibc 2.6)"
> +Enables support for the DNS extensions (EDNS0) described in RFC 2671=
=2E
> +.TP
> +.BR RES_SNGLKUP " (since glibc 2.10)"
> +By default, glibc performs IPv4 and IPv6 lookups in parallel since
> +version 2.9.
> +Some appliance DNS servers cannot handle these queries properly
> +and make the requests time out.
> +This option disables the behavior and makes glibc
> +perform the IPv6 and IPv4 requests sequentially
> +(at the cost of some slowdown of the resolving process).
> +.TP
> +.B RES_SNGLKUPREOP
> +When
> +.B RES_SNGLKUP
> +option is enabled, opens a new socket for the each request.
> +.TP
> +.B RES_USE_DNSSEC
> +Use DNSSEC with OK bit in OPT record.
> +This option implies
> +.BR RES_USE_EDNS0 .
> +.TP
> +.B RES_NOTLDQUERY
> +Do not look up unqualified name as a top-level domain (TLD).
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
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
