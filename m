From: Michael Kerrisk <mtk.manpages@gmail.com>
Subject: Re: [PATCH] fallocate.2: add FALLOC_FL_PUNCH_HOLE flag definition
Date: Mon, 19 Sep 2011 07:08:17 +0200
Message-ID: <CAKgNAkj-jPR-9hyuxrJ74uu3Kdv9bATrfCUedoty4dJOCh2GcA@mail.gmail.com>
References: <1289840876-3546-1-git-send-email-josef@redhat.com>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1289840876-3546-1-git-send-email-josef@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Josef Bacik <josef@redhat.com>
Cc: linux-man@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Lucian Adrian Grijincu <lucian.grijincu@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>, Dave Chinner <dchinner@redhat.com>
List-Id: linux-man@vger.kernel.org

Hi Josef (Dave C, please also note comments below),

On Mon, Nov 15, 2010 at 6:07 PM, Josef Bacik <josef@redhat.com> wrote:
> This patch adds the relevant documenation for using fallocate with th=
e
> FALLOC_FL_PUNCH_HOLE mode. =A0This information comes from the impleme=
ntation of
> FALLOC_FL_PUNCH_HOLE that I've posted along with this man page update=
 to outline
> the definition for hole punching. =A0Obviously this patch is dependan=
t upon the
> current implementation being accepted. =A0Thanks,
>
> Signed-off-by: Josef Bacik <josef@redhat.com>
> ---
> =A0man2/fallocate.2 | =A0 15 ++++++++++++---
> =A01 files changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/man2/fallocate.2 b/man2/fallocate.2
> index 42eefbd..1b28916 100644
> --- a/man2/fallocate.2
> +++ b/man2/fallocate.2
> @@ -31,9 +31,8 @@ bytes.
>
> =A0The
> =A0.I mode
> -argument determines the operation to be performed on the given range=
=2E
> -Currently only one flag is supported for
> -.IR mode :
> +argument determines the operation to be performed on the given range=
, the
> +value can be one of the following:
> =A0.TP
> =A0.B FALLOC_FL_KEEP_SIZE
> =A0This flag allocates and initializes to zero the disk space
> @@ -50,6 +49,16 @@ the file size (as reported by
> =A0.BR stat (2))
> =A0even if it is less than
> =A0.IR offset + len .
> +.TP
> +.B FALLOC_FL_PUNCH_HOLE
> +This flag de-allocates the disk space within the range specified by
> +.I offset
> +and
> +.IR len .
> +This call preserves the file size (as reported by
> +.BR stat (2)),
> +the only change will be to the amount of space used by the file. =A0=
After a
> +successful call, subsequent reads from this range will return 0's.
> =A0.\"
> =A0.\" Note from Amit Arora:
> =A0.\" There were few more flags which were discussed, but none of
> --
> 1.6.6.1

Thanks for this patch. As noted in another mail, Lucian also sent a
patch for FALLOC_FL_PUNCH_HOLE, and I applied his patch first, and
then added some pieces from yours, as well as some of my own edits.

However, the addition of a second class of operation to the man page
made it clear that some significant restructuring of the page is
required. So I substantially reworked the page, including the
preexisting material on the default "file allocation" operation (Dave
C please note).

Josef, Lucian, could I ask you to check ("man -l <file>") the final
text (below) for FALLOC_FL_PUNCH_HOLE (including the EPERM error under
ERRORS)?

Dave, could I ask you to review my reworked text for the "Allocating
disk space" subsection?

Thanks,

Michael

=2E\" Copyright (c) 2007 Silicon Graphics, Inc. All Rights Reserved
=2E\" Written by Dave Chinner <dgc@sgi.com>
=2E\" May be distributed as per GNU General Public License version 2.
=2E\"
=2E\" 2011-09-19: Added FALLOC_FL_PUNCH_HOLE
=2E\" 2011-09-19: Substantial restructuring of the page
=2E\"
=2ETH FALLOCATE 2 2011-09-19 "Linux" "Linux Programmer's Manual"
=2ESH NAME
fallocate \- manipulate file space
=2ESH SYNOPSIS
=2Enf
=2EBR "#define _GNU_SOURCE" "             /* See feature_test_macros(7)=
 */"
=2EB #include <fcntl.h>

=2EBI "int fallocate(int " fd ", int " mode ", off_t " offset \
", off_t " len ");
=2Efi
=2ESH DESCRIPTION
This is a nonportable, Linux-specific system call.
=46or the portable, POSIX.1-specified method of ensuring that space
is allocated for a file, see
=2EBR posix_fallocate (3).

=2EBR fallocate ()
allows the caller to directly manipulate the allocated disk space
for the file referred to by
=2EI fd
for the byte range starting at
=2EI offset
and continuing for
=2EI len
bytes.

The
=2EI mode
argument determines the operation to be performed on the given range.
Details of the supported operations are given in the subsections below.
=2ESS Allocating disk space
The default operation (i.e.,
=2EI mode
is zero) of
=2EBR fallocate ()
allocates and initializes to zero the disk space
within the range specified by
=2EI offset
and
=2EIR len .
The file size (as reported by
=2EBR stat (2))
will be changed if
=2EI "offset + len"
is greater than the file size.
This default behavior closely resembles the behavior of the
=2EBR posix_fallocate (3)
library function,
and is intended as a method of optimally implementing that function.

After a successful call, subsequent writes into the range specified by
=2EIR offset
and
=2EIR len
are guaranteed not to fail because of lack of disk space.

If the
=2EB FALLOC_FL_KEEP_SIZE
flag is specified in
=2EIR mode ,
the behavior of the call is similar,
but the file size will not be changed even if
=2EI "offset + len"
is greater than the file size.
Preallocating zeroed blocks beyond the end of the file in this manner
is useful for optimizing append workloads.
=2EPP
Because allocation is done in block size chunks,
=2EBR fallocate ()
may allocate a larger range of disk space than was specified.
=2ESS Deallocating file space
Specifying the
=2EBR FALLOC_FL_PUNCH_HOLE
flag (available since Linux 2.6.38) in
=2EI mode
deallocates space (i.e., creates a hole)
in the byte range starting at
=2EI offset
and continuing for
=2EI len
bytes.
Within the specified range, partial file system blocks are zeroed,
and whole file system blocks are removed from the file.
After a successful call,
subsequent reads from this range will return zeroes.

The
=2EBR FALLOC_FL_PUNCH_HOLE
flag must be ORed with
=2EBR FALLOC_FL_KEEP_SIZE
in
=2EIR mode ;
in other words, even when punching off the end of the file, the file si=
ze
(as reported by
=2EBR stat (2))
does not change.

Not all file systems support
=2EBR FALLOC_FL_PUNCH_HOLE ;
if a file system doesn't support the operation, an error is returned.
=2ESH RETURN VALUE
=2EBR fallocate ()
returns zero on success, and \-1 on failure.
=2ESH ERRORS
=2ETP
=2EB EBADF
=2EI fd
is not a valid file descriptor, or is not opened for writing.
=2ETP
=2EB EFBIG
=2EIR offset + len
exceeds the maximum file size.
=2ETP
=2EB EINTR
A signal was caught during execution.
=2ETP
=2EB EINVAL
=2EI offset
was less than 0, or
=2EI len
was less than or equal to 0.
=2ETP
=2EB EIO
An I/O error occurred while reading from or writing to a file system.
=2ETP
=2EB ENODEV
=2EI fd
does not refer to a regular file or a directory.
(If
=2EI fd
is a pipe or FIFO, a different error results.)
=2ETP
=2EB ENOSPC
There is not enough space left on the device containing the file
referred to by
=2EIR fd .
=2ETP
=2EB ENOSYS
The file system containing the file referred to by
=2EI fd
does not support this operation.
=2ETP
=2EB EOPNOTSUPP
The
=2EI mode
is not supported by the file system containing the file referred to by
=2EIR fd .
=2ETP
=2EB EPERM
The file referred to by
=2EI fd
is marked immutable (see
=2EBR chattr (1)).
Or:
=2EI mode
specifies
=2EBR FALLOC_FL_PUNCH_HOLE
and
the file referred to by
=2EI fd
is marked append-only
(see
=2EBR chattr (1)).
=2ETP
=2EB ESPIPE
=2EI fd
refers to a pipe of FIFO.
=2ESH VERSIONS
=2EBR fallocate ()
is available on Linux since kernel 2.6.23.
Support is provided by glibc since version 2.10.
=2ESH CONFORMING TO
=2EBR fallocate ()
is Linux-specific.
=2ESH SEE ALSO
=2EBR ftruncate (2),
=2EBR posix_fadvise (3),
=2EBR posix_fallocate (3)

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
