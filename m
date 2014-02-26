From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.61 released
Date: Wed, 26 Feb 2014 21:55:25 +0100
Message-ID: <530E54BD.6030202@gmail.com>
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

    man-pages-3.61 - man pages for Linux

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.61

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2014/02/man-pages-361-is-released.html

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


==================== Changes in man-pages-3.61 ====================

Released: 2014-02-26, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Andrew Hunter <ahh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Duncan de Wet <duncandewet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
KOSAKI Motohiro <kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sulaiman Mustafa <seininn-yx4YqRIVDag@public.gmane.org>
Xiawei Chen <chenxiawei-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

A note from Christoph Hellwig prompted me to perform a task that has
been queued for a while: merging the text of the man pages for the
*at([23]) ("directory file descriptor") APIs into their corresponding
traditional pages.  When the *at([23]) pages were originally written
(mostly in 2006), the APIs were not part of POSIX and (in most cases)
were not available on other systems. So, it made some sense to wall
them off into their own separate pages. Eight years later, with the
APIs now all in POSIX (except scandirat()), it is much more sensible
to document the newer APIs alongside their traditional counterparts,
so that the newer APIs are not "hidden", and the reader can more
easily see the differences between the APIs.

Thus, the text of 14 pairs of pages has been merged, and the "merged
from" pages have been converted to links to the "merged to" pages.
Along the way, a few other fixes were made to the pages, as noted
below.

One page that did not undergo such a change was utimensat(2), which
is different enough from utime(2) that it warrants a separate page.
Unlike the other *at() pages, the utimensat(2) page was also already
self-contained, rather than defining itself in terms of differences
from utime(2) as the other *at() pages did.

access.2
    Michael Kerrisk
        Merge text from faccessat(2)
    Michael Kerrisk
        Remove faccessat() race warning
            That point is already covered in existing text in this page.
    Michael Kerrisk
        access() also conforms to POSIX.1-2008

chmod.2
    Michael Kerrisk
        Merge text from fchmodat(2)
    Michael Kerrisk
        Use argument name 'pathname' throughout page
            (Some APIs were using 'path' while others used 'pathname')
    Michael Kerrisk
        CONFORMING TO: chmod() and fchmod() are also in POSIX.1-2008

chown.2
    Michael Kerrisk
        Merge text of fchownat(2)
    Michael Kerrisk
        AT_EMPTY_PATH is Linux-specific and requires _GNU_SOURCE
    Michael Kerrisk
        Use argument name 'pathname' throughout page
            (Some APIs were using 'path' while others used 'pathname')
    Michael Kerrisk
        Remove sentence that fchownat() is present on Solaris
            That point was only really relevant before fchownat() was
            standardized in POSIX.1.2008.
    Michael Kerrisk
        CONFORMING TO: chown(), fchown(), lchown() are in POSIX.1-2008

link.2
    Michael Kerrisk
        Merge text of linkat(2)
    Michael Kerrisk
        CONFORMING TO: link() is in POSIX.1-2008
    Michael Kerrisk
        AT_EMPTY_PATH is Linux-specific and requires _GNU_SOURCE

mkdir.2
    Michael Kerrisk
        Merge text of mkdirat(2)
    Michael Kerrisk
        CONFORMING TO: mkdir() is in POSIX.1-2008

mknod.2
    Michael Kerrisk
        Merge text of mknodat(2)
    Michael Kerrisk
        CONFORMING TO: mknod(2) is in POSIX.1-2008

open.2
    Michael Kerrisk
        Merge text from openat(2)
    Michael Kerrisk
        Remove sentence that openat() is present on Solaris
            That point was only really relevant before openat() was
            standardized in POSIX.1.2008.

readlink.2
    Michael Kerrisk
        Merge text of readlinkat(2)
    Michael Kerrisk
        CONFORMING TO: readlink() is in POSIX.1-2008.
    Michael Kerrisk
        Use argument name 'pathname' throughout page
            (Some APIs were using 'path' while others used 'pathname')

rename.2
    Michael Kerrisk
        Merge text of renameat(2)
    Michael Kerrisk
        CONFORMING TO: rename(2) is in POSIX.1-2008

stat.2
    Michael Kerrisk
        Merge text from fstatat(2)
    Michael Kerrisk
        AT_EMPTY_PATH and AT_NO_AUTOMOUNT are Linux-specific
            These flags require _GNU_SOURCE.
    Michael Kerrisk
        Use argument name 'pathname' throughout page
            (Some APIs were using 'path' while others used 'pathname')
    Michael Kerrisk
        Remove sentence that fstatat() is present on Solaris
            That point was only really relevant before fstatat() was
            standardized in POSIX.1.2008.
    Michael Kerrisk
        CONFORMING TO: stat(), fstat(), lstat() are specified in POSIX.1-2008

symlink.2
    Michael Kerrisk
        Merge text of symlinkat(2)
    Michael Kerrisk
        CONFORMING TO: symlink() is in POSIX.1-2008

unlink.2
    Michael Kerrisk
        Merge text of unlinkat(2)
    Michael Kerrisk
        Remove sentence that unlinkat() is present on Solaris
            That point was only really relevant before unlinkat() was
            standardized in POSIX.1.2008.
    Michael Kerrisk
        CONFORMING TO: unlink() is in POSIX.1-2008

mkfifo.3
    Michael Kerrisk
        Merge text of mkfifoat(3)
    Michael Kerrisk
        CONFORMING TO: mkfifo() is in POSIX.1-2008

scandir.3
    Michael Kerrisk
        Merge text of scandirat(3)
    Michael Kerrisk
        Update feature test macro requirements
            The FTM requirements changed in glibc 2.10.
    Michael Kerrisk
        Remove libc4/libc5 note under CONFORMING TO
            No-one much cares about Linux libc these days.
    Michael Kerrisk
        Put detail about alphasort under a NOTES heading
            This text was under CONFORMING TO, which made no sense.
    Michael Kerrisk
        Rework CONFORMING TO text


Newly documented interfaces in existing pages
---------------------------------------------

prctl.2
    Kir Kolyshkin
        Document PR_SET_MM options in Linux 3.5
            Some of the PR_SET_MM options were merged to vanilla kernel
            later, and appeared in Linux 3.5. Those are:

               - PR_SET_MM_ARG_START
               - PR_SET_MM_ARG_END
               - PR_SET_MM_ENV_START
               - PR_SET_MM_ENV_END
               - PR_SET_MM_AUXV
               - PR_SET_MM_EXE_FILE

socket.7
    Neil Horman
        Document the SO_RXQ_OVFL socket option
    Michael Kerrisk
    	Add kernel version number for SO_RXQ_OVFL


New and changed links
---------------------

faccessat.2
    Michael Kerrisk
        Convert to link to access.2

fchmodat.2
    Michael Kerrisk
        Convert to link to chmod.2

fchownat.2
    Michael Kerrisk
        Convert to link to chown.2

fstatat.2
    Michael Kerrisk
        Convert to link to stat.2

linkat.2
    Michael Kerrisk
        Convert to link to link.2

mkdirat.2
    Michael Kerrisk
        Convert to link to mkdir.2

mknodat.2
    Michael Kerrisk
        Convert to link to mknod.2

openat.2
    Michael Kerrisk
        Convert to link to open.2

readlinkat.2
    Michael Kerrisk
        Convert to link to symlink.2

renameat.2
    Michael Kerrisk
        Convert to link rename.2

symlinkat.2
    Michael Kerrisk
        Convert to link to symlink.2

unlinkat.2
    Michael Kerrisk
        Convert to link to unlink.2

mkfifoat.3
    Michael Kerrisk
        Convert to link to mkfifo.3

scandirat.3
    Michael Kerrisk
        Convert to link to scandir.3


Changes to individual pages
---------------------------

alarm.2
    Michael Kerrisk
        Note semantics of alarm with respect to fork() and execve()

fcntl.2
    Michael Kerrisk
        Warn that F_GETLK info may already be out of date when the call returns

intro.2
    Michael Kerrisk
        Describe policy on documenting differences between syscall and glibc API

mmap2.2
    Michael Kerrisk
        Reword note on glibc mmap() wrapper invocation of mmap2()
    Michael Kerrisk
        This system call does not exist on x86-64

msgctl.2
    Michael Kerrisk
        ERRORS: add EPERM for unprivileged attempt to set msg_qbytes > MSGMNB

prctl.2
    Michael Kerrisk  [Xiawei Chen]
        Clarify that PR_GET_TIMERSLACK is returned as the function result
    Michael Kerrisk
        Clarify that PR_GET_SECCOMP is returned as function result
    Michael Kerrisk
        Clarify that PR_GET_NO_NEW_PRIVS is returned as function result

ptrace.2
    Michael Kerrisk  [Andrew Hunter]
        Make it clearer that glibc and syscall APIs differ for PTRACE_PEEK*
            Thanks to Denys Vlasenko's additions in 78686915aed6bd12
            this page does note that the glibc API for PTRACE_PEEK*
            differs from the raw syscall interface. But, as the report
            at https://bugzilla.kernel.org/show_bug.cgi?id=70801 shows,
            this information could be more obvious. This patch makes its so.

sgetmask.2
    Michael Kerrisk
        Note that these system calls don't exist on x86-64

swapon.2
    Michael Kerrisk
        Split EINVAL cases into separate entries under ERRORS
    Michael Kerrisk
        Add EINVAL error for invalid flags to swapon()

syscalls.2
    Michael Kerrisk
        SEE ALSO: add intro(2)

umount.2
    Michael Kerrisk
        Split EINVAL cases into separate items
    Michael Kerrisk
        ERRORS: Add EINVAL case that was new in 2.6.34

utime.2
    Michael Kerrisk
        Add note that modern applications probably want utimensat(2) etc.

crypt.3
    Michael Kerrisk  [KOSAKI Motohiro]
        ERRORS: Add EINVAL and EPERM errors
            See https://bugzilla.kernel.org/show_bug.cgi?id=69771

getifaddrs.3
    Michael Kerrisk
        Enhance example program
            Print statistics for AF_PACKET interfaces.
            Add missing feature test macro definition.
            Reformat output.

iswctype.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function iswctype() is thread safe.

sem_post.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function sem_post() is thread safe.

sem_unlink.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function sem_unlink() is thread safe.

sem_wait.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions sem_wait(), sem_trywait() and sem_timedwait() are
            thread safe.

setbuf.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions setbuf(), setbuffer(), setlinebuf() and setvbuf()
            are thread safe.

strlen.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function strlen() is thread safe.

strnlen.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function strnlen() is thread safe.

strpbrk.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function strpbrk() is thread safe.

strsep.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function strsep() is thread safe.

swab.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function swab() is thread safe.

resolv.conf.5
    Carlos O'Donell
        DESCRIPTION: mention that the data is trusted
            In a recent discussion about DNSSEC it was brought to my
            attention that not all system administrators may understand
            that the information in /etc/resolv.conf is fully trusted.
            The resolver implementation in glibc treats /etc/resolv.conf
            as a fully trusted source of DNS information and passes on
            the AD-bit for DNSSEC as trusted.

            This patch adds a clarifying sentence to make it absolutely
            clear that indeed this source of information is trusted.

ascii.7
    Michael Kerrisk  [Sulaiman Mustafa]
        Fix rendering of single quote (decimal character 39)
    Michael Kerrisk
        SEE ALSO: add utf-8(7)
    Michael Kerrisk  [Duncan de Wet]
        Remove mention of ISO 8859-1 as being the default encoding on Linux

packet.7
    Neil Horman
        Document PACKET_FANOUT_QM fanout mode
    Michael Kerrisk
        Add kernel version for PACKET_FANOUT_QM
    Daniel Borkmann
        Improve PACKET_QDISC_BYPASS description

socket.7
    Michael Kerrisk
        Add kernel version number for SO_BUSY_POLL

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
