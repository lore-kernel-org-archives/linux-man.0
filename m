From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] man-pages.7: tfix
Date: Mon, 30 Jan 2017 08:33:41 +1300
Message-ID: <29d1cb93-f177-6108-93ce-6f94478cf9d6@gmail.com>
References: <20170129152113.9770-1-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170129152113.9770-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/30/2017 04:21 AM, Jakub Wilk wrote:
> Escape hyphens when explaining how to escape hyphens.

Thanks, Jakub. Applied.

Cheers,

Michael


> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
> ---
>  man7/man-pages.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man7/man-pages.7 b/man7/man-pages.7
> index 87c9a5dc0..1fbc37547 100644
> --- a/man7/man-pages.7
> +++ b/man7/man-pages.7
> @@ -833,7 +833,7 @@ or when writing options that have a leading dash, such as in
>  .IR "ls\ \-l"),
>  use the following form in the man page source:
>  
> -    \\-
> +    \\\-
>  
>  This guideline applies also to code examples.
>  .SS Character constants
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
