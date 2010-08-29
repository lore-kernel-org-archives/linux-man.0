From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] a64l.3: Fix a function name mixup: s/a64l/l64a/
Date: Sun, 29 Aug 2010 08:21:17 +0200
Message-ID: <AANLkTi==ZU3t9xD+2nQ_gT33dcpS-Y7yDfiyueNkV_08@mail.gmail.com>
References: <4C2DAB4B.4080200@cn.fujitsu.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4C2DAB4B.4080200-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Haitao

On Fri, Jul 2, 2010 at 11:03 AM, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> wr=
ote:
> Hi Michael,
>
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>

Thanks. Applied for man-pages 2.26.

Cheers,

Michael


> ---
> =A0man3/a64l.3 | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/man3/a64l.3 b/man3/a64l.3
> index dbcb897..f0d7d64 100644
> --- a/man3/a64l.3
> +++ b/man3/a64l.3
> @@ -3,7 +3,7 @@
> =A0.\"
> =A0.\" Corrected, aeb, 2002-05-30
> =A0.\"
> -.TH A64L 3 2007-07-26 "" "Linux Programmer's Manual"
> +.TH A64L 3 2010-07-02 "" "Linux Programmer's Manual"
> =A0.SH NAME
> =A0a64l, l64a \- convert between long and base-64
> =A0.SH SYNOPSIS
> @@ -54,7 +54,7 @@ So 123 =3D 59*64^0 + 1*64^1 =3D "v/".
> =A0POSIX.1-2001.
> =A0.SH NOTES
> =A0The value returned by
> -.BR a64l ()
> +.BR l64a ()
> =A0may be a pointer to a static buffer, possibly overwritten
> =A0by later calls.
> =A0.LP
> --
> 1.6.0.1
>
>
> --
> Regards
> Peng Haitao
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
