From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [Bug libc/11459] New: ftw doesn't work like documented (may be a
	documentation bug)
Date: Thu, 3 Jun 2010 09:18:22 +0200
Message-ID: <AANLkTinhGzNB_dabQcan3c1nQuGwkaTIBAVZuRO2dJty@mail.gmail.com>
References: <20100403201146.28880.qmail@sourceware.org> <20100331172608.11459.madcoder@debian.org>
	<20100406090358.GP11893@laphroaig.corp> <AANLkTim05fJpMXD1owEON-70WwxDUkxIvYIgkn7EfBEf@mail.gmail.com>
	<20100602214257.GB21506@madism.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100602214257.GB21506-zi3NMfd+bKEdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pierre Habouzit <madcoder-zi3NMfd+bKEdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Pierre,

On Wed, Jun 2, 2010 at 11:42 PM, Pierre Habouzit <madcoder-zi3NMfd+bKEdnm+yROfE0A@public.gmane.org> =
wrote:
> On Mon, May 24, 2010 at 07:41:49PM +0200, Michael Kerrisk wrote:
>> Hello Pierre,
>>
>> On Tue, Apr 6, 2010 at 11:03 AM, Pierre Habouzit <madcoder-zi3NMfd+bKFQFI55V6+gNQ@public.gmane.org=
g> wrote:
>> > See below a bug reported against the glibc. =A0Since the glibc mai=
ntainer
>> > dodged that one, I assume the bug indeed is in the documentation o=
f
>> > ftw(3). My manpages are the 3.24-1 Debian package.
>>
>> Yes. The man page is clearly incorrect. Thanks for reporting this.
>>
>> > IMHO the patch is:
>> >
>> > =A0-fpath is the pathname of the entry relative to dirpath.
>> > =A0+fpath is the pathname of the entry relative to the current wor=
king directory.
>> >
>> > POSIX is very vague about what "fpath" should be btw.
>>
>> (Agreed. It could be more precise.)
>>
>> I believe the correct text should be this:
>>
>> =A0 =A0 =A0 =A0fpath =A0 is =A0the =A0pathname =A0of =A0the =A0entry=
, =A0and =A0is
>> =A0 =A0 =A0 =A0expressed either as =A0a =A0pathname =A0relative =A0t=
o =A0the
>> =A0 =A0 =A0 =A0calling =A0process's current working directory at the
>> =A0 =A0 =A0 =A0time of the call to ftw(), if dirpath was expressed
>> =A0 =A0 =A0 =A0as a relative pathname, or as an absolute pathname,
>> =A0 =A0 =A0 =A0if dirpath was expressed as an =A0absolute =A0pathnam=
e.
>>
>> I have updated the man page accordingly, but would welcome
>> review/checking of this text.
>
> Afaict, it's not correct: ftw may perform chdir() calls, so the pathn=
ame
> is relative to the current working directory at the time `fn` is call=
ed.
>
> I'd rather phrase it that way (minus probable english mistakes):
>
> =A0 =A0fpath is the pathname of the entry, and is either a relative
> =A0 =A0pathname to the current working directory of the application w=
hen
> =A0 =A0`fn` is called, or as an absolute pathname.

Thanks for taking a look at this. However, I *think* your analysis is
wrong, and my proposed changes is right. But, still I'd like some
further confirmation. Please take a look at the the program below, and
the output produced when it runs.

$ cat t.c
#include <stdio.h>
#include <stdlib.h>
#include <ftw.h>

/* Function called by ftw(): print type, i-node number, size in
   bytes, and name of each file. */

static int
displayFileInfo(const char *pathname, const struct stat *sbuf, int type=
)
{
    printf("%c ", (type =3D=3D FTW_D) ? 'd' : (type =3D=3D FTW_DNR) ? '=
D' :
                  (type =3D=3D FTW_F) ? 'f' : (type =3D=3D FTW_SL) ? 's=
' :
                  (type =3D=3D FTW_NS) ? 'N' : '?');
    if (type !=3D FTW_NS)
        printf("%7ld %7lld ", (long) sbuf->st_ino,
                (long long) sbuf->st_size);
    else
        printf("                ");
    printf("%s\n", pathname);

    /* Let's mess with the curent directory during the ftw() call,
       to see what value is passed to 'pathname' in successive calls
       to displayFileInfo() */

    chdir("..");
    system("pwd");

    return 0;           /* to tell ftw() to continue */
}

int
main(int argc, char *argv[])
{
    if (ftw((argc < 2) ? "." : argv[1], displayFileInfo, 10) =3D=3D -1)=
 {
        perror("ftw");
        exit(EXIT_FAILURE);
    } /* if */

    exit(EXIT_SUCCESS);
}
$ cd dir1
$ find ../dir2
=2E./dir2
=2E./dir2/sub
=2E./dir2/sub/b
=2E./dir2/sub/a
=2E./dir2/bbb
$ ../a.out ../dir2/
d 9863613    4096 ../dir2
/home/mtk/tlpi/dirs_links
d 1236107    4096 ../dir2/sub
/home/mtk/tlpi
f 9176008       0 ../dir2/sub/b
/home/mtk
f 9176007       0 ../dir2/sub/a
/home
f 7635615      38 ../dir2/bbb
/

See how the CWD changes, but the pathname is always expressed with
respect to "dir1"? Do you agree with my text now, or do you still see
some problem?

Thanks,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
