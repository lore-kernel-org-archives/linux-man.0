From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 10/10] manpage: update FALLOC_FL_COLLAPSE_RANGE flag
 in fallocate
Date: Thu, 17 Apr 2014 15:40:05 +0200
Message-ID: <534FD9B5.3000207@gmail.com>
References: <1392741594-20335-1-git-send-email-linkinjeon@gmail.com> <20140416060510.GA25651@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140416060510.GA25651-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Namjae Jeon <linkinjeon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Theodore T'so <tytso-3s7WtUTddSA@public.gmane.org>, Dave Chinner <david-FqsqvQoI3Ljby3iVrkZq2A@public.gmane.org>, Linux-Fsdevel <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 04/16/2014 08:05 AM, Christoph Hellwig wrote:
> Michael, can you apply this now that we merged FALLOC_FL_COLLAPSE_RANGE
> into the kernel tree?

I've applied Namjae Jeon's patch (thanks Namjae!), and done a lot of
tweaking to generate the patch below.

Along the way I noticed that there is an inconsistency between XFS
and JFS that should be fixed (and so have added Dave and Ted to CC,
as well as linux-fsdevel@). 

If 'fd' does not refer to a regular file, then XFS fails with the 
error EINVAL (fs/xfs/xfs_file.c::xfs_file_fallocate()), but ext4 
fails with the error EOPNOTSUP
(fs/ext4/extents::ext4_collapse_range()). I suspect that EINVAL
is the right error for this case.

I'd appreciate review on my revised patch, below.

Cheers,

Michael


diff --git a/man2/fallocate.2 b/man2/fallocate.2
index b31bbde..15d0c2b 100644
--- a/man2/fallocate.2
+++ b/man2/fallocate.2
@@ -124,6 +124,62 @@ Btrfs (since Linux 3.7)
 .IP *
 tmpfs (since Linux 3.5)
 .\" commit 83e4fa9c16e4af7122e31be3eca5d57881d236fe
+.SS Collapsing file space
+.\" commit 00f5e61998dd17f5375d9dfc01331f104b83f841
+Specifying the
+.BR FALLOC_FL_COLLAPSE_RANGE
+flag (available since Linux 3.15) in
+.I mode
+removes a byte range from a file, without leaving a hole.
+The byte range to be collapsed starts at
+.I offset
+and continues for
+.I len
+bytes.
+At the completion of the operation,
+the contents of the file starting at the location
+.I offset+len
+will be appended at the location
+.IR offset ,
+and the file will be
+.I len
+bytes smaller.
+
+A filesystem may place limitations on the granularity of the operation,
+in order to ensure efficient implementation.
+Typically,
+.I offset
+and
+.I len
+must be a multiple of the filesystem logical block size,
+which varies according to the filesystem type and configuration.
+If a filesystem has such a requirement,
+.BR fallocate ()
+will fail with the error
+.BR EINVAL
+if this requirement is violated.
+
+If the region specified by
+.I offset
+plus
+.I len
+reaches or passes the end of file, an error is returned;
+instead, use
+.BR ftruncate (2)
+to truncate a file.
+
+No other flags may be specified in
+.IR mode
+in conjunction with
+.BR FALLOC_FL_COLLAPSE_RANGE .
+
+As at Linux 3.15,
+.B FALLOC_FL_COLLAPSE_RANGE
+is supported by
+ext4 (only for extent-based files)
+.\" commit 9eb79482a97152930b113b51dff530aba9e28c8e
+and XFS.
+.\" commit e1d8fb88a64c1f8094b9f6c3b6d2d9e6719c970d
 .SH RETURN VALUE
 On success,
 .BR fallocate ()
@@ -156,6 +212,36 @@ was less than 0, or
 .\" http://thread.gmane.org/gmane.linux.file-systems/48331/focus=1193526
 was less than or equal to 0.
 .TP
+.B EINVAL
+.I mode
+is
+.BR FALLOC_FL_COLLAPSE_RANGE
+and the range specified by
+.I offset
+plus
+.I len
+reaches or passes the end of the file.
+.TP
+.B EINVAL
+.I mode
+is
+.BR FALLOC_FL_COLLAPSE_RANGE ,
+but either
+.I offset
+or
+.I len
+is not a multiple of the filesystem block size.
+.TP
+.B EINVAL
+mode contains both
+.B FALLOC_FL_COLLAPSE_RANGE
+and other flags;
+no other flags are permitted with
+.BR FALLOC_FL_COLLAPSE_RANGE .
+.\" FIXME Document error when FALLOC_FL_COLLAPSE_RANGE
+.\" is given a nonregular file. As at 3.15-rc1, XFS gives
+.\" EINVAL, but ext4 gives EOPNOTSUPP.
+.TP
 .B EIO
 An I/O error occurred while reading from or writing to a filesystem.
 .TP
@@ -193,6 +279,8 @@ Or:
 .I mode
 specifies
 .BR FALLOC_FL_PUNCH_HOLE
+or
+.BR FALLOC_FL_COLLAPSE_RANGE
 and
 the file referred to by
 .I fd
@@ -203,6 +291,14 @@ is marked append-only
 .B ESPIPE
 .I fd
 refers to a pipe or FIFO.
+.TP
+.B ETXTBSY
+.I mode
+specifies
+.BR FALLOC_FL_COLLAPSE_RANGE ,
+but the file referred to by
+.IR fd
+is currently being executed.
 .SH VERSIONS
 .BR fallocate ()
 is available on Linux since kernel 2.6.23.


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
