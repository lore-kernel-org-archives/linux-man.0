From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] ptrace.2: another ffix
Date: Sat, 24 Mar 2012 12:38:25 +1300
Message-ID: <CAKgNAkiEiF34FEozs0gQdjxawpENMm2m7b4vY6fRWyBvB=B9DQ@mail.gmail.com>
References: <1332472329-31499-1-git-send-email-taffit@debian.org> <1332545535-8094-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1332545535-8094-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Yup, I spotted that one two while I applied your previous patches ;-).

On Sat, Mar 24, 2012 at 12:32 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wr=
ote:
> ---
> =A0man2/ptrace.2 | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/man2/ptrace.2 b/man2/ptrace.2
> index 62f4458..0d6ec68 100644
> --- a/man2/ptrace.2
> +++ b/man2/ptrace.2
> @@ -1458,7 +1458,7 @@ First, it enables
> =A0.B PTRACE_EVENT_EXEC
> =A0stop,
> =A0which occurs before
> -.BR execve(2)
> +.BR execve (2)
> =A0returns.
> =A0In this stop, the tracer can use
> =A0.B PTRACE_GETEVENTMSG
> --
> 1.7.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
