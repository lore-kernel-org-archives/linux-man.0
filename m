From: Michal Hocko <mhocko-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mmap.2: mmap with address NULL and MAP_FIXED results in
 EPERM
Date: Fri, 16 Jun 2017 17:25:47 +0200
Message-ID: <20170616152546.GA31298@dhcp22.suse.cz>
References: <20170615190901.30119-1-tblodt@icloud.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170615190901.30119-1-tblodt-mVuRI66OGLPQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Theodore Dubois <tblodt-mVuRI66OGLPQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu 15-06-17 12:09:01, Theodore Dubois wrote:
> This can be verified with a simple test program. I'm not sure if this is
> a kernel bug or a documentation bug, though...

THis is not a bug. You are not allowed to mmap anything below
/proc/sys/vm/mmap_min_addr. So your patch to update documentation would
have to mention this sysctl to be correct.

> ---
>  man2/mmap.2 | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/man2/mmap.2 b/man2/mmap.2
> index d1942b52a..58361c837 100644
> --- a/man2/mmap.2
> +++ b/man2/mmap.2
> @@ -515,6 +515,13 @@ was mounted no-exec.
>  .\" (Since 2.4.25 / 2.6.0.)
>  .TP
>  .B EPERM
> +The
> +.I addr
> +argument is 0 and
> +.B MAP_FIXED
> +is specified.
> +.TP
> +.B EPERM
>  The operation was prevented by a file seal; see
>  .BR fcntl (2).
>  .TP
> -- 
> 2.13.1

-- 
Michal Hocko
SUSE Labs
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
