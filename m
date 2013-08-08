From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.53 released
Date: Thu, 08 Aug 2013 16:34:25 +0200
Message-ID: <5203AC71.2010200@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

    man-pages-3.53 - man pages for Linux

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.53

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2013/08/man-pages-353-is-released.h=
tml

The current version of the pages is browsable at:
http://man7.org/linux/man-pages/

You are receiving this message either because:

a) You contributed to the content of this release.

b) You are subscribed to linux-man-u79uwXL29TaiAVqoAR/hOA@public.gmane.org

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
 man-pages-3.53 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2013-07-31, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Al Viro <viro-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Andrey Vagin <avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Benjamin Poirier <bpoirier-l3A5Bk7waGM@public.gmane.org>
Chris Heath <chris-FSXMH2gLahXJKwlM9GxbOw@public.gmane.org>
Chuck Coffing <clc-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
=46elix_Schulte-dDVk9ABzqyjQT0dZR+AlfA@public.gmane.org
graud-KK0ffGbhmjU@public.gmane.org
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

restart_syscall.2
    Michael Kerrisk
        New page for restart_syscall(2) system call


Newly documented interfaces in existing pages
---------------------------------------------

fchownat.2
    Michael Kerrisk
        Document AT_EMPTY_PATH

fstatat.2
    Michael Kerrisk
        Document AT_EMPTY_PATH

linkat.2
    Michael Kerrisk
        Document AT_EMPTY_PATH

open.2
    Michael Kerrisk [Al Viro]
        Document O_PATH
            See also https://bugzilla.redhat.com/show_bug.cgi?id=3D8857=
40


Changes to individual pages
---------------------------

clock_nanosleep.2
futex.2
nanosleep.2
poll.2
sigaction.2
sigreturn.2
signal.7
    Michael Kerrisk
        SEE ALSO: add restart_syscall(2)

open.2
    Michael Kerrisk [Geoffrey Thomas]
        Remove warning that O_DIRECTORY is only for use with opendir(3)
            O_DIRECTORY can also be used with, for example, O_PATH.

perf_event_open.2
    Vince Weaver
        Improve PERF_SAMPLE_BRANCH_STACK documentation
    Vince Weaver
        Fix indentation of the MMAP layout section
            The indentation of the MMAP layout section wasn't quite rig=
ht.
            I think this improves things but I admit I'm not an expert =
at the
            low-level indentation directives.
    Vince Weaver
        Update PERF_IOC_FLAG_GROUP info
            It turns out PERF_IOC_FLAG_GROUP was broken from 75f937f24b=
d9
            (in Linux 2.6.31, the initial perf_event release) until
            724b6daa1 (Linux 3.4).

            I've done some extensive kernel source code digging plus
            running tests of various kernels and I hope the info
            presented is accurate now.

            (Patch edited somewhat by mtk.)
    Vince Weaver
        Improve sysfs files documentation
            This improves the documentation of the various
            perf_event_open()-related sysfs files.

ptrace.2
    Denys Vlasenko  [Oleg Nesterov, Dmitry V. Levin]
        If SEIZE was used, initial auto-attach stop is EVENT_STOP
            For every PTRACE_O_TRACEfoo option, mention that old-style =
SIGSTOP
            is replaced by PTRACE_EVENT_STOP if PTRACE_SEIZE attach was=
 used.

            Mention the same thing again in the description of
            PTRACE_EVENT_STOP.
    Denys Vlasenko  [Oleg Nesterov, Dmitry V. Levin]
        Mention that PTRACE_PEEK* libc API and kernel API are different
    Denys Vlasenko  [Oleg Nesterov, Dmitry V. Levin]
        Clarify PTRACE_INTERRUPT, PTRACE_LISTEN, and group-stop behavio=
r

readlink.2
    Michael Kerrisk
        Document use of empty 'pathname' argument
    Michael Kerrisk
        Change error check in example program from "< 0" to "=3D=3D -1"
    Chuck Coffing
        Fix possible race condition in readlink.2 example
            I noticed that the example in the readlink.2 man pages does=
 error
            checking for a race condition that would cause the value of=
 the
            symbolic link to get larger.  However, it doesn't handle th=
e
            opposite case, in which the value gets shorter.  (The NULL
            terminator is always set at the old, longer offset.)  This =
could
            cause the program to operate on uninitialized data.


setpgid.2
    Michael Kerrisk  [graud-KK0ffGbhmjU@public.gmane.org]
        s/SIGTSTP/SIGTTIN/ when discussing reads from terminal
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D60504

clog2.3
    Michael Kerrisk
        Note that these functions are still not present in glibc 2.17

dirfd.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function dirfd() is thread safe.

div.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions div(), ldiv(), lldiv() and imaxdiv() are thre=
ad
            safe.

fabs.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions fabs(), fabsf() and fabsl() are thread safe.

fdim.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions fdim(), fdimf() and fdiml() are thread safe.

fflush.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function fflush() is thread safe.

finite.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions finite(), finitef(), finitel(), isinf(), isin=
ff(),
            isinfl(), isnan(), isnanf() and isnanl() are thread safe.

flockfile.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions flockfile(), ftrylockfile() and funlockfile()=
 are
            thread safe.

floor.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions floor(), floorf() and floorl() are thread saf=
e.

resolv.conf.5
    Simon Paillard
        Explain how to set empty domain
            See http://bugs.debian.org/463575

capabilities.7
    Michael Kerrisk
        Add open_by_handle_at(2) under CAP_DAC_READ_SEARCH

inotify.7
    Michael Kerrisk  [Felix_Schulte-dDVk9ABzqyjQT0dZR+AlfA@public.gmane.org]
        Clarify description of IN_MOVED_FROM and IN_MOVED_TO

man-pages.7
    Michael Kerrisk
        DESCRIPTION should note versions for new interface features or =
behavior

udp.7
    Benjamin Poirier
        Add missing #include directive
            Using the UDP_CORK socket option documented in udp.7 requir=
es
            including <netinet/udp.h>.

ld.so.8
    Michael Kerrisk
        Rework rpath token expansion text
    Michael Kerrisk
        Describe $PLATFORM rpath token
    Michael Kerrisk
        Describe $LIB rpath token
    Michael Kerrisk
        Document LD_BIND_NOT
    Michael Kerrisk  [Simon Paillard]
        Add reference to pthreads(7) in discussion of LD_ASSUME_KERNEL


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
