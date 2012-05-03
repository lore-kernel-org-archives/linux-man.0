From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.40 released
Date: Thu, 3 May 2012 19:14:34 +1200
Message-ID: <CAKgNAkg8qzVdgM9FDb55S6gKe82EG7azTq_zXsNwTt5B68BCpg@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

  man-pages-3.40.tar.gz - man pages for Linux

Tarball download:
  http://www.kernel.org/doc/man-pages/download.html
Git repository:
  http://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
Online changelog:
  http://man7.org/linux/man-pages/changelog.html#release_3.40

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2012/05/man-pages-340-is-released.html

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

==================== Changes in man-pages-3.40 ====================

Released: 2012-04-27, Christchurch


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Alexey Toptygin <alexeyt-uVmiyxGBW52XDw4h08c5KA@public.gmane.org>
Bernhard Walle <bernhard-X9USDgGjgfuzQB+pC5nmwQ@public.gmane.org>
Brian F. G. Bidulock <bidulock-B8ReZeU34LJAfugRpC6u6w@public.gmane.org>
Brian M. Carlson <sandals-spVehEqlxw627WubY2PhZeTW4wlIGRCZ@public.gmane.org>
Christopher Yeoh <cyeoh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Daniel J Blueman <daniel-JCXMqzvhRcvYtjvyW6yDsg@public.gmane.org>
Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Eugen Dedu <Eugen.Dedu-C66Sk7uXGWIalAAbUx3MVP3zm4ADWneb@public.gmane.org>
James Hunt <james.hunt-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
John Sullivan <jsrhbz-7MjidzWf6JkTEKVsKyXuntBc4/FLrbF6@public.gmane.org>
Jon Grant <jg-hus3n9K41k0@public.gmane.org>
lepton <ytht.net-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Petr Baudis <pasky-+ZI9xUNit7I@public.gmane.org>
Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Ulrich Drepper <drepper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Vadim Mikhailov <vadim.mikhailov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

process_vm_readv.2
    Mike Frysinger, Christopher Yeoh, Michael Kerrisk
        New page for process_vm_readv(2) and process_vm_writev(2)

mcheck.3
    Michael Kerrisk
        New man page for mcheck(3) and related functions
            Also describes mcheck_check_all(3), mcheck_pedantic(3),
            and mprobe(3)


Newly documented interfaces in existing pages
---------------------------------------------

rcmd.3
    Michael Kerrisk
        Document "_af" variants of these functions
            Document rcmd_af(), rresvport_af(), iruserok_af(), ruserok_af().
            Also some restructuring and other clarifications.

rexec.3
    Michael Kerrisk
        Document rexec_af()


New and changed links
---------------------

iruserok_af.3
rcmd_af.3
rresvport_af.3
ruserok_af.3
    Michael Kerrisk
        New links to rcmd.3

rexec_af.3
    Michael Kerrisk
        New link to rexec.3


Changes to individual pages
---------------------------

clock_getres.2
    Michael Kerrisk
        Clarify difference between CLOCK_MONOTONIC and CLOCK_MONOTONIC_RAW
            Note interactions of these two clocks with discontinuous
            adjustments to the system time and NTP/adjtime(2).

fallocate.2
    Michael Kerrisk  [John Sullivan]
        Fix description of ENOSYS and EOPNOTSUP errors
            As reported in https://bugzilla.redhat.com/show_bug.cgi?id=680214

fchmodat.2
    Michael Kerrisk  [Mike Frysinger]
        Improve discussion of difference between wrapper and underlying syscall

gettimeofday.2
    Michael Kerrisk
        gettimeofday() is affected by discontinuous jumps in the system time
            Advise reader to use clock_gettime(2), if they need a
            monotonically increasing time source.
    Michael Kerrisk
        SEE ALSO: Add clock_gettime(2)

prctl.2
    Michael Kerrisk
        Add PR_TASK_PERF_EVENTS_DISABLE and PR_TASK_PERF_EVENTS_ENABLE
            Add some basic documentation of these operations, with a pointer to
            tools/perf/design.txt for more information.
    Michael Kerrisk  [Marcel Holtmann]
        Amend details of PR_SET_PDEATHSIG

ptrace.2
    Michael Kerrisk  [Mike Frysinger]
        Note SPARC deviation with respect to get/set regs
            SPARC reverses the use of 'addr' and 'data' for
            PTRACE_GETREGS, PTRACE_GETFPREGS, PTRACE_SETREGS,
            and PTRACE_SETFPREGS.

send.2
    Stefan Puiu
        Document EACCES error case for UDP

sigaction.2
    Michael Kerrisk
        Remove mention of raise(3) for SI_USER
            For a long time now, glibc's raise(3) didn't yield SI_USER
            for the signal receiver, so remove mention of raise(3)
            here. The user can deduce the details, if needed, by looking
            at the recently updated raise(3) page.

aio_cancel.3
    Michael Kerrisk  [Jon Grant]
        Rewrite RETURN VALUE section to be clearer

aio_init.3
    Michael Kerrisk  [Jon Grant]
        Remove extraneous "POSIX" from NAME section

btree.3
dbopen.3
hash.3
mpool.3
recno.3
    Michael Kerrisk  [Brian M. Carlson]
        Note that glibc no longer provides these interfaces
            glibc stopped providing these interfaces with v2.2.
            Nowadays, the user that finds these pages probably wants
            the libdb API, so note this in the page.

            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=337581

fopen.3
    Michael Kerrisk
        BUGS: Note limitation on number of flag characters parsed in 'mode'
    Michael Kerrisk
        Note that 'c' and 'e' flags are ignored for fdopen()
            Determined from reading libio/iofdopen.c.
    Michael Kerrisk
        Document ",ccs=string" feature of 'mode' for fopen()/freopen()

getgrnam.3
    Michael Kerrisk  [Ulrich Drepper]
        Fix discussion of _SC_GETGR_R_SIZE_MAX
            The value is not meant to be a maximum (as was specified in
            SUSv3) but an initial guess at the required size
            (as specified in SUSv4).

getpwnam.3
    Michael Kerrisk  [Ulrich Drepper]
        Fix discussion of _SC_GETPW_R_SIZE_MAX
            The value is not meant to be a maximum (as was specified in
            SUSv3) but an initial guess at the required size
            (as specified in SUSv4).

malloc.3
mallopt.3
mtrace.3
    Michael Kerrisk
        SEE ALSO: add mcheck(3)

memchr.3
    Michael Kerrisk
        Clarify description, omitting mention of "strings" and "characters"
            The existing text slipped into talking about characters and
            strings, which could mislead readers into thing that, for
            example, searches for the byte '\0' are treated specially.
            Therefore, rewrite in terms of "bytes" and "memory areas".

            At the same time, make a few source file clean-ups.

mkstemp.3
    Michael Kerrisk
        Add "mkstemps" and "mkostemps" to NAME line

posix_openpt.3
    Michael Kerrisk  [Vadim Mikhailov]
        Add some details on use of the slave pathname
            An explicit pointer to ptsname(3) is useful, as is a note
            of the fact that the slave device pathname exists only as
            long as the master device is held open.

raise.3
    Michael Kerrisk
        Add some notes on underlying system call that is used

rcmd.3
    Michael Kerrisk
        Add some details of the rresvport() 'port' argument

resolver.3
    Petr Baudis
        Note that many options are documented in resolv.conf(5)

scandir.3
    Michael Kerrisk  [Daniel J Blueman]
        Improve EXAMPLE source code: s/0/NULL/ in scandir() call

strchr.3
    James Hunt
        Explain behavior when searching for '\0'

strerror.3
    Eric Blake  [Stefan Puiu]
        Improve strerror_r() description
            POSIX requires that perror() not modify the static storage
            returned by strerror().  POSIX 2008 and C99 both require that
            strerror() never return NULL (a strerror() that always
            returns "" for all inputs is valid for C99, but not for POSIX).

            http://sourceware.org/bugzilla/show_bug.cgi?id=12204
            documents glibc's change to come into compliance with POSIX
            regarding strerror_r() return value.  The GNU strerror_r() use
            of 'buf' was confusing - I ended up writing a test program that
            proves that 'buf' is unused for valid 'errnum', but contains
            truncated "unknown message" for out-of-range 'errnum'.

            See also http://austingroupbugs.net/view.php?id=382
    Bernhard Walle
        Correct description of error return for XSI strerror_r()
    Michael Kerrisk [Eric Blake]
        Note how to use 'errno' to detect errors when calling strerror()
    Michael Kerrisk  [Jon Grant]
        Add an example of the kind of string returned by strerror()

resolv.conf.5
    Petr Baudis
        Document "single-request" option

inotify.7
    Michael Kerrisk
        Note buffer size that guarantees being able to read at least one event
    James Hunt
        Correct description of size of inotify_event structure

iso_8859-1.7
    Eugen Dedu
        Add "-" for SOFT HYPHEN
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=156154

netdevice.7
    Brian F. G. Bidulock
        Document some SIOC configuration ioctls
            This patch adds common but missing SIOC configuration ioctls to
            the netdevice.7 manual pages that are not documented anywhere
            else. SIOCSIFPFLAGS and SIOCGIFPFLAGS are linux-specific. Flag
            values come from Linux 2.6.25 kernel headers for sockios. The
            others are standard BSD ioctls that have always been implemented
            by Linux and were verified from inspecting netdevice.c kernel
            code.

socket.7
    Michael Kerrisk  [Alexey Toptygin]
        Correct description of SO_BROADCAST

tcp.7
    lepton
        Correct description for TCP_MAXSEG on modern kernel

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
