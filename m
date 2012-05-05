From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] unix.7: tfix
Date: Sun, 6 May 2012 09:35:09 +1200
Message-ID: <CAKgNAkjFicm+HUGmDEvqUG1FCKZ_ug=JuZu8y2kyDKVpgcAf+Q@mail.gmail.com>
References: <1336248062-19460-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1336248062-19460-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, May 6, 2012 at 8:01 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrot=
e:
> Introduced in 1e4e3b.

Applied!

Thanks,

Michael


> ---
> =A0man7/unix.7 | =A0 =A02 +-
> =A01 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man7/unix.7 b/man7/unix.7
> index adbfd79..44369e6 100644
> --- a/man7/unix.7
> +++ b/man7/unix.7
> @@ -12,7 +12,7 @@
> =A0.\" =A0 =A0 address that can appear in the sockaddr_un structure: =
pathname,
> =A0.\" =A0 =A0 unnamed, and abstract.
> =A0.\"
> -.TH UNIX =A07 2102-04-16 "Linux" "Linux Programmer's Manual"
> +.TH UNIX =A07 2012-04-16 "Linux" "Linux Programmer's Manual"
> =A0.SH NAME
> =A0unix, AF_UNIX, AF_LOCAL \- Sockets for local
> =A0interprocess communication
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
