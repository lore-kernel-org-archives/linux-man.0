From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] umount.2: fix typo
Date: Sat, 04 Apr 2015 09:42:23 +0100
Message-ID: <551FA3EF.4070303@gmail.com>
References: <20150401161012.GA16041@glebfm.cloud.tilaa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150401161012.GA16041-N9aU+Tdk7XkoO014n+3aBsY9il7ykmry@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gleb Fotengauer-Malinovskiy <glebfm-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/01/2015 05:10 PM, Gleb Fotengauer-Malinovskiy wrote:
> Signed-off-by: Gleb Fotengauer-Malinovskiy <glebfm-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>

Thanks, Gleb. Applied.

Cheers,

Michael


> ---
>  man2/umount.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/umount.2 b/man2/umount.2
> index 149da1a..7c4452a 100644
> --- a/man2/umount.2
> +++ b/man2/umount.2
> @@ -164,7 +164,7 @@ are available in glibc since version 2.11.
>  These functions are Linux-specific and should not be used in
>  programs intended to be portable.
>  .SH NOTES
> -.SS umount() amd shared mount points
> +.SS umount() and shared mount points
>  Shared mount points cause any mount activity on a mount point, including
>  .BR umount (2)
>  operations, to be forwarded to every shared mount point in the
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
