From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] packet.7: ffix
Date: Sat, 01 Feb 2014 07:44:51 +0100
Message-ID: <52EC97E3.8080608@gmail.com>
References: <1391098082-22061-1-git-send-email-taffit@debian.org> <1391121980-11427-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391121980-11427-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, David. Applied.

Cheers,

Michael


On 01/30/2014 11:46 PM, David Pr=E9vot wrote:
> ---
>  man7/packet.7 | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/man7/packet.7 b/man7/packet.7
> index ed15631..1d3f222 100644
> --- a/man7/packet.7
> +++ b/man7/packet.7
> @@ -107,7 +107,9 @@ flag is passed to
>  the real length of the packet on the wire is always returned,
>  even when it is longer than the buffer.
>  .SS Address types
> -The sockaddr_ll is a device independent physical layer address.
> +The
> +.I sockaddr_ll
> +is a device independent physical layer address.
> =20
>  .in +4n
>  .nf
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
