From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] ioctl_list.2: include/linux/ext2_fs.h
Date: Tue, 03 Mar 2015 08:33:41 +0100
Message-ID: <54F563D5.9050909@gmail.com>
References: <1425326662-7567-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425326662-7567-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/02/2015 09:04 PM, Heinrich Schuchardt wrote:
> Include linux/ext2_fs.h does not contain any ioctl definitions
> anymore.
> 
> Request codes EXT2_IOC* have been replaced by FS_IOC* in
> linux/fs.h.
> 
> Some definitions of FS_IOC_* use long* but the actual code expects
> int* (see fs/ext2/ioctl.c).

Thanks, Heinrich. Applied. See one comment below.

> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man2/ioctl_list.2 | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/man2/ioctl_list.2 b/man2/ioctl_list.2
> index dc1505f..75fb3df 100644
> --- a/man2/ioctl_list.2
> +++ b/man2/ioctl_list.2
> @@ -30,6 +30,9 @@
>  .\"
>  .\" 2015-02-21 Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
>  .\"     SEE ALSO ioctl_fat(2), add FAT_IOCTL_GET_VOLUME_ID.
> +.\"
> +.\" 2015-03-02 Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> +.\"     EXT2_IOC* have been replaced by FS_IOC*.

These days, I tend to avoid updating the changelog, except sometimes
in the case of major changes. Git history is enough. (I missed that
you'd also updated the "in-page" changelog in the last patch you
made to this  page.) 

I've removed the recent changelog text....

Cheers,

Michael

>  .TH IOCTL_LIST 2 2013-09-17 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  ioctl_list \- list of ioctl calls in Linux/i386 kernel
> @@ -273,15 +276,6 @@ l l l.
>  0x00435909	CYSETDEFTIMEOUT	int
>  .TE
>  
> -// <include/linux/ext2_fs.h>
> -.TS
> -l l l.
> -0x80046601	EXT2_IOC_GETFLAGS	int *
> -0x40046602	EXT2_IOC_SETFLAGS	const int *
> -0x80047601	EXT2_IOC_GETVERSION	int *
> -0x40047602	EXT2_IOC_SETVERSION	const int *
> -.TE
> -
>  // <include/linux/fd.h>
>  .TS
>  l l l.
> @@ -326,6 +320,15 @@ l l l l.
>  0x00001263	BLKRAGET	int *
>  0x00000001	FIBMAP	int *	// I-O
>  0x00000002	FIGETBSZ	int *
> +0x80086601	FS_IOC_GETFLAGS	int *
> +0x40086602	FS_IOC_SETFLAGS	int *
> +0x80087601	FS_IOC_GETVERSION	int *
> +0x40087602	FS_IOC_SETVERSION	int *
> +0xC020660B	FS_IOC_FIEMAP	struct fiemap *
> +0x40086602	FS_IOC32_SETFLAGS	int *
> +0x40086602	FS_IOC32_SETFLAGS	int *
> +0x80047601	FS_IOC32_GETVERSION	int *
> +0x40047602	FS_IOC32_SETVERSION	int *
>  .TE
>  
>  // <include/linux/hdreg.h>
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
