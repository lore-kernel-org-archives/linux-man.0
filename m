From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-4.04 released
Date: Tue, 29 Dec 2015 17:02:45 +0100
Message-ID: <5682AEA5.8010701@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

    man-pages-4.04 - man pages for Linux

This release includes input and contributions from
over 30 people.

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_4.04

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2015/12/man-pages-404-is-released.h=
tml

The current version of the pages is browsable at:
http://man7.org/linux/man-pages/

You are receiving this message either because:

a) You contributed to the content of this release.

b) You are subscribed to linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org or
   libc-alpha-9JcytcrH/bBqeNgBaj97IQ@public.gmane.org

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
 man-pages-4.04 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2015-12-29, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Alexander Monakov <amonakov-ufN2psIa012HXe+LvDLADg@public.gmane.org>
Andries E. Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Archie Cobbs <archie.cobbs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Colin Rice <colin-fMnICKt8gSXR7s880joybQ@public.gmane.org>
Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Davidlohr Bueso <dave-h16yJtLeMjHk1uMJSBkQmQ@public.gmane.org>
Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Eric B Munson <emunson-JqFfY2XvxFXQT0dZR+AlfA@public.gmane.org>
Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
H.J. Lu <hjl.tools-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Jonathan Wakely <jwakely-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>
Mathieu Desnoyers <mathieu.desnoyers-vg+e7yoeK/dWk0Htik3J/w@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Michal Hocko <mhocko-IBi9RG/b67k@public.gmane.org>
Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
P=C3=A1draig Brady <P@draigBrady.com>
Paul Eggert <eggert-764C0pRuGfqVc3sceRu5cw@public.gmane.org>
Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Phil Blundell <pb-MHJFCCCcTeg@public.gmane.org>
Richard Voigt <richardvoigt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>
Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Tom Gundersen <teg-B22kvLQNl6c@public.gmane.org>
Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Vincent Lefevre <vincent-buymaDBGzMOsTnJN9+BGXg@public.gmane.org>
Vlastimil Babka <vbabka-AlSwsSmVLrQ@public.gmane.org>
Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>
Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org>


Apologies if I missed anyone!


New and rewritten pages
-----------------------

futex.2
    Michael Kerrisk, Thomas Gleixner, Torvald Riegel  [Davidlohr Bueso,=
 Heinrich Schuchardt, Darren Hart, Rusty Russell, Pavel Machek, Rich Fe=
lker]
        Rewrite and massively expand page

membarrier.2
    Mathieu Desnoyers  [Michael Kerrisk]
        New page documenting membarrier() system call


Newly documented interfaces in existing pages
---------------------------------------------

mlock.2
    Eric B Munson  [Michal Hocko, Vlastimil Babka, Michael Kerrisk]
        Document mlock2(2) and MCL_ONFAULT


New and changed links
---------------------

mlock2.2
    Eric B Munson
        New link to mlock.2


Global changes
--------------

Various pages
    Michael Kerrisk
        ERRORS: standardize text for EMFILE error

Various pages
    Michael Kerrisk
        ERRORS: standardize error text for ENOTSOCK error

Various pages
    Michael Kerrisk
        ERRORS: standardize text for ENFILE error


Changes to individual pages
---------------------------

clock_getres.2
    Michael Kerrisk
        SEE ALSO: add vdso(7)

epoll_create.2
    Michael Kerrisk
        ERRORS: add another EMFILE error case

fanotify_init.2
    Michael Kerrisk
        ERRORS: add an EMFILE error case

fork.2
    Michael Kerrisk
        Child of MT-process is restricted to async-signal-safe function=
s

getcpu.2
    Michael Kerrisk
        SEE ALSO: add vdso(7)

getrlimit.2
    Michael Kerrisk  [Lennart Poettering]
        The init of measurement for RLIMIT_RSS is bytes, not pages

get_robust_list.2
    Michael Kerrisk
        Reword EINVAL error text

gettimeofday.2
    Carlos O'Donell
        Expand on the historical meaning of tz_dsttime
    Michael Kerrisk
        SEE ALSO: add vdso(7)

inotify_init.2
    Michael Kerrisk
        ERRORS: add an EMFILE error case

personality.2
    Dmitry V. Levin
        Note kernel and glibc versions that introduced this system call

poll.2
    Richard Voigt
        timeout_ts is a pointer, so use -> not . for member access
    Michael Kerrisk
        Shorten name of timeout argument for ppoll()
            The name is overly long, and does not hint at the fact
            that this argument is a pointer. Fix this by renaming:
            s/timeout_ts/tmo_p/

sendfile.2
    Laurent Georget
        Document more ERRORS

sigreturn.2
    Michael Kerrisk
        SEE ALSO: add vdso(7)

socketcall.2
    Michael Kerrisk
        Since Linux 4.3, x86-32 provides direct system calls for the so=
ckets API

time.2
    Zack Weinberg
        Explain why the glibc time() wrapper never sets 'errno'
    Michael Kerrisk  [H.J. Lu]
        Where time() is provided by vDSO, an invalid address may give S=
IGSEGV
    Michael Kerrisk  [Paul Eggert]
        Describe EOVERFLOW details
    Michael Kerrisk
        SEE ALSO: add vdso(7)
    Michael Kerrisk
        Rename 't' argument to 'tloc'

dlerror.3
    Michael Kerrisk  [Jonny Grant]
        Clarify that the string returned by dlerror() is null terminate=
d

dlopen.3
    Michael Kerrisk
        Include a shell session showing build/run in EXAMPLE
    Michael Kerrisk
        Change arguments to main() to "void" in EXAMPLE

drand48.3
    Michael Kerrisk  [Vincent Lefevre]
        Correct descriptions of ranges returned by these functions
            See http://bugs.debian.org/803459

errno.3
    Michael Kerrisk
        Note probable cause of ENFILE error

fnmatch.3
    P=C3=A1draig Brady
        Describe the FNM_EXTMATCH flag and pattern syntax

iconv.3
    Andries E. Brouwer
        NOTES: describe correct usage for flushing partially buffered i=
nput

random_r.3
    Michael Kerrisk  [Archie Cobbs]
        Clarify need to use initstate_r()

tzset.3
    Carlos O'Donell
        Clarify "daylight" and remove erroneous note

random.4
    Michael Kerrisk  [Tom Gundersen]
        Rework example scripts to assume 'poolsize' unit is bits, not b=
ytes
    Michael Kerrisk  [Walter Harms]
        Use modern command substitution syntax in shell session log

proc.5
    Michael Kerrisk
        Reaching /proc/sys/fs/file-max limit normally produces an ENFIL=
E error

futex.7
    Heinrich Schuchardt
        SEE ALSO updates
    Michael Kerrisk
        Note some other locking primitives that are built with futexes
    Heinrich Schuchardt
        NPTL, avoid abbreviation
    Michael Kerrisk
        Note that a futex is 4 bytes on all platforms

vdso.7
    Michael Kerrisk
        Add note on strace(1) and vDSO

ld.so.8
    H.J. Lu [Michael Kerrisk]
        Document LD_PREFER_MAP_32BIT_EXEC
    Michael Kerrisk
        Clarify setting of LD_BIND_NOT
    Michael Kerrisk
        Clarify setting of LD_DYNAMIC_WEAK
    Michael Kerrisk
        Clarify setting of LD_TRACE_PRELINKING
    Michael Kerrisk
        Clarify some details for LD_SHOW_AUXV

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
