From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] open.2: tfix
Date: Mon, 9 May 2016 22:32:55 +0200
Message-ID: <82fa362e-28c8-f40a-904e-ec0ef36aff3f@gmail.com>
References: <1462218123-11111-1-git-send-email-toddy@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462218123-11111-1-git-send-email-toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Dr. Tobias Quathamer" <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Tobia. 

Patch applied.

Cheers,

Michael



On 05/02/2016 09:42 PM, Dr. Tobias Quathamer wrote:
> ---
>  man2/open.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/open.2 b/man2/open.2
> index 0ff0865..012d0c4 100644
> --- a/man2/open.2
> +++ b/man2/open.2
> @@ -1587,7 +1587,7 @@ is ignored).
>  .BR unlink (2),
>  .BR write (2),
>  .BR fopen (3),
> -.BR acl (5)
> +.BR acl (5),
>  .BR fifo (7),
>  .BR path_resolution (7),
>  .BR symlink (7)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
