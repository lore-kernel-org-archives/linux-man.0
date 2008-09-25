From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [patch] hsearch.3: Call hdestroy() after using hash table created by hcreate(), for the sake of completeness
Date: Thu, 25 Sep 2008 10:04:13 +0200
Message-ID: <cfd18e0f0809250104h4df88e07taaa136e5e8749353@mail.gmail.com>
References: <200809210310.43647.andre.goddard@gmail.com>
	 <200809241101.23128.andre.goddard@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200809241101.23128.andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Andr=E9_Goddard_Rosa?= <andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Andre,

On Wed, Sep 24, 2008 at 4:01 PM, Andr=E9 Goddard Rosa
<andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From dc0f26d3112519229671c621832f87a48e972642 Mon Sep 17 00:00:00 200=
1
> From: =3D?utf-8?q?Andr=3DC3=3DA9=3D20Goddard=3D20Rosa?=3D <andre.godd=
ard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Date: Wed, 24 Sep 2008 10:59:37 -0300
> Subject: [PATCH] Call hdestroy() after using hash table created by hc=
reate(), for the sake of completeness.
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3Dutf-8
> Content-Transfer-Encoding: 8bit
>
> Signed-off-by: Andr=E9 Goddard Rosa <andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man3/hsearch.3 |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/man3/hsearch.3 b/man3/hsearch.3
> index 16e3b6b..d5ae21c 100644
> --- a/man3/hsearch.3
> +++ b/man3/hsearch.3
> @@ -325,6 +325,7 @@ main(void)
>         printf("%9.9s \-> %9.9s:%d\\n", e.key,
>                ep ? ep\->key : "NULL", ep ? (int)(ep\->data) : 0);
>     }
> +    hdestroy();
>     exit(EXIT_SUCCESS);
>  }
>  .fi

Yes, good idea.  Thanks.  Applied for 3.11.

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
=46ound a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
