From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] bootparam.7: tfix
Date: Sat, 20 Jul 2013 22:07:34 +0200
Message-ID: <51EAEE06.8010304@gmail.com>
References: <1374113157-4915-1-git-send-email-taffit@debian.org> <1374113157-4915-2-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374113157-4915-2-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks,

Michael


On 07/18/13 04:05, David Pr=E9vot wrote:
> ---
>  man7/bootparam.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man7/bootparam.7 b/man7/bootparam.7
> index 89d8f72..b255e01 100644
> --- a/man7/bootparam.7
> +++ b/man7/bootparam.7
> @@ -427,7 +427,7 @@ a 'ramdisk=3DN' parameter to tell its size.
>  (This could also be set in the kernel image at compile time.)
>  These days ram disks use the buffer cache, and grow dynamically.
>  For a lot of information in conjunction with the new ramdisk
> -setup), see the kernel source file
> +setup, see the kernel source file
>  .IR Documentation/blockdev/ramdisk.txt
>  .RI ( Documentation/ramdisk.txt
>  in older kernels).
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
