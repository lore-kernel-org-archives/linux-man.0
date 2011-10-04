From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.35 released
Date: Tue, 4 Oct 2011 19:25:29 +0200
Message-ID: <CAKgNAkjkWi_p41M1uPbzFytoELmkZjwkRdHYUuXK=MZniWXOeQ@mail.gmail.com>
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

   man-pages-3.35.tar.gz - man pages for Linux

=46or the moment, the release artifacts are remain different locations
than usual (and some of these changes may become permanent):

This release tarball is available for download at:

   http://man7.org/linux/man-pages/download/

The online changelog is available at
http://man7.org/linux/man-pages/changelog.html#release_3.35 (blogged at
http://linux-man-pages.blogspot.com/2011/10/man-pages-335-is-released.h=
tml
) and the current version of the pages is browsable at
http://man7.org/linux/man-pages/

A git repository for man-pages can be found on github. You can clone
the repository with the command:

  git clone https://github.com/mkerrisk/man-pages.git

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
 man-pages-3.35 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2011-10-04, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes and ideas that have been
incorporated in changes in this release:

Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Eric W. Biederman <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Kevin Lyda <kevin-lVvlXWpnww44d9/VWYMlNA@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

recvmmsg.2
    Andi Kleen, Michael Kerrisk
        New man page for recvmmsg(2)

setns.2
    Eric W. Biederman
        New manual page for setns(2)
    Michael Kerrisk
        Various improvements


Global changes
--------------

Various pages
    Michael Kerrisk
        Global fix: remove spaces around em-dash
            Normal English typographical convention is not to have
            spaces around em dashes.

Various pages
    Michael Kerrisk
        Global fix: s/null pointer/NULL pointer/

Various pages
    Michael Kerrisk
        Global fix: use ORing
            Use "ORing", not "OR'ing", nor an italic ".IR OR ing".

Various pages
    Michael Kerrisk
        Global fix: consistent use of "null wide character"
            Bring more consistency to the discussion of
            "[terminating] null wide character"
            by writing (at least in the initial use in a page)
            "[terminating] null wide character (L'\0')".

Various pages
    Michael Kerrisk
        Global fix: consistent use of "null byte"
            Bring more consistency to the discussion of
            "[terminating] null byte"
            by writing (at least in the initial use in a page)
            "[terminating] null byte ('\0')".

mount.2, prctl.2
    Michael Kerrisk
        s/task/thread/ for consistency with other pages


Changes to individual pages
---------------------------

lseek.2
    Guillem Jover
        CONFORMING TO: Note other systems that have SEEK_HOLE+SEEK_DATA

recv.2
    Michael Kerrisk
        Add mention of recvmmsg(2)

recvmmsg.2
    Michael Kerrisk
        SEE ALSO: add sendmmsg(2)

send.2
    Michael Kerrisk
        CONFORMING TO: POSIX.1-2008 adds MSG_NOSIGNAL

sigwaitinfo.2
    Michael Kerrisk
        Note that attempts to wait for SIGKILL and SIGSTOP are silently=
 ignored

stat.2
    Michael Kerrisk
        Note POSIX.1-2001 and POSIX.1-2008 requirements for lstat()
    Michael Kerrisk
        Regarding automounter action, add a reference to fstatat(2)
    Michael Kerrisk
        Clean up text describing which POSIX describes S_IF* constants

aio_cancel.3
    Michael Kerrisk  [Jon Grant]
        Clarify meaning of "return status" and "error status"

gets.3
    Michael Kerrisk
        POSIX.1-2008 marks gets() obsolescent
            The page formerly erroneously stated that POSIX.1-2008
            removed the specification of this function.

mbsnrtowcs.3
    Michael Kerrisk
        CONFORMING TO: Add POSIX.1-2008
            This function is specified in the POSIX.1-2008 revision.
regex.3
    Michael Kerrisk  [Reuben Thomas]
        Change "terminating null" to "terminating null byte"

stpcpy.3
stpncpy.3
    Mike Frysinger
        Note that these functions are in POSIX.1-2008
            Update the "CONFORMING TO" sections of these functions to
            note that they are now part of the POSIX.1-2008 standard.

stpncpy.3
    Michael Kerrisk
        Change "terminating null" to "terminating null byte"

strcpy.3
    Mike Frysinger
        SEE ALSO: Add stpncpy(3)

strdup.3
    Michael Kerrisk
        CONFORMING TO: strndup() is in POSIX.1-2008

wcpcpy.3
wcpncpy.3
wcsnlen.3
wcsnrtombs.3
    Michael Kerrisk
        CONFORMING TO: Add POSIX.1-2008
            These functions are specified in the POSIX.1-2008 revision.

proc.5
    Eric W. Biederman
        Document /proc/[pid]/ns/
    Michael Kerrisk
        Some edit's to Eric Biederman's /proc/[pid]/ns/ additions

capabilities.7
    Michael Kerrisk
        List setns(2) as an operation allowed by CAP_SYS_ADMIN


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
