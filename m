From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] mtrace.3: tfix
Date: Mon, 31 Oct 2016 12:54:29 +0100
Message-ID: <e635a64f-7609-793a-88ec-1a0f4c0a15a8@gmail.com>
References: <20161031101043.8201-1-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161031101043.8201-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 10/31/2016 11:10 AM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Thanks, Jakub. Patch applied.

Cheers,

Michael

> ---
>  man3/mtrace.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/mtrace.3 b/man3/mtrace.3
> index 20efff1..537d1fc 100644
> --- a/man3/mtrace.3
> +++ b/man3/mtrace.3
> @@ -88,7 +88,7 @@ T{
>  .BR muntrace ()
>  T}	Thread safety	MT-Unsafe
>  .TE
> -.\" FIXME: The marking is different from that in theglibc manual,
> +.\" FIXME: The marking is different from that in the glibc manual,
>  .\" markings in glibc manual are more detailed:
>  .\"
>  .\"      mtrace: MT-Unsafe env race:mtrace const:malloc_hooks init
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
