From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.65 released
Date: Sun, 20 Apr 2014 20:48:01 +0200
Message-ID: <53541661.70306@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

    man-pages-3.65 - man pages for Linux

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.65

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2014/04/man-pages-365-is-released.h=
tml

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
 man-pages-3.65 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2014-04-20, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Alex Thorlton <athorlton-sJ/iWh9BUns@public.gmane.org>
Ashish Sangwan <a.sangwan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Christopher Covington <cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Craig McQueen <craig.mcqueen-5IW6GhIdNBM/ppqrhe30yRZCeNDtXRbv@public.gmane.org>
Dave Chinner <david-FqsqvQoI3Ljby3iVrkZq2A@public.gmane.org>
David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Greg Troxel <gdt-2FjktZCtrC/QT0dZR+AlfA@public.gmane.org>
Matthew Dempsky <mdempsky-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Namjae Jeon <namjae.jeon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Petr Gajdos <pgajdos-AlSwsSmVLrQ@public.gmane.org>
Richard Hansen <rhansen-A08e6c8yq/Q@public.gmane.org>
Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Steven Stewart-Gallus <sstewartgallus00-QKvm5KDIoDa7M0a00MdBSQ@public.gmane.org>
Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

inet_net_pton.3
    Michael Kerrisk
        New page describing inet_net_pton(3) and inet_net_ntop(3)


Newly documented interfaces in existing pages
---------------------------------------------

fallocate.2
    Michael Kerrisk, Namjae Jeon [Christoph Hellwig, Dave Chinner]
        Document FALLOC_FL_COLLAPSE_RANGE

prctl.2
    Michael Kerrisk  [Alex Thorlton]
        Document PR_SET_THP_DISABLE and PR_GET_THP_DISABLE

proc.5
    Michael Kerrisk
        Document /proc/[pid]/stack
    Michael Kerrisk
        Document /proc/[pid]/clear_refs


New and changed links
---------------------

inet_net_ntop.3
    Michael Kerrisk
        New link to new inet_net_pton.3


Changes to individual pages
---------------------------

fcntl.2
    Michael Kerrisk
        Note the race when O_CLOEXEC is used at same time as fork()+exe=
cve()

madvise.2
    Michael Kerrisk
        SEE ALSO: see prctl(2)
            Because of PR_SET_THP_DISABLE.

mlock.2
    Michael Kerrisk
        Describe treatment of MCL_FUTURE during fork(2) and execve(2)

msync.2
    Michael Kerrisk  [Richard Hansen, Greg Troxel]
        Warn that one of MS_SYNC or MS_ASYNC is required

open.2
    Michael Kerrisk
        Add more detail on the race that O_CLOEXEC is designed to avoid
    Michael Kerrisk  [Matthew Dempsky]
        Remove crufty text stating that O_DIRECTORY is Linux-specific
    Michael Kerrisk
        Note which filesystems support O_TMPFILE

perf_event_open.2
    Vince Weaver [Michael Kerrisk]
        Clarify EACCES and EPERM errors
            Clarify the reasons for EACCES and EPERM errors.
    Vince Weaver [Michael Kerrisk]
        Make the ERRORS section more comprehensive.
            Determined both by code inspection and by writing a large
            number of test programs.

personality.2
    Michael Kerrisk
        Available execution domains are listed in <sys/personality.h>
    Michael Kerrisk
        Fix discussion of return value

prctl.2
    Michael Kerrisk
        ERRORS: document EINVAL for PR_GET_NO_NEW_PRIVS
        ERRORS: document EINVAL for PR_SET_PDEATHSIG
        ERRORS: document EINVAL for PR_SET_TIMING
        ERRORS: document EINVAL for PR_SET_DUMPABLE
        ERRORS: document EINVAL for PR_SET_NO_NEW_PRIVS

shmget.2
    Michael Kerrisk
        Rewrite description of SHMMNI default value
    Michael Kerrisk
        Note default value of SHMMAX
        Note default value for SHMALL

byteorder.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions htonl(), htons(), ntohl() and ntohs() are thr=
ead
            safe.

fexecve.3
    Michael Kerrisk  [Steven Stewart-Gallus]
        If 'fd' is a close-on-exec file descriptor for a script, fexecv=
e() fails
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D74481

ffs.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions ffs(), ffsl() and ffsll() are thread safe.

getauxval.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function getauxval() is thread safe.

getcontext.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions getcontext() and setcontext() are thread safe=
=2E

getsubopt.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function getsubopt() is thread safe.

getutmp.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions getutmp() and getutmpx() are thread safe.

inet.3
    Michael Kerrisk
        Note success and error return for inet_aton()

inet.3
    Michael Kerrisk  [Craig McQueen]
        The form 'a.b' if is suitable for Class A addresses (not class =
C)
    Michael Kerrisk
        SEE ALSO: add inet_net_pton(3)

makecontext.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions makecontext() and swapcontext() are thread sa=
fe.

pthread_attr_setdetachstate.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions pthread_attr_setdetachstate() and
            pthread_attr_getdetachstate() are thread safe.

pthread_attr_setguardsize.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions pthread_attr_setguardsize() and
            pthread_attr_getguardsize() are thread safe.

sigsetops.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions sigemptyset(), sigfillset(), sigaddset(),
            sigdelset(), sigismember(), sigisemptyset(), sigorset() and
            sigandset() are thread safe.

proc.5
    Petr Gajdos
        Improve /proc/[pid]/smaps entries description
    Michael Kerrisk
        /proc/PID/smaps is present only if CONFIG_PROC_PAGE_MONITOR
    Michael Kerrisk
        Note kernel version for /proc/sys/kernel/{shmall,shmmax}
    Michael Kerrisk
        Note kernel version for /proc/sys/kernel/{msgmax,msgmnb}

capabilities.7
    Michael Kerrisk
        SEE ALSO: add capsh(1)

libc.7
    Michael Kerrisk
        Add musl libc

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
