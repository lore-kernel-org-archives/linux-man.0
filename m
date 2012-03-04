From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.36 released
Date: Sun, 4 Mar 2012 22:49:46 +1300
Message-ID: <CAKgNAkj-m5Oqy6bKfOtPLmMjEMbfe6MPAPDC9u0NzGM3c7mk4Q@mail.gmail.com>
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

    man-pages-3.36.tar.gz - man pages for Linux

Tarball download:
    http://www.kernel.org/pub/linux/docs/man-pages/
Git repository:
    http://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.36

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2012/03/man-pages-336-is-released.h=
tml

The current version of the pages is browsable at:
http://man7.org/linux/man-pages/

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
 man-pages-3.36 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2012-02-27, Christchurch


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes and ideas that have been
incorporated in changes in this release:

Alain Benedetti <alainb06-GANU6spQydw@public.gmane.org>
carado <carado-kt3qwsSULN8dnm+yROfE0A@public.gmane.org>
Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Clemens Ladisch <clemens-P6GI/4k7KOmELgA04lAiVw@public.gmane.org>
David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Jessica McKellar <jesstess-3s7WtUTddSA@public.gmane.org>
Josef Bacik <josef-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Junjiro Okajima <jro-tWOvYICHQ+GTnpBtbRfDVg@public.gmane.org>
Lucian Adrian Grijincu <lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Pat Pannuto <pat.pannuto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Salvo Tomaselli <tiposchi-IWqWACnzNjyonA0d6jMUrA@public.gmane.org>
Simone Piccardi <piccardi-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org>
Slaven Rezic <srezic-2tp4v2XkOmPZJqsBc5GL+g@public.gmane.org>
starlight-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org
Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Vijay Rao <vijay-QlAidmRl/PGakBO8gow8eQ@public.gmane.org>
Walter Haidinger <walter.haidinger-RbZlAiThDcE@public.gmane.org>
Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>
Yang Yang <wdscxsj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

sendmmsg.2
    Michael Kerrisk  [Stephan Mueller]
        New page for sendmmsg(2)
            Some pieces inspired by an initial attempt by Stephan Muell=
er.


Newly documented interfaces in existing pages
---------------------------------------------

fallocate.2
    Lucian Adrian Grijincu
        Document FALLOC_FL_PUNCH_HOLE
            FALLOC_FL_PUNCH_HOLE was added in Linux 2.6.38,
            for punching holes in the allocated space in a file.


Changes to individual pages
---------------------------

dup.2
    Michael Kerrisk
        SYNOPSIS: Add "#include <fntl.h>" for O_* constants

fallocate.2
    Michael Kerrisk
        Substantial restructuring of DESCRIPTION
            The addition of a second class of operation ("hole punching=
")
            to the man page made it clear that some significant restruc=
turing
            is required. So I substantially reworked the page, includin=
g the
            preexisting material on the default "file allocation" opera=
tion.
    Michael Kerrisk  [Josef Bacik]
        Add further details for FALLOC_FL_PUNCH_HOLE
    Michael Kerrisk
        ERRORS: Add EPERM error case for FALLOC_FL_PUNCH_HOLE

fork.2
    Michael Kerrisk
        NOTES: Describe clone() call equivalent to fork()

fsync.2
    Christoph Hellwig
        Various improvements
            - explain the situation with disk caches better
            - remove the duplicate fdatasync() explanation in the NOTES
              section
            - remove an incorrect note about fsync() generally requirin=
g two
              writes
            - remove an obsolete ext2 example note
            - fsync() works on any file descriptor (doesn't need to be
              writable); correct the EBADF error code explanation
    Michael Kerrisk  [Guillem Jover]
        Note that some systems require a writable file descriptor
            An edited version of Guillem Jover's comments:
            [While the file descriptor does not need to be writable on =
Linux]
            that's not a safe portable assumption to make on POSIX in g=
eneral
            as that behavior is not specified and as such is
            implementation-specific. Some Unix systems do actually fail=
 on
            read-only file descriptors, for example [HP-UX and AIX].

mount.2
    Michael Kerrisk  [Junjiro Okajima]
        Removed erroneous statement about MS_RDONLY and bind mounts

open.2
    Jessica McKellar
        Fix grammar in O_DIRECT description
            Some small grammar fixes to the O_DIRECT description.

pipe.2
    Michael Kerrisk  [Salvo Tomaselli]
        SYNOPSIS: Add "#include <fntl.h>" for O_* constants
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D6597=
50

sched_rr_get_interval.2
    Clemens Ladisch
        Update notes on modifying quantum
            Since Linux 2.6.24, it is no longer possible to
            modify the SCHED_RR quantum using setpriority(2).
            (Slight edits to Clemens' patch by mtk.)
    Michael Kerrisk
        Reordered various pieces of text
    Michael Kerrisk
        Reworded text of ESRCH error

send.2
    Michael Kerrisk
        Add mention of sendmmsg(2)

sync.2
    Michael Kerrisk  [Simone Piccardi]
        PROTOTYPE: Fix return type of syncfs()

vfork.2
    Michael Kerrisk  [starlight-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org]
        Clarify what is duplicated in the child
            Add some words to make it clear to the reader that vfork(),
            like fork(), creates duplicates of process attributes
            in the child.
    Michael Kerrisk
        Note clone() flags equivalent to vfork()
    Michael Kerrisk  [starlight-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org, Mike Frysinger]
        Add some notes on reasons why vfork() still exists
    Michael Kerrisk  [starlight-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org]
        Clarify that calling *thread* is suspended during vfork()
    Michael Kerrisk
        CONFORMING TO: Note that POSIX.1-2001 marked vfork() obsolete

gets.3
    Michael Kerrisk
        Document C11 and glibc 2.16 changes affecting gets()

pthread_sigmask.3
    Michael Kerrisk  [Pat Pannuto]
        Fix comment that was inconsistent with code in example program

sem_wait.3
    Walter Harms
        EXAMPLE: Remove extraneous line of output from shell session

wcsnrtombs.3
wcsrtombs.3
wcstombs.3
    Michael Kerrisk
        Fix-ups for e9c23bc636426366d659809bc99cd84661e86464

core.5
    Michael Kerrisk  [Junjiro Okajima]
        Document %E specifier for core_pattern

passwd.5
    Michael Kerrisk  [Walter Haidinger]
        s/asterisk/asterisk (*)/ to improve clarity
    Michael Kerrisk
        Correct note on passwd field value when shadowing is enabled
            When password shadowing is enabled, the password field
            contains an 'x' (not "*').

proc.5
    Elie De Brauwer
        Fix description of fourth field of /proc/loadavg
            SIgned-off-by: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

resolv.conf.5
    Michael Kerrisk  [Slaven Rezic]
        Describe syntax used for comments
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D6569=
94

feature_test_macros.7
    Michael Kerrisk
        Document _ISOC11_SOURCE

inotify.7
    Michael Kerrisk  [Yang Yang]
        Note that 'cookie' field is set to zero when unused

man.7
    Michael Kerrisk
        Various fixes for description of NAME section
            As noted by reporter:
            * The code sample given for the NAME section is incomplete =
because
              the actual content sample is not given.
            * Additionally, the description assumes that the item descr=
ibed is
              a command, which need not be the case.
            * The command makewhatis is not present on my system; the
              documented tool to create the whatis database is called m=
andb.
            * The description on .SH NAME in man(7) should either copy =
the
              relevant paragraph of lexgrog(1) or refer to it.

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
