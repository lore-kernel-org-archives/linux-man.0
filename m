From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] Changes.old: tfix
Date: Wed, 30 Dec 2015 20:36:49 +0100
Message-ID: <56843251.3040306@gmail.com>
References: <1451485000-350-1-git-send-email-jwilk@jwilk.net>
 <1451485000-350-3-git-send-email-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1451485000-350-3-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/30/2015 03:16 PM, Jakub Wilk wrote:
> ---
>  Changes.old | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, Jakub. Applied.

Cheers,

Michael


> diff --git a/Changes.old b/Changes.old
> index 80c82e6..7a7ce22 100644
> --- a/Changes.old
> +++ b/Changes.old
> @@ -2117,7 +2117,7 @@ stat.2
>  
>  frexp.3
>      Volker Reichelt / mtk
> -        Fixed to point out that that frexp() returns a number whose
> +        Fixed to point out that frexp() returns a number whose
>          *absolute* value is >= 0.5 and < 1.  Amended the example
>          program to demonstrate this.
>  
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
