From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] link.2: Fix typo.
Date: Wed, 05 Mar 2014 12:14:53 +0100
Message-ID: <5317072D.6050607@gmail.com>
References: <20140304160237.GA8347@rei.Home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140304160237.GA8347-HSzIOc4LzcM@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/04/2014 05:02 PM, Cyril Hrubis wrote:
> protected_hardlink -> protected_hardlinks

Thanks, Cyrill.

Applied.

Cheers,

Michael

> 
> Signed-off-by: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
> ---
>  man2/link.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/link.2 b/man2/link.2
> index 20c0b01..0311096 100644
> --- a/man2/link.2
> +++ b/man2/link.2
> @@ -245,7 +245,7 @@ does not support the creation of hard links.
>  .BR EPERM " (since Linux 3.6)"
>  The caller does not have permission to create a hard link to this file
>  (see the description of
> -.IR /proc/sys/fs/protected_hardlink
> +.IR /proc/sys/fs/protected_hardlinks
>  in
>  .BR proc (5)).
>  .TP
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
