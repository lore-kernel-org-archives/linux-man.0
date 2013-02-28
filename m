From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.47 released
Date: Thu, 28 Feb 2013 12:19:57 +0100
Message-ID: <CAKgNAkhV1grHTsYbDKxJ7zboUEewQOqYP7FKRstf+KKpUh1LNw@mail.gmail.com>
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

    man-pages-3.47 - man pages for Linux

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    http://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.47

A short summary of the release is blogged at:
    http://linux-man-pages.blogspot.com/2013/02/man-pages-347-is-releas=
ed.html

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
 man-pages-3.47 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2013-02-12, Christchurch


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
D. Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Radek Pazdera <rpazdera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Vince Weaver <vweaver1-qKp7vQ+Mknf2fBVCVOL8/A@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

perf_event_open.2
    Vincent Weaver
        New page documenting perf_event_open(2)

pthread_setname_np.3
    Chandan Apsangi, Michael Kerrisk
        New page for pthread_setname_np(3) and pthread_getname_np(3)

sln.8
    Michael Kerrisk  [Peter Schiffer]
        New page documenting the 'sln' command provided by glibc
            Inspired by a Red Hat downstream page, but with rather
            more detail.


Newly documented interfaces in existing pages
---------------------------------------------

prctl.2
    Michael Kerrisk  [Shawn Landden, Lennart Poettering]
        Document PR_SET_CHILD_SUBREAPER and PR_GET_CHILD_SUBREAPER

ip.7
    Radek Pazdera
        Add source-specific multicast sockopts
            This patch adds documentation of several source-specific mu=
lticast
            socket options that were added to kernel with implementatio=
n
            of IGMPv3 in 2.5.68.

            The following socket options were added:
              IP_ADD_SOURCE_MEMBERSHIP
              IP_DROP_SOURCE_MEMBERSHIP
              IP_BLOCK_SOURCE
              IP_UNBLOCK_SOURCE
              IP_MSFILTER


Pages moved across sections
---------------------------

getcontext.3
    Michael Kerrisk
        This page really belongs in Section 3 (moved from Section 2)

getdtablesize.3
    Michael Kerrisk
        Move from Section 2


New and changed links
---------------------

getcontext.2
    Michael Kerrisk
        Make link to page moved into Section 3

getdtablesize.2
    Michael Kerrisk
        Link to renamed getdtablesize.3

setcontext.2
    Michael Kerrisk
        Modify link to point to Section 3

pthread_getname_np.3
    Michael Kerrisk
        New link to new pthread_setname_np.3

setcontext.3
    Michael Kerrisk
        Link to getcontext page renamed into Section 3


Changes to individual pages
---------------------------

fallocate.2
    Michael Kerrisk
        SEE ALSO: add fallocate(1)

flock.2
    Michael Kerrisk
        SEE ALSO: add flock(1)

fork.2
    Michael Kerrisk
        SEE ALSO: add exit(2)

getpriority.2
    Michael Kerrisk
        BUGS: note that nice value is per-thread on Linux

getrlimit.2
    Michael Kerrisk
        SEE ALSO: add prlimit(1)

gettid.2
    Michael Kerrisk
        SEE ALSO: add various system calls that use thread IDs

ioprio_set.2
    Michael Kerrisk
        SEE ALSO: add ionice(1)

sched_setaffinity.2
    Michael Kerrisk
        SEE ALSO: add taskset(1)

sched_setparam.2
    Michael Kerrisk
        Scheduling policy and parameters are per-thread on Linux
            Direct the reader to the discussion in sched_setscheduler(2=
).

sched_setscheduler.2
    Michael Kerrisk
        Scheduling policy and parameters are per-thread on Linux
    Michael Kerrisk
        SEE ALSO: add chrt(1)

setsid.2
    Michael Kerrisk
        SEE ALSO: add setsid(1)

shmop.2
    Michael Kerrisk  [Peter Schiffer]
        ERRORS: Add EIDRM
            Taken from Red Hat downstream patch

sigaction.2
makecontext.3
    Michael Kerrisk
        Change getcontext/setcontext page ref to Section 3

signal.2
    Michael Kerrisk  [Reuben Thomas]
        Clarify System V vs BSD semantics for signal()

syscalls.2
    Michael Kerrisk
        The list on this page is not just syscalls common to all platfo=
rms
    Michael Kerrisk
        Add perfctr(2)
        Add ppc_rtas(2)
    Michael Kerrisk
        Add kernel version number of utrap_install(2)

unimplemented.2
    Michael Kerrisk  [Peter Schiffer]
        Remove mention of kernel version number in DESCRIPTION

inet.3
    Michael Kerrisk  [Peter Schiffer]
        Fix error in EXAMPLE using inet_aton()
            See https://bugzilla.redhat.com/show_bug.cgi?id=3D837090
            Patch taken from Red Hat downstream.

posix_fallocate.3
    Michael Kerrisk
        SEE ALSO: add fallocate(1)

regex.3
    Reuben Thomas
        Clarify details of matching
            The first is that it's far from clear that the end points o=
f the
            complete string match are stored in the zero'th element of =
the
            regmatch_t array; secondly, the phrase "next largest substr=
ing
            match" is positively misleading, implying some sort of size
            ordering, whereas in fact they are ordered according to the=
ir
            appearance in the regex pattern.

scanf.3
    Michael Kerrisk
        Clarify meaning of "string conversions" for 'm' modifier
    Mike Frysinger
        Update %a vs %m documentation
            POSIX.1-2008 adopted the 'm' flag for dynamic allocation. U=
pdate
            page to cover it and relegate the glibc-specific 'a' flag t=
o
            NOTES.

strtol.3
    Michael Kerrisk  [Peter Schiffer]
        Replace some bogus text about "thousands separator"
            See https://bugzilla.redhat.com/show_bug.cgi?id=3D652870

sysconf.3
    Michael Kerrisk  [Peter Schiffer]
        Use "_SC_PAGESIZE" consistently on page
            s/_SC_PAGE_SIZE/_SC_PAGESIZE/ in one instance.
            From Red Hat downstream patch.

nscd.conf.5
    Peter Schiffer
        Add max-db-size and auto-propagate descriptions, default values=
, + misc
             * added missing valid services (services and netgroup)
             * added many default values for options
             * reordered options according to the nscd.conf file
               (logical order)
             * added 2 missing options: max-db-size and auto-propagate

nsswitch.conf.5
    Peter Schiffer
        Mention initgroups db

proc.5
    Michael Kerrisk
        Document /proc/profile
    Michael Kerrisk  [Peter Schiffer]
        Update /proc/sys/fs/file-nr to include Linux 2.6 details
    Michael Kerrisk
        Clarify relationship between file-max and file-nr
            The third value in /proc/sys/fs/file-nr is the same as
            the value in /proc/sys/fs/file-max.
    Michael Kerrisk
        Note message written to kernel log when file-max limit is hit
            Info from Documentation/sysctl/fs.txt.
    Michael Kerrisk
        Mention lscpu(1) under discussion of /proc/cpuinfo

resolv.conf.5
    Michael Kerrisk  [Peter Schiffer]
        Document "single-request-reopen" option
            Taken from Red Hat downstream patch

            See https://bugzilla.redhat.com/show_bug.cgi?id=3D717770
            See http://thread.gmane.org/gmane.linux.man/3161

utmp.5
    Michael Kerrisk
        SEE ALSO: add utmpdump(1)

cpuset.7
    Simon Paillard
        Add missing 'cpuset.' prefix for some flags
            See kernel commit e21a05cb408bb9f244f11a0813d4b355dad0822e

svipc.7
    Michael Kerrisk
        SEE ALSO: add ipcmk(1), ipcrm(1), ipcs(1)

termio.7
    Michael Kerrisk
        SEE ALSO: add reset(1), setterm(1), stty(1), tty(4)

ld.so.8
    Michael Kerrisk  [Peter Schiffer]
        LD_VERBOSE does not work with ld.so --list and --verify
            From Red Hat downstream patch

            See https://bugzilla.redhat.com/show_bug.cgi?id=3D532629
    Michael Kerrisk
        SEE ALSO: add sln(8)

zdump.8
    Michael Kerrisk  [Peter Schiffer]
        Bring up to date with zdump --help
            Patch taken from Red Hat downstream.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
