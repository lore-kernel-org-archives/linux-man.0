From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] ioctl_fat.2: use %04x to print volume id
Date: Mon, 9 May 2016 22:26:16 +0200
Message-ID: <860ad4d2-1d47-2887-0799-6ea4abda4df7@gmail.com>
References: <1462610572-10908-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462610572-10908-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/07/2016 10:42 AM, Heinrich Schuchardt wrote:
> Leading zeroes should be used when display a FAT volume id.

Thanks, Heinrich. Applied.

Cheers,

Michael


> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man2/ioctl_fat.2 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/ioctl_fat.2 b/man2/ioctl_fat.2
> index 4ae0e5d..875b57e 100644
> --- a/man2/ioctl_fat.2
> +++ b/man2/ioctl_fat.2
> @@ -111,7 +111,7 @@ Typically the volume label is displayed to the user as a group of two
>  .PP
>  .in +4n
>  .nf
> -printf("Volume ID %4x-%4x\\n", id >> 16, id & 0xFFFF);
> +printf("Volume ID %04x-%04x\\n", id >> 16, id & 0xFFFF);
>  .fi
>  .in
>  .SS Reading short file names of a directory
> @@ -403,7 +403,7 @@ main(int argc, char *argv[])
>      /*
>       * Format the output as two groups of 16 bits each.
>       */
> -    printf("Volume ID %4x\-%4x\\n", id >> 16, id & 0xFFFF);
> +    printf("Volume ID %04x\-%04x\\n", id >> 16, id & 0xFFFF);
>  
>      close(fd);
>  
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
