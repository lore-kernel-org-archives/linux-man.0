From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH] fsync.2 updates
Date: Sun, 26 Feb 2012 14:52:02 -0500
Message-ID: <20120226195202.GA11676@infradead.org>
References: <20111104061203.GA1300@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111104061203.GA1300-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

ping?

On Fri, Nov 04, 2011 at 02:12:03AM -0400, Christoph Hellwig wrote:
>  - explain the situation with disk caches better
>  - remove the duplicate fdatasync explanation in the NOTE section
>  - remove an incorrect note about fsync generally requiring two writes
>  - remove an obsolete ext2 example note
>  - fsync works on any fd and does not require a writeable one,
>    correct the EBADF error code explanation.
> 
> Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
> 
> diff --git a/man2/fsync.2 b/man2/fsync.2
> index 58d325a..9b74774 100644
> --- a/man2/fsync.2
> +++ b/man2/fsync.2
> @@ -63,12 +63,15 @@ transfers ("flushes") all modified in-core data of
>  (i.e., modified buffer cache pages for) the
>  file referred to by the file descriptor
>  .I fd
> -to the disk device (or other permanent storage device)
> -where that file resides.
> +to the disk device (or other permanent storage device) so that all
> +changed information can be retrieved even after the system crashed or
> +was rebooted.  This includes writing through or flushing a disk cache
> +if present.
>  The call blocks until the device reports that the transfer has completed.
>  It also flushes metadata information associated with the file (see
>  .BR stat (2)).
>  
> +
>  Calling
>  .BR fsync ()
>  does not necessarily ensure
> @@ -111,7 +114,7 @@ is set appropriately.
>  .TP
>  .B EBADF
>  .I fd
> -is not a valid file descriptor open for writing.
> +is not a valid open file descriptor.
>  .TP
>  .B EIO
>  An error occurred during synchronization.
> @@ -135,49 +138,21 @@ to a value greater than 0.
>  .\" -1: unavailable, 0: ask using sysconf().
>  .\" glibc defines them to 1.
>  .SH NOTES
> -Applications that access databases or log files often write a tiny
> -data fragment (e.g., one line in a log file) and then call
> -.BR fsync ()
> -immediately in order to ensure that the written data is physically
> -stored on the harddisk.
> -Unfortunately,
> -.BR fsync ()
> -will always initiate two write operations: one for the newly written
> -data and another one in order to update the modification time stored
> -in the inode.
> -If the modification time is not a part of the transaction
> -concept
> -.BR fdatasync ()
> -can be used to avoid unnecessary inode disk write operations.
> -
> -If the underlying hard disk has write caching enabled, then
> -the data may not really be on permanent storage when
> -.BR fsync ()
> -/
> -.BR fdatasync ()
> -return.
> -.\" See
> -.\" .BR hdparm (8)
> -.\" for how to disable that cache for IDE disks.
> -.LP
> -When an ext2 file system is mounted with the
> -.I sync
> -option, directory entries are also implicitly synced by
> -.BR fsync ().
> -.LP
> -On kernels before 2.4,
> -.BR fsync ()
> -on big files can be inefficient.
> -An alternative might be to use the
> -.B O_SYNC
> -flag to
> -.BR open (2).
> -
>  In Linux 2.2 and earlier,
>  .BR fdatasync ()
>  is equivalent to
>  .BR fsync (),
>  and so has no performance advantage.
> +
> +The
> +.BR fsync ()
> +implementations in older kernels and lesser used filesystems
> +does not know how to flush disk caches.  In these cases disk caches need to
> +be disabled using
> +.BR hdparm (8)
> +or
> +.BR sdparm (8)
> +to guarantee safe operation.
>  .SH "SEE ALSO"
>  .BR bdflush (2),
>  .BR open (2),
---end quoted text---
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
