From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] open.2: improve description of O_DIRECT
Date: Mon, 11 Feb 2008 17:29:57 +0100
Message-ID: <47B07805.5030000@gmail.com>
References: <4796E05E.1000508@melbourne.sgi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4796E05E.1000508-cP1dWloDopni96+mSzHFpQC/G2K4zDHf@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Banks <gnb-cP1dWloDopni96+mSzHFpQC/G2K4zDHf@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Greg,

Sorry for the delay in following up.

In general the patch looks great -- thanks!  I have one small question,
noted below.

Greg Banks wrote:
> Against man-pages-2.76.  Update the description of the O_DIRECT flag to open(2)
> 
>  - to document the behaviour of O_DIRECT with NFS, and
> 
>  - to be clearer about the O_DIRECT alignment restriction
>    mess in Linux, and
> 
>  - to recommend that application writers exercise caution.
> 
> Information from reading NFS & XFS source and talking to XFS folks.
> 
> Signed-off-by: Greg Banks <gnb-cP1dWloDopni96+mSzHFpQC/G2K4zDHf@public.gmane.org>
> Reviewed-by: David Chinner <dgc-sJ/iWh9BUns@public.gmane.org>
> Reviewed-by: Jeremy Higdon <jeremy-sJ/iWh9BUns@public.gmane.org>
> References: SGI:PV975946
> ---
> 
>  man2/open.2 |   81 ++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 63 insertions(+), 18 deletions(-)
> 
> Index: man-pages-2.76/man2/open.2
> ===================================================================
> --- man-pages-2.76.orig/man2/open.2	2008-01-18 13:04:11.523554019 +1100
> +++ man-pages-2.76/man2/open.2	2008-01-21 20:31:52.206769981 +1100
> @@ -197,14 +197,9 @@ The I/O is synchronous, that is, at the 
>  .BR read (2)
>  or
>  .BR write (2),
> -data is guaranteed to have been transferred.
> -Under Linux 2.4 transfer sizes, and the alignment of user buffer
> -and file offset must all be multiples of the logical block size
> -of the file system.
> -Under Linux 2.6 alignment to 512-byte boundaries
> -suffices.
> -.\" Alignment should satisfy requirements for the underlying device
> -.\" There may be coherency problems.
> +data is guaranteed to have been transferred.  See
> +.B NOTES
> +below for further discussion.
>  .sp
>  A semantically similar (but deprecated) interface for block devices
>  is described in
> @@ -587,17 +582,67 @@ On many systems the file is actually tru
>  .LP
>  The
>  .B O_DIRECT
> -flag was introduced in SGI IRIX, where it has alignment restrictions
> -similar to those of Linux 2.4.
> -IRIX has also a fcntl(2) call to
> -query appropriate alignments, and sizes.
> -FreeBSD 4.x introduced
> -a flag of same name, but without alignment restrictions.
> -Support was added under Linux in kernel version 2.4.10.
> +flag may impose alignment restrictions on the length and address
> +of userspace buffers and the file offset of I/Os.  In Linux alignment
> +restrictions vary by filesystem and kernel version and might be
> +absent entirely.  However there is currently no filesystem\-independent
> +interface for an application to discover these restrictions for a given
> +file or filesystem.  Some filesystems provide their own interfaces
> +for doing so, for example the
> +.B XFS_IOC_DIOINFO
> +operation in
> +.BR xfsctl (3).
> +.LP
> +Under Linux 2.4, transfer sizes, and the alignment of user buffer
> +and file offset must all be multiples of the logical block size
> +of the file system.  Under Linux 2.6, alignment to 512-byte boundaries
> +suffices.  The flag was introduced in SGI IRIX, where it has alignment
> +restrictions similar to those of Linux 2.4.  IRIX has also a fcntl(2)
> +call to query appropriate alignments, and sizes.  FreeBSD 4.x introduced
> +a flag of the same name, but without alignment restrictions.
> +.LP
> +.B O_DIRECT
> +support was added under Linux in kernel version 2.4.10.
>  Older Linux kernels simply ignore this flag.
> -One may have to define the
> -.B _GNU_SOURCE
> -macro to get its definition.

I take it that you removed that last sentence because the information is
repeated elsewhere on the page?

> +Some filesystems may not implement the flag and
> +.B open
> +will fail with EINVAL if it is used.
> +.LP
> +Applications should avoid mixing
> +.B O_DIRECT
> +and normal I/O to the same
> +file, and especially to overlapping byte regions in the same file.
> +Even when the filesystem correctly handles the coherency issues in
> +this situation, overall I/O throughput is likely to be slower than
> +using either mode alone.  Likewise, applications should avoid mixing
> +.BR mmap (2)
> +of files with direct I/O to the same files.
> +.LP
> +The behaviour of
> +.B O_DIRECT
> +with NFS will differ from local filesystems.  Older kernels, or
> +kernels configured in certain ways, may not support this combination.
> +The NFS protocol does not support passing the flag to the server, so
> +.B O_DIRECT
> +I/O will only bypass the page cache on the client; the server may
> +still cache the I/O.  The client asks the server to make the I/O
> +synchronous to preserve the synchronous semantics of
> +.BR O_DIRECT .
> +Some servers will perform poorly under these circumstances, especially
> +if the I/O size is small.  Some servers may also be configured to
> +lie to clients about the I/O having reached stable storage; this
> +will avoid the performance penalty at some risk to data integrity
> +in the event of server power failure.  The Linux NFS client places
> +no alignment restrictions on
> +.B O_DIRECT
> +I/O.
> +.PP
> +In summary,
> +.B O_DIRECT
> +is a potentially powerful tool that should be used with caution.  It
> +is recommended that applications treat use of
> +.B O_DIRECT
> +as a performance option which is disabled by default.
>  .PP
>  There are many infelicities in the protocol underlying NFS, affecting
>  amongst others

I applied your patch, did some very light (formatting) edits to your
changes, and reorganized the NOTES section a little afterwards, so that the
O_DIRECT material stands in a subsection of its own.  Also, your new
material gives much better context to Linus's quote, so I relocated that
quote from BUGS into NOTES.

I also added your name to the list of copyright holders for the page, since
 you have added a substantial piece to the page.

The changes will be in man-pages-2.78.

Cheers,

Michael

-- 
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/
Want to report a man-pages bug?  Look here:
http://www.kernel.org/doc/man-pages/reporting_bugs.html
