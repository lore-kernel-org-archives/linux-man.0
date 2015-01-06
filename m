From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] mem.4: /dev/kmem depends on CONFIG_DEVKMEM
Date: Tue, 06 Jan 2015 11:41:50 +0100
Message-ID: <54ABBBEE.2000600@gmail.com>
References: <1420204298-25625-1-git-send-email-eliedebrauwer@gmail.com> <1420204298-25625-2-git-send-email-eliedebrauwer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420204298-25625-2-git-send-email-eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/02/2015 02:11 PM, Elie De Brauwer wrote:
> Since 2.6.26 /dev/kmem depends on the CONFIG_DEVKMEM to be set.

Thanks, Elie. Applied.  

Cheers,

Michael


> See:
>  - changelog: http://kernelnewbies.org/Linux_2_6_26
>  - commit: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=b781ecb6a379f155568ef7093e38c6c1d857fe53
> 
> Signed-off-by: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man4/mem.4 | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/man4/mem.4 b/man4/mem.4
> index 74b7b89..fef007e 100644
> --- a/man4/mem.4
> +++ b/man4/mem.4
> @@ -54,7 +54,9 @@ is the same as
>  .BR mem ,
>  except that the kernel virtual memory
>  rather than physical memory is accessed.
> +Since 2.6.26, this file is only available if the
> +.B CONFIG_DEVKMEM
> +kernel configuration option is enabled.
>  .LP
>  It is typically created by:
>  .RS
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
