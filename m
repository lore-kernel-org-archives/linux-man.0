From: =?utf-8?B?U3TDqXBoYW5l?= Aulery <saulery-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH] ipv6.7: SOL_IPV6 and other SOL_* options socket are not
 portable
Date: Sun, 22 Mar 2015 21:07:08 +0100
Message-ID: <20150322200708.GA3922@free.fr>
References: <54F6A535.3030103@gmail.com>
 <1425906293-12161-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425906293-12161-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Only this patch you forgot.


Le lundi 09 mars 2015 =C3=A0 02:04:53, AULERY St=C3=A9phane a =C3=A9cri=
t :
> Fix for Debian bug #472447 reported by David Madore <david.madore@ens=
=2Efr>
>=20
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D472447
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man7/ipv6.7 | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/man7/ipv6.7 b/man7/ipv6.7
> index c4e6cac..16c760b 100644
> --- a/man7/ipv6.7
> +++ b/man7/ipv6.7
> @@ -393,6 +393,18 @@ Programs that assume that all address types can =
be stored safely in a
>  need to be changed to use
>  .I struct sockaddr_storage
>  for that instead.
> +.PP
> +.BR SOL_IP ,
> +.BR SOL_IPV6 ,
> +.B SOL_ICMPV6
> +and other
> +.BR SOL_ *
> +socket options are not portable
> +variants of
> +.BR IPPROTO_ *.
> +For more information, see
> +.BR ip (7),
> +glibc and kernel headers.
>  .SH BUGS
>  The IPv6 extended API as in RFC\ 2292 is currently only partly
>  implemented;
> --=20
> 2.1.4
>=20

--=20
St=C3=A9phane Aulery
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
