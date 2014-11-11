From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] fanotify.7: allow relative paths in example
Date: Tue, 11 Nov 2014 06:38:06 +0100
Message-ID: <5461A0BE.3010302@gmail.com>
References: <1415037998-3821-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415037998-3821-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/03/2014 07:06 PM, Heinrich Schuchardt wrote:
> The current example code requires passing an absolute
> path to the mount to be watched.
> 
> By passing AT_FDCWD to fanotify_mark it can use both
> absolute and relative pathes.

Thanks, Heinrich. Applied.

Cheers,

Michael

> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man7/fanotify.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man7/fanotify.7 b/man7/fanotify.7
> index d6f2542..27bd0f8 100644
> --- a/man7/fanotify.7
> +++ b/man7/fanotify.7
> @@ -691,7 +691,7 @@ main(int argc, char *argv[])
>           file descriptor */
>  
>      if (fanotify_mark(fd, FAN_MARK_ADD | FAN_MARK_MOUNT,
> -                      FAN_OPEN_PERM | FAN_CLOSE_WRITE, \-1,
> +                      FAN_OPEN_PERM | FAN_CLOSE_WRITE, AT_FDCWD,
>                        argv[1]) == \-1) {
>          perror("fanotify_mark");
>          exit(EXIT_FAILURE);
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
