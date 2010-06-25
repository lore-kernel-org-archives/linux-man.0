From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Bug libc/11459] New: ftw doesn't work like documented (may be a
	documentation bug)
Date: Fri, 25 Jun 2010 06:53:31 +0200
Message-ID: <AANLkTikoQVbrO_-HYkAQjBHTXf6PTkbmLs5-EaLNVA3g@mail.gmail.com>
References: <20100403201146.28880.qmail@sourceware.org> <20100331172608.11459.madcoder@debian.org>
	<20100406090358.GP11893@laphroaig.corp> <AANLkTim05fJpMXD1owEON-70WwxDUkxIvYIgkn7EfBEf@mail.gmail.com>
	<20100602214257.GB21506@madism.org> <AANLkTinhGzNB_dabQcan3c1nQuGwkaTIBAVZuRO2dJty@mail.gmail.com>
	<20100609104629.GA2340@madism.org> <AANLkTikWG4U2wWS6ccM98Mg32WNrVCu5QCmz46hQ7lCC@mail.gmail.com>
	<20100624201216.GB5357@madism.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100624201216.GB5357-zi3NMfd+bKEdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pierre Habouzit <madcoder-zi3NMfd+bKEdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Jun 24, 2010 at 10:12 PM, Pierre Habouzit <madcoder-zi3NMfd+bKEdnm+yROfE0A@public.gmane.org>=
 wrote:
> I think it makes sense indeed.

Thanks Pierre. It's always good to have someone else confirm.

Cheers,

Michael


> On Thu, Jun 10, 2010 at 07:04:20AM +0200, Michael Kerrisk wrote:
>> Hi Pierre,
>>
>> Thanks for following up on this. I still think the current man page
>> text is correct. See below.
>>
>> On Wed, Jun 9, 2010 at 12:46 PM, Pierre Habouzit <madcoder-zi3NMfd+bKFQFI55V6+gNQ@public.gmane.org=
g> wrote:
>> > On Thu, Jun 03, 2010 at 09:18:22AM +0200, Michael Kerrisk wrote:
>> >> Hi Pierre,
>> >>
>> >> On Wed, Jun 2, 2010 at 11:42 PM, Pierre Habouzit <madcoder@madism=
=2Eorg> wrote:
>> >> > On Mon, May 24, 2010 at 07:41:49PM +0200, Michael Kerrisk wrote=
:
>> >> >> Hello Pierre,
>> >> >>
>> >> >> On Tue, Apr 6, 2010 at 11:03 AM, Pierre Habouzit <madcoder@mad=
ism.org> wrote:
>> >> >> > See below a bug reported against the glibc. =A0Since the gli=
bc maintainer
>> >> >> > dodged that one, I assume the bug indeed is in the documenta=
tion of
>> >> >> > ftw(3). My manpages are the 3.24-1 Debian package.
>> >> >>
>> >> >> Yes. The man page is clearly incorrect. Thanks for reporting t=
his.
>> >> >>
>> >> >> > IMHO the patch is:
>> >> >> >
>> >> >> > =A0-fpath is the pathname of the entry relative to dirpath.
>> >> >> > =A0+fpath is the pathname of the entry relative to the curre=
nt working directory.
>> >> >> >
>> >> >> > POSIX is very vague about what "fpath" should be btw.
>> >> >>
>> >> >> (Agreed. It could be more precise.)
>> >> >>
>> >> >> I believe the correct text should be this:
>> >> >>
>> >> >> =A0 =A0 =A0 =A0fpath =A0 is =A0the =A0pathname =A0of =A0the =A0=
entry, =A0and =A0is
>> >> >> =A0 =A0 =A0 =A0expressed either as =A0a =A0pathname =A0relativ=
e =A0to =A0the
>> >> >> =A0 =A0 =A0 =A0calling =A0process's current working directory =
at the
>> >> >> =A0 =A0 =A0 =A0time of the call to ftw(), if dirpath was expre=
ssed
>> >> >> =A0 =A0 =A0 =A0as a relative pathname, or as an absolute pathn=
ame,
>> >> >> =A0 =A0 =A0 =A0if dirpath was expressed as an =A0absolute =A0p=
athname..
>> >> >>
>> >> >> I have updated the man page accordingly, but would welcome
>> >> >> review/checking of this text.
>> >> >
>> >> > Afaict, it's not correct: ftw may perform chdir() calls, so the=
 pathname
>> >> > is relative to the current working directory at the time `fn` i=
s called.
>> >> >
>> >> > I'd rather phrase it that way (minus probable english mistakes)=
:
>> >> >
>> >> > =A0 =A0fpath is the pathname of the entry, and is either a rela=
tive
>> >> > =A0 =A0pathname to the current working directory of the applica=
tion when
>> >> > =A0 =A0`fn` is called, or as an absolute pathname.
>> >>
>> >> Thanks for taking a look at this. However, I *think* your analysi=
s is
>> >> wrong, and my proposed changes is right. But, still I'd like some
>> >> further confirmation. Please take a look at the the program below=
, and
>> >> the output produced when it runs.
>> >
>> > Yeah, that's because you're doing chdir()s during ftw, which is
>> > undefined behaviour as documented in the manpage already IIRC.
>>
>> True. That is documented in the POSIX page, but not currently in
>> man-pages. I've fixed that now. Thanks.
>>
>> > The point is, ftw() /may/ decide to do chdir() by itself sometimes=
, and
>> > then the path is relative to the current working directory as set =
by
>> > ftw().
>>
>> I'm not sure why you think it may decide to do this. If this was
>> unpredictable, then it would create difficulties for the application=
,
>> as far as I can tell, since it would take quite some effort to
>> correctly interpret the pathname supplied to 'fn'. And POSIX seems
>> fairly clear on the point (at least for nftw()):
>>
>> =A0 =A0 =A0 =A0FTW_CHDIR
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 If set, nftw() shall change =A0the =A0cu=
rrent =A0working
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 directory to each directory as it report=
s files in
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 that directory. If clear, nftw() shall n=
ot =A0change
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 the current working directory.
>>
>> > I'm pretty sure it's what POSIX authorizes ftw() to perform chdirs=
=2E
>>
>> See above.
>>
>> > And when I look at ftw.c in the glibc, it's also pretty much what
>> > happens in the case when you set FTW_CHDIR in the flags: ftw() for=
ces a
>> > chdir before the fn() call, and makes the path relative to this cw=
d.
>>
>> Yes to the first part, but as far as I can see, still no to the last
>> part ("and makes the path relative to this cwd" ). See below.
>>
>> > It happens that the glibc doesn't seem to perform any kind of chdi=
r() in
>> > the other cases (IOW when FTW_CHDIR isn't set), but I'm pretty sur=
e
>> > POSIX allows ftw() to do so.
>>
>> I don't see anywhere that POSIX authorizes that, and it wouldn't see=
m
>> sensible to do so. See above.
>>
>> Here's a variation on my earlier test program that uses nftw()
>> instead. If "c" is provided in the second command line argument, it
>> uses "FTW_CHDIR". Looking at the results, do you agree with my
>> analysis?
>>
>> $ cat n.c
>> #define _GNU_SOURCE
>> #define _XOPEN_SOURCE 500
>> #include <ftw.h>
>> #include <stdio.h>
>> #include <stdlib.h>
>> #include <string.h>
>>
>>
>> static int
>> displayFileInfo(const char *fpath, const struct stat *sb,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int tflag, struct FTW *ftwbuf)
>> {
>> =A0 =A0 printf("%-3s %2d %7lld =A0 %-40s %d %s\n",
>> =A0 =A0 =A0 =A0 (tflag =3D=3D FTW_D) ? =A0 "d" =A0 : (tflag =3D=3D F=
TW_DNR) ? "dnr" :
>> =A0 =A0 =A0 =A0 (tflag =3D=3D FTW_DP) ? =A0"dp" =A0: (tflag =3D=3D F=
TW_F) ? =A0 "f" :
>> =A0 =A0 =A0 =A0 (tflag =3D=3D FTW_NS) ? =A0"ns" =A0: (tflag =3D=3D F=
TW_SL) ? =A0"sl" :
>> =A0 =A0 =A0 =A0 (tflag =3D=3D FTW_SLN) ? "sln" : "???",
>> =A0 =A0 =A0 =A0 ftwbuf->level, (long long) sb->st_size,
>> =A0 =A0 =A0 =A0 fpath, ftwbuf->base, fpath + ftwbuf->base);
>> #ifdef DO_CHDIR
>> =A0 =A0 /* Let's mess with the curent directory during the ftw() cal=
l,
>> =A0 =A0 =A0 =A0to see what value is passed to 'pathname' in successi=
ve calls
>> =A0 =A0 =A0 =A0to displayFileInfo() */
>>
>> =A0 =A0 chdir("..");
>> #endif
>> =A0 =A0 system("pwd");
>> =A0 =A0 return 0; =A0 =A0 =A0 =A0 =A0 /* To tell nftw() to continue =
*/
>> }
>>
>> int
>> main(int argc, char *argv[])
>> {
>> =A0 =A0 int flags =3D 0;
>>
>> =A0 =A0 if (argc > 2 && strchr(argv[2], 'd') !=3D NULL)
>> =A0 =A0 =A0 =A0 flags |=3D FTW_DEPTH;
>> =A0 =A0 if (argc > 2 && strchr(argv[2], 'p') !=3D NULL)
>> =A0 =A0 =A0 =A0 flags |=3D FTW_PHYS;
>> =A0 =A0 if (argc > 2 && strchr(argv[2], 'c') !=3D NULL)
>> =A0 =A0 =A0 =A0 flags |=3D FTW_CHDIR;
>>
>> =A0 =A0 if (nftw((argc < 2) ? "." : argv[1], displayFileInfo, 20, fl=
ags) =3D=3D -1) {
>> =A0 =A0 =A0 =A0 perror("nftw");
>> =A0 =A0 =A0 =A0 exit(EXIT_FAILURE);
>> =A0 =A0 }
>>
>> =A0 =A0 exit(EXIT_SUCCESS);
>> }
>>
>> $ cc -o n n.c
>> $ cd dir1
>> /home/mtk/tlpi/dl/dir1
>> $ find ../dir2
>> .../dir2
>> .../dir2/sub
>> .../dir2/sub/d
>> .../dir2/sub/b
>> .../dir2/sub/c
>> .../dir2/sub/a
>> .../dir2/bbb
>> $ ../n ../dir2 c
>> d =A0 =A00 =A0 =A04096 =A0 ../dir2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A03 dir2
>> /home/mtk/tlpi/dirs_links
>> d =A0 =A01 =A0 =A04096 =A0 ../dir2/sub =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A08 sub
>> /home/mtk/tlpi/dirs_links/dir2
>> f =A0 =A02 =A0 =A0 =A0 0 =A0 ../dir2/sub/d =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A012 d
>> /home/mtk/tlpi/dirs_links/dir2/sub
>> f =A0 =A02 =A0 =A0 =A0 0 =A0 ../dir2/sub/b =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A012 b
>> /home/mtk/tlpi/dirs_links/dir2/sub
>> f =A0 =A02 =A0 =A0 =A0 0 =A0 ../dir2/sub/c =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A012 c
>> /home/mtk/tlpi/dirs_links/dir2/sub
>> f =A0 =A02 =A0 =A0 =A0 0 =A0 ../dir2/sub/a =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A012 a
>> /home/mtk/tlpi/dirs_links/dir2/sub
>> f =A0 =A01 =A0 =A0 =A038 =A0 ../dir2/bbb =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A08 bbb
>> /home/mtk/tlpi/dirs_links/dir2
>> $ ../n ../dir2
>> d =A0 =A00 =A0 =A04096 =A0 ../dir2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A03 dir2
>> /home/mtk/tlpi/dl/dir1
>> d =A0 =A01 =A0 =A04096 =A0 ../dir2/sub =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A08 sub
>> /home/mtk/tlpi/dl/dir1
>> f =A0 =A02 =A0 =A0 =A0 0 =A0 ../dir2/sub/d =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A012 d
>> /home/mtk/tlpi/dl/dir1
>> f =A0 =A02 =A0 =A0 =A0 0 =A0 ../dir2/sub/b =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A012 b
>> /home/mtk/tlpi/dl/dir1
>> f =A0 =A02 =A0 =A0 =A0 0 =A0 ../dir2/sub/c =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A012 c
>> /home/mtk/tlpi/dl/dir1
>> f =A0 =A02 =A0 =A0 =A0 0 =A0 ../dir2/sub/a =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A012 a
>> /home/mtk/tlpi/dl/dir1
>> f =A0 =A01 =A0 =A0 =A038 =A0 ../dir2/bbb =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A08 bbb
>> /home/mtk/tlpi/dl/dir1
>>
>> Thanks,
>>
>> Michael
>
> --
> =B7O=B7 =A0Pierre Habouzit
> =B7=B7O =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0madcoder-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org
> OOO =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0http://www.madism.org
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
