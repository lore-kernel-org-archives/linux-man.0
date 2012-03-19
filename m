From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] scandir.3: add SEE ALSO scandirat(3)
Date: Tue, 20 Mar 2012 07:58:03 +1300
Message-ID: <CAKgNAkjgVqP==Dg5VvGXzx8F2KzfRwMZ41g0Frz1GT78PJPmHQ@mail.gmail.com>
References: <48718.1321362690@proseconsulting.co.uk>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <48718.1321362690-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mark,

On Wed, Nov 16, 2011 at 2:11 AM, Mark R Bannister
<mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org> wrote:
> Hi,
>
> Following my submission of the scandirat(3) man page
> just now, here is a patch for the scandir(3) man page to
> make reference to scandirat(3) in the SEE ALSO section.

Thanks -- applied (in slightly modified form) for 3.38.

Cheers,

Michael


> --- scandir.3.old =A0 =A0 =A0 2011-10-04 07:34:44.000000000 +0100
> +++ scandir.3 =A0 2011-11-15 12:46:28.000000000 +0000
> @@ -30,10 +30,10 @@
> =A0.\" =A0 =A0 Miguel Barreiro (enano-qg+5eQvbBoBgst0ot+Erpg@public.gmane.org). =A0Added examp=
le.
> =A0.\" Modified Sun Sep 24 20:15:46 2000 by aeb, following Petter Rei=
nholdtsen.
> =A0.\" Modified 2001-12-26 by aeb, following Joey. Added versionsort.
> +.\" Modified 2011-11-15 by Mark R. Bannister <cambridge-Rn4VEauK+AIRDUWM+popnw@public.gmane.org=
forge.net>
> +.\" =A0 =A0Added reference to scandirat() in SEE ALSO
> =A0.\"
> -.\" FIXME glibc 2.15 adds scandirat()
> -.\"
> -.TH SCANDIR 3 =A02011-09-08 "GNU" "Linux Programmer's Manual"
> +.TH SCANDIR 3 =A02011-11-15 "GNU" "Linux Programmer's Manual"
> =A0.SH NAME
> =A0scandir, alphasort, versionsort \- scan a directory for matching e=
ntries
> =A0.SH SYNOPSIS
> @@ -177,8 +177,9 @@
> =A0.BR opendir (3),
> =A0.BR readdir (3),
> =A0.BR rewinddir (3),
> +.BR scandirat (3),
> =A0.BR seekdir (3),
> =A0.BR strcmp (3),
> =A0.BR strcoll (3),
> =A0.BR strverscmp (3),
> -.BR telldir (3)
> +.BR telldir (3).
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
