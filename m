From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] fcntl.2: tfix
Date: Wed, 30 Dec 2015 20:36:27 +0100
Message-ID: <5684323B.9070602@gmail.com>
References: <1451485000-350-1-git-send-email-jwilk@jwilk.net>
 <1451485000-350-2-git-send-email-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1451485000-350-2-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/30/2015 03:16 PM, Jakub Wilk wrote:
> ---
>  man2/fcntl.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Thanks, Jakub. Applied.

Cheers,

Michael


> diff --git a/man2/fcntl.2 b/man2/fcntl.2
> index 9abfb71..96c6993 100644
> --- a/man2/fcntl.2
> +++ b/man2/fcntl.2
> @@ -937,7 +937,7 @@ set etc.) to determine which file descriptors are available for I/O.
>  
>  Note that the file descriptor provided in
>  .I si_fd
> -is the one that that was specified during the
> +is the one that was specified during the
>  .BR F_SETSIG
>  operation.
>  This can lead to an unusual corner case.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
