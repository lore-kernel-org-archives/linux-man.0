From: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH] readlink.2: Document using st_size to allocate the buffer
Date: Sun, 25 Sep 2011 06:05:35 +0200
Message-ID: <20110925040535.GA10073@gaara.hadrons.org>
References: <20110421031957.GA12346@gaara.hadrons.org>
 <CAKgNAkj0FjVtJrJgaifSQ-xy+4GQm3GNmjoOndxMfGeXa+titQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkj0FjVtJrJgaifSQ-xy+4GQm3GNmjoOndxMfGeXa+titQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi!

On Tue, 2011-09-20 at 08:51:41 +0200, Michael Kerrisk wrote:
> I made some edits to your patch, and placed the added explanatory tex=
t
> in NOTES, rather than DESCRIPTION. Modified patch below.
>=20
> The change will be in 3.34.

Thanks! Looks good.

> diff --git a/man2/readlink.2 b/man2/readlink.2
> index c9f6d92..051a870 100644
> --- a/man2/readlink.2
> +++ b/man2/readlink.2
> @@ -1,4 +1,5 @@
>  .\" Copyright (c) 1983, 1991 The Regents of the University of Califo=
rnia.
> +.\" Adn Copyright (C) 2011 Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>

Small typo: Adn =E2=86=92 And.

> +    r =3D readlink(argv[1], linkname, sb.st_size + 1);
> +
> +    if (r < 0) {
> +        perror("lstat");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    if (r !=3D sb.st_size) {
> +        fprintf(stderr, "symlink increased in size "
> +                        "between lstat() and readlink()\\n");
> +        exit(EXIT_FAILURE);
> +    }

You might want to change the check condition to =E2=80=9Cr > sb.st_size=
=E2=80=9D to
match the new error string.

thanks,
guillem
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
