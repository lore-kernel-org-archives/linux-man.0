From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.62 released
Date: Wed, 12 Mar 2014 09:53:56 +0100
Message-ID: <532020A4.6040404@gmail.com>
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

    man-pages-3.62 - man pages for Linux

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.62

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2014/03/man-pages-362-is-released.html

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

==================== Changes in man-pages-3.62 ====================

Released: 2014-03-11, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Joseph S. Myers <joseph-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
Marius Gaubas <marius-PI1xv8u4z2FbJaZ9Qiajs9BPR1lH4CV8@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Rick Stanley <rstanley-PulMX1svUoYAvxtiuMwx3w@public.gmane.org>
Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

locale.1
    Michael Kerrisk [review from Mike Frysinger]
        New page describing locale(1)


Newly documented interfaces in existing pages
---------------------------------------------

locale.5
    Michael Kerrisk
        Document LC_ADDRESS
    Michael Kerrisk
        Document LC_IDENTIFICATION
    Michael Kerrisk
        Document LC_MEASUREMENT
    Michael Kerrisk
        Document LC_NAME
    Michael Kerrisk
        Document LC_PAPER
    Michael Kerrisk
        Document LC_TELEPHONE


Changes to individual pages
---------------------------

clone.2
    Michael Kerrisk
        Note that CLONE_THREAD also in effect requires CLONE_VM

stat.2
    Michael Kerrisk  [Marius Gaubas]
        Warn the reader that the 'stat' structure definition is not precise
            Padding fields aren't shown, and the order of fields varies
            somewhat across architectures.

gethostbyname.3
    Michael Kerrisk
        Remove redundant FTM requirements
            _GNU_SOURCE implies _SVID_SOURCE and _BSD_SOURCE, so

                _BSD_SOURCE || _SVID_SOURCE || _GNU_SOURCE

            is the same as

                _BSD_SOURCE || _SVID_SOURCE

getutmp.3
    Michael Kerrisk
        SEE ALSO: add utmpdump(1)

log1p.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions log1p(), log1pf() and log1pl() are thread safe.

logb.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions logb(), logbf() and logbl() are thread safe.

memccpy.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function memccpy() is thread safe.

memchr.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions memchr(), memrchr() and rawmemchr() are thread safe.

mktemp.3
    Michael Kerrisk
        Make warning not to use this function more prominent

qecvt.3
    Michael Kerrisk  [Joseph S. Myers]
        Recommend snprintf(3) not sprintf(3)

raise.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function raise() is thread safe.

remove.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function remove() is thread safe.

sem_destroy.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function sem_destroy() is thread safe.

sem_getvalue.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function sem_getvalue() is thread safe.

sem_init.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function sem_init() is thread safe.

sockatmark.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function sockatmark() is thread safe.

strcpy.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions strcpy() and strncpy() are thread safe.
    Michael Kerrisk  [Rick Stanley]
        Fix a bug, and improve discussion of forcing termination with strncpy()

strspn.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions strspn() and strcspn() are thread safe.

tempnam.3
    Michael Kerrisk
        Make warning not to use this function more prominent

tmpnam.3
    Michael Kerrisk
        Recommend use mkstemp(3) or tmpfile(3) instead

locale.5
    Michael Kerrisk
        Add intro section that lists all of the LC categories
    Michael Kerrisk
        'p_cs_precedes' is for *positive* values
    Michael Kerrisk
        Clarify 'p_sign_posn' and 'n_sign_posn'; simplify 'n_sign_posn'
            Add initial sentence for 'p_sign_posn' and 'n_sign_posn'.
            Remove repeated list for 'n_sign_posn'.
    Michael Kerrisk
        Document LC_MESSAGES 'yesstr' and 'nostr'
    Michael Kerrisk
        Clarify LC_MONETARY 'n_cs_precedes'
    Michael Kerrisk
        LC_MONETARY: Document 'int_p_sign_posn' and 'int_n_sign_posn'
    Michael Kerrisk
        Clarify/rework 'p_cs_precedes' and 'n_cs_precedes'
    Michael Kerrisk
        LC_MONETARY: document 'int_p_sep_by_space' and 'int_n_sep_by_space'
    Michael Kerrisk
        Remove crufty reference to POSIX.2
    Michael Kerrisk
        LC_MONETARY: document 'int_p_cs_precedes' and 'int_n_cs_precedes'
    Michael Kerrisk
        Clarify/simplify 'n_sep_by_space'
    Michael Kerrisk
        LC_TIME: document 'cal_direction' and 'date_fmt'
    Michael Kerrisk
        Clarify 'p_sep_by_space'

feature_test_macros.7
    Michael Kerrisk
        _BSD_SOURCE and _SVID_SOURCE are deprecated in glibc 2.20
    Michael Kerrisk
        _GNU_SOURCE implicitly defines other macros
            Saying that _GNU_SOURCE has the "effects of" other macros is not
            quite precise.
    Michael Kerrisk
        Reword glibc version for _ISOC95_SOURCE
    Michael Kerrisk
        _ISOC99_SOURCE also exposes C95 definitions
    Michael Kerrisk
        _ISOC11_SOURCE implies the effects of _ISOC99_SOURCE
    Michael Kerrisk
        Note version number for _POSIX_C_SOURCE >= 200112L implies C99/C95
            _POSIX_C_SOURCE >= 200112L causes C95 definitions to be
            exposed only since glibc 2.12 and C99 definitions only
            since 2.10.
    Michael Kerrisk
        _XOPEN_SOURCE may implicitly define _POSIX_SOURCE and _POSIX_C_SOURCE
    Michael Kerrisk
        Reword glibc version for _ISOC99_SOURCE
    Michael Kerrisk
        Rework discussion of _ISOC99_SOURCE
    Michael Kerrisk
        Improve discussion of _DEFAULT_SOURCE
    Michael Kerrisk
        _POSIX_C_SOURCE >= 200112L implies C95 and C95 features

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
