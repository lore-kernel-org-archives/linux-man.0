From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] strerror.3: Fix return value of strerror_r()
Date: Sun, 22 Apr 2012 11:13:00 +1200
Message-ID: <CAKgNAkh_c4J5OcNkAbTU1T4wAxWKn0GnuxVwioMuFnTQW1qnHg@mail.gmail.com>
References: <1335011620-20586-1-git-send-email-bernhard@bwalle.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1335011620-20586-1-git-send-email-bernhard-X9USDgGjgfuzQB+pC5nmwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bernhard Walle <bernhard-X9USDgGjgfuzQB+pC5nmwQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Bernhard,

On Sun, Apr 22, 2012 at 12:33 AM, Bernhard Walle <bernhard-X9USDgGjgfuzQB+pC5nmwQ@public.gmane.org> w=
rote:
> The XSI-compliant version of strerror_r() doesn't return -1 on error =
and
> set errno. Instead, a positive error number is returned. That's what
> POSIX says:
>
> =A0 =A0Upon successful completion, strerror_r() shall return 0. Other=
wise,
> =A0 =A0an error number shall be returned to indicate the error.
>
> I tested with an invalid error number. While some implementations see=
m
> to write "Unknown error xxx" into the supplied buffer, some others do=
n't
> and only return EINVAL. The latest glibc 2.14.1 from Arch Linux belon=
gs
> to the first category while eglibc 2.13 from current Debian testing
> belongs to the second category.
>
> However, both implementation are correct according to POSIX. So I thi=
nk
> the manpage was wrong and POSIX and the implementation are correct.

Thanks! Applied for 3.40.

Cheers,

Michael

> Signed-off-by: Bernhard Walle <bernhard-X9USDgGjgfuzQB+pC5nmwQ@public.gmane.org>
> ---
> =A0man3/strerror.3 | =A0 =A04 +---
> =A01 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/man3/strerror.3 b/man3/strerror.3
> index 37fc95d..7d6e2be 100644
> --- a/man3/strerror.3
> +++ b/man3/strerror.3
> @@ -133,9 +133,7 @@ or an "Unknown error nnn" message if the error nu=
mber is unknown.
> =A0The XSI-compliant
> =A0.BR strerror_r ()
> =A0function returns 0 on success;
> -on error, \-1 is returned and
> -.I errno
> -is set to indicate the error.
> +on error, a (positive) error number is returned.
> =A0.SH ERRORS
> =A0.TP
> =A0.B EINVAL
> --
> 1.7.10
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
