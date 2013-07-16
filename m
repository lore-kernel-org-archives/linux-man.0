From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fflush.3: ATTRIBUTES: Note function that is thread-safe
Date: Tue, 16 Jul 2013 08:19:54 +0200
Message-ID: <51E4E60A.8040601@gmail.com>
References: <1373876647-16610-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1373876647-16610-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/15/13 10:24, Peng Haitao wrote:
> The function fflush() is thread safe.

Applied.=20

thanks,

Michael



> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/fflush.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/man3/fflush.3 b/man3/fflush.3
> index 1622650..99b3482 100644
> --- a/man3/fflush.3
> +++ b/man3/fflush.3
> @@ -42,7 +42,7 @@
>  .\" Modified 2000-07-22 by Nicol=EF=BF=BDs Lichtmaier <nick@debian.o=
rg>
>  .\" Modified 2001-10-16 by John Levon <moz-SweaCY6AgrKi2/woJv4GR1pr/1R2p/CL@public.gmane.org>
>  .\"
> -.TH FFLUSH 3  2009-09-06 "GNU" "Linux Programmer's Manual"
> +.TH FFLUSH 3  2013-07-15 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  fflush \- flush a stream
>  .SH SYNOPSIS
> @@ -90,6 +90,11 @@ may also fail and set
>  .I errno
>  for any of the errors specified for
>  .BR write (2).
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR fflush ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  C89, C99, POSIX.1-2001, POSIX.1-2008.
> =20
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
