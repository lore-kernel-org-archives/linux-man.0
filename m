From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] bootparam.7: tfix
Date: Fri, 1 Jul 2016 23:49:36 +0200
Message-ID: <41ef5748-3c62-b7e3-dc4e-9490f58f50d1@gmail.com>
References: <1467285918-6408-1-git-send-email-jwilk@jwilk.net>
 <1467285918-6408-3-git-send-email-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467285918-6408-3-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Jakub! Applied.

Have a good weekend!

Cheers,

Michael

Michael

On 06/30/2016 01:25 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
> ---
>  man7/bootparam.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man7/bootparam.7 b/man7/bootparam.7
> index cd4f896..fcbcbdb 100644
> --- a/man7/bootparam.7
> +++ b/man7/bootparam.7
> @@ -632,7 +632,7 @@ T \- device type: 1=FM, 2=SB, 3=PAS, 4=GUS, 5=MPU401, 6=SB16,
>
>  aaa \- I/O address in hex.
>
> -I \- interrupt line in hex (i.e 10=a, 11=b, ...)
> +I \- interrupt line in hex (i.e., 10=a, 11=b, ...)
>
>  d \- DMA channel.
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
