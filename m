From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] termios.3: sfix
Date: Thu, 17 Apr 2014 07:44:57 +0200
Message-ID: <534F6A59.1000709@gmail.com>
References: <1397694028-23971-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397694028-23971-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, David. Applied.

Cheers,

On 04/17/2014 02:20 AM, David Pr=E9vot wrote:
> ---
>  man3/termios.3 | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/man3/termios.3 b/man3/termios.3
> index ec5a847..c0e3c45 100644
> --- a/man3/termios.3
> +++ b/man3/termios.3
> @@ -751,7 +751,7 @@ If the timer expires without any input becoming a=
vailable,
>  .BR read (2)
>  returns 0.
>  If data is already available at the time of the call to
> -.BR read (),
> +.BR read (2),
>  the call behaves as though the data was received immediately after t=
he call.
>  .TP
>  MIN > 0, TIME > 0 (read with interbyte timeout)
> @@ -772,14 +772,14 @@ has been received.
>  (POSIX does not specify this termination condition,
>  and on some other implementations
>  .\" e.g., Solaris
> -.BR read ()
> +.BR read (2)
>  does not return in this case.)
>  .RE
>  .IP
>  Because the timer is started only after the initial byte
>  becomes available, at least one byte will be read.
>  If data is already available at the time of the call to
> -.BR read (),
> +.BR read (2),
>  the call behaves as though the data was received immediately after t=
he call.
>  .PP
>  POSIX
> @@ -790,12 +790,12 @@ file status flag takes precedence over the MIN =
and TIME settings.
>  If
>  .B O_NONBLOCK
>  is set, a
> -.BR read ()
> +.BR read (2)
>  in noncanonical mode may return immediately,
>  regardless of the setting of MIN or TIME.
>  Furthermore, if no data is available,
>  POSIX permits a
> -.BR read ()
> +.BR read (2)
>  in noncanonical mode to return either 0, or \-1 with
>  .I errno
>  set to
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
