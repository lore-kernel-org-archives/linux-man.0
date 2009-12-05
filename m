From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 1/2] strcpy.3: Fix typo in reference
Date: Sat, 5 Dec 2009 07:05:48 +0100
Message-ID: <cfd18e0f0912042205s360cc4a7ja5a8e9daf1dec184@mail.gmail.com>
References: <alpine.NEB.2.01.0911212052050.25031@jrf.vwaro.pbz>
	 <1258838327-31762-1-git-send-email-mark@pogo.org.uk>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1258838327-31762-1-git-send-email-mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Cc: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mark,

On Sat, Nov 21, 2009 at 10:18 PM, Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org> wrote:
>
> Signed-off-by: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
> ---
> =A0man3/strcpy.3 | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/man3/strcpy.3 b/man3/strcpy.3
> index 9d47e37..a3e6d3b 100644
> --- a/man3/strcpy.3
> +++ b/man3/strcpy.3
> @@ -137,6 +137,6 @@ in ways that may make the impossible possible.
> =A0.BR memcpy (3),
> =A0.BR memmove (3),
> =A0.BR strdup (3),
> -.BR strpcpy (3),
> +.BR stpcpy (3),
> =A0.BR wcscpy (3),
> =A0.BR wcsncpy (3)
> --
> 1.6.5.2

Thanks.

Applied for 3.24.

Thanks,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
