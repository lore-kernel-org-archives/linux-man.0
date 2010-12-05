From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.32 released
Date: Sun, 5 Dec 2010 15:33:48 +0100
Message-ID: <AANLkTi=69sGvwP8_1dRhbwopRPVtCEVs3kaBKA59AHJZ@mail.gmail.com>
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

 man-pages-3.32.tar.gz - man pages for Linux

This release is now available for download at:

 http://www.kernel.org/pub/linux/docs/man-pages
 or ftp://ftp.kernel.org/pub/linux/docs/man-pages

The online changelog is available at
http://www.kernel.org/doc/man-pages/changelog.html (blogged at
http://linux-man-pages.blogspot.com/2010/12/man-pages-332-is-released.h=
tml
) and the current version of the pages is browsable at
http://www.kernel.org/doc/man-pages/

You are receiving this message either because:

a) You contributed to the content of this release.

b) You are subscribed to linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (*).

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
 man-pages-3.32 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2010-12-03, Munich


Contributors
------------

The following people contributed notes, ideas, or patches that have
been incorporated in changes in this release:

A. Costa <agcosta-gjFYTiW3eU0@public.gmane.org>
Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Emil Mikulic <emikulic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Eugene Kapun <abacabadabacaba-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Hugh Dickins <hughd-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Ivana Hutarova Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Joern Heissler <kernelbugs-pbvhy9/vjlfAiHgwPnP32rNAH6kLmebB@public.gmane.org>
Lars Wirzenius <liw-IHm+4ePE6Fk@public.gmane.org>
Martin Eberhard Schauer <Martin.E.Schauer-Mmb7MZpHnFY@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Petr Uzel <petr.uzel-AlSwsSmVLrQ@public.gmane.org>
Roger Pate <roger-BhOJIT0taCA@public.gmane.org>
T=F6r=F6k Edwin <edwintorok-Re5JQEeQqe8@public.gmane.org
Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

pthread_sigqueue.3
    Michael Kerrisk
        New page documenting ptrhead_sigqueue()
            pthread_sigqueue() is new in glibc 2.11 (requires a kernel =
with
            rt_tgsigqueinfo(), added in Linux 2.6.31).


Newly documented interfaces in existing pages
---------------------------------------------

readv.2
    Michael Kerrisk
        Add documentation of preadv() and pwritev()
            The preadv() and pwritev() system calls were added in
            Linux 2.6.30.


New and changed links
---------------------

preadv.2
    Michael Kerrisk
        New link to readv.2

pwritev.2
    Michael Kerrisk
        New link to readv.2


Changes to individual pages
---------------------------

chdir.2
    Michael Kerrisk
        Remove redundant and incorrect info on FTMs from NOTES

chown.2
    Michael Kerrisk
        Add NOTES explaining 32-bit system calls added in Linux 2.4

clock_nanosleep.2
    Michael Kerrisk
        Clarify that clock_nanosleep() suspends the calling *thread*

epoll_create.2
    Michael Kerrisk
        Note that 'size' argument must be greater than 0
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D23872
    Michael Kerrisk
        Added VERSIONS section

epoll_ctl.2
    Michael Kerrisk
        Added VERSIONS section

epoll_wait.2
    Michael Kerrisk
        Updated VERSIONS section

fcntl.2
    Michael Kerrisk
        Add notes on fcntl64()

fstatat.2
    Michael Kerrisk
        Add NOTES on fstatat64(), the name of the underlying system cal=
l

getdents.2
    Michael Kerrisk
        Added notes on getdents64()

getgid.2
    Michael Kerrisk
        Add NOTES explaining 32-bit system calls added in Linux 2.4

getgroups.2
    Michael Kerrisk
        Add NOTES explaining 32-bit system calls added in Linux 2.4

getpagesize.2
    Michael Kerrisk
        Improve description of getpagesize()
            Improve description of getpagesize() and relocate discussio=
n
            of sysconf(_SC_PAGESIZE).

            In part inspired by
            http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D537272

getresuid.2
    Michael Kerrisk
        Add NOTES explaining 32-bit system calls added in Linux 2.4

getrlimit.2
    Michael Kerrisk
        Add example program for prlimit()

getuid.2
    Michael Kerrisk
        Add NOTES explaining 32-bit system calls added in Linux 2.4

open.2
    Ivana Hutarova Varekova
        O_EXCL can be used without O_CREAT for block devices
            Since Linux 2.6 there is a possibility to use O_EXCL withou=
t
            O_CREAT. See patch: http://lkml.org/lkml/2003/8/10/221.

pread.2
    Michael Kerrisk
        Add notes on pread64() and pwrite64()
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D23072
    Michael Kerrisk
        SEE ALSO: add readv(3)

readv.2
    Michael Kerrisk
        Wording fix: readv() and writev() are system calls, not functio=
ns

sendfile.2
    Michael Kerrisk
        Add notes on sendfile64()

setfsgid.2
    Michael Kerrisk
        Add NOTES explaining 32-bit system calls added in Linux 2.4

setfsuid.2
    Michael Kerrisk
        Add NOTES explaining 32-bit system calls added in Linux 2.4

setgid.2
    Michael Kerrisk
        Add NOTES explaining 32-bit system calls added in Linux 2.4

setresuid.2
    Michael Kerrisk
        Add NOTES explaining 32-bit system calls added in Linux 2.4

setreuid.2
    Michael Kerrisk
        Add NOTES explaining 32-bit system calls added in Linux 2.4

setuid.2
    Michael Kerrisk
        Add NOTES explaining 32-bit system calls added in Linux 2.4

sigqueue.2
pthreads.7
signal.7
    Michael Kerrisk
        SEE ALSO: Add pthread_sigqueue(3)

stat.2
    Michael Kerrisk
        Fix EOVERFLOW error description
            2<<31 should read 1<<31 (which equals 2^31).

statfs.2
    Michael Kerrisk
        Add notes on statfs64() and fstatfs64()

swapon.2
    Hugh Dickins
        Document SWAP_FLAG_DISCARD and discarding of swap pages

truncate.2
    Michael Kerrisk
        Add notes on truncate64() and ftruncate64()

memcpy.3
    Michael Kerrisk
        Change "should not overlap" to "must not overlap"
            glibc 2.12 changed things so that applications that use mem=
cpy() on
            overlapping regions will encounter problems. (The standards=
 have
            long said that the behavious is undefined if the memory are=
as
            overlap.)

            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D6031=
44
            In reference of http://lwn.net/Articles/414467/
            and http://article.gmane.org/gmane.comp.lib.glibc.alpha/152=
78

usleep.3
    Petr Uzel
        usleep() suspends calling thread, not process

core.5
    Michael Kerrisk
        Change single quote to double quote in shell session example
            The example section has a sample shell session containing:

            echo '|$PWD/core_pattern_pipe_test %p UID=3D%u GID=3D%g sig=
=3D%s'

            But $PWD won't be expanded in single quotes. It should be d=
ouble
            quotes around the entire argument or some other form.

pthreads.7
    Michael Kerrisk
        Added description of async-cancel-safe functions

unix.7
    Michael Kerrisk
        Reworded the text of various errors
    Michael Kerrisk
        Added ENOENT error


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
