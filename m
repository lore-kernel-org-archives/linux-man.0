From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] rename(2): fix spacing
Date: Fri, 15 Aug 2014 20:06:00 +0200
Message-ID: <53EE4C08.3090204@gmail.com>
References: <1408000518-17709-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408000518-17709-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Mike. Applied.

Cheers,

Michael


On 08/14/2014 09:15 AM, Mike Frysinger wrote:
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
>  man2/rename.2 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/rename.2 b/man2/rename.2
> index a258972..02ef75c 100644
> --- a/man2/rename.2
> +++ b/man2/rename.2
> @@ -121,7 +121,7 @@ If
>  refers to a symbolic link, the link is renamed; if
>  .I newpath
>  refers to a symbolic link, the link will be overwritten.
> -.SS renameat ()
> +.SS renameat()
>  The
>  .BR renameat ()
>  system call operates in exactly the same way as
> @@ -409,7 +409,7 @@ was added to Linux in kernel 3.15.
>  .BR renameat ():
>  POSIX.1-2008.
>  
> -.BR renameat2()
> +.BR renameat2 ()
>  is Linux-specific.
>  .SH BUGS
>  On NFS filesystems, you can not assume that if the operation
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
