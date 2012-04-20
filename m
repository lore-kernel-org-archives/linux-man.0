From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mallopt.3: ffix
Date: Sat, 21 Apr 2012 06:48:25 +1200
Message-ID: <CAKgNAkgvSjMv2hGdfU7PrON3wPUghD=uYy_Ukbyb1vJ9YP22AQ@mail.gmail.com>
References: <1334786796-13418-1-git-send-email-spaillard@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1334786796-13418-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Apr 19, 2012 at 10:06 AM, Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>=
 wrote:
> ---
> =A0man3/mallopt.3 | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/man3/mallopt.3 b/man3/mallopt.3
> index 1f69875..ddb1aed 100644
> --- a/man3/mallopt.3
> +++ b/man3/mallopt.3
> @@ -497,7 +497,7 @@ Aborted (core dumped)
> =A0.in
> =A0.PP
> =A0The following runs show the results when employing other values fo=
r
> -.BR M_CHECK_ACTION:
> +.BR M_CHECK_ACTION :
> =A0.PP
> =A0.in +4n
> =A0.nf
> --
> 1.7.2.5

Thanks Simon. Applied for 3.40.

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
