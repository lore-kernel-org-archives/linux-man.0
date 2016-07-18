From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-4.07 released
Date: Mon, 18 Jul 2016 08:46:54 +0200
Message-ID: <a643dd89-8e43-9eb6-781b-ddd83c107308@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

     man-pages-4.07 - man pages for Linux

This release includes input and contributions from
around 50 people. Over 140 pages saw changes, ranging
from typo fixes through to page rewrites and 4 newly
created pages.

Tarball download:
     http://www.kernel.org/doc/man-pages/download.html
Git repository:
     https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
     http://man7.org/linux/man-pages/changelog.html#release_4.07

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2016/07/man-pages-407-is-released.h=
tml

The current version of the pages is browsable at:
http://man7.org/linux/man-pages/

You are receiving this message either because:

a) You contributed to the content of this release.

b) You are subscribed to linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org or
libc-alpha-9JcytcrH/bBqeNgBaj97IQ@public.gmane.org

c) I have information (possibly inaccurate) that you are the maintainer
of a translation of the manual pages, or are the maintainer of the
manual pages set in a particular distribution, or have expressed
interest in helping with man-pages maintenance, or have otherwise
expressed interest in being notified about man-pages releases.
If you don't want to receive such messages from me, or you know of
some other translator or maintainer who may want to receive such
notifications, send me a message.

Cheers,

Michael

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Changes in=
 man-pages-4.07 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2016-07-17, Ulm


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Alec Leamas <leamas.alec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Andrey Vagin <avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Carsten Grohmann <carstengrohmann-Mmb7MZpHnFY@public.gmane.org>
Chris Gassib <position0x45-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Darrick J. Wong <darrick.wong-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
=C3=89lie Bouttier <elie-Sg7ocfseCdfsq35pWSNszA@public.gmane.org>
Eric Biggers <ebiggers3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Eric W. Biederman <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
=46lorian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
H=C3=A5kon Sandsmark <hsandsma-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Iustin Pop <iustin-JC6qDa14zzLYtjvyW6yDsg@public.gmane.org>
Jacob Willoughby <jacob-FYK0AvAIAVI7cdpDWioORw@public.gmane.org>
Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
James H Cownie <james.h.cownie-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
John Wiersba <jrw32982-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
J=C3=B6rn Engel <joern-BHEL68pLQRGGvPXPguhicg@public.gmane.org>
Josh Triplett <josh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Kai M=C3=A4kisara <kai.makisara-9Aww8k/80nUxHbG02/KK1g@public.gmane.org>
Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Li Peng <lip-2axScPvBUlJBDgjK7y7TUQ@public.gmane.org>
Marko Kevac <marko-+omovHKzcgHYtjvyW6yDsg@public.gmane.org>
Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Micha=C5=82 Zegan <webczat_200-wo4oW1Pw1HF3vZ0LZ0W7Rg@public.gmane.org>
Miklos Szeredi <mszeredi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Mitch Walker <mitch-mA1pf0pi6YpWk0Htik3J/w@public.gmane.org>
Neven Sajko <nsajko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Omar Sandoval <osandov-b10kYP2dOMg@public.gmane.org>
Ori Avtalion <ori-prZfzsrDuP2LwutG50LtGA@public.gmane.org>
Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Robin Kuzmin <kuzmin.robin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Stephen Smalley <sds-+05T5uksL2qpZYMLLGbcSA@public.gmane.org>
Szabolcs Nagy <szabolcs.nagy-5wv7dgnIgG8@public.gmane.org>
Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Tobias Stoeckmann <tobias-te0W2B6tFQkGQOE+iOL5gA@public.gmane.org>
Tom Callaway <tcallawa-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Tom Gundersen <teg-B22kvLQNl6c@public.gmane.org>
Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
W. Trevor King <wking-vJI2gpByivqcqzYg7KEe8g@public.gmane.org>
"Yuming Ma(=E9=A9=AC=E7=8E=89=E6=98=8E)" <mayuming-2SarAXORi/o@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

ioctl_fideduperange.2
     Darrick J. Wong  [Christoph Hellwig, Michael Kerrisk]
         New page documenting the FIDEDUPERANGE ioctl
             Document the FIDEDUPERANGE ioctl, formerly known as
             BTRFS_IOC_EXTENT_SAME.

ioctl_ficlonerange.2
     Darrick J. Wong  [Christoph Hellwig, Michael Kerrisk]
         New page documenting FICLONE and FICLONERANGE ioctls
             Document the FICLONE and FICLONERANGE ioctls, formerly kno=
wn as
             the BTRFS_IOC_CLONE and BTRFS_IOC_CLONE_RANGE ioctls.

nextup.3
     Michael Kerrisk
         New page documenting nextup(), nextdown(), and related functio=
ns

mount_namespaces.7
     Michael Kerrisk  [Michael Kerrisk]
         New page describing mount namespaces


Newly documented interfaces in existing pages
---------------------------------------------

mount.2
     Michael Kerrisk
         Document flags used to set propagation type
             Document MS_SHARED, MS_PRIVATE, MS_SLAVE, and MS_UNBINDABL=
E.
     Michael Kerrisk
         Document the MS_REC flag

ptrace.2
     Michael Kerrisk  [Kees Cook, Jann Horn, Eric W. Biederman, Stephen=
 Smalley]
         Document ptrace access modes

proc.5
     Michael Kerrisk
         Document /proc/[pid]/timerslack_ns
     Michael Kerrisk
         Document /proc/PID/status 'Ngid' field
     Michael Kerrisk
         Document /proc/PID/status fields: 'NStgid', 'NSpid', 'NSpgid',=
 'NSsid'
     Michael Kerrisk
         Document /proc/PID/status 'Umask' field


New and changed links
---------------------

preadv2.2
pwritev2.2
     Michael Kerrisk
         New links to readv(2)

nextdown.3
nextdownf.3
nextdownl.3
nextupf.3
nextupl.3
     Michael Kerrisk
         New links to nextup(3)


Changes to individual pages
---------------------------

ldd.1
     Michael Kerrisk
         Add a little more detail on why ldd is unsafe with untrusted e=
xecutables
     Michael Kerrisk
         Add more detail on the output of ldd

localedef.1
     Marko Myllynen
         Drop --old-style description
             The glibc upstream decided to drop localedef(1) --old-styl=
e
             option [1] altogether, I think we can do the same with
             localedef(1), the option hasn't done anything in over 16
             years and I doubt anyone uses it.

add_key.2
     Mitch Walker
         Empty payloads are not allowed in user-defined keys

chroot.2
     Michael Kerrisk
         SEE ALSO: add pivot_root(2)

clone.2
     Michael Kerrisk
         Add reference to mount_namespaces(7) under CLONE_NEWNS descrip=
tion

fork.2
     Michael Kerrisk
         Add ENOMEM error for PID namespace where "init" has died

futex.2
     Michael Kerrisk
         Correct an ENOSYS error description
             Since Linux 4.5, FUTEX_CLOCK_REALTIME is allowed with FUTE=
X_WAIT.
     Michael Kerrisk  [Darren Hart]
         Remove crufty text about FUTEX_WAIT_BITSET interpretation of t=
imeout
             Since Linux 4.5, FUTEX_WAIT also understands
             FUTEX_CLOCK_REALTIME.
     Michael Kerrisk  [Thomas Gleixner]
         Explain how to get equivalent of FUTEX_WAIT with an absolute t=
imeout
     Michael Kerrisk
         Describe FUTEX_BITSET_MATCH_ANY
             Describe FUTEX_BITSET_MATCH_ANY and FUTEX_WAIT and FUTEX_W=
AKE
             equivalences.
     Michael Kerrisk
         Note that at least one bit must be set in mask for BITSET oper=
ations
             At least one bit must be set in the 'val3' mask supplied f=
or the
             FUTEX_WAIT_BITSET and FUTEX_WAKE_BITSET operations.
     Michael Kerrisk  [Thomas Gleixner, Darren Hart]
         Fix descriptions of various timeouts
     Michael Kerrisk
         Clarify clock default and choices for FUTEX_WAIT

getitimer.2
     Michael Kerrisk
         Substantial rewrites to various parts of the page
     Michael Kerrisk  [Tom Callaway]
         Change license to note that page may be modified
             The page as originally written carried text that said the =
page may
             be freely distributed but made no statement about modifica=
tion.
             In the 20+ years since it was first written, the page has =
in fact
             seen repeated, sometimes substantial, modifications, and o=
nly a
             small portion of the original text remains. One could I su=
ppose
             rewrite the last few pieces that remain from the original,
             but as the largest contributor to the pages existing text,
             I'm just going to relicense it to explicitly note that
             modification is permitted. (I presume the failure by the
             original author to grant permission to modify was simply a=
n
             oversight; certainly, the large number of people who have
             changed the page have taken that to be the case.)

             See also https://bugzilla.kernel.org/show_bug.cgi?id=3D118=
311

get_mempolicy.2
     Michael Kerrisk  [J=C3=B6rn Engel]
         Correct rounding to 'maxnodes' (bits, not bytes)
     Michael Kerrisk  [J=C3=B6rn Engel]
         Fix prototype for get_mempolicy()
             In numaif.h, 'addr' is typed as 'void *'

getpriority.2
     Michael Kerrisk
         Make discussion of RLIMIT_NICE more prominent
             The discussion of RLIMIT_NICE was hidden under the EPERM e=
rror,
             where it was difficult to find. Place some relevant text i=
n
             DESCRIPTION.
     Michael Kerrisk
         Note that getpriority()/setpriority deal with same attribute a=
s nice(2)
     Michael Kerrisk  [Robin Kuzmin]
         Clarify equivalence between lower nice value and higher priori=
ty

get_robust_list.2
     Michael Kerrisk
         get_robust_list() is governed by PTRACE_MODE_READ_REALCREDS

ioctl.2
     Michael Kerrisk
         SEE ALSO: add ioctl_fideduperange(2) and ioctl_ficlonerange(2)

kcmp.2
     Michael Kerrisk
         kcmp() is governed by PTRACE_MODE_READ_REALCREDS
     Shawn Landden
         Note about SECURITY_YAMA
kill.2
     Michael Kerrisk  [John Wiersba]
         Clarify the meaning if sig=3D=3D0

lookup_dcookie.2
     Michael Kerrisk
         SEE ALSO: add oprofile(1)

mmap.2
     Michael Kerrisk  [Rahul Bedarkar]
         EXAMPLE: for completeness, add munmap() and close() calls

mount.2
     Michael Kerrisk
         Restructure discussion of 'mountflags' into functional groups
             The existing text makes no differentiation between differe=
nt
             "classes" of mount flags. However, certain flags such as
             MS_REMOUNT, MS_BIND, MS_MOVE, etc. determine the general
             type of operation that mount() performs. Furthermore, the
             choice of which class of operation to perform is performed=
 in
             a certain order, and that order is significant if multiple
             flags are specified. Restructure and extend the text to
             reflect these details.
     Michael Kerrisk
         Relocate text on multimounting and mount stacking to NOTES
             The text was somewhat out of place in its previous locatio=
n;
             NOTES is a better location.
     Michael Kerrisk
         Remove version numbers attached to flags that are modifiable o=
n remount
             This information was simply bogus. Mea culpa.
     Michael Kerrisk
         Refer reader to mount_namespaces(7) for details on propagation=
 types
     Michael Kerrisk
         SEE ALSO: s/namespaces(7)/mount_namespaces(7)/
     Omar Sandoval
         MS_BIND still ignores mountflags
             This is clear from the do_mount() function in the kernel a=
s of v4.6.
     Michael Kerrisk
         Note the default treatment of ATIME flags during MS_REMOUNT
             The behavior changed in Linux 3.17.
     Michael Kerrisk
         Clarify that MS_MOVE ignores remaining bits in 'mountflags'
     Michael Kerrisk
         Note kernel version that added MS_MOVE
     Michael Kerrisk
         MS_NOSUID also disables file capabilities
     Michael Kerrisk
         Relocate/demote/rework text on MS_MGC_VAL
             The use of this constant has not been needed for 15 years =
now.
     Michael Kerrisk
         Clarify that 'source' and 'target' are pathnames, and can refe=
r to files
     Michael Kerrisk
         Update example list of filesystem types
             Put more modern examples in; remove many older examples.
     Michael Kerrisk
         MS_LAZYTIME and MS_RELATIME can be changed on remount
     Michael Kerrisk
         Explicitly note that MS_DIRSYNC setting cannot be changed on r=
emount
     Michael Kerrisk
         Move text describing 'data' argument higher up in page
             In preparation for other reworking.
     Michael Kerrisk
         Since Linux 2.6.26, bind mounts can be made read-only

open.2
     Eric Biggers
         Refer to correct functions in description of O_TMPFILE

pciconfig_read.2
     Michael Kerrisk  [Tom Callaway]
         Change license to note that page may be modified
             Niki Rahimi, the author of this page, has agreed that it's=
 okay
             to change the license to note that the page can be modifie=
d.

             See https://bugzilla.kernel.org/show_bug.cgi?id=3D118311

perf_event_open.2
     Michael Kerrisk
         If pid > 0, the operation is governed by PTRACE_MODE_READ_REAL=
CREDS
     Jann Horn
         Document new perf_event_paranoid default
     Keno Fischer  [Vince Weaver]
         Add a note that dyn_size is omitted if size =3D=3D 0
             The perf_output_sample_ustack in kernel/events/core.c only=
 writes
             a single 64 bit word if it can't dump the user registers. =
=46rom the
             current version of the man page, I would have expected two=
 64 bit
             words (one for size, one for dyn_size). Change the man pag=
e to
             make this behavior explicit.

prctl.2
     Michael Kerrisk
         Some wording improvements in timer slack description
     Michael Kerrisk
         Refer reader to discussion of /proc/[pid]/timerslack_ns
             Under discussion of PR_SET_TIMERSLACK, refer the reader to
             the /proc/[pid]/timerslack_ns file, documented in proc(5).

process_vm_readv.2
     Michael Kerrisk
         Rephrase permission rules in terms of a ptrace access mode che=
ck

ptrace.2
     Michael Kerrisk  [Jann Horn]
         Update Yama ptrace_scope documentation
             Reframe the discussion in terms of PTRACE_MODE_ATTACH chec=
ks,
             and make a few other minor tweaks and additions.
     Michael Kerrisk, Jann Horn
         Note that user namespaces can be used to bypass Yama protectio=
ns
     Michael Kerrisk
         Note that PTRACE_SEIZE is subject to a ptrace access mode chec=
k
     Michael Kerrisk
         Rephrase PTRACE_ATTACH permissions in terms of ptrace access m=
ode check

quotactl.2
     Michael Kerrisk  [Jacob Willoughby]
         'dqb_curspace' is in bytes, not blocks
             This error appears to have been injected into glibc
             when copying some headers from BSD.

             See https://bugs.debian.org/825548

recv.2
     Michael Kerrisk  [Tom Gundersen]
         With pending 0-length datagram read() and recv() with flags =3D=
=3D 0 differ

setfsgid.2
setfsuid.2
     Jann Horn  [Michael Kerrisk]
         Fix note about errors from the syscall wrapper
             See sysdeps/unix/sysv/linux/i386/setfsuid.c in glibc-2.2.1=
=2E
             (This code is not present in modern glibc anymore.)
     Michael Kerrisk
         Move glibc wrapper notes to "C library/kernel differences" sub=
section

sysinfo.2
     Michael Kerrisk
         Rewrite and update various pieces

umask.2
     Michael Kerrisk
         NOTES: Mention /proc/PID/status 'Umask' field

umount.2
     Michael Kerrisk
         SEE ALSO: add mount_namespaces(7)

unshare.2
     Michael Kerrisk
         Add reference to mount_namespaces(7) under CLONE_NEWNS descrip=
tion

utimensat.2
     Michael Kerrisk  [Rob Landley]
         Note that the glibc wrapper disallows pathname=3D=3DNULL

wait.2
     Michael Kerrisk
         Since Linux 4.7, __WALL is implied if child being ptraced
     Michael Kerrisk
         waitid() now (since Linux 4.7) also supports __WNOTHREAD/__WCL=
ONE/__WALL

assert.3
     Nikos Mavrogiannopoulos
         Improved description
             Removed text referring to text not being helpful to users.=
 Provide
             the error text instead to allow the reader to determine wh=
ether it
             is helpful.  Recommend against using NDEBUG for programs t=
o
             exhibit deterministic behavior.  Moved description ahead o=
f
             recommendations.
     Michael Kerrisk
         Clarify details of message printed by assert()

fmax.3
fmin.3
     Michael Kerrisk
         SEE ALSO: add fdim(3)

getauxval.3
     Cownie, James H
         Correct AT_HWCAP result description

inet_pton.3
     Stefan Puiu
         Mention byte order

malloc_hook.3
     Michael Kerrisk
         glibc 2.24 removes __malloc_initialize_hook

memmem.3
     Michael Kerrisk  [Shawn Landden]
         Note that memmem() is present on some other systems

mkdtemp.3
mktemp.3
     Michael Kerrisk
         SEE ALSO: add mktemp(1)

printf.3
     Michael Kerrisk  [Shawn Landden]
         Note support in other C libraries for %m and %n

strcasecmp.3
     Michael Kerrisk  [Ori Avtalion]
         Make details of strncasecmp() comparison clearer

strcat.3
     Michael Kerrisk
         Add a program that shows the performance characteristics of st=
rcat()
             In honor of Joel Spolksy's visit to Munich, let's start ed=
ucating
             Schlemiel The Painter.

strtoul.3
     Michael Kerrisk
         SEE ALSO: add a64l(3)

strxfrm.3
     Michael Kerrisk  [Florian Weimer]
         Remove NOTES section
             strxfrm() and strncpy() are not precisely equivalent in th=
e
             POSIX locale, so this NOTES section was not really correct=
=2E

             See https://bugzilla.kernel.org/show_bug.cgi?id=3D104221

console_codes.4
console_ioctl.4
tty.4
vcs.4
charsets.7
     Marko Myllynen
         Remove console(4) references
             0f9e647 removed the obsolete console(4) page but we still =
have few
             references to it. The patch below removes them or converts=
 to refs
             to concole_ioctl(4) where appropriate.

console_ioctl.4
     Michael Kerrisk  [Chris Gassib]
         The argument to KDGETMODE is an 'int'

lirc.4
     Alec Leamas
         Update after upstreamed lirc.h, bugfixes.

st.4
     Kai M=C3=A4kisara
         Fix description of read() when block is larger than request
     Kai M=C3=A4kisara
         Update MTMKPART for kernels >=3D 4.6
             Update the description of the MTMKPART operation of MTIOCT=
OP to match
             the changes in kernel version 4.6.

charmap.5
     Marko Myllynen
         Clarify keyword syntax
             Updates charmap(5) to match the syntax all the glibc
             charmap files are using currently.

elf.5
     Michael Kerrisk
         SEE ALSO: add readelf(1)

locale.5
     Marko Myllynen
         Document missing keywords, minor updates
     Marko Myllynen
         Clarify keyword syntax
     Marko Myllynen
         Adjust conformance

proc.5
namespaces.7
     Michael Kerrisk
         Move /proc/PID/mounts information to proc(5)
             There was partial duplication, and some extra information
             in namespaces(7). Move everything to proc(5).

proc.5
     Michael Kerrisk
         /proc/PID/fd/* are governed by PTRACE_MODE_READ_FSCREDS
             Permission to dereference/readlink /proc/PID/fd/* symlinks=
 is
             governed by a PTRACE_MODE_READ_FSCREDS ptrace access mode =
check.
     Michael Kerrisk
         /proc/PID/timerslack_ns is governed by PTRACE_MODE_ATTACH_FSCR=
EDS
             Permission to access /proc/PID/timerslack_ns is governed b=
y
             a PTRACE_MODE_ATTACH_FSCREDS ptrace access mode check.
     Michael Kerrisk
         Document /proc/PID/{maps,mem,pagemap} access mode checks
             Permission to access /proc/PID/{maps,pagemap} is governed =
by a
             PTRACE_MODE_READ_FSCREDS ptrace access mode check.

             Permission to access /proc/PID/mem is governed by a
             PTRACE_MODE_ATTACH_FSCREDS ptrace access mode check.
     Michael Kerrisk
         Note /proc/PID/stat fields that are governed by PTRACE_MODE_RE=
AD_FSCREDS
     Michael Kerrisk
         /proc/PID/{cwd,exe,root} are governed by PTRACE_MODE_READ_FSCR=
EDS
             Permission to dereference/readlink /proc/PID/{cwd,exe,root=
} is
             governed by a PTRACE_MODE_READ_FSCREDS ptrace access mode =
check.
     Michael Kerrisk
         /proc/PID/io is governed by PTRACE_MODE_READ_FSCREDS
             Permission to access /proc/PID/io is governed by
             a PTRACE_MODE_READ_FSCREDS ptrace access mode check.
     Michael Kerrisk
         /proc/PID/{personality,stack,syscall} are governed by PTRACE_M=
ODE_ATTACH_FSCREDS
             Permission to access /proc/PID/{personality,stack,syscall}=
 is
             governed by a PTRACE_MODE_ATTACH_FSCREDS ptrace access mod=
e check.
     Michael Kerrisk
         /proc/PID/{auxv,environ,wchan} are governed by PTRACE_MODE_REA=
D_FSCREDS
             Permission to access /proc/PID/{auxv,environ,wchan} is gov=
erned by
             a PTRACE_MODE_READ_FSCREDS ptrace access mode check.
     Michael Kerrisk
         Move shared subtree /proc/PID/mountinfo fields to mount_namesp=
aces(7)
             Move information on shared subtree fields in /proc/PID/mou=
ntinfo
             to mount_namespaces(7).
     Michael Kerrisk  ["Yuming Ma(=E9=A9=AC=E7=8E=89=E6=98=8E)"]
         Note that /proc/net is now virtualized per network namespace
     Michael Kerrisk
         Add references to mount_namespaces(7)

repertoiremap.5
     Marko Myllynen
         Clarify keyword syntax

utmp.5
     Michael Kerrisk
         SEE ALSO: add logname(1)

capabilities.7
     Michael Kerrisk  [Andy Lutomirski]
         Note on SECURE_NO_CAP_AMBIENT_RAISE for capabilities-only envi=
ronment
     Michael Kerrisk
         Add a detail on use of securebits

cgroup_namespaces.7
     Michael Kerrisk
         SEE ALSO: add namespaces(7)

cgroups.7
     Michael Kerrisk
         ERRORS: add mount(2) EBUSY error

cp1251.7
cp1252.7
iso_8859-1.7
iso_8859-15.7
iso_8859-5.7
koi8-r.7
koi8-u.7
     Marko Myllynen
         Add some charset references
             Add some references to related charsets here and there.

credentials.7
     Michael Kerrisk
         SEE ALSO: add runuser(1)
         SEE ALSO: add newgrp(1)
         SEE ALSO: add sudo(8)

feature_test_macros.7
     Michael Kerrisk
         Emphasize that applications should not directly include <featu=
res.h>

man-pages.7
     Michael Kerrisk
         Clarify which sections man-pages provides man pages for
     Michael Kerrisk  [Josh Triplett]
         Add a few more details on formatting conventions
             Add some more details for Section 1 and 8 formatting.
             Separate out formatting discussion into commands, function=
s,
             and "general".

namespaces.7
     Michael Kerrisk
         /proc/PID/ns/* are governed by PTRACE_MODE_READ_FSCREDS
             Permission to dereference/readlink /proc/PID/ns/* symlinks=
 is
             governed by a PTRACE_MODE_READ_FSCREDS ptrace access mode =
check.
     Michael Kerrisk
         Nowadays, file changes in /proc/PID/mounts are notified differ=
ently
             Exceptional condition for select(), (E)POLLPRI for (e)poll
     Michael Kerrisk
         Remove /proc/PID/mountstats description
             This is a duplicate of information in proc(5).
     Michael Kerrisk
         Refer to new mount_namespaces(7) for information on mount name=
spaces

netlink.7
     Andrey Vagin
         Describe netlink socket options
     Michael Kerrisk
         Rework version information
             (No changes in technical details.)

pid_namespaces.7
     Michael Kerrisk
         SEE ALSO: add namespaces(7)

unix.7
     Michael Kerrisk
         Move discussion on pathname socket permissions to DESCRIPTION
     Michael Kerrisk
         Expand discussion of socket permissions
     Michael Kerrisk
         Fix statement about permissions needed to connect to a UNIX do=
ain socket
             Read permission is not required (verified by experiment).
     Michael Kerrisk
         Clarify ownership and permissions assigned during socket creat=
ion
     Michael Kerrisk  [Carsten Grohmann]
         Update text on socket permissions on other systems
             At least some of the modern BSDs seem to check for write
             permission on a socket. (I tested OpenBSD 5.9.) On Solaris=
 10,
             some light testing suggested that write permission is stil=
l
             not checked on that system.
     Michael Kerrisk
         Note that umask / permissions have no effect for abstract sock=
ets
     W. Trevor King
         Fix example code: 'ret' check after accept populates 'data_soc=
ket'
     Michael Kerrisk
         Move some abstract socket details to a separate subsection
     Michael Kerrisk
         Note that abstract sockets automatically disappear when FDs ar=
e closed

user_namespaces.7
     Michael Kerrisk  [Micha=C5=82 Zegan]
         Clarify meaning of privilege in a user namespace
             Having privilege in a user NS only allows privileged
             operations on resources governed by that user NS. Many
             privileged operations relate to resources that have no
             association with any namespace type, and only processes
             with privilege in the initial user NS can perform those
             operations.

             See https://bugzilla.kernel.org/show_bug.cgi?id=3D120671
     Michael Kerrisk  [Micha=C5=82 Zegan]
         List the mount operations permitted by CAP_SYS_ADMIN
             List the mount operations permitted by CAP_SYS_ADMIN in a
             noninitial userns.

             See https://bugzilla.kernel.org/show_bug.cgi?id=3D120671
     Michael Kerrisk  [Micha=C5=82 Zegan]
         CAP_SYS_ADMIN allows mounting cgroup filesystems
             See https://bugzilla.kernel.org/show_bug.cgi?id=3D120671
     Michael Kerrisk
         Clarify details of CAP_SYS_ADMIN and cgroup v1 mounts
             With respect to cgroups version 1, CAP_SYS_ADMIN in the us=
er
             namespace allows only *named* hierarchies to be mounted (a=
nd
             not hierarchies that have a controller).
     Michael Kerrisk
         Clarify CAP_SYS_ADMIN details for mounting FS_USERNS_MOUNT fil=
esystems
     Michael Kerrisk
         Correct user namespace rules for mounting /proc
     Michael Kerrisk
         Describe a concrete example of capability checking
             Add a concrete example of how the kernel checks capabiliti=
es in
             an associated user namespace when a process attempts a pri=
vileged
             operation.
     Michael Kerrisk
         Correct kernel version where XFS added support for user namesp=
aces
             Linux 3.12, not 3.11.
     Michael Kerrisk
         SEE ALSO: add ptrace(2)
         SEE ALSO: add cgroup_namespaces(7)

utf-8.7:
     Shawn Landden
         Include RFC 3629 and clarify endianness which is left ambiguou=
s
             The endianness is suggested by the order the bytes are dis=
played,
             but the text is ambiguous.

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
