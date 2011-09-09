From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] open.2: O_CLOEXEC no longer is Linux specific
Date: Fri, 9 Sep 2011 16:10:32 +0200
Message-ID: <CAKgNAkgkhSDd6U51+h3GNmE55hSWOqk3qG4eXr_=gHrgU=7jtw@mail.gmail.com>
References: <BANLkTine_kFx7Bo2qiy8U0T7Z-ntMogWXA@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BANLkTine_kFx7Bo2qiy8U0T7Z-ntMogWXA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Folkert van Heusden <folkert.mobiel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Folkert,

On Mon, May 30, 2011 at 3:02 PM, Folkert van Heusden
<folkert.mobiel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi,
>
> Here's a patch to the problem described in the subject.
>
> I gained this knowledge by reading
> http://pubs.opengroup.org/onlinepubs/9699919799/functions/open.html
>
> Patch against version 3.32 of the man-pages.

Thanks. Applied for man-pages-3.32.

Cheers,

Michael


> diff -uNrBbd man-pages-3.32.org/man2/open.2 man-pages-3.32/man2/open.=
2
> --- man-pages-3.32.org/man2/open.2 =A0 =A0 =A02010-12-03 08:01:59.000=
000000 +0100
> +++ man-pages-3.32/man2/open.2 =A02011-05-30 14:55:53.766064010 +0200
> @@ -43,6 +43,8 @@
> =A0.\" 2008-01-11, Greg Banks <gnb-cP1dWloDopni96+mSzHFpQC/G2K4zDHf@public.gmane.org>: add more detai=
l
> =A0.\" =A0 =A0 on O_DIRECT.
> =A0.\" 2008-02-26, Michael Haardt: Reorganized text for O_CREAT and m=
ode
> +.\" 2011-05-30, Folkert van Heusden <folkert-Beo89p9qyDM6GGFevw1D/A@public.gmane.org: O_CLOEX=
EC
> +.\" =A0 =A0 no longer is Linux-specific
> =A0.\"
> =A0.\" FIXME . Apr 08: The next POSIX revision has O_EXEC, O_SEARCH, =
and
> =A0.\" O_TTYINIT. =A0Eventually these may need to be documented. =A0-=
-mtk
> @@ -79,7 +81,7 @@
> =A0.B FD_CLOEXEC
> =A0file descriptor flag described in
> =A0.BR fcntl (2)
> -is initially disabled; the Linux-specific
> +is initially disabled; the
> =A0.B O_CLOEXEC
> =A0flag, described below, can be used to change this default).
> =A0The file offset is set to the beginning of the file (see
>
>
> Really hoping that I'm not mistaken while waisting your time :-)
>
>
>
> --
> www.vanheusden.com
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
