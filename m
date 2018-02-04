From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] tmpfs(5): document current mount options
Date: Sun, 4 Feb 2018 10:03:28 +0100
Message-ID: <d92fae63-5d6a-56ea-1a69-973bee77395c@gmail.com>
References: <20180127095928.6294-1-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180127095928.6294-1-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kzak-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Mike,

On 01/27/2018 10:59 AM, Mike Frysinger wrote:
> Some of this content is moved from the mount(8) man page.
> Style was based on proc(5) sections.

Thanks. I've applied this. I also added some further details for the
'mpol' and 'huge' options, largely drawn from kernel Documentation
files. Could you take a quick look at that new content?

Is there any other text for mount(8) that should be imported to
tmpfs(5)?

Cheers,

Michael
 
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
>  man5/tmpfs.5 | 77 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 73 insertions(+), 4 deletions(-)
> 
> diff --git a/man5/tmpfs.5 b/man5/tmpfs.5
> index 5bdc8939c7f7..85f7ab5f26d1 100644
> --- a/man5/tmpfs.5
> +++ b/man5/tmpfs.5
> @@ -51,10 +51,6 @@ filesystem has the following properties:
>  The filesystem can employ swap space when physical memory pressure
>  demands it.
>  .IP *
> -The
> -.I size
> -option can be used to specify an upper limit on the size of the filesystem.
> -(The default size is half of the available RAM size.)
>  The filesystem consumes only as much physical memory and swap space
>  as is required to store the current contents of the filesystem.
>  .IP *
> @@ -66,6 +62,79 @@ the filesystem size can be changed
>  If a
>  .B tmpfs
>  filesystem is unmounted, its contents are discarded (lost).
> +.\" See mm/shmem.c:shmem_parse_options for options it supports.
> +.SS Mount options
> +The
> +.B tmpfs
> +filesystem supports the following mount options:
> +.TP
> +.BR size "=\fIbytes\fP"
> +Specify an upper limit on the size of the filesystem.
> +The size is given in bytes, and rounded up to entire pages.
> +
> +The size may have a
> +.BR k ,
> +.BR m ,
> +or
> +.B g
> +suffix for Ki, Mi, Gi (binary kilo (kibi), binary mega (mebi) and binary giga
> +(gibi)).
> +
> +The size may also have a % suffix to limit this instance to a percentage of
> +physical RAM.
> +
> +The default, when neither size nor nr_blocks is specified, is size=50%.
> +.TP
> +.BR nr_blocks "=\fIblocks\fP"
> +The same as
> +.BR size ,
> +but in blocks of PAGE_CACHE_SIZE.
> +
> +Blocks may be specified with
> +.BR k ,
> +.BR m ,
> +or
> +.B g
> +suffixes like
> +.BR size ,
> +but not a % suffix.
> +.TP
> +.BR nr_inodes "=\fIinodes\fP"
> +The maximum number of inodes for this instance.
> +The default is half of the number of your physical RAM pages, or (on a
> +machine with highmem) the number of lowmem RAM pages, whichever is smaller.
> +
> +Inodes may be specified with
> +.BR k ,
> +.BR m ,
> +or
> +.B g
> +suffixes like
> +.BR size ,
> +but not a % suffix.
> +.TP
> +.BR mode "=\fImode\fP"
> +Set initial permissions of the root directory.
> +.TP
> +.BR gid "=\fIgid\fP (since Linux 2.5.7)"
> +.\" Technically this is also in some version of Linux 2.4.
> +.\" commit 099445b489625b80b1d6687c9b6072dbeaca4096
> +Set the initial group ID of the root directory.
> +.TP
> +.BR uid "=\fIuid\fP (since Linux 2.5.7)"
> +.\" Technically this is also in some version of Linux 2.4.
> +.\" commit 099445b489625b80b1d6687c9b6072dbeaca4096
> +Set the initial user ID of the root directory.
> +.TP
> +.BR huge "=\fI[never|always|within_size|advise|deny|force]\fR (since Linux 4.7.0)"
> +.\" commit 5a6e75f8110c97e2a5488894d4e922187e6cb343
> +Set the huge table memory allocation policy for all files in this instance (if
> +CONFIG_TRANSPARENT_HUGE_PAGECACHE is enabled).
> +.TP
> +.BR mpol "=\fI[default|prefer:Node|bind:NodeList|interleave|interleave:NodeList]\fR (since Linux 2.6.15)"
> +.\" commit 7339ff8302fd70aabf5f1ae26e0c4905fa74a495
> +Set the NUMA memory allocation policy for all files in this instance (if
> +CONFIG_NUMA is enabled).
>  .SH VERSIONS
>  The
>  .B tmpfs
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
