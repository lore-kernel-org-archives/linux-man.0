From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fsync.2 updates
Date: Mon, 27 Feb 2012 13:14:42 +1300
Message-ID: <CAKgNAkiDHVZG2LGtHFb0Ego9VgA-30JkyY+966ykCBOpFT9qnQ@mail.gmail.com>
References: <20111104061203.GA1300@infradead.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111104061203.GA1300-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Christoph,

I've applied this patch for man-pages-3.36.

Cheers,

Michael


On Fri, Nov 4, 2011 at 7:12 PM, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> w=
rote:
> =A0- explain the situation with disk caches better
> =A0- remove the duplicate fdatasync explanation in the NOTE section
> =A0- remove an incorrect note about fsync generally requiring two wri=
tes
> =A0- remove an obsolete ext2 example note
> =A0- fsync works on any fd and does not require a writeable one,
> =A0 correct the EBADF error code explanation.
>
> Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
>
> diff --git a/man2/fsync.2 b/man2/fsync.2
> index 58d325a..9b74774 100644
> --- a/man2/fsync.2
> +++ b/man2/fsync.2
> @@ -63,12 +63,15 @@ transfers ("flushes") all modified in-core data o=
f
> =A0(i.e., modified buffer cache pages for) the
> =A0file referred to by the file descriptor
> =A0.I fd
> -to the disk device (or other permanent storage device)
> -where that file resides.
> +to the disk device (or other permanent storage device) so that all
> +changed information can be retrieved even after the system crashed o=
r
> +was rebooted. =A0This includes writing through or flushing a disk ca=
che
> +if present.
> =A0The call blocks until the device reports that the transfer has com=
pleted.
> =A0It also flushes metadata information associated with the file (see
> =A0.BR stat (2)).
>
> +
> =A0Calling
> =A0.BR fsync ()
> =A0does not necessarily ensure
> @@ -111,7 +114,7 @@ is set appropriately.
> =A0.TP
> =A0.B EBADF
> =A0.I fd
> -is not a valid file descriptor open for writing.
> +is not a valid open file descriptor.
> =A0.TP
> =A0.B EIO
> =A0An error occurred during synchronization.
> @@ -135,49 +138,21 @@ to a value greater than 0.
> =A0.\" -1: unavailable, 0: ask using sysconf().
> =A0.\" glibc defines them to 1.
> =A0.SH NOTES
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
> =A0In Linux 2.2 and earlier,
> =A0.BR fdatasync ()
> =A0is equivalent to
> =A0.BR fsync (),
> =A0and so has no performance advantage.
> +
> +The
> +.BR fsync ()
> +implementations in older kernels and lesser used filesystems
> +does not know how to flush disk caches. =A0In these cases disk cache=
s need to
> +be disabled using
> +.BR hdparm (8)
> +or
> +.BR sdparm (8)
> +to guarantee safe operation.
> =A0.SH "SEE ALSO"
> =A0.BR bdflush (2),
> =A0.BR open (2),
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
