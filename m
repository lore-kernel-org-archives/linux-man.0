From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.45 released
Date: Sat, 22 Dec 2012 19:12:11 +0100
Message-ID: <CAKgNAki19O3jMM7D_ecqaNCL0hRH9SaCne77vAhYiSLxQ71SbQ@mail.gmail.com>
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

    man-pages-3.45.tar.gz - man pages for Linux

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    http://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.45

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2012/12/man-pages-345-is-released.h=
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
 man-pages-3.45 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2012-12-21, Christchurch


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Eric Dumazet <eric.dumazet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
=46elipe Pena <felipensp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
=46lorian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Gao Feng <gaofeng-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Jan Glauber <jang-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Jim Paris <jim-XrPbb/hENzg@public.gmane.org>
Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Julien Cristau <jcristau-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Rens van der Heijden <rens.vanderheijden-LOWaTC5DtXCELgA04lAiVw@public.gmane.org>
Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Thierry Vignaud <thierry.vignaud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Trevor Woerner <twoerner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
YOSHIFUJI Hideaki <yoshfuji-VfPWfsRibaP+Ru+s062T9g@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

s390_runtime_instr.2
    Jan Glauber
        New page for s390-specific s390_runtime_instr(2)

if_nameindex.3
    YOSHIFUJI Hideaki
        Document if_nameindex(3) and if_freenameindex(3)
    Michael Kerrisk
        Edits, improvements and corrections to Hideaki's page
    Michael Kerrisk
        Add an example program

if_nametoindex.3
    YOSHIFUJI Hideaki
        New page documenting if_nametoindex(3) and if_indextoname(3)


New and changed links
---------------------

if_freenameindex.3
    Michael Kerrisk
        New link to if_nameindex.3

if_indextoname.3
    Michael Kerrisk
        New link to if_nametoindex.3


Global changes
--------------

sysconf.3
cciss.4
    Michael Kerrisk
        Global fix: s/runtime/run time/


Changes to individual pages
---------------------------

clone.2
    Michael Kerrisk
        Since 2.6.30, CLONE_NEWIPC also supports POSIX message queues

delete_module.2
    Michael Kerrisk
        Small rewording of description of effect of O_TRUNC

getrlimit.2
    Michael Kerrisk  [Trevor Woerner]
        Document Linux's nonstandard treatment or RLIMIT_CPU soft limit
            Upon encountering the RLIMIT_CPU soft limit when a SIGXCPU =
handler
            has been installed, Linux invokes the signal handler *and* =
raises
            the soft limit by one second. This behavior repeats until t=
he
            limit is encountered.  No other implementation that I teste=
d
            (Solaris 10, FreeBSD 9.0, OpenBSD 5.0) does this, and it se=
ems
            unlikely to be POSIX-conformant. The (Linux-specific)
            RLIMIT_RTTIME soft limit exhibits similar behavior.
    Michael Kerrisk
        Point reader at discussion of /proc/[pid]/limits in proc(5)

io_getevents.2
    Michael Kerrisk
        io_getevents() may cause segfault when called with invalid ctx_=
id
            For reference see:
http://marc.info/?l=3Dlinux-aio&m=3D130089887002435&w=3D2

recv.2
    Michael Kerrisk  [Eric Dumazet]
        UNIX domain sockets support MSG_TRUNC since 3.4

sendmmsg.2
    Elie De Brauwer
        Add example program for sendmmsg()

stat.2
    Simon Paillard
        Clarify description of EOVERFLOW error
            The EOVERFLOW error is not only for st_size, but also
            inode and block size fields. See glibc source file
            sysdeps/unix/sysv/linux/xstatconv.c and kernel source
            file fs/stat.c. Also, fix bit/byte confusion
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D6049=
28

syscalls.2
    Michael Kerrisk
        Update various references to "i386" to "x86"
    Michael Kerrisk
        Add s390_runtime_instr(2)

sysctl.2
    Michael Kerrisk
        Mention CONFIG_SYSCTL_SYSCALL
    Michael Kerrisk
        Calls to sysctl() log warnings to the kernel log since 2.6.24

syslog.2
    Michael Kerrisk
        Substantially reorganize discussion of commands
            Make the layout of the discussion of the commands
            more readable.
    Michael Kerrisk
        Add kernel symbolic 'type' names
    Michael Kerrisk
        Clarify SYSLOG_ACTION_SIZE_UNREAD semantics
            SYSLOG_ACTION_SIZE_UNREAD returns the number of bytes
            available for reading via SYSLOG_ACTION_READ.
    Michael Kerrisk
        Clarify where SYSLOG_ACTION_READ_ALL places data it reads
    Michael Kerrisk
        Clarify semantics of SYSLOG_ACTION_CLEAR
            The SYSLOG_ACTION_CLEAR command (5) does not really clear
            the ring buffer; rather it affects the semantics of what
            is returned by commands 3 (SYSLOG_ACTION_READ_ALL) and
            4 (SYSLOG_ACTION_READ_CLEAR).
    Michael Kerrisk
        Clarify discussion of privileges for commands 3 and 10
    Michael Kerrisk
        Add mention of CONFIG_LOG_BUF_SHIFT

wait.2
    Michael Kerrisk
        BUGS: Document odd waitid() behavior when 'infop' is NULL

getifaddrs.3
    Michael Kerrisk  [Julien Cristau]
        Update description of ifa_data to Linux 2.6+ reality
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D5267=
78

memcmp.3
    Michael Kerrisk  [Jon Grant]
        Enhance RETURN VALUE text and remove redundant text from DESCRI=
PTION
            Note that sign of result equals sign of difference between
            first two bytes that differ (treated as "unsigned char")."

mkstemp.3
    Michael Kerrisk  [Florian Weimer]
        Deemphasize discussion of mode 066 in glibc 2.0.6
            Glibc 2.0.6 is now so ld that the discussion of details
            of that version can be deemphasized placing just under
            NOTES.

            See https://bugzilla.kernel.org/show_bug.cgi?id=3D51811

strcmp.3
    Michael Kerrisk  [Jon Grant]
        Enhance RETURN VALUE text and remove redundant text from DESCRI=
PTION
            Note that sign of result equals sign of difference between
            first two bytes that differ (treated as "unsigned char")."

ttyname.3
    Michael Kerrisk
        Fix confused text in ERRORS
            The existing text suggested that the ERRORS applied
            only for ttyname_r(). However, 2 of the 3 errors
            can occur for ttyname().

undocumented.3
    Michael Kerrisk
        Remove some now documented functions

proc.5
    Michael Kerrisk  [Jim Paris]
        Correct description of SwapFree in /proc/meminfo
    Michael Kerrisk
        Note change of /proc/[pid]/limits file permissions in 2.6.36

resolv.conf.5
    Simon Paillard
        Document IPv6 format for nameserver
            See: http://bugs.debian.org/610036

capabilities.7
    Michael Kerrisk  [Rens van der Heijden]
        Correct URL for POSIX.1e draft

ipv6.7
    Gao Feng
        Add description of getsockopt() for IPV6_MTU
            In IPv4,IP_MTU is only supported by getsockopt.
            In IPv6, we can use IPV6_MTU to set socket's MTU,
            but the return value of getsockopt() is the path MTU.

rtnetlink.7
    Michael Kerrisk  [Julien Cristau]
        Update description of IFLA_STATS to Linux 2.6+ reality
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D5267=
78

socket.7
    Michael Kerrisk  [YOSHIFUJI Hideaki]
        Document 'sockaddr' and 'sockaddr_storage' types
    Andi Kleen
        Explain effect of SO_SNDTIMEO for connect()
            When SO_SNDTIMEO is set before connect(), then connect()
            may return EWOULDBLOCK when the timeout fires.


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
