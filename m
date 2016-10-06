From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc(5): clarify the root symlink and mount namespaces
Date: Thu, 6 Oct 2016 07:51:29 +0200
Message-ID: <f464f3c8-7c76-7288-d3dd-a7d7ffc05a75@gmail.com>
References: <20161006013609.17481-1-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161006013609.17481-1-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mike,

On 10/06/2016 03:36 AM, Mike Frysinger wrote:
> If the target process is in a different mount namespace, the root symlink
> actually shows that view of the filesystem.  As an example:
> /* Terminal 1 */
> $ unshare -Urnm
> 17168
> 
> /* Terminal 2 */

Your example appears to have been truncated. It'd be nice to have the
complete example for the commit message. Could you send that? 

Thanks,

Michael


> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
>  man5/proc.5 | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/man5/proc.5 b/man5/proc.5
> index 3a5f4407c657..0680902c54a5 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -1513,6 +1513,10 @@ root directory, and behaves in the same way as
>  and
>  .IR fd/* .
>  
> +Note however that this file is not merely a symlink.
> +It provides the same view of the filesystem (including namespaces and the
> +set of per-process mounts) as the process itself.
> +
>  .\" The following was still true as at kernel 2.6.13
>  In a multithreaded process, the contents of this symbolic link
>  are not available if the main thread has already terminated
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
