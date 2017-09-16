From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ldconfig.8: ffix
Date: Sat, 16 Sep 2017 15:14:11 +0200
Message-ID: <9821e837-5a96-061c-5764-47ba2770823d@gmail.com>
References: <20170915164553.3911-1-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170915164553.3911-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/15/2017 06:45 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Thanks. Applied.

Cheers,

Michael

> ---
>  man8/ldconfig.8 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man8/ldconfig.8 b/man8/ldconfig.8
> index d4e240282..9d9f5d2e3 100644
> --- a/man8/ldconfig.8
> +++ b/man8/ldconfig.8
> @@ -146,7 +146,7 @@ is also specified, links are still updated.
>  Print the lists of directories and candidate libraries stored in
>  the current cache.
>  .TP
> -.BI "\-r  " root
> +.BI "\-r " root
>  Change to and use
>  .I root
>  as the root directory.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
