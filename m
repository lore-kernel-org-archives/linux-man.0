From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] shmget.2: fix punctuation
Date: Tue, 17 Jun 2014 07:33:11 +0200
Message-ID: <539FD317.2030801@gmail.com>
References: <1402954521-28630-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402954521-28630-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Simon. Applied.

Cheers,

Michael


On 06/16/2014 11:35 PM, Simon Paillard wrote:
> ---
>  man2/shmget.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/shmget.2 b/man2/shmget.2
> index f781048..bb8adab 100644
> --- a/man2/shmget.2
> +++ b/man2/shmget.2
> @@ -294,7 +294,7 @@ and
>  .B SHMMNI
>  are not modified, this yields a limit for the
>  total memory used by all shared memory segments of 8 GB:
> -With a 4kB page size, this formula yields the value 2^21 (2,097,152),
> +with a 4kB page size, this formula yields the value 2^21 (2,097,152);
>  with 8kB page size, it yields 2^20 (1048576).
>  
>  On Linux, this limit can be read and modified via
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
