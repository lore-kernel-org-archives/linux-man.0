From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] getauxval.3: wfix
Date: Sat, 01 Feb 2014 07:56:17 +0100
Message-ID: <52EC9A91.9070907@gmail.com>
References: <1391223052-20777-1-git-send-email-taffit@debian.org> <1391223052-20777-2-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391223052-20777-2-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, David.

Applied.

Cheers,

Michael


On 02/01/2014 03:50 AM, David Pr=E9vot wrote:
> ---
>  man3/getauxval.3 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/man3/getauxval.3 b/man3/getauxval.3
> index 38eafe0..efcb28f 100755
> --- a/man3/getauxval.3
> +++ b/man3/getauxval.3
> @@ -157,11 +157,11 @@ and glibc changes other aspects of its behavior=
=2E
>  .BR secure_getenv (3).)
>  .TP
>  .BR AT_SYSINFO
> -The entry point to the system call function in the VDSO.
> +The entry point to the system call function in the vDSO.
>  Not present/needed on all architectures (e.g., absent on x86-64).
>  .TP
>  .BR AT_SYSINFO_EHDR
> -The address of a page containing the Virtual Dynamic Shared Object (=
VDSO)
> +The address of a page containing the virtual Dynamic Shared Object (=
vDSO)
>  that the kernel creates in order to provide fast implementations of
>  certain system calls.
>  .TP
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
