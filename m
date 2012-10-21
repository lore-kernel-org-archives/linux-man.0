From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.43 released
Date: Sun, 21 Oct 2012 08:40:07 +0200
Message-ID: <CAKgNAkg97BUx=bzmbSA+zTfJRR3=Z3Q2rDZ80+YL-s+DxLycnw@mail.gmail.com>
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

    man-pages-3.43.tar.gz - man pages for Linux

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    http://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.43

A short summary of the release is blogged at:
linux-man-pages.blogspot.com/2012/10/man-pages-343-is-released.html

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
 man-pages-3.43 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2012-10-05, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Anatoli Klassen <anatoli-onJMq2Hob96sTnJN9+BGXg@public.gmane.org>
Andreas Schwab <schwab-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
=46lorian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
=46r=E9d=E9ric Bri=E8re <fbriere-N2t/G/wdcyfR7s880joybQ@public.gmane.org>
=46redrik Arnerup <arnerup-UNjuZkX4dYU@public.gmane.org>
Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Jan Engelhardt <jengelh-9+2X+4sQBs8@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Simon Josefsson <simon-RTwAkxXyIg6Ei8DpZVb4nw@public.gmane.org>
Stephane Fillod <fillods-iA+eEnwkJgzk1uMJSBkQmQ@public.gmane.org>
Trevor Woerner <twoerner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>

Apologies if I missed anyone!


Newly documented interfaces in existing pages
---------------------------------------------

getenv.3
    Michael Kerrisk  [Florian Weimer, Andreas Schwab]
        Document secure_getenv(3)


New and changed links
---------------------

phys.2
    Michael Kerrisk
        New link to unimplemented.2

secure_getenv.3
    Michael Kerrisk
        New link to getenv.3


Global changes
--------------

Various pages
    Michael Kerrisk
        Global fix: s/-/\\-/ when real hyphen is required (e.g., in cod=
e)

Various pages
    David Pr=E9vot [Michael Kerrisk]
        Global fix: Various consistency fixes for SEE ALSO

Various pages
    Michael Kerrisk
        Global fix: use "Linux kernel source" consistently
            Rather than "kernel source".

Various pages
    Michael Kerrisk
        Global fix: disable justification and hyphenation in SEE ALSO
            For a better visual result, disable justification and hyphe=
nation
            in SEE ALSO where page names are long.

syscalls.2
uname.2
boot.7
    Michael Kerrisk
        Global fix: s/OS/operating system/


Changes to individual pages
---------------------------

epoll_wait.2
    Michael Kerrisk  [Fredrik Arnerup]
        Describe timeout limitation in kernels < 2.6.37
            As reported by Fredrik (and as far as I can tell the proble=
m
            went back to 2.6.0):

            The timeout argument has an upper limit. Any values above t=
hat
            limit are treated the same as -1, i.e. to wait indefinitely=
=2E
            The limit is given by:

                #define EP_MAX_MSTIMEO min(1000ULL *
MAX_SCHEDULE_TIMEOUT / HZ, \
                (LONG_MAX - 999ULL) / HZ)

            That is, the limit depends on the size of a long and the ti=
mer
            frequency.  Assuming the a long is never smaller than 32 bi=
ts
            and HZ never larger than 1000, the worst case is 35 minutes=
=2E
            I think this should be mentioned under "BUGS".

            Although this is likely to be fixed in the future
            (http://lkml.org/lkml/2010/8/8/144), the problem exists in
            at least 2.6.14 - 2.6.35. I don't know if select(2) and pol=
l(2)
            are affected.

            https://bugzilla.kernel.org/show_bug.cgi?id=3D20762
    Michael Kerrisk
        Add pointer to select(2) for discussion of close in another thr=
ead

getitimer.2
    Michael Kerrisk  [Trevor Woerner]
        Note Linux's odd handling of the new_value=3D=3DNULL case
    Michael Kerrisk  [Trevor Woerner]
        Fix types used to declare fields in timeval struct

keyctl.2
    David Pr=E9vot
        Reorder SEE ALSO, without .br

poll.2
    Michael Kerrisk
        Add pointer to select(2) for discussion of close in another thr=
ead

select.2
    Michael Kerrisk  [Stephane Fillod]
        Note behavior if monitored file descriptor is closed in another=
 thread
            Executive summary: a sane application can't rely on any
            particular behavior if another thread closes a file descrip=
tor
            being monitored by select().

            See https://bugzilla.kernel.org/show_bug.cgi?id=3D40852
    Michael Kerrisk
        Clarify equivalent pselect() code in terms of threads
            s/sigprogmask/pthread_sigmask/

semop.2
    Michael Kerrisk
        Recast discussion of blocking behavior in terms of threads
            semop() blocks the calling thread, not the process.
    Michael Kerrisk
        SEE ALSO: Add clone(2)
            Give reader a clue about CLONE_SYSVSEM.

shutdown.2
    Michael Kerrisk  [Eric Dumazet]
        Document EINVAL error (and associated bug)
            Eric Dumazet noted that EINVAL was not documented. Some fur=
ther
            digging shows that it's also not diagnosed consistently.
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D47111.

sigaction.2
    Michael Kerrisk
        Tweak SA_RESETHAND description

timer_settime.2
    Michael Kerrisk
        Small rewording around discussion of pointer arguments

wait4.2
    Adrian Bunk
        Note that these functions are nonstandard and recommend alterna=
tives
            Some edits to Adrian's patch by mtk.
    Michael Kerrisk
        CONFORMING TO: Note SUS details for wait3()

gnu_get_libc_version.3
    Michael Kerrisk
        Remove unneeded "#define _GNU_SOURCE" from SYNOPSIS

pthread_kill.3
pthread_sigqueue.3
    Michael Kerrisk
        Remove wording "another"
            Writing "another thread" in these pages implies that these
            functions can't be used to send a signal to the calling thr=
ead
            itself, which is of course untrue.

sigvec.3
    Michael Kerrisk
        Add "int" arg to sv_handler definition in sigvec structure
    Michael Kerrisk
        Fix small error in discussion of blocking of signals
            The signal that causes the handler to be invoked is blocked=
,
            but saying "by default" implies that this can be changed vi=
a
            the API. It cannot. (One needs sigaction(2) for that.)

syslog.3
    Simon Josefsson
        Remove (apparently bogus) text claiming LOG_AUTH is deprecated
            LOG_AUTH is in POSIX, and widely available. There
            seems to be no basis to the claim it is deprecated.

            Quoting Simon:
                I cannot find any other source that claim LOG_AUTH is
                deprecated in any way.  LOG_AUTH is distinct from
                LOG_AUTHPRIV.  The GNU C Library manual only documents
                LOG_AUTH.  The header files contains both without any
                comment.  Common systems like Debian appear to refer to
                both auth and authpriv facilities in syslog configurati=
ons.
                Popular daemons appear to use both facilities.
                Both facilities are discussed in several RFCs.

            See https://bugzilla.kernel.org/show_bug.cgi?id=3D46091

ttyname.3
    Michael Kerrisk
        SEE ALSO: Add ctermid(3)

proc.5
    Michael Kerrisk
        Clarify header file related to 'flags' field of /proc/PID/stat
    Michael Kerrisk  [Fr=E9d=E9ric Bri=E8re]
        Update description of 'starttime' field of /proc/PID/stat
            The unit of measurement changed from jiffies to clock ticks=
 in
            Linux 2.6.

            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D6758=
91
    Michael Kerrisk
        Document /proc/sys/kernel/kptr_restrict
    Michael Kerrisk [Kees Cook]
        Document /proc/sys/fs/protected_symlinks
            Based on text in Documentation/sysctl/fs.txt by Kees Cook
    Michael Kerrisk [Kees Cook]
        Document /proc/sys/fs/protected_hardlinks
            Based on text in Documentation/sysctl/fs.txt by Kees Cook

capabilities.7
    Michael Kerrisk
        Document interaction of CAP_SYSLOG and /proc/sys/kernel/kptr_re=
strict

ip.7
    Michael Kerrisk
        SEE ALSO: Add ipv6(7)
        SEE ALSO: Add icmp(7)

man-pages.7
    Michael Kerrisk
        Add some advice about disabling hyphenation in SEE ALSO

ld.so.8
    Michael Kerrisk
        Describe interpretation of slashes in dependency strings
    Michael Kerrisk
        Repeat note that LD_LIBRARY_PATH is ignored in privileged progr=
ams
            This point is already noted when discussing search order fo=
r
            libraries, but it's worth repeating under the specific disc=
ussion
            of LD_LIBRARY_PATH further down the page.
    Michael Kerrisk
        Add some details for LD_PRELOAD
        Note that LD_PRELOAD list separator can be space or colon

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
