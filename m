From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 1/2] getpriority.2, nice.2: Move renice from section 8 to
	section 1
Date: Mon, 14 Jun 2010 06:05:56 +0200
Message-ID: <AANLkTim-_lEvhoLZAJgk7zj-fWEIOA6hbgDHeF0iTiP1@mail.gmail.com>
References: <1276420363-6226-1-git-send-email-cosoleto@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1276420363-6226-1-git-send-email-cosoleto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Francesco Cosoleto <cosoleto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Francesco,

On Sun, Jun 13, 2010 at 11:12 AM, Francesco Cosoleto <cosoleto-Re5JQEeQqe8@public.gmane.org=
m> wrote:
> Signed-off-by: Francesco Cosoleto <cosoleto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0man2/getpriority.2 | =A0 =A02 +-
> =A0man2/nice.2 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A02 files changed, 2 insertions(+), 2 deletions(-)

Thanks. Applied for man-pages-3.25.

Cheers,

Michael

> diff --git a/man2/getpriority.2 b/man2/getpriority.2
> index 1168a63..302d88a 100644
> --- a/man2/getpriority.2
> +++ b/man2/getpriority.2
> @@ -224,7 +224,7 @@ defined in
> =A0.BR nice (1),
> =A0.BR fork (2),
> =A0.BR capabilities (7),
> -.BR renice (8)
> +.BR renice (1)
> =A0.sp
> =A0.I Documentation/scheduler/sched-nice-design.txt
> =A0in the kernel source tree (since Linux 2.6.23).
> diff --git a/man2/nice.2 b/man2/nice.2
> index 407145b..c7e1d7d 100644
> --- a/man2/nice.2
> +++ b/man2/nice.2
> @@ -108,4 +108,4 @@ returns \-1.
> =A0.BR getpriority (2),
> =A0.BR setpriority (2),
> =A0.BR capabilities (7),
> -.BR renice (8)
> +.BR renice (1)
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
