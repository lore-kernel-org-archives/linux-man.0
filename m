From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ipv6.7: SOL_IPV6 and other SOL_* options socket are not
 portable
Date: Mon, 23 Mar 2015 07:17:57 +0100
Message-ID: <550FB015.3050504@gmail.com>
References: <54F6A535.3030103@gmail.com> <1425906293-12161-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425906293-12161-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi St=C3=A9phane,

On 03/09/2015 02:04 PM, St=C3=A9phane Aulery wrote:
> Fix for Debian bug #472447 reported by David Madore <david.madore@ens=
=2Efr>
>=20
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D472447
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

Applied, but some comments below.

Take a look also at commit 8013e4ef703e3d1199dfb628e6fe1e0fd290ca49
to see how you could tweak your commit messages to better fit with
my normal layout.

Cheers,

Michael

http://git.kernel.org/cgit/docs/man-pages/man-pages.git/commit/?id=3D80=
13e4ef703e3d1199dfb628e6fe1e0fd290ca49

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

I made that last sentence just: "See also ip(7)." I think
it suffices.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
