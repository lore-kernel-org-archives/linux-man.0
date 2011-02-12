From: =?UTF-8?Q?Przemys=C5=82aw_Pawe=C5=82czyk?= <przemoc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sendfile.2: Fix description of the out_fd
Date: Sat, 12 Feb 2011 21:11:47 +0100
Message-ID: <AANLkTimMgyM+bUmePtxL83PZdQfRFdZes-hmOLAARRvp@mail.gmail.com>
References: <4D413168.1080901@rs.jp.nec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4D413168.1080901-cUW4a6blu5N8UrSeD/g0lQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akira Fujita <a-fujita-cUW4a6blu5N8UrSeD/g0lQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

2011/1/27 Akira Fujita <a-fujita-cUW4a6blu5N8UrSeD/g0lQ@public.gmane.org>:
> commit cc56f7de7f00d188c7c4da1e9861581853b9e92f made
> sendfile(2) can work with any output file.
> Therefore the out_fd of sendfile(2) can refer to any file,
> but current manual (man-pages-3.32) has not been changed so far.

And I thought I was the only one discovering it recently (beside a few
obvious people year ago). :)

> diff -Nrup man-pages-3.32-a/man2/sendfile.2 man-pages-3.32-b/man2/sen=
dfile.2
> --- man-pages-3.32-a/man2/sendfile.2 =C2=A0 =C2=A02010-12-03 16:01:59=
=2E000000000 +0900
> +++ man-pages-3.32-b/man2/sendfile.2 =C2=A0 =C2=A02011-01-27 16:03:48=
=2E000000000 +0900
> @@ -87,15 +87,11 @@ and the file offset will be updated by t
> =C2=A0.I count
> =C2=A0is the number of bytes to copy between the file descriptors.
>
> -Presently (Linux 2.6.9):
> -.IR in_fd ,
> +.IR in_fd
> =C2=A0must correspond to a file which supports
> =C2=A0.BR mmap (2)-like
> =C2=A0operations
> -(i.e., it cannot be a socket);
> -and
> -.I out_fd
> -must refer to a socket.
> +(i.e., it cannot be a socket).

I don't think that completely removing out_fd socket restriction part
is a proper way of fixing this page. Such information should not be
lost.
I would add here sth like:

out_fd was required to be a socket, but since Linux 2.6.33 it can be
any file. If it is a regular file, then sendfile() changes its offset
appropriately.

>
> =C2=A0Applications may wish to fall back to
> =C2=A0.BR read (2)/ write (2)
> @@ -168,6 +164,9 @@ In Linux 2.4 and earlier,
> =C2=A0could refer to a regular file, and

s/could/could also/

> =C2=A0.BR sendfile ()
> =C2=A0changed the current offset of that file.

> +Since 2.6.33,
> +.I out_fd
> +can refer to any file.

IMO this change shouldn't be mentioned in NOTES section.

>
> =C2=A0The original Linux
> =C2=A0.BR sendfile ()

Regards.

--=20
Przemys=C5=82aw 'Przemoc' Pawe=C5=82czyk
http://przemoc.net/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
