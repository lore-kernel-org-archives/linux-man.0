From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] getline.3: Emphasiqze that user code should free the
 allocated buffer even if getline() failed.
Date: Wed, 02 Apr 2014 12:10:23 +0200
Message-ID: <533BE20F.7070302@gmail.com>
References: <CAGSYnCNRKxShgzR=WCLOd4BB_4CqEScNsmk-81eytih84cx9gA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGSYnCNRKxShgzR=WCLOd4BB_4CqEScNsmk-81eytih84cx9gA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexey Samsonov <samsonov-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Alexey,

Good patch, good explanation. Applied. 

Thanks!

Cheers,

Michael



On 04/02/2014 10:30 AM, Alexey Samsonov wrote:
>>From 4a09a0da31e9b98167e974e05f13f57b53dd41c3 Mon Sep 17 00:00:00 2001
> From: Alexey Samsonov <samsonov-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> Date: Wed, 2 Apr 2014 12:26:44 +0400
> Subject: [PATCH] getline.3: Emphasize that user code should free the allocated
>  buffer even if getline() failed.
> 
> ---
>  man3/getline.3 | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/man3/getline.3 b/man3/getline.3
> index 806e455..9f403a0 100644
> --- a/man3/getline.3
> +++ b/man3/getline.3
> @@ -69,8 +69,11 @@ is set to NULL and
>  .I *n
>  is set 0 before the call, then
>  .BR getline ()
> -will allocate a buffer for storing the line,
> -which should be freed by the user program.
> +will allocate a buffer for storing the line.
> +This buffer should be freed by the user program
> +even if
> +.BR getline ()
> +failed.
> 
>  Alternatively, before calling
>  .BR getline (),
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
