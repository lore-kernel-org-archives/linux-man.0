From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ioctl_fat.2: correctly reference volume ID instead of
 volume label
Date: Wed, 8 Feb 2017 09:30:10 +0100
Message-ID: <c17ee5c6-b6cd-44e6-3925-c3ab78d1445a@gmail.com>
References: <20170208011336.6578-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170208011336.6578-1-masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Masney <masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Brian,

On 02/08/2017 02:13 AM, Brian Masney wrote:
> The description of FAT_IOCTL_GET_VOLUME_ID references volume name, when
> it really should be volume ID since the volume label is different in the
> FAT filesystem. This patch renames the incorrect volume name references
> to volume id.
> 
> This man page supplies an example display_fat_volume_id.c program that
> can be used to read the volume ID (serial number) from a filesystem.
> Here is an additional test showing that the volume ID and volume name
> are two different entities:
> 
> $ dd if=/dev/zero of=fat_volume bs=1M count=1
> $ mkfs.fat -v -n MASNEYB fat_volume
> [snip]
> Volume ID is da8cecf2, volume label MASNEYB    .
> $ sudo mount -o loop fat_volume /mnt
> $ ./display_fat_volume_id /mnt/
> Volume ID da8c-ecf2

Thanks for the patch, and the omformative commit message! Applied.

Cheers,

Michael


> Signed-off-by: Brian Masney <masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
> ---
>  man2/ioctl_fat.2 | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/man2/ioctl_fat.2 b/man2/ioctl_fat.2
> index 1417b61..aa6e9f8 100644
> --- a/man2/ioctl_fat.2
> +++ b/man2/ioctl_fat.2
> @@ -88,9 +88,9 @@ It is reset by an archiving system.
>  The zero value
>  .B ATTR_NONE
>  can be used to indicate that no attribute bit is set.
> -.SS Reading the volume label
> -FAT filesystems are identified by a volume label.
> -The volume label can be read with
> +.SS Reading the volume ID
> +FAT filesystems are identified by a volume ID.
> +The volume ID can be read with
>  .BR FAT_IOCTL_GET_VOLUME_ID .
>  .PP
>  The
> @@ -106,7 +106,7 @@ flag.
>  The
>  .I id
>  argument is a pointer to the field that will be filled with the volume ID.
> -Typically the volume label is displayed to the user as a group of two
> +Typically the volume ID is displayed to the user as a group of two
>  16-bit fields:
>  .PP
>  .in +4n
> @@ -347,10 +347,10 @@ main(int argc, char *argv[])
>  }
>  .fi
>  .in
> -.SS Reading the volume label
> +.SS Reading the volume ID
>  The following program demonstrates the use of
>  .BR ioctl (2)
> -to display the volume label of a FAT filesystem.
> +to display the volume ID of a FAT filesystem.
>  .PP
>  The following output was recorded when applying the program for
>  directory
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
