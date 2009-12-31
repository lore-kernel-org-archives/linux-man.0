From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] proc.5: Fix typo for CONFIG_MAGIC_SYSRQ.
Date: Fri, 1 Jan 2010 07:25:42 +1300
Message-ID: <cfd18e0f0912311025g291a4cck3df9ef58210ba345@mail.gmail.com>
References: <1261980512-5073-1-git-send-email-antonf@turbolinux.com.cn>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1261980512-5073-1-git-send-email-antonf-Qbad7dcHD6Y0jvc7zYWOs/8+0UxHXcjY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fang Wenqi <anton.fang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nicolas.francois-Fa7rcPG4DJn7nK0/Xc0eeg@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fang Wenqi <antonf-Qbad7dcHD6Y0jvc7zYWOs/8+0UxHXcjY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Applied for man-pages 3.24.

thanks,

Michael

On Mon, Dec 28, 2009 at 7:08 PM, Fang Wenqi <anton.fang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
> Signed-off-by: Fang Wenqi <antonf-Qbad7dcHD6Y0jvc7zYWOs/8+0UxHXcjY@public.gmane.org>
> ---
> =A0man5/proc.5 | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/man5/proc.5 b/man5/proc.5
> index 3da30af..b50fdae 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -2313,7 +2313,7 @@ Possible values in this file are:
> =A0 =A0 =A0 =A0 256 - allow nicing of all real-time tasks
>
> =A0This file is only present if the
> -.B CONFIG_MAGIG_SYSRQ
> +.B CONFIG_MAGIC_SYSRQ
> =A0kernel configuration option is enabled.
> =A0For further details see the kernel source file
> =A0.IR Documentation/sysrq.txt .
> --
> 1.6.5.2
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
