From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH] iswblank.3: ATTRIBUTES: Note function that is thread
 safe with exceptions
Date: Wed, 11 Jun 2014 17:33:23 +0800
Message-ID: <53982263.20405@cn.fujitsu.com>
References: <1392013239-31138-1-git-send-email-penght@cn.fujitsu.com> <CAE2sS1g5w0jZ04EovvQoW=Cta4ACdHWVus-5zo+vw1J7E1SnZg@mail.gmail.com> <52FACFBB.6070607@cn.fujitsu.com> <CAE2sS1ijg2ef1WcswN0o+wmJOcgLDoCEbYrcNJyOxhS-HCxuSg@mail.gmail.com> <CAKgNAkix8vTrKEV_vicpD2yH88NQmiSrMR9dgKoQ1u2NkqZexA@mail.gmail.com> <CAE2sS1gZJCZdEhY7hpF8=dP069JFTyxD-B-nY9va0OTFV8jN4w@mail.gmail.com> <CAKgNAkh029iy5=7+N1RiA1_X9Zeiv_coci59bFN1y-oQmOJykA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkh029iy5=7+N1RiA1_X9Zeiv_coci59bFN1y-oQmOJykA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


On 06/11/2014 04:30 PM, Michael Kerrisk (man-pages) wrote:
=2E..
> Practically speaking, I think this means:
>=20
> 1. We'd create an attributes(7) man page that has much of the same
> information as in the glibc manual nodes listed above. If needed we
> can rewrite to avoid any licensing issues. On the other hand, if
> Alex(?) wants to make that text available under a suitable license
> (e.g., one of those at
> https://www.kernel.org/doc/man-pages/licenses.html). (Note, GFDL
> doesn't work for man-pages, as explained on that web page.)
>=20
> 2. We redesign the ATTRIBUTES section that we use in man-pages. I
> think it would make sense to use something like the Solaris
> attributes(5) approach, where there is a table of safety information.
> That table would be supplemented by notes, as needed. Thus, we might
> have something like:
>=20
>     ATTRIBUTES
>=20
>         See attributes(7).
>=20
>         +-----------+---------------+-----------+
>         | Interface | Attribute     | Value     |
>         +-----------+---------------+-----------+
>         | l64a()    | Thread-safety | MT-Unsafe |
>         +-----------+---------------+-----------+
>=20
>         +-------------------+---------------+---------+
>        | Interface         | Attribute     | Value   |
>        +-------------------+---------------+---------+
>         | bindresvport()    | Thread-safety | MT-Safe |
>         +-------------------+---------------+---------+
>=20
>         Before glibc 2.17, the bindresvport() function uses a static =
variable
>         that is not protected, so it is not thread-safe.
>         Since glibc 2.17, it protects the static variable with a lock=
,
>         and is thus MT-Safe.
>=20
>         +----------------------------+---------------+---------------=
-+
>         | Interface                  | Attribute     | Value         =
 |
>         +----------------------------+---------------+---------------=
-+
>         | atoi(), atol(), atoll()    | Thread-safety | MT-Safe locale=
 |
>         +----------------------------+---------------+---------------=
-+
>=20
>         +--------------------------+---------------------+---------+
>         | Interface                | Attribute           | Value   |
>         +--------------------------+---------------------+---------+
>         | pthread_setcancelstate() | Async-cancel-safety | AC-Safe |
>         +--------------------------+---------------------+---------+
>=20
> An alternative approach would be to have subsections under ATTRIBUES,
> with separate tables for Thread-safety, Async-signal-safety, and
> Async-cancel-safety. Something like this:
>=20
>     ATTRIBUTES
>=20
>             See attributes(7).
>=20
>         Thread-safety
>             +-------------------+---------+
>             | Interface         | Value   |
>             +-------------------+---------+
>             | bindresvport()    | MT-Safe |
>             +-------------------+---------+
>=20
>             Before glibc 2.17, the bindresvport() function uses a sta=
tic
>             variable that is not protected, so it is not thread-safe.
>             Since glibc 2.17, it protects the static variable with a =
lock,
>             and is thus MT-Safe.
>=20
>         Async-cancel-safety
>=20
>             +--------------------------+---------+
>             | Interface                | Value   |
>             +--------------------------+---------+
>             | pthread_setcancelstate() | AC-Safe |
>             +--------------------------+---------+
>=20
> Does one of those approaches eem okay? Haitao, Qian Lei, what do you
> think? (I appreciate that there's a lot of pages to be fixed to follo=
w
> this new approach: I'd do that, though you could help if you want.)
>=20

I select the first approach.
If the approach is decided=EF=BC=8CQian and I will help to fix to follo=
w the new approach.
Thanks.


--=20
Best Regards,
Peng

> Cheers,
>=20
> Michael
>=20
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
