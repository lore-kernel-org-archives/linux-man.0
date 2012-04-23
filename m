From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.39 released
Date: Tue, 24 Apr 2012 07:39:13 +1200
Message-ID: <CAKgNAkga_Prw3X-9e8mxwRGFV3uH_TkOzR=oPKiXo1GjR3eHwg@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

  man-pages-3.39.tar.gz - man pages for Linux

Tarball download:
  http://www.kernel.org/doc/man-pages/download.html
Git repository:
  http://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
Online changelog:
  http://man7.org/linux/man-pages/changelog.html#release_3.39

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2012/04/man-pages-339-is-released.h=
tml

The current version of the pages is browsable at:
http://man7.org/linux/man-pages/

You are receiving this message either because:

a) You contributed to the content of this release.

b) You are subscribed to linux-man-u79uwXL29TaiAVqoAR/hOA@public.gmane.org

c) I have information (possibly inaccurate) that you are the
maintainer of a translation of the manual pages, or are the maintainer
of the manual pages set in a particular distribution, or have
expressed interest in helping with man-pages maintenance, or have
otherwise expressed interest in being notified about man-pages
releases.  If you don't want to receive such messages from me, or you
know of some other translator or maintainer who may want to receive
such notifications, send me a message.

Cheers,

Michael


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Changes in=
 man-pages-3.39 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2012-04-17, Christchurch


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Abhijith Das <adas-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Alexander Kruppa <akruppa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Andreas Jaeger <aj-IBi9RG/b67k@public.gmane.org>
Armin Rigo <arigo-SAGZdM4SFkLYtjvyW6yDsg@public.gmane.org>
Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Denys Vlasenko <vda.linux-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Eric Blake <ebb9-PGZyUNKar/Q@public.gmane.org>
=46elix <fkater-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Jak <jak-Cyn6bMzNSQ8@public.gmane.org>
Jeff Mahoney <jeffm-IBi9RG/b67k@public.gmane.org>
Jesus Otero <jesus.otero-zg5kjA6Mr10@public.gmane.org>
Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Kevin O'Gorman <kevinogorman4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mark R Bannister <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Michael Welsh Duggan <mwd-etTNj8cnB6w@public.gmane.org>
Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Petr Gajdos <pgajdos-AlSwsSmVLrQ@public.gmane.org>
Regid Ichira <regid23-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
Ricardo Catalinas Jim=E9nez <jimenezrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Simone Piccardi <piccardi-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org>
Tetsuo Handa <penguin-kernel-1yMVhJb1mP/7nzcFbJAaVXf5DAMn2ifp@public.gmane.org>
<who-t+iU6Fs6Cel2agKppZcdFSwD8/FfD2ys@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

malloc_trim.3
    Michael Kerrisk
        New man page for malloc_trim(3)

malloc_usable_size.3
    Michael Kerrisk
        New man page for malloc_usable_size(3)


Newly documented interfaces in existing pages
---------------------------------------------

prctl.2
    Cyrill Gorcunov
        Document PR_SET_MM (new in Linux 3.3)
    Michael Kerrisk
        Various edits and improvements to Cyrill's patch


Changes to individual pages
---------------------------

epoll_create.2
    Michael Kerrisk
        Rework discussion of 'size' argument
    Michael Kerrisk
        Add .SS for description of epoll_create1()

epoll_wait.2
    Michael Kerrisk  [Armin Rigo]
        Another thread can add to epoll instance while epoll_wait is bl=
ocked
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D43072
    Michael Kerrisk
        Clarify that epoll_pwait() blocks calling *thread*
        A few wording improvements

fchmodat.2
    Michael Kerrisk  [Mike Frysinger]
        Note difference between glibc wrapper and underlying system cal=
l
            The wrapper function has a 'flags' argument (which currentl=
y
            serves no purpose), while the underlying system call does n=
ot.

fcntl.2
    Abhijith Das
        Explain behaviour of F_GETLEASE during lease break
    Michael Kerrisk  [Eric Blake]
        Change type of arg from "long" to "int"
            Various fcntl(2) commands require an integral 'arg'.
            The man page said it must be "long" in all such cases.
            However, for the cases covered by POSIX, there is an
            explicit requirement that these arguments be "int".
            Update the man page to reflect. Probably, all of the
            other "long" cases (not specified in POSIX) should
            be "int", and this patch makes them so. Based on a
            note fromEric Blake, relating to F_DUPFD_CLOEXEC.

gettimeofday.2
    Michael Kerrisk
        Reorganize content
            The main change is to move the historical information about
            the 'tz_dsttime' to NOTES.
    Michael Kerrisk  [Felix]
        Note that compiler issues warnings if 'tv' is NULL

mmap.2
    Michael Kerrisk  [Kevin O'Gorman]
        Clarify that this system call should not be invoked directly
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D42892
    Michael Kerrisk
        Clarify NOTES discussion of mmap() versus mmap2()

poll.2
    Michael Kerrisk  [Michael Welsh Duggan]
        Document negative value in 'fd' field
    Michael Kerrisk
        Document semantics of passing zero in 'events' field

ptrace.2
    Denys Vlasenko
        Various fixes
            For some reason, the PTRACE_TRACEME paragraph talks about s=
ome
            general aspects of ptraced process behavior. It repeats the
            "tracee stops on every signal" information even though that=
 was
            already explained just a few paragraphs before. Then it des=
cribes
            legacy SIGTRAP on execve().

            This patch deletes the first part, and moves the second par=
t up,
            into the general ptrace description. It also adds
            "If PTRACE_O_TRACEEXEC option is not in effect" to the desc=
ription
            of the legacy SIGTRAP on execve().

            The patch also amends the part which says "For requests oth=
er
            than PTRACE_KILL, the tracee must be stopped." - PTRACE_ATT=
ACH
            also doesn't require that.

sigaction.2
    Michael Kerrisk  [Andreas Jaeger, ]
        Clarify that the use of SI_SIGIO is for Linux 2.2 only
            See also http://sourceware.org/bugzilla/show_bug.cgi?id=3D6=
745

sigprocmask.2
    Mike Frysinger
        ERRORS: add EFAULT

times.2
    Michael Kerrisk  [Simone Piccardi]
        ERRORS: Add EFAULT

div.3
    Michael Kerrisk  [Reuben Thomas]
        CONFORMING TO: Add C99

fread.3
    Regid Ichira
        Clarify further that return value is number of items, not bytes
            See also http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D=
665780

getaddrinfo.3
    Michael Kerrisk  [Jak]
        Correct type of ai_addrlen field

malloc.3
    Michael Kerrisk
        SEE ALSO: add malloc_usable_size(3)
        SEE ALSO: Add malloc_trim(3)

mallopt.3
    Michael Kerrisk
        Fix text describing M_PERTURB and free()
        SEE ALSO: Add malloc_trim(3)

memchr.3
    Michael Kerrisk  [Reuben Thomas]
        Remove mention of terminating null in description of rawmemchr(=
)

perror.3
    Michael Kerrisk  [Jesus Otero]
        Note that use of 'sys_errlist' is deprecated

rcmd.3
    Michael Kerrisk
        glibc eventually added a declaration of iruserok() in version 2=
=2E12

sysconf.3
    Michael Kerrisk  [Ricardo Catalinas Jim=E9nez]
        Add mention of _SC_SYMLOOP_MAX

nologin.5
    Michael Kerrisk  [Tetsuo Handa]
        nologin must not only exist, but *be readable* to be effective

nsswitch.conf.5
    Mark R Bannister
        Significant rewrites and improvements
            This patch applies to nsswitch.conf.5 in man-pages-3.36.

            My changes almost completely rewrite large sections of the
            man page. They are needed to add clarity, correct grammar,
            reduce confusion, and bring up-to-date with the latest glib=
c.
            I have checked the man page against the nss source code in
            glibc 2.14.90.

            Historical notes are demoted to the footer.

            The rewrite makes the man page much clearer to
            understand, more authoratitive, and easier to read.
    Michael Kerrisk
        Light edits to Mark Bannister's changes

capabilities.7
    Michael Kerrisk
        Add prctl(PR_SET_MM) to CAP_SYS_RESOURCE

epoll.7
    Michael Kerrisk
        Some minor clarifications at start of DESCRIPTION

netlink.7
    Jeff Mahoney  [Petr Gajdos]
        Note cases where nonprivileged users can use netlink multicast =
groups
            See also https://bugzilla.novell.com/show_bug.cgi?id=3D7546=
11

unix.7
    Michael Kerrisk  [Tetsuo Handa]
        Add a detail on autobind feature

ld.so.8
    Jonathan Nieder  [Reuben Thomas]
        Document effect of hwcaps on search path
            Wording by Aurelien Jarno from Debian glibc's r4701 (2011-0=
6-04).

            Addresses http://bugs.debian.org/622385

--
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
