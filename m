From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH manpages] umount.2: revise MNT_FORCE description.
Date: Tue, 8 Aug 2017 21:26:54 +0200
Message-ID: <508034ae-e254-d0bd-5ca9-c3f1959f8fe5@gmail.com>
References: <87mv7asj5l.fsf@notabene.neil.brown.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87mv7asj5l.fsf-wvvUuzkyo1HefUI2i7LXDhCRmIWqnp/j@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: NeilBrown <neilb-IBi9RG/b67k@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, systemd-devel-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/08/2017 07:49 AM, NeilBrown wrote:
> 
> MNT_FORCE does not allow a busy filesystem to be unmounted.  Only
> MNT_DETACH allows that.
> MNT_FORCE only tries to abort pending transactions, in the hope that
> might help umount not to block,
> 
> Also, other filesystems than NFS support MNT_FORCE.
> 
> Signed-off-by: NeilBrown <neilb-IBi9RG/b67k@public.gmane.org>

Thanks, Neil. Applied.

Cheers,

Michael


> ---
> 
> Explanation derived from examination of source code.
> Cc to systemd devel in relation to comment I just posted:
> 
> https://github.com/systemd/systemd/commit/0c08f5cde749bd2818475e487109cd0d413452df
> 
> You may want to move the "linux version when support was added" to a
> comment, or discard it.
> 
>  man2/umount.2 | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/man2/umount.2 b/man2/umount.2
> index 68f76b7c6352..ccd1d07afe88 100644
> --- a/man2/umount.2
> +++ b/man2/umount.2
> @@ -61,9 +61,17 @@ unmounts a target, but allows additional
>  controlling the behavior of the operation:
>  .TP
>  .BR MNT_FORCE " (since Linux 2.1.116)"
> -Force unmount even if busy.
> -This can cause data loss.
> -(Only for NFS mounts.)
> +Ask the filesystem to abort pending requests before attempting the
> +unmount.  This may allow the unmount to complete without waiting
> +for an inaccessible server.  If, after aborting requests, some
> +processes still have active references to the filesystem, the
> +unmount will still fail. In Linux 4.12, only the filesystems
> +9p (2.6.16),
> +ceph (2.6.34),
> +cifs (2.6.12),
> +fuse (2.6.16),
> +lustre (3.11),
> +and NFS (2.1.116) respond to MNT_FORCE.
>  .TP
>  .BR MNT_DETACH " (since Linux 2.4.11)"
>  Perform a lazy unmount: make the mount point unavailable for new
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
