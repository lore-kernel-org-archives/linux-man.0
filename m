From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [Bug libc/11459] New: ftw doesn't work like documented (may be a
	documentation bug)
Date: Thu, 10 Jun 2010 07:04:20 +0200
Message-ID: <AANLkTikWG4U2wWS6ccM98Mg32WNrVCu5QCmz46hQ7lCC@mail.gmail.com>
References: <20100403201146.28880.qmail@sourceware.org> <20100331172608.11459.madcoder@debian.org>
	<20100406090358.GP11893@laphroaig.corp> <AANLkTim05fJpMXD1owEON-70WwxDUkxIvYIgkn7EfBEf@mail.gmail.com>
	<20100602214257.GB21506@madism.org> <AANLkTinhGzNB_dabQcan3c1nQuGwkaTIBAVZuRO2dJty@mail.gmail.com>
	<20100609104629.GA2340@madism.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100609104629.GA2340-zi3NMfd+bKEdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pierre Habouzit <madcoder-zi3NMfd+bKEdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Pierre,

Thanks for following up on this. I still think the current man page
text is correct. See below.

On Wed, Jun 9, 2010 at 12:46 PM, Pierre Habouzit <madcoder-zi3NMfd+bKEdnm+yROfE0A@public.gmane.org> =
wrote:
> On Thu, Jun 03, 2010 at 09:18:22AM +0200, Michael Kerrisk wrote:
>> Hi Pierre,
>>
>> On Wed, Jun 2, 2010 at 11:42 PM, Pierre Habouzit <madcoder-zi3NMfd+bKFQFI55V6+gNQ@public.gmane.org=
g> wrote:
>> > On Mon, May 24, 2010 at 07:41:49PM +0200, Michael Kerrisk wrote:
>> >> Hello Pierre,
>> >>
>> >> On Tue, Apr 6, 2010 at 11:03 AM, Pierre Habouzit <madcoder@madism=
=2Eorg> wrote:
>> >> > See below a bug reported against the glibc. =A0Since the glibc =
maintainer
>> >> > dodged that one, I assume the bug indeed is in the documentatio=
n of
>> >> > ftw(3). My manpages are the 3.24-1 Debian package.
>> >>
>> >> Yes. The man page is clearly incorrect. Thanks for reporting this=
=2E
>> >>
>> >> > IMHO the patch is:
>> >> >
>> >> > =A0-fpath is the pathname of the entry relative to dirpath.
>> >> > =A0+fpath is the pathname of the entry relative to the current =
working directory.
>> >> >
>> >> > POSIX is very vague about what "fpath" should be btw.
>> >>
>> >> (Agreed. It could be more precise.)
>> >>
>> >> I believe the correct text should be this:
>> >>
>> >> =A0 =A0 =A0 =A0fpath =A0 is =A0the =A0pathname =A0of =A0the =A0en=
try, =A0and =A0is
>> >> =A0 =A0 =A0 =A0expressed either as =A0a =A0pathname =A0relative =A0=
to =A0the
>> >> =A0 =A0 =A0 =A0calling =A0process's current working directory at =
the
>> >> =A0 =A0 =A0 =A0time of the call to ftw(), if dirpath was expresse=
d
>> >> =A0 =A0 =A0 =A0as a relative pathname, or as an absolute pathname=
,
>> >> =A0 =A0 =A0 =A0if dirpath was expressed as an =A0absolute =A0path=
name.
>> >>
>> >> I have updated the man page accordingly, but would welcome
>> >> review/checking of this text.
>> >
>> > Afaict, it's not correct: ftw may perform chdir() calls, so the pa=
thname
>> > is relative to the current working directory at the time `fn` is c=
alled.
>> >
>> > I'd rather phrase it that way (minus probable english mistakes):
>> >
>> > =A0 =A0fpath is the pathname of the entry, and is either a relativ=
e
>> > =A0 =A0pathname to the current working directory of the applicatio=
n when
>> > =A0 =A0`fn` is called, or as an absolute pathname.
>>
>> Thanks for taking a look at this. However, I *think* your analysis i=
s
>> wrong, and my proposed changes is right. But, still I'd like some
>> further confirmation. Please take a look at the the program below, a=
nd
>> the output produced when it runs.
>
> Yeah, that's because you're doing chdir()s during ftw, which is
> undefined behaviour as documented in the manpage already IIRC.

True. That is documented in the POSIX page, but not currently in
man-pages. I've fixed that now. Thanks.

> The point is, ftw() /may/ decide to do chdir() by itself sometimes, a=
nd
> then the path is relative to the current working directory as set by
> ftw().

I'm not sure why you think it may decide to do this. If this was
unpredictable, then it would create difficulties for the application,
as far as I can tell, since it would take quite some effort to
correctly interpret the pathname supplied to 'fn'. And POSIX seems
fairly clear on the point (at least for nftw()):

       FTW_CHDIR
              If set, nftw() shall change  the  current  working
              directory to each directory as it reports files in
              that directory. If clear, nftw() shall not  change
              the current working directory.

> I'm pretty sure it's what POSIX authorizes ftw() to perform chdirs.

See above.

> And when I look at ftw.c in the glibc, it's also pretty much what
> happens in the case when you set FTW_CHDIR in the flags: ftw() forces=
 a
> chdir before the fn() call, and makes the path relative to this cwd.

Yes to the first part, but as far as I can see, still no to the last
part ("and makes the path relative to this cwd" ). See below.

> It happens that the glibc doesn't seem to perform any kind of chdir()=
 in
> the other cases (IOW when FTW_CHDIR isn't set), but I'm pretty sure
> POSIX allows ftw() to do so.

I don't see anywhere that POSIX authorizes that, and it wouldn't seem
sensible to do so. See above.

Here's a variation on my earlier test program that uses nftw()
instead. If "c" is provided in the second command line argument, it
uses "FTW_CHDIR". Looking at the results, do you agree with my
analysis?

$ cat n.c
#define _GNU_SOURCE
#define _XOPEN_SOURCE 500
#include <ftw.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


static int
displayFileInfo(const char *fpath, const struct stat *sb,
                int tflag, struct FTW *ftwbuf)
{
    printf("%-3s %2d %7lld   %-40s %d %s\n",
        (tflag =3D=3D FTW_D) ?   "d"   : (tflag =3D=3D FTW_DNR) ? "dnr"=
 :
        (tflag =3D=3D FTW_DP) ?  "dp"  : (tflag =3D=3D FTW_F) ?   "f" :
        (tflag =3D=3D FTW_NS) ?  "ns"  : (tflag =3D=3D FTW_SL) ?  "sl" =
:
        (tflag =3D=3D FTW_SLN) ? "sln" : "???",
        ftwbuf->level, (long long) sb->st_size,
        fpath, ftwbuf->base, fpath + ftwbuf->base);
#ifdef DO_CHDIR
    /* Let's mess with the curent directory during the ftw() call,
       to see what value is passed to 'pathname' in successive calls
       to displayFileInfo() */

    chdir("..");
#endif
    system("pwd");
    return 0;           /* To tell nftw() to continue */
}

int
main(int argc, char *argv[])
{
    int flags =3D 0;

    if (argc > 2 && strchr(argv[2], 'd') !=3D NULL)
        flags |=3D FTW_DEPTH;
    if (argc > 2 && strchr(argv[2], 'p') !=3D NULL)
        flags |=3D FTW_PHYS;
    if (argc > 2 && strchr(argv[2], 'c') !=3D NULL)
        flags |=3D FTW_CHDIR;

    if (nftw((argc < 2) ? "." : argv[1], displayFileInfo, 20, flags) =3D=
=3D -1) {
        perror("nftw");
        exit(EXIT_FAILURE);
    }

    exit(EXIT_SUCCESS);
}

$ cc -o n n.c
$ cd dir1
/home/mtk/tlpi/dl/dir1
$ find ../dir2
=2E./dir2
=2E./dir2/sub
=2E./dir2/sub/d
=2E./dir2/sub/b
=2E./dir2/sub/c
=2E./dir2/sub/a
=2E./dir2/bbb
$ ../n ../dir2 c
d    0    4096   ../dir2                                  3 dir2
/home/mtk/tlpi/dirs_links
d    1    4096   ../dir2/sub                              8 sub
/home/mtk/tlpi/dirs_links/dir2
f    2       0   ../dir2/sub/d                            12 d
/home/mtk/tlpi/dirs_links/dir2/sub
f    2       0   ../dir2/sub/b                            12 b
/home/mtk/tlpi/dirs_links/dir2/sub
f    2       0   ../dir2/sub/c                            12 c
/home/mtk/tlpi/dirs_links/dir2/sub
f    2       0   ../dir2/sub/a                            12 a
/home/mtk/tlpi/dirs_links/dir2/sub
f    1      38   ../dir2/bbb                              8 bbb
/home/mtk/tlpi/dirs_links/dir2
$ ../n ../dir2
d    0    4096   ../dir2                                  3 dir2
/home/mtk/tlpi/dl/dir1
d    1    4096   ../dir2/sub                              8 sub
/home/mtk/tlpi/dl/dir1
f    2       0   ../dir2/sub/d                            12 d
/home/mtk/tlpi/dl/dir1
f    2       0   ../dir2/sub/b                            12 b
/home/mtk/tlpi/dl/dir1
f    2       0   ../dir2/sub/c                            12 c
/home/mtk/tlpi/dl/dir1
f    2       0   ../dir2/sub/a                            12 a
/home/mtk/tlpi/dl/dir1
f    1      38   ../dir2/bbb                              8 bbb
/home/mtk/tlpi/dl/dir1

Thanks,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
