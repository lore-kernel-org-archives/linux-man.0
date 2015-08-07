From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] fanotify.7: clarify effects of file moves
Date: Fri, 07 Aug 2015 11:18:09 +0200
Message-ID: <55C477D1.1050808@gmail.com>
References: <1438894183-3979-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438894183-3979-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/06/2015 10:49 PM, Heinrich Schuchardt wrote:
> If files or directories are moved to other mounts the inode is
> deleted. Fanotify marks are lost.

Thanks, Heinrich. Applied.

Cheers,

Michael


> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man7/fanotify.7 | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/man7/fanotify.7 b/man7/fanotify.7
> index 54b1ea6..f63fb51 100644
> --- a/man7/fanotify.7
> +++ b/man7/fanotify.7
> @@ -91,10 +91,10 @@ ignore mask and the file cache entry can be updated.
>  .PP
>  The entries in the fanotify notification groups refer to files and
>  directories via their inode number and to mounts via their mount ID.
> -If files or directories are renamed or moved,
> +If files or directories are renamed or moved within the same mount,
>  the respective entries survive.
> -If files or directories are deleted or mounts are unmounted,
> -the corresponding entries are deleted.
> +If files or directories are deleted or moved to another mount or if mounts are
> +unmounted, the corresponding entries are deleted.
>  .SS The event queue
>  As events occur on the filesystem objects monitored by a notification group,
>  the fanotify system generates events that are collected in a queue.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
