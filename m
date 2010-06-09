From: Pierre Habouzit <madcoder-zi3NMfd+bKEdnm+yROfE0A@public.gmane.org>
Subject: Re: [Bug libc/11459] New: ftw doesn't work like documented (may be
 a   documentation bug)
Date: Wed, 9 Jun 2010 12:46:29 +0200
Message-ID: <20100609104629.GA2340@madism.org>
References: <20100403201146.28880.qmail@sourceware.org>
 <20100331172608.11459.madcoder@debian.org>
 <20100406090358.GP11893@laphroaig.corp>
 <AANLkTim05fJpMXD1owEON-70WwxDUkxIvYIgkn7EfBEf@mail.gmail.com>
 <20100602214257.GB21506@madism.org>
 <AANLkTinhGzNB_dabQcan3c1nQuGwkaTIBAVZuRO2dJty@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTinhGzNB_dabQcan3c1nQuGwkaTIBAVZuRO2dJty-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Jun 03, 2010 at 09:18:22AM +0200, Michael Kerrisk wrote:
> Hi Pierre,
>=20
> On Wed, Jun 2, 2010 at 11:42 PM, Pierre Habouzit <madcoder-zi3NMfd+bKEdnm+yROfE0A@public.gmane.org=
> wrote:
> > On Mon, May 24, 2010 at 07:41:49PM +0200, Michael Kerrisk wrote:
> >> Hello Pierre,
> >>
> >> On Tue, Apr 6, 2010 at 11:03 AM, Pierre Habouzit <madcoder@madism.=
org> wrote:
> >> > See below a bug reported against the glibc. =C2=A0Since the glib=
c maintainer
> >> > dodged that one, I assume the bug indeed is in the documentation=
 of
> >> > ftw(3). My manpages are the 3.24-1 Debian package.
> >>
> >> Yes. The man page is clearly incorrect. Thanks for reporting this.
> >>
> >> > IMHO the patch is:
> >> >
> >> > =C2=A0-fpath is the pathname of the entry relative to dirpath.
> >> > =C2=A0+fpath is the pathname of the entry relative to the curren=
t working directory.
> >> >
> >> > POSIX is very vague about what "fpath" should be btw.
> >>
> >> (Agreed. It could be more precise.)
> >>
> >> I believe the correct text should be this:
> >>
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0fpath =C2=A0 is =C2=A0the =C2=A0pathnam=
e =C2=A0of =C2=A0the =C2=A0entry, =C2=A0and =C2=A0is
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0expressed either as =C2=A0a =C2=A0pathn=
ame =C2=A0relative =C2=A0to =C2=A0the
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0calling =C2=A0process's current working=
 directory at the
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0time of the call to ftw(), if dirpath w=
as expressed
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0as a relative pathname, or as an absolu=
te pathname,
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0if dirpath was expressed as an =C2=A0ab=
solute =C2=A0pathname.
> >>
> >> I have updated the man page accordingly, but would welcome
> >> review/checking of this text.
> >
> > Afaict, it's not correct: ftw may perform chdir() calls, so the pat=
hname
> > is relative to the current working directory at the time `fn` is ca=
lled.
> >
> > I'd rather phrase it that way (minus probable english mistakes):
> >
> > =C2=A0 =C2=A0fpath is the pathname of the entry, and is either a re=
lative
> > =C2=A0 =C2=A0pathname to the current working directory of the appli=
cation when
> > =C2=A0 =C2=A0`fn` is called, or as an absolute pathname.
>=20
> Thanks for taking a look at this. However, I *think* your analysis is
> wrong, and my proposed changes is right. But, still I'd like some
> further confirmation. Please take a look at the the program below, an=
d
> the output produced when it runs.

Yeah, that's because you're doing chdir()s during ftw, which is
undefined behaviour as documented in the manpage already IIRC.

The point is, ftw() /may/ decide to do chdir() by itself sometimes, and
then the path is relative to the current working directory as set by
ftw().

I'm pretty sure it's what POSIX authorizes ftw() to perform chdirs.

And when I look at ftw.c in the glibc, it's also pretty much what
happens in the case when you set FTW_CHDIR in the flags: ftw() forces a
chdir before the fn() call, and makes the path relative to this cwd.

It happens that the glibc doesn't seem to perform any kind of chdir() i=
n
the other cases (IOW when FTW_CHDIR isn't set), but I'm pretty sure
POSIX allows ftw() to do so.
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
