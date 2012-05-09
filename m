From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch], cp1251(7): table too wide
Date: Thu, 10 May 2012 11:54:54 +1200
Message-ID: <CAKgNAkjKDQk-4aJBWM_RJf=+1rntzpe9cHKSfqPgnh43xusCbQ@mail.gmail.com>
References: <20120509194651.GA23531@rhi.hi.is>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120509194651.GA23531-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, May 10, 2012 at 7:46 AM, Bjarni Ingi Gislason
<bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org> wrote:
> Package: man-pages
> Version: 3.40
> Severity: minor
> Tags: patch
>
> =A0From "nroff -ww -t ...":
>
> warning: around line 44: table wider than line width
>
> =A0Columns are made narrower (column gutter decreased).

Nice! Thanks; applied.

Cheers,

Michael


> =A0Patch:
>
> --- cp1251.7 =A0 =A02012-04-26 22:58:39.000000000 +0000
> +++ cp1251.7.new =A0 =A0 =A0 =A02012-05-09 02:05:59.000000000 +0000
> @@ -37,7 +37,7 @@
> =A0The fourth column will only show the proper glyphs
> =A0in an environment configured for CP\ 1251.
> =A0.TS
> -l l l c lp-1.
> +l2 l2 l2 c2 lp-1.
> =A0Oct =A0 =A0Dec =A0 =A0 Hex =A0 =A0 Char =A0 =A0Description
> =A0_
> =A0200 =A0 =A0128 =A0 =A0 80 =A0 =A0 =A0=80 =A0 =A0 =A0 CYRILLIC CAPI=
TAL LETTER DJE
>
> --
> Bjarni I. Gislason



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
