From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] netdevice.7: ffix
Date: Tue, 04 Feb 2014 10:04:38 +0100
Message-ID: <52F0AD26.6010201@gmail.com>
References: <1391294257-25320-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391294257-25320-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?RGF2aWQgUHLDqXZvdA==?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/01/2014 11:37 PM, David Pr=C3=A9vot wrote:
> Hi Michael,
>=20
> I=E2=80=99m not totally sure for this one, but it seems to fit the us=
ual usage,
> even if man-pages(7) =E2=80=94 Font conventions =E2=80=94 suggests to=
 rather use
> something like:
>=20
> 	.BI "sizeof(struct " ifreq )
>=20
> Regards

Your fix looks good to me. Applied.

Thanks, David.

Cheers,

Michael


>=20
> David
> ---
>  man7/netdevice.7 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/man7/netdevice.7 b/man7/netdevice.7
> index ff2ac82..c1cb8a2 100644
> --- a/man7/netdevice.7
> +++ b/man7/netdevice.7
> @@ -309,8 +309,8 @@ with
>  .I ifc_req
>  set to NULL, or to retry the call with a bigger buffer whenever
>  .I ifc_len
> -upon return differs by less than sizeof(struct
> -.IR ifreq )
> +upon return differs by less than
> +.I sizeof(struct ifreq)
>  from its original value.
> =20
>  If an error occurs accessing the
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
