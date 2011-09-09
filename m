From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] errno: add numbers to the errno-names
Date: Fri, 9 Sep 2011 16:34:52 +0200
Message-ID: <CAKgNAkgMoFBJKQhy_mnMuSsdm5TY2SSyoOW3iG70UaqSZeqRKQ@mail.gmail.com>
References: <1310591022-28752-1-git-send-email-w.sang@pengutronix.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1310591022-28752-1-git-send-email-w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Wolfram,

On Wed, Jul 13, 2011 at 11:03 PM, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> =
wrote:
> Kernel logs often print errnos as '%d', so having the numbers next to=
 the
> defined names in the man-page is convenient to find out what went wro=
ng.
> Also move the indentation from 16 to 21 to make the numbers fit.
>
> Signed-off-by: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>
> The errorcodes were inserted by a little awk-script which parsed the =
numbers
> directly out of the Kernel include-files.

Which Kernel include files? As I recall there is some variation in
errno codes across architectures.

Cheers,

Michael


>
> The script also noted the following not mentioned error-codes:
>
> ERFKILL (132) unused!
> EOWNERDEAD (130) unused!
> EHWPOISON (133) unused!
> ENOTRECOVERABLE (131) unused!
>
> =A0man3/errno.3 | =A0240 +++++++++++++++++++++++++++++---------------=
--------------
> =A01 files changed, 120 insertions(+), 120 deletions(-)
>
> diff --git a/man3/errno.3 b/man3/errno.3
> index af08aa7..32e7e36 100644
> --- a/man3/errno.3
> +++ b/man3/errno.3
> @@ -90,296 +90,296 @@ Some of these are marked
> =A0indicating that the name is defined by POSIX.1-2001, or
> =A0.IR C99 ,
> =A0indicating that the name is defined by C99.
> -.TP 16
> -.B E2BIG
> +.TP 21
> +.B E2BIG (7)
> =A0Argument list too long (POSIX.1)
> =A0.TP
> -.B EACCES
> +.B EACCES (13)
> =A0Permission denied (POSIX.1)
> =A0.TP
> -.B EADDRINUSE
> +.B EADDRINUSE (98)
> =A0Address already in use (POSIX.1)
> =A0.TP
> -.B EADDRNOTAVAIL
> +.B EADDRNOTAVAIL (99)
> =A0Address not available (POSIX.1)
> =A0.\" EADV is only an error on HURD(?)
> =A0.TP
> -.B EAFNOSUPPORT
> +.B EAFNOSUPPORT (97)
> =A0Address family not supported (POSIX.1)
> =A0.TP
> -.B EAGAIN
> +.B EAGAIN (11)
> =A0Resource temporarily unavailable (may be the same value as
> =A0.BR EWOULDBLOCK )
> =A0(POSIX.1)
> =A0.TP
> -.B EALREADY
> +.B EALREADY (114)
> =A0Connection already in progress (POSIX.1)
> =A0.TP
> -.B EBADE
> +.B EBADE (52)
> =A0Invalid exchange
> =A0.TP
> -.B EBADF
> +.B EBADF (9)
> =A0Bad file descriptor (POSIX.1)
> =A0.TP
> -.B EBADFD
> +.B EBADFD (77)
> =A0File descriptor in bad state
> =A0.TP
> -.B EBADMSG
> +.B EBADMSG (74)
> =A0Bad message (POSIX.1)
> =A0.TP
> -.B EBADR
> +.B EBADR (53)
> =A0Invalid request descriptor
> =A0.TP
> -.B EBADRQC
> +.B EBADRQC (56)
> =A0Invalid request code
> =A0.TP
> -.B EBADSLT
> +.B EBADSLT (57)
> =A0Invalid slot
> =A0.\" EBFONT is defined but appears not to be used by kernel or glib=
c.
> =A0.TP
> -.B EBUSY
> +.B EBUSY (16)
> =A0Device or resource busy (POSIX.1)
> =A0.TP
> -.B ECANCELED
> +.B ECANCELED (125)
> =A0Operation canceled (POSIX.1)
> =A0.TP
> -.B ECHILD
> +.B ECHILD (10)
> =A0No child processes (POSIX.1)
> =A0.TP
> -.B ECHRNG
> +.B ECHRNG (44)
> =A0Channel number out of range
> =A0.TP
> -.B ECOMM
> +.B ECOMM (70)
> =A0Communication error on send
> =A0.TP
> -.B ECONNABORTED
> +.B ECONNABORTED (103)
> =A0Connection aborted (POSIX.1)
> =A0.TP
> -.B ECONNREFUSED
> +.B ECONNREFUSED (111)
> =A0Connection refused (POSIX.1)
> =A0.TP
> -.B ECONNRESET
> +.B ECONNRESET (104)
> =A0Connection reset (POSIX.1)
> =A0.TP
> -.B EDEADLK
> +.B EDEADLK (35)
> =A0Resource deadlock avoided (POSIX.1)
> =A0.TP
> -.B EDEADLOCK
> +.B EDEADLOCK (35)
> =A0Synonym for
> =A0.B EDEADLK
> =A0.TP
> -.B EDESTADDRREQ
> +.B EDESTADDRREQ (89)
> =A0Destination address required (POSIX.1)
> =A0.TP
> -.B EDOM
> +.B EDOM (33)
> =A0Mathematics argument out of domain of function (POSIX.1, C99)
> =A0.\" EDOTDOT is defined but appears to be unused
> =A0.TP
> -.B EDQUOT
> +.B EDQUOT (122)
> =A0.\" POSIX just says "Reserved"
> =A0Disk quota exceeded (POSIX.1)
> =A0.TP
> -.B EEXIST
> +.B EEXIST (17)
> =A0File exists (POSIX.1)
> =A0.TP
> -.B EFAULT
> +.B EFAULT (14)
> =A0Bad address (POSIX.1)
> =A0.TP
> -.B EFBIG
> +.B EFBIG (27)
> =A0File too large (POSIX.1)
> =A0.TP
> -.B EHOSTDOWN
> +.B EHOSTDOWN (112)
> =A0Host is down
> =A0.TP
> -.B EHOSTUNREACH
> +.B EHOSTUNREACH (113)
> =A0Host is unreachable (POSIX.1)
> =A0.TP
> -.B EIDRM
> +.B EIDRM (43)
> =A0Identifier removed (POSIX.1)
> =A0.TP
> -.B EILSEQ
> +.B EILSEQ (84)
> =A0Illegal byte sequence (POSIX.1, C99)
> =A0.TP
> -.B EINPROGRESS
> +.B EINPROGRESS (115)
> =A0Operation in progress (POSIX.1)
> =A0.TP
> -.B EINTR
> +.B EINTR (4)
> =A0Interrupted function call (POSIX.1); see
> =A0.BR signal (7).
> =A0.TP
> -.B EINVAL
> +.B EINVAL (22)
> =A0Invalid argument (POSIX.1)
> =A0.TP
> -.B EIO
> +.B EIO (5)
> =A0Input/output error (POSIX.1)
> =A0.TP
> -.B EISCONN
> +.B EISCONN (106)
> =A0Socket is connected (POSIX.1)
> =A0.TP
> -.B EISDIR
> +.B EISDIR (21)
> =A0Is a directory (POSIX.1)
> =A0.TP
> -.B EISNAM
> +.B EISNAM (120)
> =A0Is a named type file
> =A0.TP
> -.B EKEYEXPIRED
> +.B EKEYEXPIRED (127)
> =A0Key has expired
> =A0.TP
> -.B EKEYREJECTED
> +.B EKEYREJECTED (129)
> =A0Key was rejected by service
> =A0.TP
> -.B EKEYREVOKED
> +.B EKEYREVOKED (128)
> =A0Key has been revoked
> =A0.TP
> -.B EL2HLT
> +.B EL2HLT (51)
> =A0Level 2 halted
> =A0.TP
> -.B EL2NSYNC
> +.B EL2NSYNC (45)
> =A0Level 2 not synchronized
> =A0.TP
> -.B EL3HLT
> +.B EL3HLT (46)
> =A0Level 3 halted
> =A0.TP
> -.B EL3RST
> +.B EL3RST (47)
> =A0Level 3 halted
> =A0.TP
> -.B ELIBACC
> +.B ELIBACC (79)
> =A0Cannot access a needed shared library
> =A0.TP
> -.B ELIBBAD
> +.B ELIBBAD (80)
> =A0Accessing a corrupted shared library
> =A0.TP
> -.B ELIBMAX
> +.B ELIBMAX (82)
> =A0Attempting to link in too many shared libraries
> =A0.TP
> -.B ELIBSCN
> +.B ELIBSCN (81)
> =A0lib section in a.out corrupted
> =A0.TP
> -.B ELIBEXEC
> +.B ELIBEXEC (83)
> =A0Cannot exec a shared library directly
> =A0.TP
> -.B ELOOP
> +.B ELOOP (40)
> =A0Too many levels of symbolic links (POSIX.1)
> =A0.\" ELNRNG is defined but appears to be unused
> =A0.TP
> -.B EMEDIUMTYPE
> +.B EMEDIUMTYPE (124)
> =A0Wrong medium type
> =A0.TP
> -.B EMFILE
> +.B EMFILE (24)
> =A0Too many open files (POSIX.1)
> =A0.TP
> -.B EMLINK
> +.B EMLINK (31)
> =A0Too many links (POSIX.1)
> =A0.TP
> -.B EMSGSIZE
> +.B EMSGSIZE (90)
> =A0Message too long (POSIX.1)
> =A0.TP
> -.B EMULTIHOP
> +.B EMULTIHOP (72)
> =A0.\" POSIX says "Reserved"
> =A0Multihop attempted (POSIX.1)
> =A0.TP
> -.B ENAMETOOLONG
> +.B ENAMETOOLONG (36)
> =A0Filename too long (POSIX.1)
> =A0.\" ENAVAIL is defined, but appears not to be used
> =A0.TP
> -.B ENETDOWN
> +.B ENETDOWN (100)
> =A0Network is down (POSIX.1)
> =A0.TP
> -.B ENETRESET
> +.B ENETRESET (102)
> =A0Connection aborted by network (POSIX.1)
> =A0.TP
> -.B ENETUNREACH
> +.B ENETUNREACH (101)
> =A0Network unreachable (POSIX.1)
> =A0.TP
> -.B ENFILE
> +.B ENFILE (23)
> =A0Too many open files in system (POSIX.1)
> =A0.\" ENOANO is defined but appears to be unused.
> =A0.TP
> -.B ENOBUFS
> +.B ENOBUFS (105)
> =A0No buffer space available (POSIX.1 (XSI STREAMS option))
> =A0.\" ENOCSI is defined but appears to be unused.
> =A0.TP
> -.B ENODATA
> +.B ENODATA (61)
> =A0No message is available on the STREAM head read queue (POSIX.1)
> =A0.TP
> -.B ENODEV
> +.B ENODEV (19)
> =A0No such device (POSIX.1)
> =A0.TP
> -.B ENOENT
> +.B ENOENT (2)
> =A0No such file or directory (POSIX.1)
> =A0.TP
> -.B ENOEXEC
> +.B ENOEXEC (8)
> =A0Exec format error (POSIX.1)
> =A0.TP
> -.B ENOKEY
> +.B ENOKEY (126)
> =A0Required key not available
> =A0.TP
> -.B ENOLCK
> +.B ENOLCK (37)
> =A0No locks available (POSIX.1)
> =A0.TP
> -.B ENOLINK
> +.B ENOLINK (67)
> =A0.\" POSIX says "Reserved"
> =A0Link has been severed (POSIX.1)
> =A0.TP
> -.B ENOMEDIUM
> +.B ENOMEDIUM (123)
> =A0No medium found
> =A0.TP
> -.B ENOMEM
> +.B ENOMEM (12)
> =A0Not enough space (POSIX.1)
> =A0.TP
> -.B ENOMSG
> +.B ENOMSG (42)
> =A0No message of the desired type (POSIX.1)
> =A0.TP
> -.B ENONET
> +.B ENONET (64)
> =A0Machine is not on the network
> =A0.TP
> -.B ENOPKG
> +.B ENOPKG (65)
> =A0Package not installed
> =A0.TP
> -.B ENOPROTOOPT
> +.B ENOPROTOOPT (92)
> =A0Protocol not available (POSIX.1)
> =A0.TP
> -.B ENOSPC
> +.B ENOSPC (28)
> =A0No space left on device (POSIX.1)
> =A0.TP
> -.B ENOSR
> +.B ENOSR (63)
> =A0No STREAM resources (POSIX.1 (XSI STREAMS option))
> =A0.TP
> -.B ENOSTR
> +.B ENOSTR (60)
> =A0Not a STREAM (POSIX.1 (XSI STREAMS option))
> =A0.TP
> -.B ENOSYS
> +.B ENOSYS (38)
> =A0Function not implemented (POSIX.1)
> =A0.TP
> -.B ENOTBLK
> +.B ENOTBLK (15)
> =A0Block device required
> =A0.TP
> -.B ENOTCONN
> +.B ENOTCONN (107)
> =A0The socket is not connected (POSIX.1)
> =A0.TP
> -.B ENOTDIR
> +.B ENOTDIR (20)
> =A0Not a directory (POSIX.1)
> =A0.TP
> -.B ENOTEMPTY
> +.B ENOTEMPTY (39)
> =A0Directory not empty (POSIX.1)
> =A0.\" ENOTNAM is defined but appears to be unused.
> =A0.TP
> -.B ENOTSOCK
> +.B ENOTSOCK (88)
> =A0Not a socket (POSIX.1)
> =A0.TP
> =A0.B ENOTSUP
> =A0Operation not supported (POSIX.1)
> =A0.TP
> -.B ENOTTY
> +.B ENOTTY (25)
> =A0Inappropriate I/O control operation (POSIX.1)
> =A0.TP
> -.B ENOTUNIQ
> +.B ENOTUNIQ (76)
> =A0Name not unique on network
> =A0.TP
> -.B ENXIO
> +.B ENXIO (6)
> =A0No such device or address (POSIX.1)
> =A0.TP
> -.B EOPNOTSUPP
> +.B EOPNOTSUPP (95)
> =A0Operation not supported on socket (POSIX.1)
> =A0.sp
> =A0.RB ( ENOTSUP
> @@ -388,67 +388,67 @@ and
> =A0have the same value on Linux, but
> =A0according to POSIX.1 these error values should be distinct.)
> =A0.TP
> -.B EOVERFLOW
> +.B EOVERFLOW (75)
> =A0Value too large to be stored in data type (POSIX.1)
> =A0.TP
> -.B EPERM
> +.B EPERM (1)
> =A0Operation not permitted (POSIX.1)
> =A0.TP
> -.B EPFNOSUPPORT
> +.B EPFNOSUPPORT (96)
> =A0Protocol family not supported
> =A0.TP
> -.B EPIPE
> +.B EPIPE (32)
> =A0Broken pipe (POSIX.1)
> =A0.TP
> -.B EPROTO
> +.B EPROTO (71)
> =A0Protocol error (POSIX.1)
> =A0.TP
> -.B EPROTONOSUPPORT
> +.B EPROTONOSUPPORT (93)
> =A0Protocol not supported (POSIX.1)
> =A0.TP
> -.B EPROTOTYPE
> +.B EPROTOTYPE (91)
> =A0Protocol wrong type for socket (POSIX.1)
> =A0.TP
> -.B ERANGE
> +.B ERANGE (34)
> =A0Result too large (POSIX.1, C99)
> =A0.TP
> -.B EREMCHG
> +.B EREMCHG (78)
> =A0Remote address changed
> =A0.TP
> -.B EREMOTE
> +.B EREMOTE (66)
> =A0Object is remote
> =A0.TP
> -.B EREMOTEIO
> +.B EREMOTEIO (121)
> =A0Remote I/O error
> =A0.TP
> -.B ERESTART
> +.B ERESTART (85)
> =A0Interrupted system call should be restarted
> =A0.TP
> -.B EROFS
> +.B EROFS (30)
> =A0Read-only file system (POSIX.1)
> =A0.TP
> -.B ESHUTDOWN
> +.B ESHUTDOWN (108)
> =A0Cannot send after transport endpoint shutdown
> =A0.TP
> -.B ESPIPE
> +.B ESPIPE (29)
> =A0Invalid seek (POSIX.1)
> =A0.TP
> -.B ESOCKTNOSUPPORT
> +.B ESOCKTNOSUPPORT (94)
> =A0Socket type not supported
> =A0.TP
> -.B ESRCH
> +.B ESRCH (3)
> =A0No such process (POSIX.1)
> =A0.\" ESRMNT is defined but appears not to be used
> =A0.TP
> -.B ESTALE
> +.B ESTALE (116)
> =A0Stale file handle (POSIX.1)
> =A0.sp
> =A0This error can occur for NFS and for other file systems
> =A0.TP
> -.B ESTRPIPE
> +.B ESTRPIPE (86)
> =A0Streams pipe error
> =A0.TP
> -.B ETIME
> +.B ETIME (62)
> =A0Timer expired
> =A0(POSIX.1 (XSI STREAMS option))
> =A0.sp
> @@ -456,31 +456,31 @@ Timer expired
> =A0.BR ioctl (2)
> =A0timeout")
> =A0.TP
> -.B ETIMEDOUT
> +.B ETIMEDOUT (110)
> =A0Connection timed out (POSIX.1)
> =A0.\" ETOOMANYREFS is defined, but appears not to be used.
> =A0.TP
> -.B ETXTBSY
> +.B ETXTBSY (26)
> =A0Text file busy (POSIX.1)
> =A0.TP
> -.B EUCLEAN
> +.B EUCLEAN (117)
> =A0Structure needs cleaning
> =A0.TP
> -.B EUNATCH
> +.B EUNATCH (49)
> =A0Protocol driver not attached
> =A0.TP
> -.B EUSERS
> +.B EUSERS (87)
> =A0Too many users
> =A0.TP
> -.B EWOULDBLOCK
> +.B EWOULDBLOCK (11)
> =A0Operation would block (may be same value as
> =A0.BR EAGAIN )
> =A0(POSIX.1)
> =A0.TP
> -.B EXDEV
> +.B EXDEV (18)
> =A0Improper link (POSIX.1)
> =A0.TP
> -.B EXFULL
> +.B EXFULL (54)
> =A0Exchange full
> =A0.SH NOTES
> =A0A common mistake is to do
> --
> 1.7.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
