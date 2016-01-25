From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] perfmonctl.2: tfix
Date: Mon, 25 Jan 2016 14:34:06 +0100
Message-ID: <56A6244E.3010205@gmail.com>
References: <1453489995-4990-1-git-send-email-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453489995-4990-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/22/2016 08:13 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Thanks, Jakub. Applied.

Cheers,

Michael

> ---
>  man2/perfmonctl.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/perfmonctl.2 b/man2/perfmonctl.2
> index c942def..e061e2a 100644
> --- a/man2/perfmonctl.2
> +++ b/man2/perfmonctl.2
> @@ -148,7 +148,7 @@ Restart monitoring after receiving an overflow notification.
>  .B PFM_GET_FEATURES
>  .\" pfm_get_features()
>  .nf
> -.BI  "perfmonctl(int " fd ", PFM_GET_FEARURES, pfarg_features_t *" arg ", 1);
> +.BI  "perfmonctl(int " fd ", PFM_GET_FEATURES, pfarg_features_t *" arg ", 1);
>  .fi
>  .TP
>  .B PFM_DEBUG
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
