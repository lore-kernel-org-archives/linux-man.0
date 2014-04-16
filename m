From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH v5 10/10] manpage: update FALLOC_FL_COLLAPSE_RANGE flag
 in fallocate
Date: Tue, 15 Apr 2014 23:05:10 -0700
Message-ID: <20140416060510.GA25651@infradead.org>
References: <1392741594-20335-1-git-send-email-linkinjeon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392741594-20335-1-git-send-email-linkinjeon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Namjae Jeon <linkinjeon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael, can you apply this now that we merged FALLOC_FL_COLLAPSE_RANGE
into the kernel tree?

On Wed, Feb 19, 2014 at 01:39:53AM +0900, Namjae Jeon wrote:
> From: Namjae Jeon <namjae.jeon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> 
> Update FALLOC_FL_COLLAPSE_RANGE flag in fallocate.
> 
> Signed-off-by: Namjae Jeon <namjae.jeon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Ashish Sangwan <a.sangwan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  man2/fallocate.2 |   21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/man2/fallocate.2 b/man2/fallocate.2
> index b31bbde..06a0b0c 100644
> --- a/man2/fallocate.2
> +++ b/man2/fallocate.2
> @@ -1,5 +1,6 @@
>  .\" Copyright (c) 2007 Silicon Graphics, Inc. All Rights Reserved
>  .\" Written by Dave Chinner <dgc-sJ/iWh9BUns@public.gmane.org>
> +.\" Updated by Namjae Jeon <namjae.jeon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>  .\"
>  .\" %%%LICENSE_START(GPLv2_ONELINE)
>  .\" May be distributed as per GNU General Public License version 2.
> @@ -7,6 +8,7 @@
>  .\"
>  .\" 2011-09-19: Added FALLOC_FL_PUNCH_HOLE
>  .\" 2011-09-19: Substantial restructuring of the page
> +.\" 2014-02-19: Added FALLOC_FL_COLLAPSE_RANGE
>  .\"
>  .TH FALLOCATE 2 2014-01-24 "Linux" "Linux Programmer's Manual"
>  .SH NAME
> @@ -124,6 +126,25 @@ Btrfs (since Linux 3.7)
>  .IP *
>  tmpfs (since Linux 3.5)
>  .\" commit 83e4fa9c16e4af7122e31be3eca5d57881d236fe
> +.SS Collapsing file space
> +Specifiying the
> +.BR FALLOC_FL_COLLAPSE_RANGE
> +flag in
> +.I mode
> +collpse space in the byte range starting at
> +.I offset
> +and continuing for
> +.I len
> +bytes. Within the specified range, it first de-allocates blocks and eliminates
> +the hole created in this process by shifting data blocks into the hole.
> +
> +Different filesystem may implement different limitatios on the granularity of
> +the operation. Most filesystem will limit operations to filesystem block size
> +boundaries, but this boundary may be larger or smaller depending
> +on the filesystem and/or the configuration of the filesystem or file.
> +
> +If filesystem has such limitation on granularity, It will return error(EINVAL).
> +
>  .SH RETURN VALUE
>  On success,
>  .BR fallocate ()
> -- 
> 1.7.9.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-fsdevel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
---end quoted text---
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
