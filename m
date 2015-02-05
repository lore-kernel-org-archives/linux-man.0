From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] statfs: Add OCFS2_SUPER_MAGIC.
Date: Thu, 05 Feb 2015 09:17:41 +0100
Message-ID: <54D32725.3070103@gmail.com>
References: <1265178434-25008-1-git-send-email-tao.ma@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1265178434-25008-1-git-send-email-tao.ma-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tao Ma <tao.ma-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/03/2010 07:27 AM, Tao Ma wrote:
> Signed-off-by: Tao Ma <tao.ma-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
> Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Applied!

Cheers,

Michael


> ---
>  man2/statfs.2 |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/man2/statfs.2 b/man2/statfs.2
> index 73ec57f..8a79321 100644
> --- a/man2/statfs.2
> +++ b/man2/statfs.2
> @@ -87,6 +87,7 @@ File system types:
>     NCP_SUPER_MAGIC       0x564c
>     NFS_SUPER_MAGIC       0x6969
>     NTFS_SB_MAGIC         0x5346544e
> +   OCFS2_SUPER_MAGIC     0x7461636f
>     OPENPROM_SUPER_MAGIC  0x9fa1
>     PROC_SUPER_MAGIC      0x9fa0
>     QNX4_SUPER_MAGIC      0x002f
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
