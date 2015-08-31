From: Michal Hocko <mhocko-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mremap.2: Add note about mremap with locked areas
Date: Mon, 31 Aug 2015 11:14:03 +0200
Message-ID: <20150831091403.GD29723@dhcp22.suse.cz>
References: <1440787372-30214-1-git-send-email-emunson@akamai.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1440787372-30214-1-git-send-email-emunson-JqFfY2XvxFXQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric B Munson <emunson-JqFfY2XvxFXQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri 28-08-15 14:42:52, Eric B Munson wrote:
> When mremap() is used to move or expand a mapping that is locked with
> mlock() or equivalent it will attempt to populate the new area.
> However, like mmap(MAP_LOCKED), mremap() will not fail if the area
> cannot be populated.  Also like mmap(MAP_LOCKED) this might come as a
> surprise to users and should be noted.
> 
> Signed-off-by: Eric B Munson <emunson-JqFfY2XvxFXQT0dZR+AlfA@public.gmane.org>
> Cc: Michal Hocko <mhocko-AlSwsSmVLrQ@public.gmane.org>

Acked-by: Michal Hocko <mhocko-IBi9RG/b67k@public.gmane.org>

Thank you for following on this.

> Cc: David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  man2/mremap.2 | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/man2/mremap.2 b/man2/mremap.2
> index 071adb5..cf884e6 100644
> --- a/man2/mremap.2
> +++ b/man2/mremap.2
> @@ -196,6 +196,17 @@ and the prototype for
>  did not allow for the
>  .I new_address
>  argument.
> +
> +If
> +.BR mremap ()
> +is used to move or expand an area locked with
> +.BR mlock (2)
> +or equivalent, the
> +.BR mremap ()
> +call will make a best effort to populate the new area but will not fail
> +with
> +.B ENOMEM
> +if the area cannot be populated.
>  .SH SEE ALSO
>  .BR brk (2),
>  .BR getpagesize (2),
> -- 
> 1.9.1

-- 
Michal Hocko
SUSE Labs
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
