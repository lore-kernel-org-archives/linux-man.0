From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 2/2] msgctl.2, semctl.2, shmctl.2: Move ipcs from section
	8 to section 1
Date: Mon, 14 Jun 2010 06:06:24 +0200
Message-ID: <AANLkTim3p_dwOQRbvrWkcvZCth-OcJ8LkwaPD3mdO_Pl@mail.gmail.com>
References: <1276420363-6226-1-git-send-email-cosoleto@gmail.com>
	<1276420363-6226-2-git-send-email-cosoleto@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1276420363-6226-2-git-send-email-cosoleto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Francesco Cosoleto <cosoleto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Francesco,

On Sun, Jun 13, 2010 at 11:12 AM, Francesco Cosoleto <cosoleto-Re5JQEeQqe8@public.gmane.org=
m> wrote:
> Signed-off-by: Francesco Cosoleto <cosoleto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0man2/msgctl.2 | =A0 =A02 +-
> =A0man2/semctl.2 | =A0 =A02 +-
> =A0man2/shmctl.2 | =A0 =A02 +-
> =A03 files changed, 3 insertions(+), 3 deletions(-)

Thanks. Applied for man-pages-3.25.

Cheers,

Michael



> diff --git a/man2/msgctl.2 b/man2/msgctl.2
> index 2ecbdcf..9514f85 100644
> --- a/man2/msgctl.2
> +++ b/man2/msgctl.2
> @@ -316,7 +316,7 @@ The
> =A0and
> =A0.B MSG_INFO
> =A0operations are used by the
> -.BR ipcs (8)
> +.BR ipcs (1)
> =A0program to provide information on allocated resources.
> =A0In the future these may modified or moved to a /proc file system
> =A0interface.
> diff --git a/man2/semctl.2 b/man2/semctl.2
> index fba8d7d..457a395 100644
> --- a/man2/semctl.2
> +++ b/man2/semctl.2
> @@ -467,7 +467,7 @@ The
> =A0and
> =A0.B SEM_INFO
> =A0operations are used by the
> -.BR ipcs (8)
> +.BR ipcs (1)
> =A0program to provide information on allocated resources.
> =A0In the future these may modified or moved to a /proc file system
> =A0interface.
> diff --git a/man2/shmctl.2 b/man2/shmctl.2
> index d893947..5552bd3 100644
> --- a/man2/shmctl.2
> +++ b/man2/shmctl.2
> @@ -375,7 +375,7 @@ The
> =A0and
> =A0.B SHM_INFO
> =A0operations are used by the
> -.BR ipcs (8)
> +.BR ipcs (1)
> =A0program to provide information on allocated resources.
> =A0In the future these may modified or moved to a /proc file system
> =A0interface.
> --
> 1.6.4.2
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
