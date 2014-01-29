From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] proc.5: American spelling
Date: Wed, 29 Jan 2014 11:07:07 +0100
Message-ID: <52E8D2CB.2060102@gmail.com>
References: <1390863188-8704-1-git-send-email-taffit@debian.org> <1390863188-8704-2-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390863188-8704-2-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Good catch!

Patch applied.

Cheers,

Michael

On 01/27/2014 11:53 PM, David Pr=E9vot wrote:
> ---
>  man5/proc.5 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man5/proc.5 b/man5/proc.5
> index 3acf867..4607a45 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -3264,7 +3264,7 @@ Possible values in this file are:
>            8 - enable debugging dumps of processes etc.
>           16 - enable sync command
>           32 - enable remount read-only
> -         64 - enable signalling of processes (term, kill, oom-kill)
> +         64 - enable signaling of processes (term, kill, oom-kill)
>          128 - allow reboot/poweroff
>          256 - allow nicing of all real-time tasks
> =20
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
