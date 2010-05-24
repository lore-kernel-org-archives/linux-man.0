From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 2/3] getrusage.2: Add ru_maxrss
Date: Mon, 24 May 2010 07:32:11 +0200
Message-ID: <AANLkTik8Yty2okGTHKg7SXM2xPKAd2YTZxsnVZqU6-vW@mail.gmail.com>
References: <1272228153-11825-1-git-send-email-mark@pogo.org.uk>
	<1272228153-11825-3-git-send-email-mark@pogo.org.uk>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1272228153-11825-3-git-send-email-mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mark,

On Sun, Apr 25, 2010 at 10:42 PM, Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org> wrote:
> See kernel commit 1f10206.

Thanks. Applied for 3.25

Cheers,

Michael


> Signed-off-by: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
> ---
> =A0man2/getrusage.2 | =A0 =A06 +++++-
> =A01 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/man2/getrusage.2 b/man2/getrusage.2
> index 6ffdce2..9fb38fb 100644
> --- a/man2/getrusage.2
> +++ b/man2/getrusage.2
> @@ -100,7 +100,11 @@ the total amount of time spent executing in user=
 mode.
> =A0the total amount of time spent in the system executing on behalf
> =A0of the process(es).
> =A0.TP
> -.IR ru_maxrss " (unmaintained)"
> +.IR ru_maxrss " (since Linux 2.6.32)"
> +the maximum resident set size used (in kilobytes). For
> +.B RUSAGE_CHILDREN
> +this is the resident set size of the largest child, not the maximum
> +resident set size of the process tree.
> =A0.TP
> =A0.IR ru_ixrss " (unmaintained)"
> =A0.TP
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
