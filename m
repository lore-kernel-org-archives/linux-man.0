From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] posix_memalign.3: ffix
Date: Sat, 21 Apr 2012 06:48:19 +1200
Message-ID: <CAKgNAkj1btaFp0wE00-fuMwKFoOASvNg4DUO-NL6zbpu_Qfc=w@mail.gmail.com>
References: <1334782812-23000-1-git-send-email-spaillard@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1334782812-23000-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Apr 19, 2012 at 9:00 AM, Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> =
wrote:
> ---
> =A0man3/posix_memalign.3 | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/man3/posix_memalign.3 b/man3/posix_memalign.3
> index 822cb43..5d33cba 100644
> --- a/man3/posix_memalign.3
> +++ b/man3/posix_memalign.3
> @@ -198,7 +198,7 @@ The function
> =A0comes from POSIX.1d.
>
> =A0The function
> -.I aligned_alloc ()
> +.BR aligned_alloc ()
> =A0is specified in the C11 standard.
> =A0.\"
> =A0.SS Headers
> --
> 1.7.2.5

Applied for 3.40.

Thanks,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
