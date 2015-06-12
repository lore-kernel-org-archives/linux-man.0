From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] capget.2: capset works with gettid not getpid.
Date: Fri, 12 Jun 2015 20:17:45 +0200
Message-ID: <557B2249.8050509@gmail.com>
References: <1433966193-19774-1-git-send-email-ju.orth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433966193-19774-1-git-send-email-ju.orth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julian Orth <ju.orth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Julian. Applied.

Cheers,

Michael


On 06/10/2015 09:56 PM, Julian Orth wrote:
> ---
>  man2/capget.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/capget.2 b/man2/capget.2
> index 44ba568..014b974 100644
> --- a/man2/capget.2
> +++ b/man2/capget.2
> @@ -140,7 +140,7 @@ That is, with VFS support, for
>  calls the only permitted values for
>  .I hdrp->pid
>  are 0 or
> -.BR getpid (2),
> +.BR gettid (2),
>  which are equivalent.
>  .SS Without VFS capability support
>  When the kernel does not support VFS capabilities,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
