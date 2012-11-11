From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] prctl.2: wfix
Date: Sun, 11 Nov 2012 08:57:12 +0100
Message-ID: <CAKgNAkh661eLhGb9rWPNYphhO5fAq2BxHpxQA0XBspGNkDyNkg@mail.gmail.com>
References: <1352589760-23885-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352589760-23885-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, David. Applied

On Sun, Nov 11, 2012 at 12:22 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wr=
ote:
> ---
>  man2/prctl.2 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man2/prctl.2 b/man2/prctl.2
> index b0ab23e..c8a4919 100644
> --- a/man2/prctl.2
> +++ b/man2/prctl.2
> @@ -418,7 +418,7 @@ Thereafter, a thread can adjust its current timer=
 slack value via
>  The timer slack values of
>  .IR init
>  (PID 1), the ancestor of all processes,
> -is 50,000 nanoseconds (50 microseconds).
> +are 50,000 nanoseconds (50 microseconds).
>  The timer slack values are preserved across
>  .BR execve (2).
>  .TP
> --
> 1.7.10.4
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
