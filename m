From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] nftw(): clarify dangling symlinks case
Date: Fri, 24 Feb 2017 09:58:54 +0100
Message-ID: <CAKgNAki6wMCLRNZzFM975NviY-fd6gDNBTLvWZKSA2hdtb3AYA@mail.gmail.com>
References: <xnshn7hw5i.fsf@greed.delorie.com> <23f174b0-5a52-213b-6fd8-4026c2b8fcc3@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <23f174b0-5a52-213b-6fd8-4026c2b8fcc3-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: DJ Delorie <dj-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlos O'Donell <codonell-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi DJ, Carlos,

Below is a copy of my response to the Red Hat bug report at
https://bugzilla.redhat.com/show_bug.cgi?id=3D1422736

On 22 February 2017 at 18:11, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> On 02/21/2017 08:06 PM, DJ Delorie wrote:
>> In the event that nftw() encounters a symbolic link which refers to a
>> nonexisting file, the "struct stat" info will not have been filled in
>> if FTW_PHYS is not specified (because stat() is used instead of
>> lstat()).  This patch clarifies the documentation and corrects the
>> sample code to reflect this.
>>
>> Reported to Fedora in https://bugzilla.redhat.com/show_bug.cgi?id=3D1422=
736
>>
>> patch is against today's git
>
> Looks good to me. Thanks for fixing the man page.
>
> --
> Cheers,
> Carlos.

(In reply to Carlos O'Donell from comment #7)
> (In reply to han pingtian from comment #5)
> > (In reply to DJ Delorie from comment #4)
> > > I've reproduced what you see.
> > >
> > > While it's not explicit in the nftw() man page, if you don't call nft=
w with
> > > FTW_PHYS, it only calls stat() on dangling symlinks, which of course =
fails.
> > > It returns FTW_SLN for those cases, and the stat data passed is not
> > > initialized.
> > >
> > If it knew it's an dangling symlink, why not returns the stat data of t=
he
> > symblink itself. After all, it has known it's a dangling symblink.

((Yes.)

> Without FTW_PHYS the symlink _must_ be followed,

Why? (See below.)

> and if the symlink target
> doesn't exist then there is no stat-related data to be returned. If you w=
ant
> a mixed hybrid API somewhere between FTW_PHYS and not-FTW_PHYS then this
> needs to be discussed usptream. I think it's easy enough to just lstat()
> yourself on the broken symlink if that's what you need. Requiring the
> implementation to do the extra stat() will slow down performance for
> everyone that doesn't need and didn't ask for that information.
>
> In summary, having DJ adjust the documentation is the best way forward.

When I received the man-pages patch, I very nearly applied it, but
something niggled... (I have not applied the man-pages patch.)

I believe this is actually a (very longstanding) glibc bug. Here is
what POSIX says for nftw():

           FTW_NS    The  stat() function failed on the object because of
                     lack of  appropriate  permission.  The  stat  buffer
                     passed to fn is undefined. Failure of stat() for any
                     other reason is considered an error and nftw() shall
                     return =E2=88=921.

           ....

           FTW_SLN   The  object is a symbolic link that does not name an
                     existing file.  (This condition shall only occur  if
                     the FTW_PHYS flag is not included in flags.)

Note that POSIX explicitly says that the stat buffer is undefined for
FTW_NS, but makes no such statement for FTW_SLN, with the implication
that the stat buffer is valid in this case.

This implies that FTW_SLN should work as Han Pingtian suggested: for a
dangling symlink, the lstat() information on the link should be
returned. This is certainly how I always understood things should
work. (But, obviously, I never tested this on glibc.)

So, what do other implementations do? Every other implementation that
I looked at, does return the lstat() information for the dangling
symlink. I looked at Solaris, OpenBSD, FreeBSD, and musl.  All of this
strongly suggests that glibc got it wrong.

For the points below, I used the following test program (and yes, I
realize by now that the FTW_NS treatment in this code is not correct;
I've fixed the man page already).

8x---8x---8x---8x---8x---8x---8x---8x---8x---8x---8x---8x---
/*#* t_nftw.c

   Copyright Michael Kerrisk 2000

   Demonstrate the use of the nftw(3) function.
*/
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
    printf("%-3s %2d %7lld   %-30s %d %s (st_ino: %ld)\n",
        (tflag =3D=3D FTW_D) ?   "d"   : (tflag =3D=3D FTW_DNR) ? "dnr" :
    (tflag =3D=3D FTW_DP) ?  "dp"  : (tflag =3D=3D FTW_F) ?   "f" :
    (tflag =3D=3D FTW_NS) ?  "ns"  : (tflag =3D=3D FTW_SL) ?  "sl" :
    (tflag =3D=3D FTW_SLN) ? "sln" : "???",
    ftwbuf->level, (long long) sb->st_size,
    fpath, ftwbuf->base, fpath + ftwbuf->base, (long) sb->st_ino);
    memset((void *) sb, 0, sizeof(struct stat));
    return 0;          /* To tell nftw() to continue */
}


int
main(int argc, char *argv[])
{
    int flags =3D 0;

    if (argc > 2 && strchr(argv[2], 'd') !=3D NULL)
    flags |=3D FTW_DEPTH;
    if (argc > 2 && strchr(argv[2], 'p') !=3D NULL)
    flags |=3D FTW_PHYS;

    if (nftw((argc < 2) ? "." : argv[1], displayFileInfo,
        20, flags) =3D=3D -1) {
    perror("nftw");
    exit(EXIT_FAILURE);
    }

    exit(EXIT_SUCCESS);
}
8x---8x---8x---8x---8x---8x---8x---8x---8x---8x---8x---8x---


Solaris (Illumos source code)
usr/src/lib/libc/port/gen/nftw.c:

The following code causes the stat buffer to be populated with lstat()
infor in the FTW_SLN case:

        } else {
                /*
                 * Statf has failed. If stat was used instead of lstat,
                 * try using lstat. If lstat doesn't fail, "comp"
                 * must be a symbolic link pointing to a non-existent
                 * file. Such a symbolic link should be ignored.
                 * Also check the file type, if possible, for symbolic
                 * link.
                 */
                if ((vp->statf =3D=3D stat) && (lstat(comp, &statb) >=3D 0)=
 &&
                    ((statb.st_mode & S_IFMT) =3D=3D S_IFLNK)) {

                        /*
                         * Ignore bad symbolic link, let "fn"
                         * report it.
                         */

                        errno =3D ENOENT;
                        type =3D FTW_SLN;
                } else {
                        type =3D FTW_NS;
        fail:


Testing shows that the link info *is* returned in the stat structure:

$ ls -li t
total 4
     45068 -rw-r--r--   1 mtk     csw      29 Feb 24 04:28 f
     45067 lrwxrwxrwx   1 mtk     csw       6 Feb 24 04:28 my_sln -> ssssss
     45069 lrwxrwxrwx   1 mtk     csw       1 Feb 24 04:28 sl_f -> f

$ ./a.out t
d    0       5   t                              0 t (st_ino: 45066)
sln  1       6   t/my_sln                       2 my_sln (st_ino: 45067)
f    1      29   t/f                            2 f (st_ino: 45068)
f    1      29   t/sl_f                         2 sl_f (st_ino: 45068)

=3D=3D=3D=3D=3D=3D

OpenBSD

I didn't look at the source code, but the test gives the same results
as Solaris:

-bash-4.3$ ls -li
total 4
4693795 -rw-r--r--  1 mtk  mtk  29 Feb 24 04:37 f
4693796 lrwxr-xr-x  1 mtk  mtk   1 Feb 24 04:37 sl_f -> f
4693797 lrwxr-xr-x  1 mtk  mtk  11 Feb 24 04:37 sln -> jajdhfdskjh
-bash-4.3$ ./a.out t
d    0     512   t                              0 t (st_ino: 4693794)
f    1      29   t/f                            2 f (st_ino: 4693795)
f    1      29   t/sl_f                         2 sl_f (st_ino: 4693795)
sln  1      11   t/sln                          2 sln (st_ino: 4693797)

=3D=3D=3D=3D=3D

FreeBSD

I don't have access to a FreeBSD test system at the moment, nut my
reading of the source code is that id delivers the same results as
Solaris and OpenBSD

See lib/libc/gen/nftw.c, where FTS_SLN is implemented using the
FTS_SLNONE option, and fts(3) on that system says:

              FTS_SLNONE  A symbolic link with a nonexistent target.  The
                          contents  of  the fts_statp field reference the
                          file characteristic information  for  the  sym=E2=
=80=90
                          bolic link itself.

=3D=3D=3D=3D=3D
musl libc

src/misc/nftw.c

        if ((flags & FTW_PHYS) ? lstat(path, &st) : stat(path, &st) < 0) {
                if (!(flags & FTW_PHYS) && errno=3D=3DENOENT && !lstat(path=
, &st))
                        type =3D FTW_SLN;
                else if (errno !=3D EACCES) return -1;
                else type =3D FTW_NS;
        } else if (S_ISDIR(st.st_mode)) {
                if (access(path, R_OK) < 0) type =3D FTW_DNR;
                else if (flags & FTW_DEPTH) type =3D FTW_DP;
                else type =3D FTW_D;
        } else if (S_ISLNK(st.st_mode)) {
                if (flags & FTW_PHYS) type =3D FTW_SL;
                else type =3D FTW_SLN;
        } else {
                type =3D FTW_F;
        }


Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
