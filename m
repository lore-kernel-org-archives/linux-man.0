From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] update the sync.2 man page
Date: Thu, 11 Feb 2016 13:35:30 +0100
Message-ID: <56BC8012.6080900@gmail.com>
References: <20160209162134.GA18634@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160209162134.GA18634-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/09/2016 05:21 PM, Christoph Hellwig wrote:
> Clarify the description a bit, and document the Linux data integrity
> guarantees.

Thanks, Christoph. Applied.

Cheers,

Michael

> Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
> 
> diff --git a/man2/sync.2 b/man2/sync.2
> index 5e222cb..28a42c4 100644
> --- a/man2/sync.2
> +++ b/man2/sync.2
> @@ -35,7 +35,7 @@
>  .\"
>  .TH SYNC 2 2015-08-08 "Linux" "Linux Programmer's Manual"
>  .SH NAME
> -sync, syncfs \- commit buffer cache to disk
> +sync, syncfs \- commit filesystem caches to disk
>  .SH SYNOPSIS
>  .B #include <unistd.h>
>  .sp
> @@ -64,8 +64,8 @@ _GNU_SOURCE
>  .ad
>  .SH DESCRIPTION
>  .BR sync ()
> -causes all buffered modifications to file metadata and data to be
> -written to the underlying filesystems.
> +causes all pending modifications to file system metadata and cached file
> +data to be written to the underlying filesystems.
>  
>  .BR syncfs ()
>  is like
> @@ -108,16 +108,21 @@ In glibc 2.2.1 and earlier,
>  it was "int sync(void)", and
>  .BR sync ()
>  always returned 0.
> -.SH BUGS
> +
>  According to the standard specification (e.g., POSIX.1-2001),
>  .BR sync ()
>  schedules the writes, but may return before the actual
> -writing is done.
> -However, since version 1.3.20 Linux does actually wait.
> -(This still does not guarantee data integrity: modern disks have
> -large caches.)
> +writing is done.  However Linux waits for I/O completions,
> +and thus
> +.BR sync ()
> +or
> +.BR syncfs ()
> +provide the same guarantees as fsync called on every file in
> +the system or filesystem respectively.
> +.SH BUGS
> +Before version 1.3.20 Linux did not wait for I/O to complete
> +before returning.
>  .SH SEE ALSO
> -.BR bdflush (2),
>  .BR fdatasync (2),
>  .BR fsync (2),
>  .BR sync (1)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> .
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
