From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] aio_return.3: Specifies the return values for errors
Date: Sun, 22 Mar 2015 16:19:51 +0100
Message-ID: <550EDD97.8070603@gmail.com>
References: <5509315A.1040103@ahsoftware.de> <1426708273-9475-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426708273-9475-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/18/2015 08:51 PM, St=C3=A9phane Aulery wrote:
> Reported by Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
>=20
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man3/aio_return.3 | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/man3/aio_return.3 b/man3/aio_return.3
> index 3e6f334..37d735c 100644
> --- a/man3/aio_return.3
> +++ b/man3/aio_return.3
> @@ -55,6 +55,7 @@ the value that would have been returned in case of =
a synchronous
>  or
>  .BR fdatasync (2),
>  call.
> +On error, \-1 is returned, and \fIerrno\fP is set appropriately.
> =20
>  If the asynchronous I/O operation has not yet completed,
>  the return value and effect of

Hi St=C3=A9phane,

Thanks! Patch applied.

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
