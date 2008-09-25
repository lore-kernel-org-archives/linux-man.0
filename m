From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [patch] strcpy.3: Avoid redundantly filling the position 'n - 1' two times in strncpy() example code
Date: Thu, 25 Sep 2008 10:14:08 +0200
Message-ID: <cfd18e0f0809250114i12a1f899iab6e554a6a66a12@mail.gmail.com>
References: <200809210310.43647.andre.goddard@gmail.com>
	 <200809241101.34334.andre.goddard@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200809241101.34334.andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Andr=E9_Goddard_Rosa?= <andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Andre,

On Wed, Sep 24, 2008 at 4:01 PM, Andr=E9 Goddard Rosa
<andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From 88a02845c606413444bfb055935303b4896d0271 Mon Sep 17 00:00:00 200=
1
> From: =3D?utf-8?q?Andr=3DC3=3DA9=3D20Goddard=3D20Rosa?=3D <andre.godd=
ard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Date: Wed, 24 Sep 2008 10:25:08 -0300
> Subject: [PATCH] Avoid redundantly filling the position 'n - 1' two t=
imes in strncpy() example code.
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3Dutf-8
> Content-Transfer-Encoding: 8bit
>
> When we use 'strncpy(buf, str, n)', strncpy() will fill chars from 0.=
=2E(n - 1).
> As we force the character at position 'n - 1' to be '\0' anyway, don'=
t fill it in strncpy() before.

Thanks!  Applied for 3.11.

Cheers,

Michael

> Signed-off-by: Andr=E9 Goddard Rosa <andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man3/strcpy.3 |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/man3/strcpy.3 b/man3/strcpy.3
> index 7a8091f..d2e08a3 100644
> --- a/man3/strcpy.3
> +++ b/man3/strcpy.3
> @@ -115,7 +115,7 @@ as follows:
>  .in +4n
>  .nf
>
> -strncpy(buf, str, n);
> +strncpy(buf, str, n \- 1);
>  if (n > 0)
>     buf[n \- 1]=3D \(aq\\0\(aq;
>  .fi
> --
> 1.6.0.2.508.g24593
>
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
=46ound a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
