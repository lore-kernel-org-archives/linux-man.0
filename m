From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] vdso.7: repetition fix
Date: Sat, 01 Feb 2014 07:46:01 +0100
Message-ID: <52EC9829.30804@gmail.com>
References: <1391223052-20777-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391223052-20777-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, David. Applied.

Cheers,

Michael


On 02/01/2014 03:50 AM, David Pr=E9vot wrote:
> ---
>  man7/vdso.7 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/man7/vdso.7 b/man7/vdso.7
> index 7251561..986cb2c 100644
> --- a/man7/vdso.7
> +++ b/man7/vdso.7
> @@ -32,7 +32,7 @@ There are some system calls the kernel provides tha=
t
>  user-space code ends up using frequently,
>  to the point that such calls can dominate overall performance.
>  This is due both to the frequency of the call as well as the
> -context-switch overhead that results from
> +context-switch overhead that results
>  from exiting user space and entering the kernel.
> =20
>  The rest of this documentation is geared toward the curious and/or
> @@ -135,7 +135,7 @@ You will frequently find it under the architectur=
e-specific directory:
>      find arch/$ARCH/ -name '*vdso*.so*' -o -name '*gate*.so*'
> =20
>  .SS vDSO names
> -The name of vDSO shared object varies across architectures.
> +The name of vDSO varies across architectures.
>  It will often show up in things like glibc's
>  .BR ldd (1)
>  output.
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
