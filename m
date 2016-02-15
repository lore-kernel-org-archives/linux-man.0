From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sigpause.3: srcfix
Date: Mon, 15 Feb 2016 11:26:16 +0100
Message-ID: <56C1A7C8.6030100@gmail.com>
References: <1455461393-23525-1-git-send-email-toddy@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455461393-23525-1-git-send-email-toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Dr. Tobias Quathamer" <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/14/2016 03:49 PM, Dr. Tobias Quathamer wrote:
> ---
>  man3/sigpause.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, Tobias. Applied.

Cheers,

Michael

> diff --git a/man3/sigpause.3 b/man3/sigpause.3
> index dbc10de..d70bacf 100644
> --- a/man3/sigpause.3
> +++ b/man3/sigpause.3
> @@ -67,7 +67,7 @@ T{
>  .\" marking in glibc manual is more detailed.
>  .\" sigpause: MT-Unsafe race:sigprocmask/!bsd!linux
>  .\" glibc manual says /!linux!bsd indicate the preceding marker only applies
> -./" when the underlying kernel is neither Linux nor a BSD kernel.
> +.\" when the underlying kernel is neither Linux nor a BSD kernel.
>  .\" So, it is safety in Linux kernel.
>  T}	Thread safety	MT-Safe
>  .TE
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
