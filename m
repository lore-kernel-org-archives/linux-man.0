From: Pierre Habouzit <madcoder-zi3NMfd+bKEdnm+yROfE0A@public.gmane.org>
Subject: Re: [Bug libc/11459] New: ftw doesn't work like documented (may be
 a   documentation bug)
Date: Thu, 24 Jun 2010 22:12:16 +0200
Message-ID: <20100624201216.GB5357@madism.org>
References: <20100403201146.28880.qmail@sourceware.org>
 <20100331172608.11459.madcoder@debian.org>
 <20100406090358.GP11893@laphroaig.corp>
 <AANLkTim05fJpMXD1owEON-70WwxDUkxIvYIgkn7EfBEf@mail.gmail.com>
 <20100602214257.GB21506@madism.org>
 <AANLkTinhGzNB_dabQcan3c1nQuGwkaTIBAVZuRO2dJty@mail.gmail.com>
 <20100609104629.GA2340@madism.org>
 <AANLkTikWG4U2wWS6ccM98Mg32WNrVCu5QCmz46hQ7lCC@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTikWG4U2wWS6ccM98Mg32WNrVCu5QCmz46hQ7lCC-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

I think it makes sense indeed.

On Thu, Jun 10, 2010 at 07:04:20AM +0200, Michael Kerrisk wrote:
> Hi Pierre,
>=20
> Thanks for following up on this. I still think the current man page
> text is correct. See below.
>=20
> On Wed, Jun 9, 2010 at 12:46 PM, Pierre Habouzit <madcoder-zi3NMfd+bKEdnm+yROfE0A@public.gmane.org=
> wrote:
> > On Thu, Jun 03, 2010 at 09:18:22AM +0200, Michael Kerrisk wrote:
> >> Hi Pierre,
> >>
> >> On Wed, Jun 2, 2010 at 11:42 PM, Pierre Habouzit <madcoder@madism.=
org> wrote:
> >> > On Mon, May 24, 2010 at 07:41:49PM +0200, Michael Kerrisk wrote:
> >> >> Hello Pierre,
> >> >>
> >> >> On Tue, Apr 6, 2010 at 11:03 AM, Pierre Habouzit <madcoder@madi=
sm.org> wrote:
> >> >> > See below a bug reported against the glibc. =C2=A0Since the g=
libc maintainer
> >> >> > dodged that one, I assume the bug indeed is in the documentat=
ion of
> >> >> > ftw(3). My manpages are the 3.24-1 Debian package.
> >> >>
> >> >> Yes. The man page is clearly incorrect. Thanks for reporting th=
is.
> >> >>
> >> >> > IMHO the patch is:
> >> >> >
> >> >> > =C2=A0-fpath is the pathname of the entry relative to dirpath=
=2E
> >> >> > =C2=A0+fpath is the pathname of the entry relative to the cur=
rent working directory.
> >> >> >
> >> >> > POSIX is very vague about what "fpath" should be btw.
> >> >>
> >> >> (Agreed. It could be more precise.)
> >> >>
> >> >> I believe the correct text should be this:
> >> >>
> >> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0fpath =C2=A0 is =C2=A0the =C2=A0path=
name =C2=A0of =C2=A0the =C2=A0entry, =C2=A0and =C2=A0is
> >> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0expressed either as =C2=A0a =C2=A0pa=
thname =C2=A0relative =C2=A0to =C2=A0the
> >> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0calling =C2=A0process's current work=
ing directory at the
> >> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0time of the call to ftw(), if dirpat=
h was expressed
> >> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0as a relative pathname, or as an abs=
olute pathname,
> >> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0if dirpath was expressed as an =C2=A0=
absolute =C2=A0pathname..
> >> >>
> >> >> I have updated the man page accordingly, but would welcome
> >> >> review/checking of this text.
> >> >
> >> > Afaict, it's not correct: ftw may perform chdir() calls, so the =
pathname
> >> > is relative to the current working directory at the time `fn` is=
 called.
> >> >
> >> > I'd rather phrase it that way (minus probable english mistakes):
> >> >
> >> > =C2=A0 =C2=A0fpath is the pathname of the entry, and is either a=
 relative
> >> > =C2=A0 =C2=A0pathname to the current working directory of the ap=
plication when
> >> > =C2=A0 =C2=A0`fn` is called, or as an absolute pathname.
> >>
> >> Thanks for taking a look at this. However, I *think* your analysis=
 is
> >> wrong, and my proposed changes is right. But, still I'd like some
> >> further confirmation. Please take a look at the the program below,=
 and
> >> the output produced when it runs.
> >
> > Yeah, that's because you're doing chdir()s during ftw, which is
> > undefined behaviour as documented in the manpage already IIRC.
>=20
> True. That is documented in the POSIX page, but not currently in
> man-pages. I've fixed that now. Thanks.
>=20
> > The point is, ftw() /may/ decide to do chdir() by itself sometimes,=
 and
> > then the path is relative to the current working directory as set b=
y
> > ftw().
>=20
> I'm not sure why you think it may decide to do this. If this was
> unpredictable, then it would create difficulties for the application,
> as far as I can tell, since it would take quite some effort to
> correctly interpret the pathname supplied to 'fn'. And POSIX seems
> fairly clear on the point (at least for nftw()):
>=20
>        FTW_CHDIR
>               If set, nftw() shall change  the  current  working
>               directory to each directory as it reports files in
>               that directory. If clear, nftw() shall not  change
>               the current working directory.
>=20
> > I'm pretty sure it's what POSIX authorizes ftw() to perform chdirs.
>=20
> See above.
>=20
> > And when I look at ftw.c in the glibc, it's also pretty much what
> > happens in the case when you set FTW_CHDIR in the flags: ftw() forc=
es a
> > chdir before the fn() call, and makes the path relative to this cwd=
=2E
>=20
> Yes to the first part, but as far as I can see, still no to the last
> part ("and makes the path relative to this cwd" ). See below.
>=20
> > It happens that the glibc doesn't seem to perform any kind of chdir=
() in
> > the other cases (IOW when FTW_CHDIR isn't set), but I'm pretty sure
> > POSIX allows ftw() to do so.
>=20
> I don't see anywhere that POSIX authorizes that, and it wouldn't seem
> sensible to do so. See above.
>=20
> Here's a variation on my earlier test program that uses nftw()
> instead. If "c" is provided in the second command line argument, it
> uses "FTW_CHDIR". Looking at the results, do you agree with my
> analysis?
>=20
> $ cat n.c
> #define _GNU_SOURCE
> #define _XOPEN_SOURCE 500
> #include <ftw.h>
> #include <stdio.h>
> #include <stdlib.h>
> #include <string.h>
>=20
>=20
> static int
> displayFileInfo(const char *fpath, const struct stat *sb,
>                 int tflag, struct FTW *ftwbuf)
> {
>     printf("%-3s %2d %7lld   %-40s %d %s\n",
>         (tflag =3D=3D FTW_D) ?   "d"   : (tflag =3D=3D FTW_DNR) ? "dn=
r" :
>         (tflag =3D=3D FTW_DP) ?  "dp"  : (tflag =3D=3D FTW_F) ?   "f"=
 :
>         (tflag =3D=3D FTW_NS) ?  "ns"  : (tflag =3D=3D FTW_SL) ?  "sl=
" :
>         (tflag =3D=3D FTW_SLN) ? "sln" : "???",
>         ftwbuf->level, (long long) sb->st_size,
>         fpath, ftwbuf->base, fpath + ftwbuf->base);
> #ifdef DO_CHDIR
>     /* Let's mess with the curent directory during the ftw() call,
>        to see what value is passed to 'pathname' in successive calls
>        to displayFileInfo() */
>=20
>     chdir("..");
> #endif
>     system("pwd");
>     return 0;           /* To tell nftw() to continue */
> }
>=20
> int
> main(int argc, char *argv[])
> {
>     int flags =3D 0;
>=20
>     if (argc > 2 && strchr(argv[2], 'd') !=3D NULL)
>         flags |=3D FTW_DEPTH;
>     if (argc > 2 && strchr(argv[2], 'p') !=3D NULL)
>         flags |=3D FTW_PHYS;
>     if (argc > 2 && strchr(argv[2], 'c') !=3D NULL)
>         flags |=3D FTW_CHDIR;
>=20
>     if (nftw((argc < 2) ? "." : argv[1], displayFileInfo, 20, flags) =
=3D=3D -1) {
>         perror("nftw");
>         exit(EXIT_FAILURE);
>     }
>=20
>     exit(EXIT_SUCCESS);
> }
>=20
> $ cc -o n n.c
> $ cd dir1
> /home/mtk/tlpi/dl/dir1
> $ find ../dir2
> .../dir2
> .../dir2/sub
> .../dir2/sub/d
> .../dir2/sub/b
> .../dir2/sub/c
> .../dir2/sub/a
> .../dir2/bbb
> $ ../n ../dir2 c
> d    0    4096   ../dir2                                  3 dir2
> /home/mtk/tlpi/dirs_links
> d    1    4096   ../dir2/sub                              8 sub
> /home/mtk/tlpi/dirs_links/dir2
> f    2       0   ../dir2/sub/d                            12 d
> /home/mtk/tlpi/dirs_links/dir2/sub
> f    2       0   ../dir2/sub/b                            12 b
> /home/mtk/tlpi/dirs_links/dir2/sub
> f    2       0   ../dir2/sub/c                            12 c
> /home/mtk/tlpi/dirs_links/dir2/sub
> f    2       0   ../dir2/sub/a                            12 a
> /home/mtk/tlpi/dirs_links/dir2/sub
> f    1      38   ../dir2/bbb                              8 bbb
> /home/mtk/tlpi/dirs_links/dir2
> $ ../n ../dir2
> d    0    4096   ../dir2                                  3 dir2
> /home/mtk/tlpi/dl/dir1
> d    1    4096   ../dir2/sub                              8 sub
> /home/mtk/tlpi/dl/dir1
> f    2       0   ../dir2/sub/d                            12 d
> /home/mtk/tlpi/dl/dir1
> f    2       0   ../dir2/sub/b                            12 b
> /home/mtk/tlpi/dl/dir1
> f    2       0   ../dir2/sub/c                            12 c
> /home/mtk/tlpi/dl/dir1
> f    2       0   ../dir2/sub/a                            12 a
> /home/mtk/tlpi/dl/dir1
> f    1      38   ../dir2/bbb                              8 bbb
> /home/mtk/tlpi/dl/dir1
>=20
> Thanks,
>=20
> Michael

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
