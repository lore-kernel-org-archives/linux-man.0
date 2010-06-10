From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] Cosmetic change in man5/core.5
Date: Thu, 10 Jun 2010 06:12:49 +0200
Message-ID: <AANLkTil_GkGrBlyDjT542XoXMmEV1hICnDMx6W8hcuR-@mail.gmail.com>
References: <AANLkTilhsx7SMVtj7UX21Ni6H-AAeh-bPGe7r0ra_6h7@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTilhsx7SMVtj7UX21Ni6H-AAeh-bPGe7r0ra_6h7-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Denis.

On Thu, May 27, 2010 at 11:39 PM, Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
> Hello,
>
> Description of all other bits have a full stop, adding one to bit 4.

Thanks. Applied for man-pages-3.25.

Cheers,

Michael


> Thanks,
>
> Denis
>
> diff --git a/man5/core.5 b/man5/core.5
> index 4b6a5bf..f890799 100644
> --- a/man5/core.5
> +++ b/man5/core.5
> @@ -224,7 +224,7 @@ Dump file-backed shared mappings.
> =A0.\" mapped file.
> =A0.TP
> =A0bit 4 (since Linux 2.6.24)
> -Dump ELF headers
> +Dump ELF headers.
> =A0.TP
> =A0bit 5 (since Linux 2.6.28)
> =A0Dump private huge pages.
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
