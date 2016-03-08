From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] posix_fallocate.3: fallocate may be interrupted
Date: Wed, 9 Mar 2016 00:34:17 +0100
Message-ID: <56DF6179.3080509@gmail.com>
References: <1444773650-3009-1-git-send-email-jeremie.galarneau@efficios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444773650-3009-1-git-send-email-jeremie.galarneau-vg+e7yoeK/dWk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?J=c3=a9r=c3=a9mie_Galarneau?= <jeremie.galarneau-vg+e7yoeK/dWk0Htik3J/w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 10/14/2015 12:00 AM, J=C3=A9r=C3=A9mie Galarneau wrote:
> The glibc implementation of posix_fallocate, which calls
> fallocate(), may be interrupted. The fallocate() emulation
> also makes use of pread()/pwrite(), which may also be
> interrupted.

Thanks for the ping, J=C3=A9r=C3=A9mie. And thanks for the patch. Appli=
ed.

Cheers,

Michael


> Signed-off-by: J=C3=A9r=C3=A9mie Galarneau <jeremie.galarneau@efficio=
s.com>
> ---
>  man3/posix_fallocate.3 | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/man3/posix_fallocate.3 b/man3/posix_fallocate.3
> index 6d8d593..d30f681 100644
> --- a/man3/posix_fallocate.3
> +++ b/man3/posix_fallocate.3
> @@ -98,6 +98,9 @@ referred to by
>  .B ESPIPE
>  .I fd
>  refers to a pipe.
> +.TP
> +.B EINTR
> +A signal was caught during execution.
>  .SH VERSIONS
>  .BR posix_fallocate ()
>  is available since glibc 2.1.94.
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
