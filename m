From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/8] request_key.2: tfix
Date: Wed, 4 Jan 2017 15:25:08 +1300
Message-ID: <f0087167-8ec1-c5c6-8c75-32855b7c823a@gmail.com>
References: <20170103233657.8875-1-jwilk@jwilk.net>
 <20170103233657.8875-4-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170103233657.8875-4-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/04/2017 12:36 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Thanks, Jakub. Applied.

Cheers,

Michael


> ---
>  man2/request_key.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/request_key.2 b/man2/request_key.2
> index c6cdddc6b..843fdb8ef 100644
> --- a/man2/request_key.2
> +++ b/man2/request_key.2
> @@ -462,7 +462,7 @@ specifiers.
>  
>  Then we run the program and check the contents of
>  .IR /proc/keys
> -to verify that the requested kay has been instantiated:
> +to verify that the requested key has been instantiated:
>  
>  .in +4n
>  .nf
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
