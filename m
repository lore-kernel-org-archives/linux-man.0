From: Stephane Fillod <fillods-iA+eEnwkJgzk1uMJSBkQmQ@public.gmane.org>
Subject: Re: Missing ioctl descriptions: TIOCMIWAIT, TIOCGICOUNT
Date: Thu, 3 Oct 2013 14:37:19 +0000 (UTC)
Message-ID: <loom.20131003T162604-48@post.gmane.org>
References: <CAFhHFBwabFu9obCPVWJYZVJ4d1qAcQvwR1JhhEJgZgpSGVTLQg@mail.gmail.com> <CAKgNAkhnZfZXB5xr1U7UcU6d8DyumgaUTa2_c6TfxU1opU=uZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael Kerrisk <mtk.manpages@...> writes:
> On Sat, Jan 21, 2012 at 11:28 PM, Andreas Heiduk
> <asheiduk@...> wrote:
> > my Ubuntu 10.04 (lucid) distribution uses manpages-3.23-1. But neit=
her
> > there nor in the browsable manpages here
> >
> > http://www.kernel.org/doc/man-pages/online/pages/man4/tty_ioctl.4.h=
tml
> > http://www.kernel.org/doc/man-pages/online/pages/man2/ioctl_list.2.=
html
> >
> > there is a description for the ioctls TIOCMIWAIT and TIOCGICOUNT
> >
> > Could you please add them to the pages ioctl_list and tty_ioctl ?
>=20
> Andreas,
>=20
> Sorry -- I don't know the purpose of these two ioctl()s. If you have
> some text to propose, I could take it.

A patch[1] for these descriptions has been submitted by Fr=C3=A9d=C3=A9=
ric Maria back
in '09, but left unhandled. The patch looks good to me. Do you think yo=
u can
apply it?

[1] http://article.gmane.org/gmane.linux.man/770

Cheers,
--=20
Stephane

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
