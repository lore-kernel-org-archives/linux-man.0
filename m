From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 3/3] getrusage.2: Bump revision
Date: Mon, 24 May 2010 07:34:42 +0200
Message-ID: <AANLkTikV8uhscjjpnX8e62Dlh6MniBYRI1N8AAnSCV-5@mail.gmail.com>
References: <1272228153-11825-1-git-send-email-mark@pogo.org.uk>
	<1272228153-11825-4-git-send-email-mark@pogo.org.uk>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1272228153-11825-4-git-send-email-mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mark,

Applied a fix like you suggest below, but marked with today's date
(2010-05-24). Sorry about the large gap between the two dates....

Thanks

Michael


On Sun, Apr 25, 2010 at 10:42 PM, Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org> wrote:
>
> Signed-off-by: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
> ---
> =A0man2/getrusage.2 | =A0 =A04 +++-
> =A01 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/man2/getrusage.2 b/man2/getrusage.2
> index 9fb38fb..498bd00 100644
> --- a/man2/getrusage.2
> +++ b/man2/getrusage.2
> @@ -32,8 +32,10 @@
> =A0.\" =A0 =A0when SIGCHLD is being ignored is fixed in 2.6.9.
> =A0.\" 2008-02-22, Sripathi Kodi <sripathik-xthvdsQ13ZrQT0dZR+AlfA@public.gmane.org>: Document RUS=
AGE_THREAD
> =A0.\" 2008-05-25, mtk, clarify RUSAGE_CHILDREN + other clean-ups.
> +.\" 2009-11-28, Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>: Description of fields=
,
> +.\" =A0 =A0 document ru_maxrss
> =A0.\"
> -.TH GETRUSAGE 2 2009-08-25 "Linux" "Linux Programmer's Manual"
> +.TH GETRUSAGE 2 2009-11-28 "Linux" "Linux Programmer's Manual"
> =A0.SH NAME
> =A0getrusage \- get resource usage
> =A0.SH SYNOPSIS
> --
> 1.7.1
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
