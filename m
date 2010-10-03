From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] nl_langinfo.3: better explaination
Date: Sun, 3 Oct 2010 18:04:06 +0200
Message-ID: <AANLkTimVWrwUSOjG=6CicBGPjs7emrOjOtYYCUEF-CJZ@mail.gmail.com>
References: <E1P0Ycq-0004ph-WB@fangorn.moria.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1P0Ycq-0004ph-WB-zeUDcrRnZRzyzWfxuKwaJA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Haardt <michael-8s1n8bisGiQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Michael.

On Tue, Sep 28, 2010 at 1:45 PM, Michael Haardt <michael-8s1n8bisGiQ@public.gmane.org> wrot=
e:
> Hello,
>
> it could be more clear that nl_langinfo() interacts with setlocale().
> I made a patch against 3.27 and added a short example to query the
> terminal character set.

Thanks. Applied for man-pages-3.28.

Cheers,

Michael


> Michael
> ---------------------------------------------------------------------=
-
> --- ./nl_langinfo.3.orig =A0 =A0 =A0 =A02010-09-28 13:14:39.000000000=
 +0200
> +++ ./nl_langinfo.3 =A0 =A0 2010-09-28 13:33:26.000000000 +0200
> @@ -10,8 +10,9 @@
> =A0.\" =A0 OpenGroup's Single Unix specification http://www.UNIX-syst=
ems.org/online.html
> =A0.\"
> =A0.\" Corrected prototype, 2002-10-18, aeb
> +.\" Modified 2010-09-28 by Michael Haardt
> =A0.\"
> -.TH NL_LANGINFO 3 =A02001-05-11 "GNU" "Linux Programmer's Manual"
> +.TH NL_LANGINFO 3 "GNU" "Linux Programmer's Manual"
> =A0.SH NAME
> =A0nl_langinfo \- query language and locale information
> =A0.SH SYNOPSIS
> @@ -97,7 +98,9 @@
> =A0For a more detailed list, consult
> =A0.IR "The GNU C Library Reference Manual" .
> =A0.SH "RETURN VALUE"
> -If no locale has been selected for the appropriate category,
> +If no locale has been selected by
> +.BR setlocale ()
> +for the appropriate category,
> =A0.BR nl_langinfo ()
> =A0returns a pointer to the corresponding string in the
> =A0"C" locale.
> @@ -109,6 +112,23 @@
> =A0.BR nl_langinfo ()
> =A0or
> =A0.BR setlocale (3).
> +.SH "EXAMPLE"
> +This program sets the character type locale according to the
> +environment and queries the terminal character set.
> +.LP
> +.nf
> +#include <langinfo.h>
> +#include <locale.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +
> +int main(int argc, char *argv[])
> +{
> + =A0setlocale(LC_CTYPE,"");
> + =A0printf("%s\\n",nl_langinfo(CODESET));
> + =A0exit(EXIT_SUCCESS);
> +}
> +.fi
> =A0.SH "CONFORMING TO"
> =A0SUSv2, POSIX.1-2001.
> =A0.SH "SEE ALSO"
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
