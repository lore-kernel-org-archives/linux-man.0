From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] proc.5: tfix
Date: Tue, 21 Nov 2017 09:29:40 +0100
Message-ID: <441613fa-784b-935e-c4d0-9cb84099d6ec@gmail.com>
References: <20171120224409.5568-1-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171120224409.5568-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/20/2017 11:44 PM, Jakub Wilk wrote:
> Remove duplicated word.

Thanks, Jakub. Patch applied.

Cheers,

Michael

> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
> ---
>  man5/proc.5 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man5/proc.5 b/man5/proc.5
> index ab8d915cb..2de23b77b 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -3177,7 +3177,7 @@ namespace (see
>  for which the
>  .I /proc
>  filesystem was mounted.
> -(In the the initial PID namespace,
> +(In the initial PID namespace,
>  there is no filtering of the records shown in this file.)
>  .IP
>  The
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
