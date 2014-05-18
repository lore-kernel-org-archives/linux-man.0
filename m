From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.66 released
Date: Sun, 18 May 2014 12:54:41 +0200
Message-ID: <53789171.3000901@gmail.com>
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

    man-pages-3.66 - man pages for Linux

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.66

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2014/05/man-pages-366-is-released.h=
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
 man-pages-3.66 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2014-05-08, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Alan Curry <rlwinm-WF+c3Tt1nJM@public.gmane.org>
Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>
Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Eric Siegerman <pub08-knl-Hke7B/fnggLYtjvyW6yDsg@public.gmane.org>
Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
Jan Moskyto Matejka <mq-AlSwsSmVLrQ@public.gmane.org>
John Marshall <jm18-5fLPn3lgkryFxr2TtlUqVg@public.gmane.org>
Luk=C3=A1=C5=A1 Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Manfred Spraul <manfred-nhLOkwUX5cPe2c5cEj3t2g@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Miklos Szeredi <miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org>
Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Silvan Jegen <s.jegen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Steven Stewart-Gallus <sstewartgallus00-QKvm5KDIoDa7M0a00MdBSQ@public.gmane.org>
Stijn Hinterding <contact-Tcs81MCHamfqOYT2WTFYB/P6llvjuJOh@public.gmane.org>
Willem de Bruijn <willemb-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

fanotify_init.2
    Heinrich Schuchardt, Michael Kerrisk
        New page documenting fanotify_init(2)

fanotify_mark.2
    Heinrich Schuchardt, Michael Kerrisk
        New page documenting fanotify_mark(2)

sched_setscheduler.2
    Michael Kerrisk
        Page rewritten
            Stripped out the general scheduling material, which
            moved to sched(7), and rewrote much of the remainder.
            Changed copyright and license since pretty much all
            of the content was or is written by mtk.

fanotify.7
    Heinrich Schuchardt, Michael Kerrisk
        New page providing overview of the fanotify API

sched.7
    Michael Kerrisk
        New page providing an overview of the scheduling APIs
            Most of this content derives from sched_setscheduler(2). In
            preparation for adding a sched_setattr(2) page, it makes
            sense to isolate out this general content to a separate
            page that is referred to by the other scheduling pages.


Newly documented interfaces in existing pages
---------------------------------------------

fallocate.2
    Lukas Czerner [Michael Kerrisk]
        Document FALLOC_FL_ZERO_RANGE
            FALLOC_FL_ZERO_RANGE was added in Linux 3.14,
            for zeroing ranges in the allocated space in a file.

rename.2
    Miklos Szeredi [Michael Kerrisk]
        Document renameat2() system call added in Linux 3.15

shmop.2
    Michael Kerrisk
        Document SHM_EXEC


Changes to individual pages
---------------------------

fallocate.2
    Michael Kerrisk
        Employ term "open file description" in DESCRIPTION
            And include reference to open(2) for an explanation of the =
term.

getpriority.2
    Michael Kerrisk
        SEE ALSO: add sched(7)

getsockopt.2
    Carsten Andrich
        SEE ALSO: add packet(7)

link.2
    Michael Kerrisk  [Steven Stewart-Gallus]
        Document ENOENT error for linkat()
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D73301

msgget.2
    Michael Kerrisk
        Reword EEXIST error

msgop.2
    Michael Kerrisk
        Note capability required to raise MQ size beyond MSGMNB

msync.2
    Michael Kerrisk  [Heinrich Schuchardt]
        s/flushes... back to disk/flushes... back to filesystem/

nice.2
    Michael Kerrisk
        SEE ALSO: add sched(7)

open.2
    Peter Schiffer
        Update note on alignment of user buffer and file offset for O_D=
IRECT
            The sentence in open(2) man page in notes for O_DIRECT flag=
:

                "Under Linux 2.6, alignment to 512-byte boundaries suff=
ices."

            is not universally correct. The alignment is a property of =
the
            storage, for example, 4k-sector drives with no 512 byte sec=
tor
            emulation will be unable to perform 512-byte direct I/O.
    Michael Kerrisk
        Note some of the various synonyms for "open file description"
    Michael Kerrisk
        Remove repetitious text on use of fcntl() to change file status=
 flags

open_by_handle_at.2
    Michael Kerrisk
        Mention FreeBSD analogs

posix_fadvise.2
    Michael Kerrisk  [Eric Siegerman]
        Fix wording error under "Architecture-specific variants"
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D75431

process_vm_readv.2
    Michael Kerrisk  [Stijn Hinterding]
        Add feature test macro requirements
            The _GNU_SOURCE FTM must be defined.

read.2
    Michael Kerrisk
        BUGS: detail nonatomicity bug with respect to file offset updat=
es
            This bug was fixed in Linux 3.14, with commit
            9c225f2655e36a470c4f58dbbc99244c5fc7f2d4
            See also http://thread.gmane.org/gmane.linux.kernel/1649458

sched_get_priority_max.2
    Michael Kerrisk
        Small changes consistent with migration of content to sched(7)

sched_rr_get_interval.2
    Michael Kerrisk
        Small changes consistent with migration of content to sched(7)

sched_setaffinity.2
    Michael Kerrisk
        Small changes consistent with migration of content to sched(7)

sched_setparam.2
    Michael Kerrisk
        Small changes consistent with migration of content to sched(7)

sched_yield.2
    Michael Kerrisk
        Small changes consistent with migration of content to sched(7)

semget.2
    Michael Kerrisk
        Consolidate discussion on noninitialization of semaphores
            The fact that semget() does not initialize the semaphores
            in a new set was covered in two places (in DESCRIPTION
            and BUGS). Consolidate these into one place (in NOTES)
            and also point out that POSIX.1-2008 says that a future
            version of the standard may require an implementation to
            initialize the semaphores to 0.
    Michael Kerrisk
        Clarify SEMMNS versus SEMMSL*SEMMNI
    Michael Kerrisk
        Rework EINVAL text a little
    Michael Kerrisk
        Clarify wording for EEXIST error

shmget.2
    Manfred Spraul
        Clarify SHMALL
            The default for SHMALL is a limit of 8 GB, regardless of
            PAGE_SIZE. The current documentation does not mention that
            and is therefore more difficult to understand than necessar=
y.
    Manfred Spraul
        Correct math error
            2097152 is 2^21, not 2^20.
    Michael Kerrisk
        Reword EEXIST error
    Michael Kerrisk
        Clarify one of the EINVAL cases
    Michael Kerrisk
        Note that SHM_NORESERVE is a Linux extension
    Michael Kerrisk  [Simon Paillard]
        Fix kernel version numbers in discussion of SHMALL
    Michael Kerrisk
        Rework EINVAL text
    Michael Kerrisk
        Move and rework discussion of mode bits
    Michael Kerrisk
        Reword description of O_EXCL

shmop.2
    Michael Kerrisk
        Move fork(2), execve(2), _exit(2) discussion to NOTES
    Michael Kerrisk
        Add subheads for shmat() and shmdt()
    Michael Kerrisk
        Rework discussion of SHM_RDONLY and SHM_REMAP into list format
    Michael Kerrisk
        Structure the attach cases as a list

sigaction.2
    Alan Curry
        Fix bad cross reference (times(2) not time(2))
            The system call that reports child CPU usage is times(2),
            not time(2).

symlink.2
    Michael Kerrisk  [Steven Stewart-Gallus]
        Document ENOENT error for symlinkat()
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D73301

syscalls.2
    Michael Kerrisk
        Add renameat2()
            And bump kernel version.

write.2
    Michael Kerrisk
        BUGS: detail nonatomicity bug with respect to file offset updat=
es
            This bug was fixed in Linux 3.14, with commit
            9c225f2655e36a470c4f58dbbc99244c5fc7f2d4
            See also http://thread.gmane.org/gmane.linux.kernel/1649458

pthread_attr_setinheritsched.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions pthread_attr_setinheritsched() and
            pthread_attr_getinheritsched() are thread safe.

pthread_attr_setschedparam.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions pthread_attr_setschedparam() and
            pthread_attr_getschedparam() are thread safe.

pthread_attr_setschedpolicy.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions pthread_attr_setschedpolicy() and
            pthread_attr_getschedpolicy() are thread safe.

pthread_attr_setscope.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions pthread_attr_setscope() and pthread_attr_gets=
cope()
            are thread safe.

pthread_attr_setstack.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions pthread_attr_setstack() and pthread_attr_gets=
tack()
            are thread safe.

sched_getcpu.3
    Michael Kerrisk
        SEE ALSO: add sched(7)

termios.3
    Michael Kerrisk  [Yuri Kozlov]
        Rework intro text for 'c_oflag'
    Michael Kerrisk
        OFDEL is in POSIX.1-2001, so remove "(Not in POSIX)" text

proc.5
    Jan Moskyto Matejka  [Randy Dunlap]
        Improve description of /proc/stat 'intr' field
            The sum at the beginning of line "intr" includes also
            unnumbered interrupts.

packet.7
    Carsten Andrich  [Neil Horman]
        Improve sockopt documentation for packet sockets
    Carsten Andrich  [Willem de Bruijn]
        PACKET_LOSS has inverse meaning
    Stefan Puiu  [Daniel Borkmann, Carsten Andrich]
        Status in PACKET_RX_RING is actually a bit mask
    Michael Kerrisk  [Carsten Andrich]
        SEE ALSO: add /tools/testing/selftests/net/psock_tpacket.c


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
