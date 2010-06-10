From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: example in fmemopen.3
Date: Thu, 10 Jun 2010 06:21:29 +0200
Message-ID: <AANLkTimO3OIc3uLSlPvJbpw5bRD0mIIAErFJpkAZdQa5@mail.gmail.com>
References: <4BFFD3CF.2070608@bfs.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4BFFD3CF.2070608-fPG8STNUNVg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wharms-fPG8STNUNVg@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Walter,

On Fri, May 28, 2010 at 4:31 PM, walter harms <wharms-fPG8STNUNVg@public.gmane.org> wrote:
> =A0Hi,
> the error message in the fmemopen example is confusing
>
> =A0 =A0 =A0 =A0 =A0in =3D fmemopen(argv[1], strlen(argv[1]), "r");
> =A0 =A0 =A0 =A0 =A0 if (in =3D=3D NULL)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 handle_error("fmemopen");
>
> =A0 =A0 =A0 =A0 =A0 out =3D open_memstream(&ptr, &size);
> =A0 =A0 =A0 =A0 =A0 if (out =3D=3D NULL)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 handle_error("fmemopen");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0^^^^^^^^^^^^^^^^^
>
> perhaps =A0 =A0 =A0 =A0 handle_error("open_memstream"); is intended ?

Agreed. Fixed for man-pages-3.25.

Thanks!

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
