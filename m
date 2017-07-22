From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Changes.old: tfix
Date: Sat, 22 Jul 2017 09:19:17 +0200
Message-ID: <87a2b875-9ee3-87bf-f39f-0398b9c8abe6@gmail.com>
References: <20170721190406.2658-1-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170721190406.2658-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/21/2017 09:04 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Thanks, Jakub. Applied.

Cheers,

Michael


> ---
>  Changes.old | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Changes.old b/Changes.old
> index 45b5dbafc..445ccf6ab 100644
> --- a/Changes.old
> +++ b/Changes.old
> @@ -45584,7 +45584,7 @@ sigaltstack.2
>      Michael Kerrisk
>          Note buggy addition of ss.ss_flags==SS_ONSTACK
>              Note buggy addition of ss.ss_flags==SS_ONSTACK as a synonym
> -            for ss_flags==0. No other implemenation does this, AFAIK.
> +            for ss_flags==0. No other implementation does this, AFAIK.
>              And it was not needed :-(.
>      Michael Kerrisk
>          Specifying 'ss' returns the current settings without changing them
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
