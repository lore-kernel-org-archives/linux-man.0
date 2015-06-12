From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] listxattr.2: tfix
Date: Fri, 12 Jun 2015 20:16:48 +0200
Message-ID: <557B2210.90409@gmail.com>
References: <1433610714-27588-1-git-send-email-jann@thejh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433610714-27588-1-git-send-email-jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Jann. Applied.

Cheers,

Michael


On 06/06/2015 07:11 PM, Jann Horn wrote:
> ---
>  man2/listxattr.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/listxattr.2 b/man2/listxattr.2
> index 779fdb7..7519bff 100644
> --- a/man2/listxattr.2
> +++ b/man2/listxattr.2
> @@ -138,7 +138,7 @@ is set appropriately.
>  .B E2BIG
>  The size of the list of attribute names for this file exceeds
>  the system-imposed limit.
> -See BUSG.
> +See BUGS.
>  .TP
>  .B ENOTSUP
>  Extended attributes are not supported by the filesystem, or are disabled.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
