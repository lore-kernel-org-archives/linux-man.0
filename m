From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-4.14 released
Date: Sun, 26 Nov 2017 20:18:07 +0100
Message-ID: <249fd919-e973-5d76-3ea2-419b03c21eac@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

    man-pages-4.14 - man pages for Linux

This release resulted from patches, bug reports, reviews, and comments 
from 71 contributors. Nearly 400 commits changed more than 160 pages.
In addition, 4 new manual pages were added.

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_4.14

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2017/11/man-pages-414-is-released.html

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

==================== Changes in man-pages-4.14 ====================

Released: 2017-11-26, Paris


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Adhemerval Zanella <adhemerval.zanella-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Ahmad Fatoum <ahmad-WDeAlZut61o@public.gmane.org>
Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Bastien Roucaries <roucaries.bastien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Breno Leitao <leitao-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Christian Brauner <christian.brauner-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Colm MacCárthaigh <colm-ZXBCfW2eEe/k1uMJSBkQmQ@public.gmane.org>
Craig Ringer <craig.ringer-lJk9oCk3lhPBpgsEml150g@public.gmane.org>
Cristian Rodríguez <crrodriguez-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
David Eckardt <david.eckardt-Nv4yljlyjElHVLtYWmsBHw@public.gmane.org>
Don Brace <don.brace-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>
Elliot Hughes <enh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Eric W. Biederman <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Fabio Scotoni <fabio-VLnxIkhT3pI@public.gmane.org>
Fangrui Song <i@maskray.me>
Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
G. Branden Robinson <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Goldwyn Rodrigues <rgoldwyn-IBi9RG/b67k@public.gmane.org>
Grégory Vander Schueren <gregory.vanderschueren-g9H5/arvmg7k1uMJSBkQmQ@public.gmane.org>
Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Jann Horn <jannh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Jeff Layton <jlayton-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>
Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Julien Gomes <julien-nzgTgzXrdUbQT0dZR+AlfA@public.gmane.org>
Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Křištof Želechovski <giecrilj-n4IAqcmFnHAX1+iMCFCb4w@public.gmane.org>
Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>
Lucas Werkmeister <mail-rm2KDkFaiJZ2qFAiU50y3BvVK+yQ3ZXh@public.gmane.org>
Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Marin H. <mar-tSIEzQ-y2m5y9CR1fHZqoDxQYNGw6WcyMjQiRWr@public.gmane.org>
Mathieu Desnoyers <mathieu.desnoyers-vg+e7yoeK/dWk0Htik3J/w@public.gmane.org>
Matthew Wilcox <willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Michal Hocko <mhocko-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Michał Zegan <webczat_200-wo4oW1Pw1HF3vZ0LZ0W7Rg@public.gmane.org>
Mihir Mehta <mihir-NZpS4cJIG2HvQtjrzfazuQ@public.gmane.org>
Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Miklos Szeredi <mszeredi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
NeilBrown <neilb-IBi9RG/b67k@public.gmane.org>
Oliver Ebert <oe-h0GdYU6q0jndfRFfCFeH3g@public.gmane.org>
Pedro Alves <palves-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Per Böhlin <Per.Bohlin-MFMeSrSslgZWk0Htik3J/w@public.gmane.org>
Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Petr Malat <oss-uyNjkDRvLzClVyrhU4qvOw@public.gmane.org>
Petr Uzel <petr.uzel-AlSwsSmVLrQ@public.gmane.org>
Prakash Sangappa <prakash.sangappa-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Raghavendra D Prabhu <me-BUtdsdy3pNFWk0Htik3J/w@public.gmane.org>
Rahul Bedarkar <rpal143-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Ram Pai <linuxram-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Richard Knutsson <richard.knutsson-Yzag3CzIk2SzQB+pC5nmwQ@public.gmane.org>
Rik van Riel <riel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Scott Vokes <vokes.s-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Stas Sergeev <stsp-cmBhpYW9OiY@public.gmane.org>
Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Tobias Klausmann <klausman-MzPq5hiN5PY4ErOGf3VzIA@public.gmane.org>
Tomas Pospisek <tpo-UQchlGytWBLoPl2ZpcX+cw@public.gmane.org>
Tyler Hicks <tyhicks-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Victor Porton <porton-Q+l+L2ir60w@public.gmane.org>
Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>
Wesley Aptekar-Cassels <w.aptekar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org>
Дилян Палаузов <dilyan.palauzov-L8B2PhUVQgrYtjvyW6yDsg@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

pthread_spin_init.3
    Michael Kerrisk  [Peter Zijlstra, Thomas Gleixner, Zack Weinberg,
                     Florian Weimer]
        New page describing pthread_spin_init(3) and pthread_spin_destroy(3)

pthread_spin_lock.3
    Michael Kerrisk  [Carlos O'Donell]
        New page describing functions that lock and unlock spin locks
            Add a page describing pthread_spin_lock(3), pthread_spin_unlock(3),
            and pthread_spin_trylock(3).

smartpqi.4
    Don Brace  [Michael Kerrisk, G. Branden Robinson]
            Document the smartpqi SCSI driver

veth.4
    Tomáš Pospíšek, Eric Biederman, Michael Kerrisk
        New page document veth virtual ethernet devices
            Based on a page from Tomáš Pospíšek, with some clean-ups by mtk.


Removed pages
-------------

infnan.3:
    Michael Kerrisk
        This function was in libc4 and libc5, but never part
        of glibc. It ceased to be relevant nearly 20 years
        ago. Time to remove the man page.


Newly documented interfaces in existing pages
---------------------------------------------

ioctl_userfaultfd.2
userfaultfd.2
    Prakash Sangappa  [Andrea Arcangeli, Mike Rapoport]
        Add description for UFFD_FEATURE_SIGBUS

madvise.2
    Rik van Riel  [Colm MacCárthaigh, Michael Kerrisk]
        Document MADV_WIPEONFORK and MADV_KEEPONFORK
    Michael Kerrisk
        Note fork() and execve() semantics for wipe-on-fork setting

membarrier.2
    Mathieu Desnoyers
        Update membarrier manpage for 4.14
            Add documentation for these new membarrier() commands:
                    MEMBARRIER_CMD_PRIVATE_EXPEDITED
                    MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED

memfd_create.2
    Mike Kravetz
        Add description of MFD_HUGETLB (hugetlbfs) support
            hugetlbfs support for memfd_create() was recently merged by Linus
            and should be in the Linux 4.14 release.  To request hugetlbfs
            support a new memfd_create() flag (MFD_HUGETLB) was added.

readv.2
    Christoph Hellwig
        Document RWF_NOWAIT added in Linux 4.14

seccomp.2
    Tyler Hicks
        Document the SECCOMP_GET_ACTION_AVAIL operation added in Linux 4.14
    Tyler Hicks
        Document the SECCOMP_FILTER_FLAG_LOG flag added in Linux 4.14
    Tyler Hicks
        Document the SECCOMP_RET_LOG action added In Linux 4.14
    Michael Kerrisk  [Kees Cook]
        Add description of SECCOMP_RET_KILL_PROCESS
    Michael Kerrisk
        Add SECCOMP_RET_KILL_THREAD description and rework SECCOMP_RET_KILL text
    Michael Kerrisk
        Document the seccomp audit logging feature added in Linux 4.14

seccomp.2
proc.5
    Tyler Hicks
        Document the seccomp /proc interfaces added in Linux 4.14
            Document the seccomp /proc interfaces in Linux 4.14:
            /proc/sys/kernel/seccomp/actions_avail and
            /proc/sys/kernel/seccomp/actions_logged.

sigaltstack.2
    Michael Kerrisk  [Stas Sergeev]
        Document the SS_AUTODISARM flag added in Linux 4.7

proc.5
    Michael Kerrisk
        Document /proc/locks
    Oliver Ebert
        Document /proc/kpagecgroup
    Oliver Ebert
        Add KPF_BALLOON, KPF_ZERO_PAGE, and KPF_IDLE for /proc/kpageflags

pid_namespaces.7
    Michael Kerrisk
        Document /proc/sys/kernel/ns_last_pid


New and changed links
---------------------

pthread_spin_destroy.3
    Michael Kerrisk
        New link to new pthread_spin_init.3 page

pthread_spin_trylock.3
pthread_spin_unlock.3
    Michael Kerrisk
        New links to new pthread_spin_lock.3 page


Global changes
--------------

Various pages
    Michael Kerrisk
        Consistently use "x86-64", not "x86_64"
            When referring to the architecture, consistently use "x86-64",
            not "x86_64". Hitherto, there was a mixture of usages, with
            "x86-64" predominant.

Various pages
    G. Branden Robinson
        Replace incorrect uses of Latin abbreviation "cf.".
            People seem to be using "cf." ("confere"), which means "compare",
            to mean "see" instead, for which the Latin abbreviation would be


Changes to individual pages
---------------------------

capget.2
    Michael Kerrisk
        Clarify discussion of kernels that have no VFS capability support

clock_getres.2
    Michael Kerrisk
        clock_gettime() may be implemented in the vDSO

clone.2
    Michael Kerrisk
        Warn that the clone() wrapper modifies child_stack in the parent
    Michael Kerrisk
        Rework the discussion of the historical CLONE_PID for clarity
    Michael Kerrisk
        Add NOTES heading
    Michael Kerrisk
        Add a reference to new veth(4) page
    Michael Kerrisk
        Eliminate some redundant phrasing in discussion of "fn()"
    Michael Kerrisk
        Combine redundant paragraphs describing child_stack==NULL
    Michael Kerrisk
        Note that child_stack can be NULL when using the raw system call
    Michael Kerrisk
        Remove a redundant paragraph

connect.2
    Michael Kerrisk
        Clarify that ECONNREFUSED is for stream sockets

fcntl.2
    Michael Kerrisk  [Jens Axboe]
        Inode read-write hints persist only until the filesystem is unmounted

flock.2
    Michael Kerrisk
        Move NFS details to a headed subsection
    Michael Kerrisk  [Petr Uzel]
        Placing an exclusive lock over NFS requires the file is open for writing

fork.2
    Rik van Riel  [Colm MacCárthaigh, Michael Kerrisk]
        Document effect of MADV_WIPEONFORK

fork.2
getsid.2
setpgid.2
setsid.2
    Ahmad Fatoum
        Include <sys/types.h> in SYNOPSIS to obtain declaration of pid_t

fsync.2
    Craig Ringer
        ERRORS: add ENOSPC

getcpu.2
    Michael Kerrisk
        getcpu() may have an implementation in the vDSO

getpid.2
    Michael Kerrisk
        Mention that PID == TGID, and note contrast with TID
    Michael Kerrisk
        SEE ALSO: add gettid(2)

getrandom.2
    Michael Kerrisk  [Fabio Scotoni]
        ERRORS: add ENOSYS

getrlimit.2
    Michael Kerrisk  [Scott Vokes]
        Make it clear RLIMIT_NPROC is a limit on current number of processes
            https://twitter.com/silentbicycle/status/893849097903505409

gettid.2
    Michael Kerrisk
        SEE ALSO: add getpid(2)

gettimeofday.2
    Michael Kerrisk
        Note that gettimeofday() may be implemented in the vDSO

ioctl_userfaultfd.2
    Michael Kerrisk
        Rework version information for feature bits

io_submit.2
    Goldwyn Rodrigues
        Add iocb details to io_submit
            Add more information about the iocb structure. Explains the
            fields of the I/O control block structure which is passed to the
            io_submit() call.
    Michael Kerrisk
        Add cross-reference to io_getevents(2)
    Michael Kerrisk
        Cross reference pwritev(2) in discussion of RWF_SYNC and RWF_DSYNC

membarrier.2
    Mathieu Desnoyers
        Update example to take TSO into account
            The existing example given specifically states that it focus on
            x86 (TSO memory model), but gives a read-read vs write-write
            ordering example, even though this scenario does not require
            explicit barriers on TSO.

            So either we change the example architecture to a weakly-ordered
            architecture, or we change the example to a scenario requiring
            barriers on x86.

            Let's stay on x86, but provide a Dekker as example instead.
    Mathieu Desnoyers
            Adapt the MEMBARRIER_CMD_SHARED return value documentation to
            reflect that it now returns -EINVAL when issued on a system
            configured for nohz_full.

memfd_create.2
    Michael Kerrisk
        Note the limit for size of 'name'

mkdir.2
    Michael Kerrisk  [Raghavendra D Prabhu]
        ERRORS: document EINVAL error for invalid filename

mmap.2
    Michael Kerrisk
        Add explicit text noting that 'length' must be greater than 0
            Currently, this detail is hidden in ERRORS. Make it clear in
            the main text.
    Michael Kerrisk
        SEE ALSO: add ftruncate(2)

mremap.2
    Mike Kravetz  [Florian Weimer, Jann Horn]
        Add description of old_size == 0 functionality
            Since at least the 2.6 time frame, mremap() would create a new
            mapping of the same pages if 'old_size == 0'.  It would also leave
            the original mapping.  This was used to create a 'duplicate
            mapping'.

            A recent change was made to mremap() so that an attempt to create a
            duplicate a private mapping will fail.
    Michael Kerrisk  [Michal Hocko, Mike Kravetz]
        BUGS: describe older behavior for old_size==0 on private mappings
            Explain the older behavior, and why it changed. This is a
            follow-up to Mike Kravetz's patch documenting the behavior
            for old_size==0 with shared mappings.
    Michael Kerrisk
        Reformat EINVAL errors as a list

open.2
    Michael Kerrisk
        By contrast with O_RDONLY, no file permissions are required for O_PATH
            Note one of the significant advantages of O_PATH: many of the
            operations applied to O_PATH file descriptors don't require
            read permission, so there's no reason why the open() itself
            should require read permission.
    Michael Kerrisk
        Note use of O_PATH to provide O_EXEC functionality
    Michael Kerrisk
        Mention O_PATH file descriptor use with fexecve(3)
    Michael Kerrisk
        ERRORS: document EINVAL error for invalid filename
    Michael Kerrisk
        Clarify that O_TMPFILE creates a *regular* file
    Michael Kerrisk
        Make it explicit that O_CREAT creates a regular file
    Michael Kerrisk
        Since glibc 2.26, the open() wrapper always uses the openat() syscall
    Michael Kerrisk
        Change pathname used in discussion of rationale for openat()
            /path/to/file is a little confusing as a pathname
    Michael Kerrisk
        Make the purpose of open() a little clearer at the start of the page

open_by_handle_at.2
    NeilBrown
        Clarifications needed due to NFS reexport
    NeilBrown  [Lennart Poettering]
        Clarify MAX_HANDLE_SZ
            As hinted in the kernel source, MAX_HANDLE_SZ is a hint
            rather than a promise.

pipe.2
    Michael Kerrisk  [Marin H.]
        Since Linux 4.5, fcntl() can be used to set O_DIRECT for a pipe
            See https://bugzilla.kernel.org/show_bug.cgi?id=197917

pivot_root.2
    Michael Kerrisk
        SEE ALSO: add switch_root(8)

pkey_alloc.2
    Breno Leitao
        Fix argument order
            Currently pkey_alloc() syscall has two arguments, and the very
            first argument is still not supported and should be set to zero.
            The second argument is the one that should specify the
            page access rights.

ptrace.2
    Michael Kerrisk
        SEE ALSO: add ltrace(1)

reboot.2
    Michael Kerrisk  [Michał Zegan]
        Fix bogus description of reboot() from non-initial PID namespace
            The current text was confused (mea culpa). No signal is sent to
            the init() process. Rather, depending on the 'cmd' given to
            reboot(), the 'group_exit_code' value will set to either SIGHUP or
            SIGINT, with the effect that one of those signals is reported to
            wait() in the parent process.

            See https://bugzilla.kernel.org/show_bug.cgi?id=195899
    Michael Kerrisk
        SEE ALSO: remove reboot(8) (synonym for halt(8)); add shutdown(8)
    Michael Kerrisk
        SEE ALSO: add systemctl(1), systemd(1)

recvmmsg.2
sendmmsg.2
    Elliot Hughes
        Type fixes in SYNOPSIS
            [mtk: The raw system calls use "unsigned int", but the glibc
            wrappers have "int" for the 'flags' argument.]

sched_setaffinity.2
    Michael Kerrisk
        SEE ALSO: add numactl(8)

sched_yield.2
    Michael Kerrisk  [Peter Zijlstra]
        sched_yield() is intended for use with real-time scheduling policies

seccomp.2
    Michael Kerrisk  [Adhemerval Zanella, Florian Weimer, Kees Cook]
        Add some Caveats regarding the use of seccomp filters
    Michael Kerrisk
        Document the "default" filter return action
            The kernel defaults to either SECCOMP_RET_KILL_PROCESS
            or SECCOMP_RET_KILL_THREAD for unrecognized filter
            return action values.
    Michael Kerrisk  [Kees Cook]
        Change SECCOMP_RET_ACTION to SECCOMP_RET_ACTION_FULL
            In Linux 4.14, the action component of the return value
            switched from being 15 bits to being 16 bits. A new macro,
            SECCOMP_RET_ACTION_FULL, that masks the 16 bits was added,
            to replace the older SECCOMP_RET_ACTION.
    Michael Kerrisk
        Explicitly note that other threads survive SECCOMP_RET_KILL_THREAD
    Michael Kerrisk
        SEE ALSO: add strace(1)

send.2
    Grégory Vander Schueren
        Add EALREADY to ERRORS

setns.2
    Michael Kerrisk
        SEE ALSO: add nsenter(1)

shmop.2
    Yubin Ruan
        Note that return value of shmat() is page-aligned

sigaction.2
    Michael Kerrisk
        Rework discussion of SA_SIGINFO handler arguments
            Expand and rework the text a little, in particular adding
            a reference to sigreturn(2) as a source of further
            information about the ucontext argument.
    Michael Kerrisk
        Mention that libc sets the act.sa_restorer field

sigaltstack.2
    Michael Kerrisk  [Walter Harms]
        Reword BUGS text to be a little clearer
    Michael Kerrisk
        Add explicit error handling to example code
    Michael Kerrisk
        Add use of sigaction() to example code

sigreturn.2
    Michael Kerrisk
        Make it a little clearer that a stack frame is created by the kernel
    Michael Kerrisk
        glibc has a simple wrapper for sigreturn() that returns ENOSYS

splice.2
    Michael Kerrisk
        Since Linux 2.6.31,'fd_in' and 'fd_out' may both refer to pipes

stat.2
    Michael Kerrisk  [Richard Knutsson]
        Use lstat() instead of stat()
            It's more logical to use lstat() in the example code,
            since one can then experiment with symbolic links, and
            also the S_IFLNK case can also occur.
    NeilBrown
        Correct AT_NO_AUTOMOUNT text and general revisions
            Expand on the relationship between fstatat() and the other three
            functions, and improve the description of AT_NO_AUTOMOUNT.
            Specifically, both  stat() and lstat() act the same way with
            respect to automounts, and that behavior matches fstatat() with
            the AT_NO_AUTOMOUNT flag.

statfs.2
    Michael Kerrisk
        Add some comments noting filesystems that are no longer current
    Michael Kerrisk
        Add comments describing a few filesystem types

time.2
    Michael Kerrisk
        Note that time() may be implemented in the vDSO
    Michael Kerrisk  [Victor Porton]
        Language fix-up: clarify that "tasks" means "work"
            See https://bugzilla.kernel.org/show_bug.cgi?id=197183

userfaultfd.2
    Mike Rapoport
        BUGS: document spurious UFFD_EVENT_FORK

write.2
fsync.2
close.2
    NeilBrown  [Jeff Layton]
        Update description of error codes
            Since 4.13, errors from writeback are more reliably reported
            to all file descriptors that might be relevant.

            Add notes to this effect, and also add detail about ENOSPC and
            EDQUOT which can be delayed in a similar many to EIO - for NFS
            in particular.

abort.3
    Michael Kerrisk
        Starting with glibc 2.27, abort() does not attempt to flush streams
    Michael Kerrisk
        SEE ALSO: add assert(3)

backtrace_symbols_fd(3)
    Stefan Puiu  [Walter Harms]
        backtrace_symbols_fd() can trigger a call to malloc()

daemon.3
    Michael Kerrisk
        SEE ALSO: add daemon(7), logrotate(8)

errno.3
    Michael Kerrisk
        Note use of errno(1) to look up error names and numbers
    Michael Kerrisk
        Update error list for POSIX.1-2008
            POSIX.1-2008 specified a couple of new errors not present in
            POSIX.1-2001.
    Michael Kerrisk  [Walter Harms]
        Note the use of perror(3) and strerror(3)
    Michael Kerrisk
        Recast the advice against manually declaring 'errno'
            Recast the advice against manually declaring 'errno' to
            a more modern perspective. It's 13 years since the original
            text was added, and even then it was describing old behavior.
            Cast the description to be about behavior further away in
            time, and note more clearly that manual declaration will
            cause problems with modern C libraries.
    Michael Kerrisk
        Add some missing errors
    Michael Kerrisk
        Error numbers are positive values (rather than nonzero values)
            POSIX.1-2008 noted the explicitly the change (to align with
            the C standards) that error numbers are positive, rather
            than nonzero.
    Michael Kerrisk
        Reorganize the text and and some subheadings
            Restructure the text and add some subheadings for better
            readability. No (intentional) content changes.
    Michael Kerrisk  [Wesley Aptekar-Cassels]
        Note that error numbers vary somewhat across architectures
            Added after a patch from Wesley Aptekar-Cassels that proposed
            to add error numbers to the text.
    Michael Kerrisk
        Note the <errno.h> also provides the symbolic error names
    Michael Kerrisk  [Walter Harms]
        Explicitly note that error numbers vary also across UNIX systems

exec.3
    Michael Kerrisk
        glibc 2.24 dropped CWD from the default path
            Document the glibc 2.24 change that dropped CWD from the default
            search path employed by execlp(), execvp() and execvpe() when
            PATH is not defined.

fexecve.3
    Michael Kerrisk
        O_PATH file descriptors are also usable with fexecve()
    Cristian Rodríguez
        fexecve() is now implemented with execveat(2), where available
    Michael Kerrisk
        Add some detail on the glibc implementation of fexecve() via execveat(2)

ffs.3
    Michael Kerrisk
        glibc 2.27 relaxes the FTM requirements for ffsl() and ffsll()

get_nprocs_conf.3
    Michael Kerrisk
        SEE ALSO: add nproc(1)

lround.3
    Michael Kerrisk  [David Eckardt]
        Clarify that lround() rounds *halfway cases" away from zero
            See https://bugzilla.kernel.org/show_bug.cgi?id=194601

makedev.3
    Adrian Bunk
        glibc has deprecated exposing the definitions via <sys/types.h>

mallinfo.3
    Jakub Wilk
        Fix the example
            Remove reference to non-standard "tlpi_hdr.h" and replace calls to
            functions that were declared in this header.

malloc.3
    Michael Kerrisk
        SEE ALSO: add valgrind(1)

popen.3
    Michael Kerrisk
        Add a cross reference to Caveats in system(3)
            All of the same risks regarding system() also apply to popen().

pthread_detach.3
    Michael Kerrisk  [Rahul Bedarkar]
        Improve sentence describing freeing of resources on process termination
            As reported by Rahul, the existing sentence could be read as
            meaning that resources of joined and terminated detached
            threads are freed only at process termination. Eliminate
            that possible misreading.

pthread_yield.3
    Michael Kerrisk  [Peter Zijlstra]
        pthread_yield() is intended for use with real-time scheduling policies

setlocale.3
    Michael Kerrisk  [Křištof Želechovski]
        The standards do not specify all of the locale categories

sockatmark.3
    Seonghun Lim
        Fix cruft in code example

stdio.3
    Michael Kerrisk
        Use proper section cross references in function list
    Michael Kerrisk
        Remove crufty reference to pc(1)

sysconf.3
    Michael Kerrisk
        Mention get_nprocs_conf(3)
            Mention get_nprocs_conf(3) in discussion of _SC_NPROCESSORS_CONF
            and _SC_NPROCESSORS_ONLN.

system.3
    Michael Kerrisk  [Bastien Roucaries]
        Create a "Caveats" subsection to hold warnings about the use of system()
        See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=882222
    Michael Kerrisk  [Bastien Roucaries]
        Mention PATH explicitly in discussion of system() and set-UID programs
    Michael Kerrisk  [Bastien Roucaries]
        Note that user input for system() should be carefully sanitized
    Michael Kerrisk
        Mention file capabilities in discussion of privileged programs
    Michael Kerrisk
        Correctly note which shell Debian uses as (noninteractive) /bin/sh

core.5
    Michael Kerrisk
        Add some notes on systemd and core dumps
    Michael Kerrisk
        Dumps are not produced if core_pattern is empty and core_uses_pid is 0
    Michael Kerrisk  [Per Böhlin]
        RLIMIT_CORE is not enforced when piping core dump to a program
    Michael Kerrisk
        SEE ALO: add systemd-coredump(8)
    Michael Kerrisk
        SEE ALSO: add coredumpctl(1)

filesystems.5
    Michael Kerrisk  [Jonny Grant]
        Replace crufty URL reference for 'smb' with up-to-date URL
    Michael Kerrisk  [Jonny Grant]
        Refer to VFAT as an extended FAT (not DOS) filesystem

proc.5
    Michael Kerrisk  [Miklos Szered, Ram Pai]
        Correct the description of the parent mount ID for /proc/PID/mountinfo
    Oliver Ebert
        Add mmap-exclusive bit for /proc/[pid]/pagemap
    Marcus Folkesson
        Update description of /proc/<pid>/oom_score
    Lucas Werkmeister
        Clarify permissions in /proc/[pid]/fd/
    Michael Kerrisk
        Add reference to pid_namespaces(7) for /proc/sys/kernel/ns_last_pid

shells.5
    Michael Kerrisk
        SEE ALSO: add pam_shells(8)

sysfs.5
    Michael Kerrisk
        Add a brief explanation of /sys/kernel
    Michael Kerrisk
        Add a brief description of /sys/class/net
    Michael Kerrisk
        Add a brief description of /sys/kernel/mm
    Michael Kerrisk
        Add brief description of /sys/kernel/debug/tracing
    Michael Kerrisk
        Add a description of /sys/kernel/mm/hugepages

arp.7
    Michael Kerrisk
        SEE ALSO: add arpd(8)

capabilities.7
    Michael Kerrisk
        Add a reference to xattr(7) in the discussion of extended attributes
    Michael Kerrisk
        SEE ALSO: add captest(8)

epoll.7
    Michael Kerrisk
        Note existence of kcmp() KCMP_EPOLL_TFD operation

fifo.7
    Michael Kerrisk
        Refer reader to pipe(7) for details of I/O semantics of FIFOs

hier.7
    Michael Kerrisk
        SEE ALSO: add file-hierarchy(7)

icmp.7
    Michael Kerrisk
        SEE ALSO: add rdisc(8)

man-pages.7
    Michael Kerrisk
        Note that "x86-64" is generally preferred over "x86_64"
    G. Branden Robinson
        Add a use case for real minus character

namespaces.7
    Michael Kerrisk
        Add a reference to new veth(4) page
    Michael Kerrisk
        EXAMPLE: refer also to example in clone(2)

pid_namespaces.7
    Michael Kerrisk
        SEE ALSO: add reboot(2)
            Add because reboot(2) has special semantics for non-initial
            PID namespaces.

pthreads.7
    Michael Kerrisk
        SEE ALSO: add pthread_spin_init(3) and pthread_spin_lock(3)

socket.7
    Michael Kerrisk  [Petr Malat, Tobias Klausmann]
        Correct the description of SO_RXQ_OVFL

standards.7
    Michael Kerrisk
        SEE ALSO: add getconf(1), confstr(3), pathconf(3), sysconf(3)

user_namespaces.7
    Christian Brauner  [Michael Kerrisk]
        Document new 340 line idmap limit

ld.so.8
    Michael Kerrisk  [Yubin Ruan]
        Simplify language around conferring capabilities
            The statement "conferring permitted or effective capabilities"
            to the process is somewhat redundant. Binaries with capabilities
            confer capabilities only to those process capability sets, so it's
            simpler to just say "confers capabilities to the process".

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
