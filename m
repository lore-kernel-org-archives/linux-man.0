From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] open.2: Fix up incorrect O_DIRECT aligment information
Date: Tue, 9 Apr 2013 16:18:22 +0200
Message-ID: <CAKgNAkhqnRaZbY+1+bXHCRz5My8y+Ady1zotQ9JU+GNjwAL7NQ@mail.gmail.com>
References: <x49ip4bzb6c.fsf@segfault.boston.devel.redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <x49ip4bzb6c.fsf-RRHT56Q3PSP4kTEheFKJxxDDeQx5vsVwAInAS/Ez/D0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Jeff,

On Thu, Mar 28, 2013 at 6:28 PM, Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Hi,
>
> The alignment text for O_DIRECT is slightly misleading:
>
>        Under  Linux  2.4, transfer sizes, and the alignment of the user buffer
>        and the file offset must all be multiples of the logical block size  of
>        the  file  system.   Under  Linux 2.6, alignment to 512-byte boundaries
>        suffices.
>
> The last sentence is incorrect.  You cannot perform O_DIRECT I/O in
> sizes smaller than the underlying logical block size (for block devices
> and block-based file systems; nfs is a different beast).  I've attached
> my proposed change.  Comments and word-smithing are most welcome.

Could you provide some detail on how you determined, verified, or
tested this detail? I'm not saying you're wrong, but that text has
been there a long time (since before I was maintainer), in the days
when there was no VCS and changelog. It's even possible that I sent
the patch to Andries that added this piece, since I have an idea that
I tested this detail on Linux 2.6 at some point in the distant past.
Indeed, I just now did a (very) quick test using an old program that
suggest that you can do O_DIRECT I/O with block sizes smaller than the
LBS.

Thanks,

Michael

> Signed-off-by: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>
> diff --git a/man2/open.2 b/man2/open.2
> index e518c1f..df92d6a 100644
> --- a/man2/open.2
> +++ b/man2/open.2
> @@ -787,7 +787,8 @@ operation in
>  Under Linux 2.4, transfer sizes, and the alignment of the user buffer
>  and the file offset must all be multiples of the logical block size
>  of the file system.
> -Under Linux 2.6, alignment to 512-byte boundaries suffices.
> +Under Linux 2.6, alignment to the underlying block device's logical
> +block size suffices.
>  .LP
>  .B O_DIRECT
>  I/Os should never be run concurrently with the



--
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
