From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] io_submit.2: tfix
Date: Tue, 21 Nov 2017 09:30:02 +0100
Message-ID: <b3625872-9bee-fb20-f737-8e595b02d1e8@gmail.com>
References: <20171120224409.5568-1-jwilk@jwilk.net>
 <20171120224409.5568-2-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171120224409.5568-2-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/20/2017 11:44 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Thanks, Jakub. Patch applied.

Cheers,

Michael

> ---
>  man2/io_submit.2 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/io_submit.2 b/man2/io_submit.2
> index 25c152d46..397fd0b75 100644
> --- a/man2/io_submit.2
> +++ b/man2/io_submit.2
> @@ -59,13 +59,13 @@ struct iocb {
>  The fields of this structure are as follows:
>  .TP
>  .I aio_data
> -This is a internal field used by the kernel.
> +This is an internal field used by the kernel.
>  Do not modify this field after an
>  .BR io_submit (2)
>  call.
>  .TP
>  .I aio_key
> -This is a internal field used by the kernel.
> +This is an internal field used by the kernel.
>  Do not modify this field after an
>  .BR io_submit (2)
>  call.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
