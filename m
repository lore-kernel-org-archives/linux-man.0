From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] errno: add numbers to the errno-names
Date: Tue, 16 Aug 2011 14:45:58 +0200
Message-ID: <20110816124558.GE1953@pengutronix.de>
References: <1310591022-28752-1-git-send-email-w.sang@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h56sxpGKRmy85csR"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1310591022-28752-1-git-send-email-w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--h56sxpGKRmy85csR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2011 at 11:03:42PM +0200, Wolfram Sang wrote:

Any interest in this patch?

> Kernel logs often print errnos as '%d', so having the numbers next to the
> defined names in the man-page is convenient to find out what went wrong.
> Also move the indentation from 16 to 21 to make the numbers fit.
>=20
> Signed-off-by: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>=20
> The errorcodes were inserted by a little awk-script which parsed the numb=
ers
> directly out of the Kernel include-files.
>=20
> The script also noted the following not mentioned error-codes:
>=20
> ERFKILL (132) unused!
> EOWNERDEAD (130) unused!
> EHWPOISON (133) unused!
> ENOTRECOVERABLE (131) unused!
>=20
>  man3/errno.3 |  240 +++++++++++++++++++++++++++++-----------------------=
------
>  1 files changed, 120 insertions(+), 120 deletions(-)
>=20
> diff --git a/man3/errno.3 b/man3/errno.3
> index af08aa7..32e7e36 100644
> --- a/man3/errno.3
> +++ b/man3/errno.3
> @@ -90,296 +90,296 @@ Some of these are marked
>  indicating that the name is defined by POSIX.1-2001, or
>  .IR C99 ,
>  indicating that the name is defined by C99.
> -.TP 16
> -.B E2BIG
> +.TP 21
> +.B E2BIG (7)
>  Argument list too long (POSIX.1)
>  .TP
> -.B EACCES
> +.B EACCES (13)
>  Permission denied (POSIX.1)
>  .TP
> -.B EADDRINUSE
> +.B EADDRINUSE (98)
>  Address already in use (POSIX.1)
>  .TP
> -.B EADDRNOTAVAIL
> +.B EADDRNOTAVAIL (99)
>  Address not available (POSIX.1)
>  .\" EADV is only an error on HURD(?)
>  .TP
> -.B EAFNOSUPPORT
> +.B EAFNOSUPPORT (97)
>  Address family not supported (POSIX.1)
>  .TP
> -.B EAGAIN
> +.B EAGAIN (11)
>  Resource temporarily unavailable (may be the same value as
>  .BR EWOULDBLOCK )
>  (POSIX.1)
>  .TP
> -.B EALREADY
> +.B EALREADY (114)
>  Connection already in progress (POSIX.1)
>  .TP
> -.B EBADE
> +.B EBADE (52)
>  Invalid exchange
>  .TP
> -.B EBADF
> +.B EBADF (9)
>  Bad file descriptor (POSIX.1)
>  .TP
> -.B EBADFD
> +.B EBADFD (77)
>  File descriptor in bad state
>  .TP
> -.B EBADMSG
> +.B EBADMSG (74)
>  Bad message (POSIX.1)
>  .TP
> -.B EBADR
> +.B EBADR (53)
>  Invalid request descriptor
>  .TP
> -.B EBADRQC
> +.B EBADRQC (56)
>  Invalid request code
>  .TP
> -.B EBADSLT
> +.B EBADSLT (57)
>  Invalid slot
>  .\" EBFONT is defined but appears not to be used by kernel or glibc.
>  .TP
> -.B EBUSY
> +.B EBUSY (16)
>  Device or resource busy (POSIX.1)
>  .TP
> -.B ECANCELED
> +.B ECANCELED (125)
>  Operation canceled (POSIX.1)
>  .TP
> -.B ECHILD
> +.B ECHILD (10)
>  No child processes (POSIX.1)
>  .TP
> -.B ECHRNG
> +.B ECHRNG (44)
>  Channel number out of range
>  .TP
> -.B ECOMM
> +.B ECOMM (70)
>  Communication error on send
>  .TP
> -.B ECONNABORTED
> +.B ECONNABORTED (103)
>  Connection aborted (POSIX.1)
>  .TP
> -.B ECONNREFUSED
> +.B ECONNREFUSED (111)
>  Connection refused (POSIX.1)
>  .TP
> -.B ECONNRESET
> +.B ECONNRESET (104)
>  Connection reset (POSIX.1)
>  .TP
> -.B EDEADLK
> +.B EDEADLK (35)
>  Resource deadlock avoided (POSIX.1)
>  .TP
> -.B EDEADLOCK
> +.B EDEADLOCK (35)
>  Synonym for
>  .B EDEADLK
>  .TP
> -.B EDESTADDRREQ
> +.B EDESTADDRREQ (89)
>  Destination address required (POSIX.1)
>  .TP
> -.B EDOM
> +.B EDOM (33)
>  Mathematics argument out of domain of function (POSIX.1, C99)
>  .\" EDOTDOT is defined but appears to be unused
>  .TP
> -.B EDQUOT
> +.B EDQUOT (122)
>  .\" POSIX just says "Reserved"
>  Disk quota exceeded (POSIX.1)
>  .TP
> -.B EEXIST
> +.B EEXIST (17)
>  File exists (POSIX.1)
>  .TP
> -.B EFAULT
> +.B EFAULT (14)
>  Bad address (POSIX.1)
>  .TP
> -.B EFBIG
> +.B EFBIG (27)
>  File too large (POSIX.1)
>  .TP
> -.B EHOSTDOWN
> +.B EHOSTDOWN (112)
>  Host is down
>  .TP
> -.B EHOSTUNREACH
> +.B EHOSTUNREACH (113)
>  Host is unreachable (POSIX.1)
>  .TP
> -.B EIDRM
> +.B EIDRM (43)
>  Identifier removed (POSIX.1)
>  .TP
> -.B EILSEQ
> +.B EILSEQ (84)
>  Illegal byte sequence (POSIX.1, C99)
>  .TP
> -.B EINPROGRESS
> +.B EINPROGRESS (115)
>  Operation in progress (POSIX.1)
>  .TP
> -.B EINTR
> +.B EINTR (4)
>  Interrupted function call (POSIX.1); see
>  .BR signal (7).
>  .TP
> -.B EINVAL
> +.B EINVAL (22)
>  Invalid argument (POSIX.1)
>  .TP
> -.B EIO
> +.B EIO (5)
>  Input/output error (POSIX.1)
>  .TP
> -.B EISCONN
> +.B EISCONN (106)
>  Socket is connected (POSIX.1)
>  .TP
> -.B EISDIR
> +.B EISDIR (21)
>  Is a directory (POSIX.1)
>  .TP
> -.B EISNAM
> +.B EISNAM (120)
>  Is a named type file
>  .TP
> -.B EKEYEXPIRED
> +.B EKEYEXPIRED (127)
>  Key has expired
>  .TP
> -.B EKEYREJECTED
> +.B EKEYREJECTED (129)
>  Key was rejected by service
>  .TP
> -.B EKEYREVOKED
> +.B EKEYREVOKED (128)
>  Key has been revoked
>  .TP
> -.B EL2HLT
> +.B EL2HLT (51)
>  Level 2 halted
>  .TP
> -.B EL2NSYNC
> +.B EL2NSYNC (45)
>  Level 2 not synchronized
>  .TP
> -.B EL3HLT
> +.B EL3HLT (46)
>  Level 3 halted
>  .TP
> -.B EL3RST
> +.B EL3RST (47)
>  Level 3 halted
>  .TP
> -.B ELIBACC
> +.B ELIBACC (79)
>  Cannot access a needed shared library
>  .TP
> -.B ELIBBAD
> +.B ELIBBAD (80)
>  Accessing a corrupted shared library
>  .TP
> -.B ELIBMAX
> +.B ELIBMAX (82)
>  Attempting to link in too many shared libraries
>  .TP
> -.B ELIBSCN
> +.B ELIBSCN (81)
>  lib section in a.out corrupted
>  .TP
> -.B ELIBEXEC
> +.B ELIBEXEC (83)
>  Cannot exec a shared library directly
>  .TP
> -.B ELOOP
> +.B ELOOP (40)
>  Too many levels of symbolic links (POSIX.1)
>  .\" ELNRNG is defined but appears to be unused
>  .TP
> -.B EMEDIUMTYPE
> +.B EMEDIUMTYPE (124)
>  Wrong medium type
>  .TP
> -.B EMFILE
> +.B EMFILE (24)
>  Too many open files (POSIX.1)
>  .TP
> -.B EMLINK
> +.B EMLINK (31)
>  Too many links (POSIX.1)
>  .TP
> -.B EMSGSIZE
> +.B EMSGSIZE (90)
>  Message too long (POSIX.1)
>  .TP
> -.B EMULTIHOP
> +.B EMULTIHOP (72)
>  .\" POSIX says "Reserved"
>  Multihop attempted (POSIX.1)
>  .TP
> -.B ENAMETOOLONG
> +.B ENAMETOOLONG (36)
>  Filename too long (POSIX.1)
>  .\" ENAVAIL is defined, but appears not to be used
>  .TP
> -.B ENETDOWN
> +.B ENETDOWN (100)
>  Network is down (POSIX.1)
>  .TP
> -.B ENETRESET
> +.B ENETRESET (102)
>  Connection aborted by network (POSIX.1)
>  .TP
> -.B ENETUNREACH
> +.B ENETUNREACH (101)
>  Network unreachable (POSIX.1)
>  .TP
> -.B ENFILE
> +.B ENFILE (23)
>  Too many open files in system (POSIX.1)
>  .\" ENOANO is defined but appears to be unused.
>  .TP
> -.B ENOBUFS
> +.B ENOBUFS (105)
>  No buffer space available (POSIX.1 (XSI STREAMS option))
>  .\" ENOCSI is defined but appears to be unused.
>  .TP
> -.B ENODATA
> +.B ENODATA (61)
>  No message is available on the STREAM head read queue (POSIX.1)
>  .TP
> -.B ENODEV
> +.B ENODEV (19)
>  No such device (POSIX.1)
>  .TP
> -.B ENOENT
> +.B ENOENT (2)
>  No such file or directory (POSIX.1)
>  .TP
> -.B ENOEXEC
> +.B ENOEXEC (8)
>  Exec format error (POSIX.1)
>  .TP
> -.B ENOKEY
> +.B ENOKEY (126)
>  Required key not available
>  .TP
> -.B ENOLCK
> +.B ENOLCK (37)
>  No locks available (POSIX.1)
>  .TP
> -.B ENOLINK
> +.B ENOLINK (67)
>  .\" POSIX says "Reserved"
>  Link has been severed (POSIX.1)
>  .TP
> -.B ENOMEDIUM
> +.B ENOMEDIUM (123)
>  No medium found
>  .TP
> -.B ENOMEM
> +.B ENOMEM (12)
>  Not enough space (POSIX.1)
>  .TP
> -.B ENOMSG
> +.B ENOMSG (42)
>  No message of the desired type (POSIX.1)
>  .TP
> -.B ENONET
> +.B ENONET (64)
>  Machine is not on the network
>  .TP
> -.B ENOPKG
> +.B ENOPKG (65)
>  Package not installed
>  .TP
> -.B ENOPROTOOPT
> +.B ENOPROTOOPT (92)
>  Protocol not available (POSIX.1)
>  .TP
> -.B ENOSPC
> +.B ENOSPC (28)
>  No space left on device (POSIX.1)
>  .TP
> -.B ENOSR
> +.B ENOSR (63)
>  No STREAM resources (POSIX.1 (XSI STREAMS option))
>  .TP
> -.B ENOSTR
> +.B ENOSTR (60)
>  Not a STREAM (POSIX.1 (XSI STREAMS option))
>  .TP
> -.B ENOSYS
> +.B ENOSYS (38)
>  Function not implemented (POSIX.1)
>  .TP
> -.B ENOTBLK
> +.B ENOTBLK (15)
>  Block device required
>  .TP
> -.B ENOTCONN
> +.B ENOTCONN (107)
>  The socket is not connected (POSIX.1)
>  .TP
> -.B ENOTDIR
> +.B ENOTDIR (20)
>  Not a directory (POSIX.1)
>  .TP
> -.B ENOTEMPTY
> +.B ENOTEMPTY (39)
>  Directory not empty (POSIX.1)
>  .\" ENOTNAM is defined but appears to be unused.
>  .TP
> -.B ENOTSOCK
> +.B ENOTSOCK (88)
>  Not a socket (POSIX.1)
>  .TP
>  .B ENOTSUP
>  Operation not supported (POSIX.1)
>  .TP
> -.B ENOTTY
> +.B ENOTTY (25)
>  Inappropriate I/O control operation (POSIX.1)
>  .TP
> -.B ENOTUNIQ
> +.B ENOTUNIQ (76)
>  Name not unique on network
>  .TP
> -.B ENXIO
> +.B ENXIO (6)
>  No such device or address (POSIX.1)
>  .TP
> -.B EOPNOTSUPP
> +.B EOPNOTSUPP (95)
>  Operation not supported on socket (POSIX.1)
>  .sp
>  .RB ( ENOTSUP
> @@ -388,67 +388,67 @@ and
>  have the same value on Linux, but
>  according to POSIX.1 these error values should be distinct.)
>  .TP
> -.B EOVERFLOW
> +.B EOVERFLOW (75)
>  Value too large to be stored in data type (POSIX.1)
>  .TP
> -.B EPERM
> +.B EPERM (1)
>  Operation not permitted (POSIX.1)
>  .TP
> -.B EPFNOSUPPORT
> +.B EPFNOSUPPORT (96)
>  Protocol family not supported
>  .TP
> -.B EPIPE
> +.B EPIPE (32)
>  Broken pipe (POSIX.1)
>  .TP
> -.B EPROTO
> +.B EPROTO (71)
>  Protocol error (POSIX.1)
>  .TP
> -.B EPROTONOSUPPORT
> +.B EPROTONOSUPPORT (93)
>  Protocol not supported (POSIX.1)
>  .TP
> -.B EPROTOTYPE
> +.B EPROTOTYPE (91)
>  Protocol wrong type for socket (POSIX.1)
>  .TP
> -.B ERANGE
> +.B ERANGE (34)
>  Result too large (POSIX.1, C99)
>  .TP
> -.B EREMCHG
> +.B EREMCHG (78)
>  Remote address changed
>  .TP
> -.B EREMOTE
> +.B EREMOTE (66)
>  Object is remote
>  .TP
> -.B EREMOTEIO
> +.B EREMOTEIO (121)
>  Remote I/O error
>  .TP
> -.B ERESTART
> +.B ERESTART (85)
>  Interrupted system call should be restarted
>  .TP
> -.B EROFS
> +.B EROFS (30)
>  Read-only file system (POSIX.1)
>  .TP
> -.B ESHUTDOWN
> +.B ESHUTDOWN (108)
>  Cannot send after transport endpoint shutdown
>  .TP
> -.B ESPIPE
> +.B ESPIPE (29)
>  Invalid seek (POSIX.1)
>  .TP
> -.B ESOCKTNOSUPPORT
> +.B ESOCKTNOSUPPORT (94)
>  Socket type not supported
>  .TP
> -.B ESRCH
> +.B ESRCH (3)
>  No such process (POSIX.1)
>  .\" ESRMNT is defined but appears not to be used
>  .TP
> -.B ESTALE
> +.B ESTALE (116)
>  Stale file handle (POSIX.1)
>  .sp
>  This error can occur for NFS and for other file systems
>  .TP
> -.B ESTRPIPE
> +.B ESTRPIPE (86)
>  Streams pipe error
>  .TP
> -.B ETIME
> +.B ETIME (62)
>  Timer expired
>  (POSIX.1 (XSI STREAMS option))
>  .sp
> @@ -456,31 +456,31 @@ Timer expired
>  .BR ioctl (2)
>  timeout")
>  .TP
> -.B ETIMEDOUT
> +.B ETIMEDOUT (110)
>  Connection timed out (POSIX.1)
>  .\" ETOOMANYREFS is defined, but appears not to be used.
>  .TP
> -.B ETXTBSY
> +.B ETXTBSY (26)
>  Text file busy (POSIX.1)
>  .TP
> -.B EUCLEAN
> +.B EUCLEAN (117)
>  Structure needs cleaning
>  .TP
> -.B EUNATCH
> +.B EUNATCH (49)
>  Protocol driver not attached
>  .TP
> -.B EUSERS
> +.B EUSERS (87)
>  Too many users
>  .TP
> -.B EWOULDBLOCK
> +.B EWOULDBLOCK (11)
>  Operation would block (may be same value as
>  .BR EAGAIN )
>  (POSIX.1)
>  .TP
> -.B EXDEV
> +.B EXDEV (18)
>  Improper link (POSIX.1)
>  .TP
> -.B EXFULL
> +.B EXFULL (54)
>  Exchange full
>  .SH NOTES
>  A common mistake is to do
> --=20
> 1.7.2.5
>=20

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--h56sxpGKRmy85csR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk5KZoYACgkQD27XaX1/VRtweACeJge4Rz0WBlfIqSBbwYWrp3qs
0jQAn2xla+iaEnSkWfR1OYvfjAzXL4JF
=bmv2
-----END PGP SIGNATURE-----

--h56sxpGKRmy85csR--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
