From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.48 released
Date: Tue, 12 Mar 2013 07:31:21 +0100
Message-ID: <CAKgNAkiFpHUW3KHem87Od+BY5XV9caUOnA68UJPO5jF_erNCpw@mail.gmail.com>
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

    man-pages-3.48 - man pages for Linux

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    http://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.48

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.de/2013/03/man-pages-348-is-released_12=
=2Ehtml

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
 man-pages-3.48 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2013-03-05, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Andrey Vagin <avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Aristeu Rozanski <aris-moeOTchvdi7YtjvyW6yDsg@public.gmane.org>
Colin Walters <walters-gPq2gbYjIk8dnm+yROfE0A@public.gmane.org>
Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Daniel P. Berrange <berrange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
D. Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Denys Vlasenko <vda.linux-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
=46lavio Leitner <fbl-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Graham Gower <graham.gower-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Ivana Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Kai Kunschke <kai-Qc2A93eMNZEdnm+yROfE0A@public.gmane.org>
Marcela Maslanova <mmaslano-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Marc Lehmann <debian-reportbug-zsXavz5zCAg@public.gmane.org>
Marshel Abraham <Marshel.Abraham-Mykyq1cwIDpWk0Htik3J/w@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Nathan Stratton Treadway <kernelbugs-a6y0ucgZPWpWk0Htik3J/w@public.gmane.org>
Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Simon Heimberg <simohe-y/QulLNSqklyDzI6CaY1VQ@public.gmane.org>
Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
T=F6r=F6k Edwin <edwintorok-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

getunwind.2
    Marcela Maslanova
        New page documenting getunwind(2)
            Taken from Red Hat downstream man pages set
    Michael Kerrisk
        Much rewriting
            Some text taken from arch/ia64/kernel/unwind.c.

perfmonctl.2
    Ivana Varekova
        New page documenting IA-64-specific perfmonctl(2)
            Taken from Red Hat downstream man pages
    Michael Kerrisk
        Rework discussion of PFM_CREATE_CONTEXT
        Add VERSIONS and CONFORMING TO
        Note that there is no glibc wrapper
        Remove PFM_CREATE_EVTSETS, PFM_DELETE_EVTSETS, PFM_GETINFO_EVTS=
ETS
            These don't exist, and it appears they never have.
        Fix argument types for PFM_WRITE_PMCS, PFM_WRITE_PMDS, PFM_READ=
_PMDS
            The types that were being used don't exist!
        Briefly document PFM_GET_FEATURES, PFM_DEBUG, PFM_GET_PMC_RESET=
_VAL

gai.conf.5
    Ulrich Drepper
        New page documenting gai.conf
            Taken from Red Hat downstream pages

nss.conf.5
    Ulrich Drepper
        New page describing nss.conf


Newly documented interfaces in existing pages
---------------------------------------------

clock_getres.2
    Cyril Hrubis
        Document CLOCK_REALTIME_COARSE and CLOCK_MONOTONIC_COARSE
    Cyril Hrubis
        Document CLOCK_BOOTTIME
    Michael Kerrisk
        Some improvements to CLOCK_BOOTTIME description

ptrace.2
    Denys Vlasenko
        Document PTRACE_GETREGSET, PTRACE_SETREGSET, PTRACE_SEIZE, and =
friends
            Document PTRACE_GETREGSET, PTRACE_SETREGSET,
            PTRACE_SEIZE, PTRACE_INTERRUPT, and PTRACE_LISTEN.


New and changed links
---------------------

fattach.2
fdetach.2
getmsg.2
isastream.2
putmsg.2
    Michael Kerrisk  [Peter Schiffer]
        New link to unimplemented.2
            Taken from Red Hat downstream.

            See https://bugzilla.redhat.com/show_bug.cgi?id=3D436407


Global changes
--------------

Many pages
    Michael Kerrisk
        Global fix: remove unneeded double quotes in .SH headings

Many pages
    Michael Kerrisk
        Global fix: remove unneeded double quotes in .SS headings

Many pages
    Michael Kerrisk
        Global fix: use consistent capitalization in .SS headings
            Capitalization in .SS sections across pages (and sometimes =
even
            within a single page) is wildly inconsistent. Make it consi=
stent.
            Capitalize first word in heading, but otherwise use lower c=
ase,
            except where English usage (e.g., proper nouns) or programm=
ing
            language requirements (e.g., identifier names) dictate othe=
rwise.
Many pages
    Michael Kerrisk  [Denys Vlasenko]
        Remove double blank lines in output

Various pages
    Michael Kerrisk
        Fix order of SH sections


Changes to individual pages
---------------------------

accept.2
    Michael Kerrisk
        NAME: Add "accept4"

access.2
    Colin Walters
        Note that access() may also fail for FUSE
            Since in some cases (e.g. libguestfs's guestmount) it also =
has the
            semantics where files can appear owned by root, but are act=
ually
            mutable by the user, despite what one might infer from the =
Unix
            permissions.

getpeername.2
    Michael Kerrisk  [Kai Kunschke]
        Clarify semantics of getpeername() for datagram sockets
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D6740=
34

getuid.2
    Michael Kerrisk
        Remove duplicate section heading

mmap.2
    Cyril Hrubis
        Add note about partial page in BUGS section
            This adds a note about Linux behavior with partial page at =
the end
            of the object. The problem here is that a page that contain=
s only
            part of a file (because the file size is not multiple of PA=
GE_SIZE)
            stays in page cache even after the mapping is unmapped and =
the file
            is closed. So if some process dirties such page, other mapp=
ings
            will see the changes rather than zeroes.
    Michael Kerrisk  [T=F6r=F6k Edwin]
        Some 'flags' values require a feature test macro to be defined
            Add text to NOTES noting that some MAP_* constants are
            defined only if a suitable feature test macro is defined.
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D5426=
01
    Cyril Hrubis
        Document EOVERFLOW error

open.2
    Michael Kerrisk
        Clarify list of file creation flags
            POSIX.1-2008 TC1 clarified this, so that O_CLOEXEC,
            O_DIRECTORY, and O_NOFOLLOW are also in this list.

prctl.2
    Cyrill Gorcunov
        Add some details for PR_GET_TID_ADDRESS

read.2
    Michael Kerrisk  [Zack Weinberg]
        Clarify interaction of count=3D=3D0 and error checking
            POSIX deliberately leaves this case open, so the man
            page should be less specific about what happens.

            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D5332=
32
    Michael Kerrisk  [Marc Lehmann]
        Remove crufty text about O_NONBLOCK on files
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D7005=
29
    Michael Kerrisk
        Clarify details for seekable files

unimplemented.2
    Michael Kerrisk  [Peter Schiffer]
        Add various STREAMS interfaces to NAME
            Taken from Red Hat downstream.

            See https://bugzilla.redhat.com/show_bug.cgi?id=3D436407

cexp2.3
    Michael Kerrisk
        Still does not exist in glibc 2.17

exit.3
    Michael Kerrisk
        Note that a call to execve() clears exit handler registrations

getaddrinfo.3
    Michael Kerrisk
        SEE ALSO: Add gai.conf(5)

malloc_trim.3
    Michael Kerrisk
        Remove duplicate section title

printf.3
    Marshel Abraham  [Graham Gower, Graham Gower]
        Fix error handling in example code
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D23282

pthread_yield.3
    Michael Kerrisk  [Aristeu Rozanski]
        Add _GNU_SOURCE feature test macro to SYNOPSIS

resolver.3
resolv.conf.5
    Michael Kerrisk  [Nathan Stratton Treadway, Simon Heimberg]
        RES_DEBUG is only available if glibc is compiled with debug sup=
port
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D6921=
36
            and https://bugzilla.kernel.org/show_bug.cgi?id=3D43061

strtol.3
    Michael Kerrisk  [Peter Schiffer]
        Remove crufty text from previous fix

core.5
    Michael Kerrisk
        Document CONFIG_COREDUMP

capabilities.7
    Andrey Vagin
        Nonexistent bits are no longer shown as set in /proc/PID/status=
 Cap*

inotify.7
    Michael Kerrisk
        A monitoring process can't easily distinguish events triggered =
by itself

ip.7
    Flavio Leitner  [Peter Schiffer]
        Improve explanation about calling listen() or connect()

man-pages.7
    Michael Kerrisk
        Describe rules for capitalization in .SS headings

rtnetlink.7
    Pavel Emelyanov
        Add info about ability to create links with given index
            Since kernel v3.7 the RTM_NEWLINK message now accepts nonze=
ro
            values in ifi_index field. Mention this fact in the respect=
ive
            rtnetlink.7 section.

socket.7
    Pavel Emelyanov
        SO_BINDTODEVICE is now readable
            SO_BINDTODEVICE is readable since since kernel 3.8.

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
