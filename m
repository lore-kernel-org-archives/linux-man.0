From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ptrace.2: pfix
Date: Tue, 04 Feb 2014 10:03:19 +0100
Message-ID: <52F0ACD7.60502@gmail.com>
References: <1391286290-24188-1-git-send-email-taffit@debian.org> <1391286290-24188-2-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391286290-24188-2-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks, David.

Cheers,

Michael

On 02/01/2014 09:24 PM, David Pr=E9vot wrote:
> ---
>  man2/ptrace.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man2/ptrace.2 b/man2/ptrace.2
> index 040ff57..c77f7cf 100644
> --- a/man2/ptrace.2
> +++ b/man2/ptrace.2
> @@ -341,7 +341,7 @@ the
>  field includes information
>  .RB ( __SI_CHLD ,
>  .BR __SI_FAULT ,
> -etc.), that are not otherwise exposed to user space.
> +etc.) that are not otherwise exposed to user space.
>  .PP
>  .in +10n
>  .nf
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
