From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] mcheck.3: tfix
Date: Mon, 25 Jan 2016 14:33:39 +0100
Message-ID: <56A62433.9050301@gmail.com>
References: <1453474138-2742-1-git-send-email-jwilk@jwilk.net>
 <1453474138-2742-2-git-send-email-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453474138-2742-2-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/22/2016 03:48 PM, Jakub Wilk wrote:
> Remove duplicated word.

Thanks, Jakub. Applied.

Cheers,

Michael

> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
> ---
>  man3/mcheck.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/mcheck.3 b/man3/mcheck.3
> index 3a44e88..50d97fc 100644
> --- a/man3/mcheck.3
> +++ b/man3/mcheck.3
> @@ -79,7 +79,7 @@ is called beforehand.
>  If the system detects an inconsistency in the heap,
>  the caller-supplied function pointed to by
>  .I abortfunc
> -is invoked with a single argument argument,
> +is invoked with a single argument,
>  .IR mstatus ,
>  that indicates what type of inconsistency was detected.
>  If
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
