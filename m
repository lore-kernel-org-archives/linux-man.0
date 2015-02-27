From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] intro.2: tfix
Date: Fri, 27 Feb 2015 07:39:16 +0100
Message-ID: <54F01114.9010608@gmail.com>
References: <1424996777-10600-1-git-send-email-saulery@free.fr> <1424996777-10600-2-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424996777-10600-2-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: saulery-GANU6spQydw@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/27/2015 01:26 AM, saulery-GANU6spQydw@public.gmane.org wrote:
> From: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

Thanks, St=C3=A9phane. Applied.

Cheers,

Michael


> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man2/intro.2 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/man2/intro.2 b/man2/intro.2
> index b65bdfc..d0d18dc 100644
> --- a/man2/intro.2
> +++ b/man2/intro.2
> @@ -46,7 +46,7 @@ copying arguments and the unique system call number=
 to the
>  registers where the kernel expects them;
>  .IP *
>  trapping to kernel mode,
> -at which point the kernel does the real work of the system call; and
> +at which point the kernel does the real work of the system call;
>  .IP *
>  setting
>  .I errno
> @@ -55,7 +55,7 @@ CPU to user mode.
>  .LP
>  However, in a few cases, a wrapper function may do rather more than =
this,
>  for example, performing some preprocessing
> -of the arguments of arguments before trapping to kernel mode,
> +of the arguments before trapping to kernel mode,
>  or postprocessing of values returned by the system call.
>  Where this is the case, the manual pages in Section 2 generally
>  try to note the details of both the (usually GNU) C library API
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
