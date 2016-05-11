From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-4.06 released
Date: Wed, 11 May 2016 08:51:14 +0200
Message-ID: <f06548d5-5857-c73f-0f9a-331761cd748c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

    man-pages-4.06 - man pages for Linux

This release includes input and contributions from
around 20 people. Arounbd 40 pages saw changes, ranging
from typo fixes through to page rewrites and newly
created pages.

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_4.06

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2016/05/man-pages-406-is-released.h=
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
 man-pages-4.06 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2016-05-09, Oslo


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Alon Bar-Lev <alon.barlev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Benjamin Poirier <bpoirier-IBi9RG/b67k@public.gmane.org>
Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Dr. Tobias Quathamer <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Ed Avis <eda-0aTcAJqSNDHby3iVrkZq2A@public.gmane.org>
Georg Sauthoff <gsauthof-If1cxaH3S3JVgF+RW+Bo1SZEdBbF94EN@public.gmane.org>
Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Jordan Birks <birkses-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Nikola Forr=C3=B3 <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Rasmus Villemoes <linux-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Serge E. Hallyn <serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org>
Serge Hallyn <serge.hallyn-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Valery Reznic <valery_reznic-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

cgroups.7
    Serge Hallyn, Michael Kerrisk
        New page documenting cgroups

cgroup_namespaces.7
    Michael Kerrisk  [Serge Hallyn]
        New page describing cgroup namespaces


Newly documented interfaces in existing pages
---------------------------------------------

clone.2
    Michael Kerrisk
        Document CLONE_NEWCGROUP

readv.2
    Christoph Hellwig
        Document preadv2() and pwritev2()
setns.2
    Michael Kerrisk
        Document CLONE_NEWCGROUP

unshare.2
    Michael Kerrisk
        Document CLONE_NEWCGROUP


Changes to individual pages
---------------------------

clock_getres.2
    Michael Kerrisk  [Rasmus Villemoes]
        Note that coarse clocks need architecture and VDSO support

clone.2
fork.2
    Nikola Forr=C3=B3
        Document ERESTARTNOINTR error code

clone.2
    Michael Kerrisk  [Colin Ian King]
        ERRORS: add EINVAL for improperly aligned 'child_stack' value

execve.2
    Michael Kerrisk  [Valery Reznic]
        Since Linux 2.6.28, recursive script interpretation is supporte=
d

fcntl.2
    Michael Kerrisk
        Note that mandatory locking is now governed by a configuration =
option

fsync.2
    Michael Kerrisk  [Georg Sauthoff]
        Give some examples of files where sync can fail with EINVAL

getrlimit.2
    Michael Kerrisk
        SEE ALSO: add cgroups(7)

ioctl_fat.2
    Heinrich Schuchardt
        Use %04x to print volume ID
            Leading zeroes should be used when display a FAT volume ID.

ioprio_set.2
    Michael Kerrisk
        SEE ALSO: add cgroups(7)

lseek.2
    Michael Kerrisk
        Note that 'off_t' is an integer data type defined by POSIX

memfd_create.2
    Michael Kerrisk
        Note that memfd_create() does not have a glibc wrapper

mount.2
    Michael Kerrisk
        MS_MANDLOCK requires CAP_SYS_ADMIN (since Linux 4.5)

quotactl.2
    Michael Kerrisk
        Document Q_GETNEXTQUOTA and Q_XGETNEXTQUOTA
    Michael Kerrisk
        Rework/reorder ERRORS list
            Make into a single alphabetically ordered list
    Michael Kerrisk
        Note kernel version that removed Q_GETSTATS
    Michael Kerrisk
        Add kernel version for G_GETINFO, Q_SETINFO, and Q_GETFMT

readv.2
    Michael Kerrisk
        Clarify that 'size_t' and 'ssize_t' are integer types specified=
 in POSIX

semctl.2
    Michael Kerrisk
        From kernel 4.6, Linux now updates 'sempid' on SETALL operation=
s

sigaction.2
    Michael Kerrisk
        Document SEGV_BNDERR
    Michael Kerrisk
        Document SEGV_PKUERR

syscalls.2
    Michael Kerrisk
        Add preadv2() and pwritev2()

write.2
    Michael Kerrisk
        Clarify that 'size_t' and 'ssize_t' are integer types specified=
 in POSIX

makedev.3
    Mike Frysinger
        Use <sys/sysmacros.h> in SYNOPSIS
            Defining these functions via <sys/types.h> causes problems =
for
            some folk. As noted by Zack Wein:

                libstdc++ force-enables _GNU_SOURCE, which means people
                writing in C++ _can't_ avoid these nonstandard macros b=
y
                using a strict conformance mode.

            Since glibc has basically always used <sys/sysmacros.h>,
            update the docs to have people include that instead.
    Michael Kerrisk
        NOTES: mention that <sys/types.h> may also define these macros

popen.3
    Nikola Forr=C3=B3
        RETURN VALUE: describe successful case
            Reference:
            http://pubs.opengroup.org/onlinepubs/9699919799/functions/p=
open.html
            http://pubs.opengroup.org/onlinepubs/9699919799/functions/p=
close.html

strtod.3
    Michael Kerrisk  [Ed Avis]
        Improve a detail in RETURN VALUE

core.5
    Michael Kerrisk
        Document /proc/sys/kernel/core_pipe_limit

locale.5
    Marko Myllynen
        Adjust LC_IDENTIFICATION / abbreviation
            Tiny tweak to locale.5 based on the on ISO/IEC TR 14652:

            http://www.open-std.org/jtc1/SC22/WG20/docs/n972-14652ft.pd=
f
    Marko Myllynen
        Update LC_ADDRESS after glibc change
            This patch updates locale.5 to match the recent glibc chang=
e
            in commit a837257199ffab76237385b830cc7b6179fc2f18
    Marko Myllynen
        Complete LC_COLLATE
            Here's the first attempt to (almost) complete the locale.5 =
manual
            page by documenting all (but perhaps one) of the missing
            LC_COLLATE keywords.
    Mike Frysinger
        country_car: Add a better description


nsswitch.conf.5
    Marko Myllynen
        Document group merging
            Document the recently merged glibc group merge support.
            Glibc commit ced8f8933673f4efda1d666d26a1a949602035ed
            https://sourceware.org/glibc/wiki/Proposals/GroupMerging

proc.5
    Michael Kerrisk
        Move /proc/PID/cgroup discussion to cgroups(7) page
    Michael Kerrisk
        Add some background on why /proc/PID/mountinfo was added
    Michael Kerrisk
        Improve description of /proc/PID/mountinfo 'root' field
    Michael Kerrisk
        Add pointer to cgroups(7) for documentation of /proc/cgroups
    Michael Kerrisk
        Add reference to core(5) for info on /proc/sys/kernel/core_pipe=
_limit

cpuset.7
    Michael Kerrisk
        SEE ALSO: add cgroups(7)

ip.7
    Benjamin Poirier
        Fix incorrect sockopt name
            "IP_LEAVE_GROUP" does not exist. It was perhaps a confusion=
 with
            MCAST_LEAVE_GROUP. Change the text to IP_DROP_MEMBERSHIP wh=
ich has
            the same function as MCAST_LEAVE_GROUP and is documented in=
 the
            ip.7 man page.

            Reference:
            Linux kernel net/ipv4/ip_sockglue.c do_ip_setsockopt()

namespaces.7
    Michael Kerrisk
        SEE ALSO: add cgroups(7), cgroup_namespaces(7)

vdso.7
    Zubair Lutfullah Kakakhel  [Mike Frysinger]
        Update for MIPS
            Document the symbols exported by the MIPS VDSO.
            VDSO support was added from kernel 4.4 onwards.

            See https://git.kernel.org/cgit/linux/kernel/git/torvalds/l=
inux.git/log/arch/mips/vdso
    Michael Kerrisk  [Rasmus Villemoes]
        The __kernel_clock_* interfaces don't support *_COARSE clocks o=
n PowerPC

ld.so.8
    Michael Kerrisk  [Alon Bar-Lev]
        Document use of $ORIGIN, $LIB, and $PLATFORM in environment var=
iables
            These strings are meaningful in LD_LIBRARY_PATH and LD_PREL=
OAD.
--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
