From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] bootparam.7: tfix
Date: Sat, 20 Jul 2013 22:07:23 +0200
Message-ID: <51EAEDFB.400@gmail.com>
References: <1374113157-4915-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374113157-4915-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied.

Thanks, David.

Cheers,

Michael



On 07/18/13 04:05, David Pr=E9vot wrote:
> ---
>  man7/bootparam.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man7/bootparam.7 b/man7/bootparam.7
> index fa4c5c3..89d8f72 100644
> --- a/man7/bootparam.7
> +++ b/man7/bootparam.7
> @@ -42,7 +42,7 @@ When the kernel is booted directly by the BIOS (say=
 from a floppy to
>  which you copied a kernel using 'cp zImage /dev/fd0'),
>  you have no opportunity to specify any parameters.
>  So, in order to take advantage of this possibility you have to
> -use boot loader software that is able to pass parameters, such as GR=
UB.
> +use a boot loader software that is able to pass parameters, such as =
GRUB.
> =20
>  .\" The LILO program (LInux LOader) written by Werner Almesberger is=
 the
>  .\" most commonly used.
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
