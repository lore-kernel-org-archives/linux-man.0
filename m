From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ptrace.2: pfix
Date: Wed, 04 Sep 2013 08:18:23 +0200
Message-ID: <5226D0AF.8010501@gmail.com>
References: <1378259828-12785-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378259828-12785-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks, David.

Cheers,

Michael


On 09/04/13 03:57, David Pr=E9vot wrote:
> ---
>  man2/ptrace.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man2/ptrace.2 b/man2/ptrace.2
> index 60d5345..7ad5ce8 100644
> --- a/man2/ptrace.2
> +++ b/man2/ptrace.2
> @@ -1231,7 +1231,7 @@ Stop induced by
>  .B PTRACE_INTERRUPT
>  command, or group-stop, or initial ptrace-stop when a new child is a=
ttached
>  (only if attached using
> -.BR PTRACE_SEIZE ).
> +.BR PTRACE_SEIZE ),
>  or
>  .B PTRACE_EVENT_STOP
>  if
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
