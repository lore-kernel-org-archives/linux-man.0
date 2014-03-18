From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.63 released
Date: Tue, 18 Mar 2014 17:52:02 +0100
Message-ID: <532879B2.3090809@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

    man-pages-3.63 - man pages for Linux

He also proudly announces that man-pages recently passed
10,000 commits since he took over as maintainer in 2004
(https://plus.google.com/u/0/+MichaelKerrisk/posts/SVH47FGnQCN ).


Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.63

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2014/03/man-pages-363-is-released.html

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

==================== Changes in man-pages-3.63 ====================

Released: 2014-03-18, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Corrado Zoccolo <czoccolo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Gregory P. Smith <gps-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Joseph S. Myers <joseph-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Phillip Susi <psusi-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Robert P. J. Day <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Zhu Yanhai <zhu.yanhai-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

duplocale.3
    Michael Kerrisk
        New page documenting duplocale(3)

newlocale.3
    Michael Kerrisk  [Mike Frysinger]
        New page documenting newlocale(3) and freelocale(3)

towlower.3
    Michael Kerrisk
        Largely rewrite description of towlower() to be simpler and clearer

towupper.3
    Michael Kerrisk
        Largely rewrite description of towupper() to be simpler and clearer

uselocale.3
    Michael Kerrisk
        New page documenting uselocale(3)


Newly documented interfaces in existing pages
---------------------------------------------

open.2
    Michael Kerrisk
        Document O_DSYNC and rewrite discussion of O_SYNC

isalpha.3
    Michael Kerrisk
        Document the "_l" locale APIs
            The GNU C library v2.3 added some locale APIs, most of which
            were later specified in POSIX.1-2008, namely:

                   isalnum_l()
                   isalpha_l()
                   isblank_l()
                   iscntrl_l()
                   isdigit_l()
                   isgraph_l()
                   islower_l()
                   isprint_l()
                   ispunct_l()
                   isspace_l()
                   isupper_l()
                   isxdigit_l()
                   isascii_l()

            Also update and correct various pieces in CONFORMING TO
            (and remove a few crufty old pieces there).

strerror.3
    Michael Kerrisk
        Document strerror_l()

toupper.3
    Michael Kerrisk
        Document toupper_l() and tolower_l()

towlower.3
    Michael Kerrisk
        Document towlower_l()

towupper.3
    Michael Kerrisk
        Document towupper_l()

proc.5
    Michael Kerrisk
        Document /proc/sys/kernel/random/uuid

locale.7
    Michael Kerrisk
        Document LC_ADDRESS
        Document LC_IDENTIFICATION
        Document LC_MEASUREMENT
        Document LC_NAME
        Document LC_PAPER
        Document LC_TELEPHONE


New and changed links
---------------------

freelocale.3
    Michael Kerrisk
        New link to new newlocale.3 page

isalnum_l.3
isascii_l.3
isblank_l.3
iscntrl_l.3
isdigit_l.3
isgraph_l.3
islower_l.3
isprint_l.3
ispunct_l.3
isspace_l.3
isupper_l.3
isxdigit_l.3
    Michael Kerrisk
        New links to isalpha.3

tolower_l.3
toupper_l.3
    Michael Kerrisk
        New links to toupper.3

towlower_l.3
    Michael Kerrisk
        New link to towlower.3

towupper_l.3
    Michael Kerrisk
        New link to towupper.3


Global changes
--------------

Various pages
    Michael Kerrisk
        Global change: "upper case" ==> "uppercase", "lower case" ==> lowercase"


Changes to individual pages
---------------------------

mount.2
    Michael Kerrisk
        SEE ALSO: add blkid(1)

msgop.2
    Michael Kerrisk
        Document two MSG_COPY failure modes
            Since Linux 3.14, the kernel now diagnoses two errors
            when using msgrcv() MSG_COPY:
            * MSG_COPY must be specified with IPC_NOWAIT
            * MSG_COPY can't be specified with MSG_EXCEPT

open.2
    Michael Kerrisk
        Organize some material under additional subheadings in NOTES
            There's an amorphous mass of material under NOTES.  Structure
            it with some subheadings, and do a little reorganizing.
    Michael Kerrisk
        Add other system calls and functions that are like openat()
            fanotify_mark(2), name_to_handle_at(2), and scandirat(3) have a
            directory file descriptor argument for the same reason as openat().
            Also: reword the rationale for the *at() functions somewhat.
    Michael Kerrisk
        Clarify ELOOP error interaction with O_PATH

readahead.2
    Phillip Susi  [Corrado Zoccolo, Gregory P. Smith, Zhu Yanhai, Michael Kerrisk, Christoph Hellwig]
        Don't claim the call blocks until all data has been read
            The readahead(2) man page was claiming that the call blocks until
            all data has been read into the cache.  This is incorrect.

            See https://bugzilla.kernel.org/show_bug.cgi?id=54271

stat.2
    Michael Kerrisk
        SEE ALSO: add ls(1) and stat(1)

fts.3
    Christoph Hellwig  [Michael Kerrisk]
        The fts(3) API does not work with LFS builds
            As pointed out during a recent discussion on libc-hacker the
            fts(3) APIs can't be used with large file offsets:

                https://sourceware.org/bugzilla/show_bug.cgi?id=15838

mbrtowc.3
mbsnrtowcs.3
mbsrtowcs.3
mbtowc.3
    Michael Kerrisk
        Add entries in SEE ALSO
            Mainly inspired by the POSIX pages.

mbsinit.3
    Michael Kerrisk
        SEE ALSO: add mbrlen(3), mbrtowc(3), and wcrtomb(3)

mbsrtowcs.3
wcsrtombs.3
    Michael Kerrisk
        SEE ALSO: add mbsinit(3)

mbstowcs.3
    Michael Kerrisk  [Stefan Puiu]
        Add example program
            And add some SEE ALSO entries

memcmp.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function memcmp() is thread safe.

memcpy.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function memcpy() is thread safe.

memfrob.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function memfrob() is thread safe.

memmem.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function memmem() is thread safe.

memmove.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function memmove() is thread safe.

mempcpy.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions mempcpy() and wmempcpy() are thread safe.

memset.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function memset() is thread safe.

strerror.3
    Michael Kerrisk
        CONFORMING TO: strerror() and strerror_r() are in POSIX.1-2008
    Michael Kerrisk
        Add SS heading for strerror_r()

toupper.3
    Michael Kerrisk
        Rewrite to more explicitly bring locales into the discussion
    Michael Kerrisk
        Retitle BUGS section to NOTES
            These are not really bugs, just background info.

wcrtomb.3
wcsnrtombs.3
wcsrtombs.3
wcstombs.3
wctomb.3
    Michael Kerrisk
        SEE ALSO: add various entries
            Mainly inspired by POSIX

core.5
    Mike Frysinger  [Michael Kerrisk]
        Document core_pattern %d specifier
        Document %P core_pattern specifier
    Michael Kerrisk
        Rearrange core_pattern specifiers alphabetically

locale.5
    Michael Kerrisk
        SEE ALSO: add newlocale(3) + duplocale(3)

feature_test_macros.7
    Michael Kerrisk  [Joseph S. Myers]
        Remove mention of bogus _ISOC95_SOURCE macro
            The _ISOC95_SOURCE macro is defined in <features.h>, but it
            does nothing. So remove discussion of it, and move some of
            the discussion of C95 under the ISOC99_SOURCE subhead.
    Michael Kerrisk  [Carlos O'Donell]
        Add packaging note for _BSD_SOURCE/_SVID_SOURCE/_DEFAULT_SOURCE
            To compile warning-free across glibc < 2.20 and glibc >= 2.20
            code may been to define both _DEFAULT_SOURCE and either
            _BSD_SOURCE or _SVID_SOURCE.
    Michael Kerrisk
        Reword description of C90

locale.7
    Michael Kerrisk
        Add subsection on POSIX.1-2008 (originally GNU) extensions to locale API
    Michael Kerrisk
        Remove reference to LI18NUX2000
            LI18NUX2000 is difficult to even find these days, and in any case
            this page does not document gettext(), so notes about gettext()
            in the CONFORMING TO section here make no sense.
    Michael Kerrisk
        SEE ALSO: add mbstowcs(3) and wcstombs(3)
        SEE ALSO: add newlocale(3) + duplocale(3)

man-pages.7
    Michael Kerrisk
        Add preferred term "superblock"
    Michael Kerrisk
        Add preferred terms "uppercase" and "lowercase"

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
