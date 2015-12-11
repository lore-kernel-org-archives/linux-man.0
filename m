From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getdirentries: Add a simple example rather than just
 referencing
Date: Fri, 11 Dec 2015 19:52:27 +0100
Message-ID: <566B1B6B.9010904@gmail.com>
References: <1447153987-1742-1-git-send-email-der.herr@hofr.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447153987-1742-1-git-send-email-der.herr-kA1LtwSENNE@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicholas Mc Guire <der.herr-kA1LtwSENNE@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Nicholas,

On 11/10/2015 12:13 PM, Nicholas Mc Guire wrote:
> The manpage of getdirentries basically just repeats the limited infor=
mation
> from dirent.h and does not explain the content of the returned buffer=
=2E

Agreed that an example in the page would be helpful.

> Further it refers the reader to "the Linux library source code for de=
tails",=20
> which is not really that helpful - a simple example including the nee=
d to
> check available fields, and showing that the returned buffer contains=
=20
> struct direntries would simplify things.

There's a number of problems with the example program, starting with

$ cc -Wall  h.c
h.c: In function =91main=92:
h.c:31:17: warning: format =91%llu=92 expects argument of type =91long =
long unsigned int=92, but argument 3 has type =91int=92 [-Wformat=3D]
                 );

Also, the program won't compile at all if _DIRENT_HAVE_D_TYPE happens=20
to be undefined.

There's also a rendering issue for the code when placed into a man page=
:
the backslashes must be doubled (e.g., "\\n")

> Signed-off-by: Nicholas Mc Guire <der.herr-kA1LtwSENNE@public.gmane.org>
> ---
>=20
> The ifdef ugliness is intentional as one actually can not write porta=
ble
> code using getdirenties without checking these macros.
>=20
>  man3/getdirentries.3 | 45 ++++++++++++++++++++++++++++++++++++++++++=
++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
>=20
> diff --git a/man3/getdirentries.3 b/man3/getdirentries.3
> index 2030e3a..962710f 100644
> --- a/man3/getdirentries.3
> +++ b/man3/getdirentries.3
> @@ -60,7 +60,50 @@ If an error occurs, \-1 is returned, and
>  .I errno
>  is set appropriately.
>  .SH ERRORS
> -See the Linux library source code for details.
> +.PP
> +The returned buffer contains the struct dirent of the directory entr=
ies.
> +The available fields depend on the macros defined in dirent.h and ne=
ed to be checked
> +A basic examples usage (based on libsysio) is shown below
> +.SS Program source
> +.nf
> +#define _BSD_SOURCE
> +#include <dirent.h>
> +#include <stdio.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <fcntl.h>
> +
> +#define BUFSIZE 128

This seems on the small side. What if a filename entry is > 128 bytes l=
ong?
> +
> +int
> +main(int argc, char *argv[])
> +{
> +    ssize_t len;
> +    int fd;
> +    off_t base;
> +    char buf[BUFSIZE];
> +    struct dirent *dp;
> +
> +    fd =3D open(".", O_RDONLY);

Better to use argv[1], rather than "." here.

> +    while ((len =3D getdirentries(fd, (char *)buf, BUFSIZE, &base)) =
> 0) {
> +        dp =3D (struct dirent *)buf;
> +        while (len > 0) {
> +            printf("%s:\n"
> +#if defined _DIRENT_HAVE_D_TYPE
> +                "\t type %llu\n",
> +#endif

If _DIRENT_HAVE_D_TYPE is not defined, the code won't compile=20
(missing comma in argument list).


> +                dp->d_name,
> +#if defined _DIRENT_HAVE_D_TYPE
> +                dp->d_type
> +#endif
> +                );
> +            len -=3D dp->d_reclen;
> +            dp =3D (struct dirent *)((char *)dp + dp->d_reclen);
> +        }
> +    }
> +    return 0;
> +}
> +.fi
>  .SH ATTRIBUTES
>  For an explanation of the terms used in this section, see
>  .BR attributes (7).


Thanks,

Michael



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
