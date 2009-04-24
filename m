From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [patch] epoll.7: fix unfinished string in example code
Date: Fri, 24 Apr 2009 13:16:57 +1200
Message-ID: <cfd18e0f0904231816x2941c7c5qa33efdc9280ff807@mail.gmail.com>
References: <acf3f2e60904221422l33e37f8bg969c242d6e7dd1a7@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <acf3f2e60904221422l33e37f8bg969c242d6e7dd1a7-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucian Adrian Grijincu <lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Lucian,

On Thu, Apr 23, 2009 at 9:22 AM, Lucian Adrian Grijincu
<lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> There is an unfinished string =EEn an example =EEn epoll.7
> Patch inline and attached.

Thanks!  Applied for 3.22.

Cheers,

Michael

> diff --git a/man7/epoll.7 b/man7/epoll.7
> index ba9ec06..ff67371 100644
> --- a/man7/epoll.7
> +++ b/man7/epoll.7
> @@ -263,7 +263,7 @@ for (;;) {
> =A0 =A0 =A0 =A0 =A0 =A0 ev.data.fd =3D conn_sock;
> =A0 =A0 =A0 =A0 =A0 =A0 if (epoll_ctl(epollfd, EPOLL_CTL_ADD, conn_so=
ck,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &ev) =3D=3D \-1) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0perror("epoll_ctl: conn_sock);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0perror("epoll_ctl: conn_sock");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 exit(EXIT_FAILURE);
> =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 } else {
>
>
> --
> =A0.
> ..: Lucian
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
=46ound a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
