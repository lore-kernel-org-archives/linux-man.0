From: Pierre Habouzit <madcoder-zi3NMfd+bKEdnm+yROfE0A@public.gmane.org>
Subject: Re: [Bug libc/11459] New: ftw doesn't work like documented (may be
 a   documentation bug)
Date: Wed, 2 Jun 2010 23:42:57 +0200
Message-ID: <20100602214257.GB21506@madism.org>
References: <20100403201146.28880.qmail@sourceware.org>
 <20100331172608.11459.madcoder@debian.org>
 <20100406090358.GP11893@laphroaig.corp>
 <AANLkTim05fJpMXD1owEON-70WwxDUkxIvYIgkn7EfBEf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTim05fJpMXD1owEON-70WwxDUkxIvYIgkn7EfBEf-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, May 24, 2010 at 07:41:49PM +0200, Michael Kerrisk wrote:
> Hello Pierre,
>=20
> On Tue, Apr 6, 2010 at 11:03 AM, Pierre Habouzit <madcoder-zi3NMfd+bKEdnm+yROfE0A@public.gmane.org=
> wrote:
> > See below a bug reported against the glibc. =C2=A0Since the glibc m=
aintainer
> > dodged that one, I assume the bug indeed is in the documentation of
> > ftw(3). My manpages are the 3.24-1 Debian package.
>=20
> Yes. The man page is clearly incorrect. Thanks for reporting this.
>=20
> > IMHO the patch is:
> >
> > =C2=A0-fpath is the pathname of the entry relative to dirpath.
> > =C2=A0+fpath is the pathname of the entry relative to the current w=
orking directory.
> >
> > POSIX is very vague about what "fpath" should be btw.
>=20
> (Agreed. It could be more precise.)
>=20
> I believe the correct text should be this:
>=20
>        fpath   is  the  pathname  of  the  entry,  and  is
>        expressed either as  a  pathname  relative  to  the
>        calling  process's current working directory at the
>        time of the call to ftw(), if dirpath was expressed
>        as a relative pathname, or as an absolute pathname,
>        if dirpath was expressed as an  absolute  pathname.
>=20
> I have updated the man page accordingly, but would welcome
> review/checking of this text.

Afaict, it's not correct: ftw may perform chdir() calls, so the pathnam=
e
is relative to the current working directory at the time `fn` is called=
=2E

I'd rather phrase it that way (minus probable english mistakes):

    fpath is the pathname of the entry, and is either a relative
    pathname to the current working directory of the application when
    `fn` is called, or as an absolute pathname.

--=20
=C2=B7O=C2=B7  Pierre Habouzit
=C2=B7=C2=B7O                                                madcoder@d=
ebian.org
OOO                                                http://www.madism.or=
g
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
