From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] bdflush.2, fsync.2, sync.2, proc.5: It's sync(1), not
 sync(8)
Date: Fri, 01 Aug 2014 22:03:04 +0200
Message-ID: <53DBF278.30003@gmail.com>
References: <20140731150117.GD28246@bunk.spdns.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140731150117.GD28246-sb+G6o0a8UClyZJzQ+nmOQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/31/2014 05:01 PM, Adrian Bunk wrote:
> This seems to be a remnant from the times when man-pages
> shipped a sync(8).

Thanks, Adrian. Applied.

Cheers,

Michael


> Signed-off-by: Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  man2/bdflush.2 | 2 +-
>  man2/fsync.2   | 2 +-
>  man2/sync.2    | 2 +-
>  man5/proc.5    | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/man2/bdflush.2 b/man2/bdflush.2
> index 7b7f28c..c44dd4f 100644
> --- a/man2/bdflush.2
> +++ b/man2/bdflush.2
> @@ -119,4 +119,4 @@ intended to be portable.
>  .SH SEE ALSO
>  .BR fsync (2),
>  .BR sync (2),
> -.BR sync (8)
> +.BR sync (1)
> diff --git a/man2/fsync.2 b/man2/fsync.2
> index 630e90a..ec2f710 100644
> --- a/man2/fsync.2
> +++ b/man2/fsync.2
> @@ -166,4 +166,4 @@ to guarantee safe operation.
>  .BR sync_file_range (2),
>  .BR hdparm (8),
>  .BR mount (8),
> -.BR sync (8)
> +.BR sync (1)
> diff --git a/man2/sync.2 b/man2/sync.2
> index f21a38b..3547bec 100644
> --- a/man2/sync.2
> +++ b/man2/sync.2
> @@ -120,4 +120,4 @@ large caches.)
>  .BR bdflush (2),
>  .BR fdatasync (2),
>  .BR fsync (2),
> -.BR sync (8)
> +.BR sync (1)
> diff --git a/man5/proc.5 b/man5/proc.5
> index 040db32..2c1afde 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -3731,7 +3731,7 @@ To free pagecache, dentries and inodes, use:
>  Because writing to this file is a nondestructive operation and dirty objects
>  are not freeable, the
>  user should run
> -.BR sync (8)
> +.BR sync (1)
>  first.
>  .TP
>  .IR /proc/sys/vm/legacy_va_layout " (since Linux 2.6.9)"
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
