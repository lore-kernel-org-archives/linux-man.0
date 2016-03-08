From: =?UTF-8?Q?J=C3=A9r=C3=A9mie_Galarneau?=
	<jeremie.galarneau-vg+e7yoeK/dWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] posix_fallocate.3: fallocate may be interrupted
Date: Tue, 8 Mar 2016 16:18:12 -0500
Message-ID: <CA+jJMxsE+2cHZCn4ABhzHGU5BMaNx3OECH7oqBwP=a40131HwQ@mail.gmail.com>
References: <1444773650-3009-1-git-send-email-jeremie.galarneau@efficios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444773650-3009-1-git-send-email-jeremie.galarneau-vg+e7yoeK/dWk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?Q?J=C3=A9r=C3=A9mie_Galarneau?= <jeremie.galarneau-vg+e7yoeK/dWk0Htik3J/w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Sorry for the bump, but was this forgotten?

J=C3=A9r=C3=A9mie

On Tue, Oct 13, 2015 at 6:00 PM, J=C3=A9r=C3=A9mie Galarneau
<jeremie.galarneau-vg+e7yoeK/dWk0Htik3J/w@public.gmane.org> wrote:
> The glibc implementation of posix_fallocate, which calls
> fallocate(), may be interrupted. The fallocate() emulation
> also makes use of pread()/pwrite(), which may also be
> interrupted.
>
> Signed-off-by: J=C3=A9r=C3=A9mie Galarneau <jeremie.galarneau@efficio=
s.com>
> ---
>  man3/posix_fallocate.3 | 3 +++
>  1 file changed, 3 insertions(+)
>
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
> --
> 2.6.1
>



--=20
J=C3=A9r=C3=A9mie Galarneau
EfficiOS Inc.
http://www.efficios.com
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
