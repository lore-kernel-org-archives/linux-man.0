From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] unlink.2: same intro paragraph of unlinkat() errors as
 other *at()
Date: Mon, 03 Mar 2014 05:54:54 +0100
Message-ID: <53140B1E.5010702@gmail.com>
References: <1393679439-1123-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393679439-1123-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Simon,


On 03/01/2014 02:10 PM, Simon Paillard wrote:
> Same as link.2, open.2, readlink.2, rename.2, symlink.2, etc.

But, this case is not quite the same, since the errors from unlinkat() are
those from unlink() *and those from rmdir()* as well as some extra errors.
That's why I didn't treat the piece here the same as for link.2, open.2, 
readlink.2, rename.2, symlink.2, etc.

Cheers,

Michael


> ---
>  man2/unlink.2 | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/man2/unlink.2 b/man2/unlink.2
> index 7aafb90..d6a7a68 100644
> --- a/man2/unlink.2
> +++ b/man2/unlink.2
> @@ -237,12 +237,6 @@ capability).
>  .I pathname
>  refers to a file on a read-only filesystem.
>  .PP
> -The same errors that occur for
> -.BR unlink ()
> -and
> -.BR rmdir (2)
> -can also occur for
> -.BR unlinkat ().
>  The following additional errors can occur for
>  .BR unlinkat ():
>  .TP




-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
