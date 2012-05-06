From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch], stat(2): One table too wide for line length; use text blocks
Date: Mon, 7 May 2012 09:10:34 +1200
Message-ID: <CAKgNAkg6WstpqpBuumGmhmq0gQyjXcUg2DWWzDnr8Kcq9T=Aug@mail.gmail.com>
References: <20120506200619.GA1037@rhi.hi.is>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120506200619.GA1037-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Bjarni,

On Mon, May 7, 2012 at 8:06 AM, Bjarni Ingi Gislason <bjarniig-2945IVfuVpc@public.gmane.org=
s> wrote:
> Package: man-pages
> Version: 3.40
> Severity: minor
> Tags: patch
>
> =A0From "groff -ww" (or "man --warnings=3Dw ..."):
>
> warning: around line 442: table wider than line width
>
> =A0GNU man uses line length of 78.
>
> =A0Use text blocks. =A0Two spaces between sentences or better: start
> each sentence in a new line.
>
> =A0Patch:

I applied, with the addition of
=2Ead l
=2Ead j
around the table.

Thanks!

Michael


> --- stat.2 =A0 =A0 =A02012-04-26 22:58:36.000000000 +0000
> +++ stat.2.new =A02012-05-06 02:10:05.000000000 +0000
> @@ -239,10 +239,10 @@
> =A0FIFO (named pipe)?
> =A0.TP
> =A0.BR S_ISLNK (m)
> -symbolic link? (Not in POSIX.1-1996.)
> +symbolic link? =A0(Not in POSIX.1-1996.)
> =A0.TP
> =A0.BR S_ISSOCK (m)
> -socket? (Not in POSIX.1-1996.)
> +socket? =A0(Not in POSIX.1-1996.)
> =A0.RE
> =A0.PP
> =A0The following flags are defined for the
> @@ -438,16 +438,18 @@
> =A0l l l l l.
> =A0hex =A0 =A0name =A0 =A0ls =A0 =A0 =A0octal =A0 description
> =A0f000 =A0 S_IFMT =A0 =A0 =A0 =A0 =A0170000 =A0mask for file type
> -0000 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 000000 =A0SCO out-of-servic=
e inode; BSD unknown
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 type; S=
VID-v2 and XPG2 have both
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0 and 0=
100000 for ordinary file
> +0000 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 000000 =A0T{
> +SCO out-of-service inode; BSD unknown type; SVID-v2 and XPG2
> +have both 0 and 0100000 for ordinary file
> +T}
> =A01000 =A0 S_IFIFO p| =A0 =A0 =A0010000 =A0FIFO (named pipe)
> =A02000 =A0 S_IFCHR c =A0 =A0 =A0 020000 =A0character special (V7)
> =A03000 =A0 S_IFMPC =A0 =A0 =A0 =A0 030000 =A0multiplexed character s=
pecial (V7)
> =A04000 =A0 S_IFDIR d/ =A0 =A0 =A0040000 =A0directory (V7)
> -5000 =A0 S_IFNAM =A0 =A0 =A0 =A0 050000 =A0XENIX named special file
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 with tw=
o subtypes, distinguished by
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \fIst_r=
dev\fP values 1, 2
> +5000 =A0 S_IFNAM =A0 =A0 =A0 =A0 050000 =A0T{
> +XENIX named special file with two subtypes, distinguished by
> +\fIst_rdev\fP values 1, 2
> +T}
> =A00001 =A0 S_INSEM s =A0 =A0 =A0 000001 =A0XENIX semaphore subtype o=
f IFNAM
> =A00002 =A0 S_INSHD m =A0 =A0 =A0 000002 =A0XENIX shared data subtype=
 of IFNAM
> =A06000 =A0 S_IFBLK b =A0 =A0 =A0 060000 =A0block special (V7)
> @@ -456,26 +458,33 @@
> =A09000 =A0 S_IFCMP =A0 =A0 =A0 =A0 110000 =A0VxFS compressed
> =A09000 =A0 S_IFNWK n =A0 =A0 =A0 110000 =A0network special (HP-UX)
> =A0a000 =A0 S_IFLNK l@ =A0 =A0 =A0120000 =A0symbolic link (BSD)
> -b000 =A0 S_IFSHAD =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0130000 =A0Solaris s=
hadow inode for ACL
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (not se=
en by userspace)
> +b000 =A0 S_IFSHAD =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0130000 =A0T{
> +Solaris shadow inode for ACL (not seen by userspace)
> +T}
> =A0c000 =A0 S_IFSOCK =A0 =A0 =A0 =A0s=3D =A0 =A0 =A0140000 =A0socket =
(BSD; also "S_IFSOC" on VxFS)
> =A0d000 =A0 S_IFDOOR =A0 =A0 =A0 =A0D> =A0 =A0 =A0150000 =A0Solaris d=
oor
> =A0e000 =A0 S_IFWHT w% =A0 =A0 =A0160000 =A0BSD whiteout (not used fo=
r inode)
> -0200 =A0 S_ISVTX =A0 =A0 =A0 =A0 001000 =A0sticky bit: save swapped =
text even
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 after u=
se (V7)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reserve=
d (SVID-v2)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 On nond=
irectories: don't cache this
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file (S=
unOS)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 On dire=
ctories: restricted deletion
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 flag (S=
VID-v4.2)
> -0400 =A0 S_ISGID =A0 =A0 =A0 =A0 002000 =A0set-group-ID on execution=
 (V7)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for dir=
ectories: use BSD semantics for
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 propaga=
tion of GID
> -0400 =A0 S_ENFMT =A0 =A0 =A0 =A0 002000 =A0System V file locking enf=
orcement (shared
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 with S_=
ISGID)
> +0200 =A0 S_ISVTX =A0 =A0 =A0 =A0 001000 =A0T{
> +sticky bit: save swapped text even after use (V7)
> +.br
> +reserved (SVID-v2)
> +.br
> +On nondirectories: don't cache this file (SunOS)
> +.br
> +On directories: restricted deletion flag (SVID-v4.2)
> +T}
> +0400 =A0 S_ISGID =A0 =A0 =A0 =A0 002000 =A0T{
> +set-group-ID on execution (V7)
> +.br
> +for directories: use BSD semantics for propagation of GID
> +T}
> +0400 =A0 S_ENFMT =A0 =A0 =A0 =A0 002000 =A0T{
> +System V file locking enforcement (shared with S_ISGID)
> +T}
> =A00800 =A0 S_ISUID =A0 =A0 =A0 =A0 004000 =A0set-user-ID on executio=
n (V7)
> -0800 =A0 S_CDF =A0 =A0 =A0 =A0 =A0 004000 =A0directory is a context =
dependent
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file (H=
P-UX)
> +0800 =A0 S_CDF =A0 =A0 =A0 =A0 =A0 004000 =A0T{
> +directory is a context dependent file (HP-UX)
> +T}
> =A0.TE
>
> =A0A sticky command appeared in Version 32V AT&T UNIX.
>
> --
> Bjarni I. Gislason



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
