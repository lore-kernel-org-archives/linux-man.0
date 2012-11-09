From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getenv.3, ld.so.8: ffix
Date: Fri, 9 Nov 2012 06:54:49 +0100
Message-ID: <CAKgNAkhi6Mb7=+QOghPEUVXkS-=to-_w2ztfJRkehZJdGMTo_w@mail.gmail.com>
References: <1352416316-13010-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352416316-13010-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks. Applied.

On Fri, Nov 9, 2012 at 12:11 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> ---
>  man3/getenv.3 |    2 +-
>  man8/ld.so.8  |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/man3/getenv.3 b/man3/getenv.3
> index e10b287..ffb0af9 100644
> --- a/man3/getenv.3
> +++ b/man3/getenv.3
> @@ -126,7 +126,7 @@ is controlled by the
>  flag contained in the auxiliary vector passed from the kernel to use=
r space.
>  .SH "SEE ALSO"
>  .BR clearenv (3),
> -.BR getauxval (3)
> +.BR getauxval (3),
>  .BR putenv (3),
>  .BR setenv (3),
>  .BR unsetenv (3),
> diff --git a/man8/ld.so.8 b/man8/ld.so.8
> index fb7b581..88bc76b 100644
> --- a/man8/ld.so.8
> +++ b/man8/ld.so.8
> @@ -420,7 +420,7 @@ functionality is available for executables compil=
ed using libc version
>  ELF functionality is available since Linux 1.1.52 and libc5.
>  .SH SEE ALSO
>  .BR ldd (1),
> -.BR getauxval (3)
> +.BR getauxval (3),
>  .BR rtld-audit (7),
>  .BR ldconfig (8)
>  .\" .SH AUTHORS
> --
> 1.7.10.4
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
