From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mremap.2: Add note about mremap with locked areas
Date: Fri, 11 Sep 2015 13:47:42 +0200
Message-ID: <55F2BF5E.2000505@gmail.com>
References: <1440787372-30214-1-git-send-email-emunson@akamai.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440787372-30214-1-git-send-email-emunson-JqFfY2XvxFXQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric B Munson <emunson-JqFfY2XvxFXQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Michal Hocko <mhocko-AlSwsSmVLrQ@public.gmane.org>, David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/28/2015 08:42 PM, Eric B Munson wrote:
> When mremap() is used to move or expand a mapping that is locked with
> mlock() or equivalent it will attempt to populate the new area.
> However, like mmap(MAP_LOCKED), mremap() will not fail if the area
> cannot be populated.  Also like mmap(MAP_LOCKED) this might come as a
> surprise to users and should be noted.

Thanks, Eric! 

Applied, with Michael's Acked-by added.

Cheers,

Michael


> Signed-off-by: Eric B Munson <emunson-JqFfY2XvxFXQT0dZR+AlfA@public.gmane.org>
> Cc: Michal Hocko <mhocko-AlSwsSmVLrQ@public.gmane.org>
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
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
