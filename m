From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ptrace.2: tfix
Date: Mon, 4 Feb 2013 05:30:04 +0100
Message-ID: <CAKgNAkiXRZwL81FYLywgYx0wjdYHbMmtN0q8Rx=7++6P5y0EWw@mail.gmail.com>
References: <1359946661-14700-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1359946661-14700-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks David. Applied.

On Mon, Feb 4, 2013 at 3:57 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrot=
e:
> ---
>  man2/ptrace.2 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man2/ptrace.2 b/man2/ptrace.2
> index b137da3..4320de2 100644
> --- a/man2/ptrace.2
> +++ b/man2/ptrace.2
> @@ -306,7 +306,7 @@ If a tracer sets this flag, a
>  .B SIGKILL
>  signal will be sent to every tracee if the tracer exits.
>  This option is useful for ptrace jailers that
> -want to ensure that tracees can never escape the trcer's control.
> +want to ensure that tracees can never escape the tracer's control.
>
>  .TP
>  .BR PTRACE_O_TRACECLONE " (since Linux 2.5.46)"
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
