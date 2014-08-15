From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] readv.2: tfix
Date: Fri, 15 Aug 2014 20:22:58 +0200
Message-ID: <53EE5002.3090904@gmail.com>
References: <1407186689-24626-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407186689-24626-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Simon. Applied.

Cheers,

Michael


On 08/04/2014 11:11 PM, Simon Paillard wrote:
> ---
>  man2/readv.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/readv.2 b/man2/readv.2
> index 6cd4486..c19b729 100644
> --- a/man2/readv.2
> +++ b/man2/readv.2
> @@ -240,7 +240,7 @@ However, the glibc wrapper functions do some extra work if
>  they detect that the underlying kernel system call failed because this
>  limit was exceeded.
>  In the case of
> -.BR readv ().
> +.BR readv (),
>  the wrapper function allocates a temporary buffer large enough
>  for all of the items specified by
>  .IR iov ,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
