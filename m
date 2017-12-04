From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mount.2: Add EINVAL error condition when MS_BINDing
 MNT_LOCKED submounts
Date: Mon, 4 Dec 2017 20:55:09 +0100
Message-ID: <b35b0de4-ef4c-702e-b2d0-a78608fe745b@gmail.com>
References: <20171127224417.GA5122@juliacomputing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171127224417.GA5122-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Keno,

Question below....

On 11/27/2017 11:44 PM, Keno Fischer wrote:
> When the user creates an unpriviledged mount namespace, the linux
> kernel sets the MNT_LOCKED flag [1] on any submounts to prevent
> such mounts from being unmounted inside the mount namespace. Such
> an unmount would reveal the filesystem tree behind the mount, which
> is not otherwise possible from an unpriviledge vantage point.
> 
> Attempting to unmount such a mount will fail with EINVAL. However,
> less obvious implication is that attempting a bind mount without
> MS_REC, where the tree being bound contains locked sub-mounts,
> will also fail with EINVAL, because, without MS_REC, such submounts
> are effectively being unmounted.
> 
> Cursory googling shows several instances of people running into this
> problem, so I felt it advantageous to have it documented in the man
> page.
> 
> [1] https://github.com/torvalds/linux/blob/4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323/fs/namespace.c#L1110-L1113
> ---
>  man2/mount.2 | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/man2/mount.2 b/man2/mount.2
> index 87cb1a9..8d2a347 100644
> --- a/man2/mount.2
> +++ b/man2/mount.2
> @@ -650,6 +650,14 @@ or
>  .BR EINVAL
>  An attempt was made to bind mount an unbindable mount.
>  .TP
> +.BR EINVAL
> +In an unpriviledged mount namespace, a bind operation

What is meant by "an unprivileged mount namespace"?

Thanks,

Michael

> +.RB ( MS_BIND )
> +was attempted without specifying
> +.RB ( MS_REC ),
> +which would have revealed the filesytem tree underneath one of
> +the submounts of the directory being bound.
> +.TP
>  .B ELOOP
>  Too many links encountered during pathname resolution.
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
