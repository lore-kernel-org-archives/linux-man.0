From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 2/2] string.3: Reference stpcpy(3)
Date: Sat, 5 Dec 2009 08:42:57 +0100
Message-ID: <cfd18e0f0912042342o57b65e56ub70950afe81d915b@mail.gmail.com>
References: <alpine.NEB.2.01.0911212052050.25031@jrf.vwaro.pbz>
	 <1258838327-31762-1-git-send-email-mark@pogo.org.uk>
	 <1258838327-31762-2-git-send-email-mark@pogo.org.uk>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1258838327-31762-2-git-send-email-mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Cc: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Mark,

On Sat, Nov 21, 2009 at 10:18 PM, Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org> wrote:
> This function is a variant of strcpy(3). Even though it is lesser-use=
d
> it appears at the top alphabetically because of its unusual name.

Thanks. Applied for 2.34.

Cheers,

Michael


> Signed-off-by: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
> ---
> =A0man3/string.3 | =A0 =A05 ++++-
> =A01 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/man3/string.3 b/man3/string.3
> index 89d60e1..1fa71b8 100644
> --- a/man3/string.3
> +++ b/man3/string.3
> @@ -27,7 +27,7 @@
> =A0.\" Modified Sun Jul 25 10:54:31 1993, Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org=
)
> =A0.TH STRING 3 =A01993-04-09 "" "Linux Programmer's Manual"
> =A0.SH NAME
> -strcasecmp, strcat, strchr, strcmp, strcoll, strcpy, strcspn,
> +stpcpy, strcasecmp, strcat, strchr, strcmp, strcoll, strcpy, strcspn=
,
> =A0strdup, strfry, strlen, strncat, strncmp, strncpy, strncasecmp, st=
rpbrk,
> =A0strrchr, strsep, strspn, strstr, strtok, strxfrm, index, rindex
> =A0\- string operations
> @@ -45,6 +45,8 @@ strrchr, strsep, strspn, strstr, strtok, strxfrm, i=
ndex, rindex
> =A0.sp
> =A0.B #include <string.h>
> =A0.sp
> +.BI "char *stpcpy(char *" dest ", const char *" src );
> +.sp
> =A0.BI "char *strcat(char *" dest ", const char *" src );
> =A0.sp
> =A0.BI "char *strchr(const char *" s ", int " c );
> @@ -90,6 +92,7 @@ See the individual man pages for descriptions of ea=
ch function.
> =A0.SH "SEE ALSO"
> =A0.BR index (3),
> =A0.BR rindex (3),
> +.BR stpcpy (3),
> =A0.BR strcasecmp (3),
> =A0.BR strcat (3),
> =A0.BR strchr (3),
> --
> 1.6.5.2
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
