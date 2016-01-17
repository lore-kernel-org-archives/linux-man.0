From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] mq_close.3: tfix
Date: Sun, 17 Jan 2016 08:02:50 +0100
Message-ID: <569B3C9A.2020905@gmail.com>
References: <1452803318-7860-1-git-send-email-jwilk@jwilk.net>
 <1452803318-7860-2-git-send-email-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452803318-7860-2-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/14/2016 09:28 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Thanks, Jakub.Applied.

Cheers,

Michael

> ---
>  man3/mq_close.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/mq_close.3 b/man3/mq_close.3
> index 6846a00..8457bbb 100644
> --- a/man3/mq_close.3
> +++ b/man3/mq_close.3
> @@ -53,7 +53,7 @@ set to indicate the error.
>  .SH ERRORS
>  .TP
>  .B EBADF
> -The message quueue descriptor specified in
> +The message queue descriptor specified in
>  .I mqdes
>  is invalid.
>  .SH ATTRIBUTES
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
