From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [patch] tsearch.3: dispose properly of allocated resources in example code
Date: Tue, 23 Sep 2008 08:28:31 +0200
Message-ID: <cfd18e0f0809222328r599e22c1je0f4261ee969bca8@mail.gmail.com>
References: <200809210310.43647.andre.goddard@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200809210310.43647.andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Andr=E9_Goddard_Rosa?= <andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Andr=E9,

On Sun, Sep 21, 2008 at 8:10 AM, Andr=E9 Goddard Rosa
<andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> As there are many users who base their own code on these examples, we
> should avoid leaking memory when using functions of tsearch() family.
> In the provided example, tsearch() leaks memory whenever it tries to
> insert a number which was already inserted before.

Thanks.  My first patch applied via 'git am'!

I applied this patch for man-pages-3.10.  (I added
#define _GNU_SOURCE
since that's required to expose the tdestroy() declaration.)

Cheers,

Michael

> --- man3/tsearch.3      2008-09-10 10:16:13.000000000 -0300
> +++ man3/tsearch.3.goddard      2008-09-21 02:42:55.000000000 -0300
> @@ -246,8 +246,11 @@
>         val =3D tsearch((void *) ptr, &root, compare);
>         if (val =3D=3D NULL)
>             exit(EXIT_FAILURE);
> +        else if (!((*(int **) val) =3D=3D ptr))
> +            free(ptr);
>     }
>     twalk(root, action);
> +    tdestroy(root, free);
>     exit(EXIT_SUCCESS);
>  }
>  .fi
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
