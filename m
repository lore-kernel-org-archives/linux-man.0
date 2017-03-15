From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-4.10 released
Date: Wed, 15 Mar 2017 06:41:54 +0100
Message-ID: <40feffd8-8721-1cbf-00c3-8bc40ea85129@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

The Linux man-pages maintainer proudly announces:

    man-pages-4.10 - man pages for Linux

This release resulted from patches, bug reports, reviews, and comments
from over 40 contributors. The release sees a large number of changes:
over 600 commits changing around 160 pages. The changes include the
addition of 11 pages, significant rewrites of 3 other pages, and
enhancements to many other pages.

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_4.10

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2017/03/man-pages-410-is-released.html

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

==================== Changes in man-pages-4.10 ====================

Released: 2017-03-13, Paris


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Adam Martindale <adam.john.martindale-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Alex <psybin-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Anders Thulin <anders-IjA8hSScV5Z7tPAFqOLdPg@public.gmane.org>
Andreas Gruenbacher <agruenba-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Brian Masney <masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
Casey Schaufler <casey-iSGtlc1asvQWG2LlvL+J4A@public.gmane.org>
David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Erik Kline <ekline-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Erik Roland van der Meer <ervdmeer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Fabjan Sukalia <fsukalia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Helmut Eller <eller.helmut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Hugo Guiroux <hugo.guiroux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Ian Jackson <ijackson-QGMSyCZBOSwv4zxTlrOuLwNdhmdF6hFW@public.gmane.org>
Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Jann Horn <jannh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Jan Ziak <0xe2.0x9a.0x9b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
John Wiersba <jrw32982-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Jon Jensen <jon-O9fzpki4YnJWk0Htik3J/w@public.gmane.org>
Kai NODA <nodakai-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
KASAKI Motohiro <kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Kent Fredic <kentfredric-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Krzysztof Kulakowski <krzysztof.kulakowski-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Maik Zumstrull <maik-pC6eOnvJXUcJGwgDXS7ZQA@public.gmane.org>
Mat Martineau <mathew.j.martineau-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Nadav Har'El  <nyh-TS7m/3hpY0sOpacJJkBjfT4kX+cae0hd@public.gmane.org>
Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Nicolas Biscos <nicolas.biscos+man7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Omar Sandoval <osandov-nWWhXC5lh1RBDgjK7y7TUQ@public.gmane.org>
Paul Fee <paul.f.fee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reverend Homer <mk.43.ecko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Sergey Polovko <sergey-r6a5ZGF03PZBDLzU/O5InQ@public.gmane.org>
Steven Luo <steven-HV3ct5rG0+cz/5BUvQrP4w@public.gmane.org>
Tadeusz Struk <tadeusz.struk-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Vincent Bernat <vincent-5wNQGcxKXm8AvxtiuMwx3w@public.gmane.org>
Vivenzio Pagliari <vivenzio.pagliari-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Wainer dos Santos Moschetta <wainersm-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Willy Tarreau <w@1wt.eu>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

add_key.2
    Michael Kerrisk  [Eugene Syromyatnikov, David Howells]
        Major improvements and additions
            The page has doubled in length.

ioctl_iflags.2
    Michael Kerrisk
        New page describing inode flags and ioctl() operations

ioctl_ns.2
    Michael Kerrisk
        New page created by splitting ioctl(2) operations out of namespaces(7)

keyctl.2
    Michael Kerrisk, Eugene Syromyatnikov  [David Howells, Mat Martineau]
         A vast number of additions and improvements
             The page has gone from somewhat over 100 lines to well over
             1000 lines and now more or less documents the complete interface
             provided by this system call.

getentropy.3
    Michael Kerrisk
        New page documenting getentropy(3)
            getentropy(3) is added to glibc in version 2.25.

keyrings.7
    David Howells
        New page (written by David Howells) adopted from keyutils
            Since this page documents kernel-user-space interfaces,
            it makes sense to have it as part of man-pages, rather
            than the keyutils package.
    Michael Kerrisk  [Eugene Syromyatnikov, David Howells]
        Very many additions and improvements
    Michael Kerrisk
        Document /proc/keys
    Michael Kerrisk
        Document /proc/sys/kernel/keys/persistent_keyring_expiry
    Michael Kerrisk
        Document /proc/key-users
    Michael Kerrisk
        Document /proc/sys/kernel/keys/gc_delay
    Michael Kerrisk
        Document /proc files that define key quotas

persistent-keyring.7
    Michael Kerrisk
        New page (written by David Howells) adopted from keyutils
            Since this page documents kernel-user-space interfaces,
            it makes sense to have it as part of man-pages, rather
            than the keyutils package.
    Michael Kerrisk
        Various clean-ups and additions

process-keyring.7
    Michael Kerrisk
        New page (written by David Howells) adopted from keyutils
            Since this page documents kernel-user-space interfaces,
            it makes sense to have it as part of man-pages, rather
            than the keyutils package.
    Michael Kerrisk
        Various additions and improvements

request_key.2
    Michael Kerrisk, Eugene Syromyatnikov  [David Howells]
        Very many additions and improvements
             The page is now three times its former length.

session-keyring.7
    Michael Kerrisk
        New page (written by David Howells) adopted from keyutils
            Since this page documents kernel-user-space interfaces,
            it makes sense to have it as part of man-pages, rather
            than the keyutils package.
    Michael Kerrisk
        Various reworking and additions

signal-safety.7
    Michael Kerrisk
        New page created by migrating the signal-safety discussion from
        signal(7). Along the way some more details got added.
    Michael Kerrisk  [KASAKI Motohiro]
        Note async-signal-safety problems caused by pthread_atfork()
            See https://bugzilla.kernel.org/show_bug.cgi?id=25292
    Michael Kerrisk  [KASAKI Motohiro]
        Note glibc deviations from POSIX requirements
            See https://bugzilla.kernel.org/show_bug.cgi?id=25292

thread-keyring.7
    Michael Kerrisk
        New page (written by David Howells) adopted from keyutils
            Since this page documents kernel-user-space interfaces,
            it makes sense to have it as part of man-pages, rather
            than the keyutils package.
    Michael Kerrisk
        Various rewordings and additions

user-keyring.7
    Michael Kerrisk
        New page (written by David Howells) adopted from keyutils
            Since this page documents kernel-user-space interfaces,
            it makes sense to have it as part of man-pages, rather
            than the keyutils package.
    Michael Kerrisk
        Various reworking and improvements

user-session-keyring.7
    Michael Kerrisk
        New page (written by David Howells) adopted from keyutils
            Since this page documents kernel-user-space interfaces,
            it makes sense to have it as part of man-pages, rather
            than the keyutils package.
    Michael Kerrisk
        Various rewordings and additions


Newly documented interfaces in existing pages
---------------------------------------------

bzero.3
    Michael Kerrisk
        Document explicit_bzero() (new in glibc 2.25)
            Also, reword the description of bzero somewhat.

proc.5
    Michael Kerrisk
        Document /proc/sys/vm/user_reserve_kbytes
    Michael Kerrisk
        Document /proc/sys/vm/admin_reserve_kbytes
    Michael Kerrisk
        Document /proc/sys/fs/mount-max
    Michael Kerrisk
        Document /proc/PID/status 'NoNewPrivs' field


New and changed links
---------------------

explicit_bzero.3
    Michael Kerrisk
        New link to bzero.3


Changes to individual pages
---------------------------

chmod.2
    Michael Kerrisk
        ERRORS: add EPERM error for immutable/append-only file

chown.2
    Michael Kerrisk
        ERRORS: add EPERM error for immutable/append-only file

chroot.2
    Michael Kerrisk
        SEE ALSO: add switch_root(8)

clock_getres.2
    Michael Kerrisk
        Note POSIX.1 requirements re relative time services and CLOCK_REALTIME

clone.2
    Michael Kerrisk
        clone() does not execute fork handlers

execve.2
    Michael Kerrisk
        Rework text describing when effective IDs aren't transformed by execve()
    Michael Kerrisk
        File capabilities can be ignored for the same reasons as set-UID/set-GID
    Michael Kerrisk
        The 'no_new_privs' bit inhibits transformations of the effective IDs

fork.2
    Michael Kerrisk
        cgroup PIDs controller may also be trigger for EAGAIN error

fsync.2
    Michael Kerrisk
        SEE ALSO: add posix_fadvise(2)

getrandom.2
    Michael Kerrisk
        Remove getentropy(3) details and defer to new getentropy(3) page
    Michael Kerrisk
        Starting with glibc 2.25, getrandom() is now declared in <sys/random.h>
    Michael Kerrisk
        glibc support was added in version 2.25

getrlimit.2
    Michael Kerrisk
        Document role of RLIMIT_NOFILE for FD passing over UNIX sockets

getxattr.2
listxattr.2
    Andreas Gruenbacher
        Document E2BIG errors

inotify_add_watch.2
    Michael Kerrisk
        Note "inode" as a synonym for "filesystem object"
            Consistent with clarifications just made in inotify(7).

ioctl.2
    Michael Kerrisk
        SEE ALSO: add ioctl_ns(2), ioctl_iflags(2)

ioctl_fat.2
    Brian Masney
        Correctly reference volume ID instead of volume label

kcmp.2
    Michael Kerrisk
        Mention the clone(2) flags relating to various kcmp() 'type' values
    Michael Kerrisk
        KCMP_FILE: note reasons why FDs may refer to same open file description

link.2
    Michael Kerrisk
        When using linkat() AT_EMPTY_PATH, 'olddirfd' must not be a directory
    Michael Kerrisk
        ERRORS: add EPERM for immutable/append-only files
    Michael Kerrisk
        Note limits where EMLINK is encountered on ext4 and Btrfs

listxattr.2
    Michael Kerrisk
        Eliminate extra E2BIG error text
            Andreas' patch added a second description of E2BIG that
            was (mostly) more detailed than the existing text. Combine
            the two texts.

lseek.2
    Michael Kerrisk
        O_APPEND overrides the effect of lseek() when doing file writes
    Michael Kerrisk
        Remove ancient info about whence values and return values on old systems
    Michael Kerrisk
        Remove slightly bogus advice about race conditions
            The page already (by now) contains a reference to open(2)
            for a discussion of open file descriptions. Leave it at that,
            since the reader can then deduce how things work.

madvise.2
    Michael Kerrisk
        Note that madvise() is generally about improving performance

mbind.2
    Krzysztof Kulakowski  [Michael Kerrisk]
        Update MPOL_BIND description
            The behavior of MPOL_BIND changed in Linux 2.6.26.

mincore.2
    Michael Kerrisk
        SEE ALSO: add madvise(2), posix_fadvise(2), posix_madvise(3)

mlock.2
    Michael Kerrisk
        Note pre-4.9 bug in RLIMIT_MEMLOCK accounting for overlapping locks
    Michael Kerrisk
        SEE ALSO: add mincore(2)

mmap.2
    Michael Kerrisk
        mincore(2) can be used to discover which pages of a mapping are resident

mount.2
    Michael Kerrisk  [Rob Landley]
        Refer to mount_namespaces(7) for details of default propagation type

nanosleep.2
    Michael Kerrisk
        Describe "creeping sleep" problem
            nanosleep() has a problem if used in a program that catches
            signals and those signals are delivered at a very high rate.
            Describe the problem, and note that clock_nanosleep(2)
            provides a solution.
    Michael Kerrisk
        BUGS: explicitly note that the Linux 2.4 bug was fixed in Linux 2.6

open.2
    Michael Kerrisk
        Make it clear that O_APPEND implies atomicity
    Michael Kerrisk
        Clarify distinction between file creation flags and file status flags
    Michael Kerrisk
        Note ambiguity of ELOOP error when using O_NOFOLLOW
    Michael Kerrisk
        Restructure O_NOFOLLOW text for easier parsing
    Michael Kerrisk
        Clarify that O_NOFOLLOW is now in POSIX

poll.2
select.2
    Nicolas Biscos
        Add a reference to the sigset discussion in sigprocmask(2)
            A little while back, I added a note to sigprocmask.2 that
            discussed the difference between the libc's and the kernel's
            sigset_t structures.  I added that note, because I saw this being
            done wrong in a tool tracing system calls (causing subtle bugs).
            As it turns out, the same bugs existed for ppoll and pselect, for
            the same reason. I'm hoping by adding the reference here, future
            writers of similar tools will find that discussion and not make
            the same mistake.

posix_fadvise.2
    Michael Kerrisk
        Mention /proc/sys/vm/drop_caches
            It may be helpful for the reader of this page to know about
            /proc/sys/vm/drop_caches.
    Michael Kerrisk
        Reorganize some text
            Details for various flags were hidden under NOTES.
            Move them to DESCRIPTION, to make the details more
            obvious.
    Michael Kerrisk
        One can use open(2) + mmap(2) + mincore(2) as a 'fincore'
            Note that open(2) + mmap(2) + mincore(2) can be used to get a view
            of which pages of a file are currently cached.
    Michael Kerrisk  [Maik Zumstrull]
        Note that POSIX_FADV_DONTNEED *may* try to write back dirty pages
    Michael Kerrisk
        SEE ALSO: mincore(2)

prctl.2
    Michael Kerrisk
        Clarify that the ambient capability set is per-thread
    Keno Fischer
        Be more precise in what causes dumpable to reset
    Michael Kerrisk
        The no_new_privs setting is per-thread (not per-process)
    Michael Kerrisk
        Mention /proc/PID/status 'NoNewPrivs' field
    Michael Kerrisk
        Add reference to seccomp(2) in discussion of PR_SET_NO_NEW_PRIVS

ptrace.2
    Omar Sandoval
        Clarify description of PTRACE_O_EXITKILL

read.2
    Michael Kerrisk  [Kai NODA]
        Rework text in DESCRIPTION that talks about limits for 'count'
            See https://bugzilla.kernel.org/show_bug.cgi?id=86061
    Michael Kerrisk  [Steven Luo]
        Remove crufty text about EINTR and partial read
            Remove bogus text saying that POSIX permits partial read
            to return -1/EINTR on interrupt by a signal handler.
            That statement already ceased to be true in SUSv1 (1995)!

            See https://bugzilla.kernel.org/show_bug.cgi?id=193111

readv.2
    Michael Kerrisk
        Remove generic advice about mixing stdio and syscalls on same file
            There is nothing specific to readv()/writev() about this advice.

recv.2
    Michael Kerrisk  [Vincent Bernat]
        Remove duplicate paragraph
            man-pages-1.34 included changes that duplicated an existing
            paragraph. Remove that duplicate.
    Michael Kerrisk
        SEE ALSO: add ip(7), ipv6(7), tcp(7), udp(7), unix(7)

remap_file_pages.2
    Michael Kerrisk
        remap_file_pages() has been replaced by a slower in-kernel emulation

send.2
    Michael Kerrisk
        SEE ALSO: add ipv6(7), socket(7), unix(7)

setxattr.2
    Michael Kerrisk
        ERRORS: add EPERM for immutable/append-only files

signalfd.2
    Michael Kerrisk
        signalfd() doesn't play well with helper programs spawned by libraries
            See https://lwn.net/Articles/415684/.
    Michael Kerrisk
        signalfd can't be used to receive synchronously generated signals
            Signals such as the SIGSEGV that results from an invalid
            memory access can be caught only with a handler.

stat.2
    Michael Kerrisk
        EXAMPLE: extend program to also show ID of the containing device
    Michael Kerrisk
        NOTES: mention fstatat() AT_NO_AUTOMOUNT in discussion of automounting

statfs.2
    Namhyung Kim
        Add more filesystem types
            Add missing magic numbers from /usr/include/linux/magic.h

syscall.2
    Mike Frysinger
        Add endian details with 64-bit splitting
            Architectures that split 64-bit values across register pairs
            usually do so according to their C ABI calling convention (which
            means endianness).  Add some notes to that effect, and change the
            readahead example to show a little endian example (since that is
            way more common than big endian).

            Also start a new list of syscalls that this issue does not apply
            to.
    Mike Frysinger
        Note parisc handling of aligned register pairs
            While parisc would normally have the same behavior as ARM/PowerPC,
            they decide to write shim syscall stubs to unpack/realign rather
            than expose the padding to userspace.

tkill.2
    Jann Horn
        Document EAGAIN error for real-time signals

truncate.2
    Michael Kerrisk
        Note use of ftruncate() for POSIX shared memory objects

unlink.2
    Michael Kerrisk
        ERRORS: add EPERM error for immutable/read-only files

vfork.2
    Michael Kerrisk
        Explain why the child should not call exit(3)
    Michael Kerrisk
        Another reason to use vfork() is to avoid overcommitting memory
    Michael Kerrisk
        Note some caveats re the use of vfork()
            Inspired by Rich Felker's post at http://ewontfix.com/7/.
            See also https://sourceware.org/bugzilla/show_bug.cgi?id=14749 and
            See also https://sourceware.org/bugzilla/show_bug.cgi?id=14750.
    Michael Kerrisk
        SEE ALSO: add _exit(2)

write.2
    Michael Kerrisk  [Kai NODA]
        Alert the reader that there is a limit on 'count'
            See https://bugzilla.kernel.org/show_bug.cgi?id=86061

aio_suspend.3
    Michael Kerrisk
        Note that the glibc implementation is not async-signal-safe
            See https://sourceware.org/bugzilla/show_bug.cgi?id=13172

backtrace.3
    Michael Kerrisk
        SEE ALSO: add addr2line(1) and gdb(1)

bcmp.3
bcopy.3
bzero.3
memccpy.3
memchr.3
memcmp.3
memcpy.3
memfrob.3
memmem.3
memmove.3
memset.3
    Michael Kerrisk
        SEE ALSO: add bstring(3)

exec.3
    Michael Kerrisk
        execl() and execle() were not async-signal-safe before glibc 2.24

fopen.3
    Michael Kerrisk  [Helmut Eller]
        Describe freopen() behavior for NULL pathname argument
            See https://bugzilla.kernel.org/show_bug.cgi?id=191261
    Michael Kerrisk
        Note the open(2) flags that correspond to the 'mode' argument
    Michael Kerrisk
        Change argument name: 'path' to 'pathname'
            For consistency with open(2).
    Michael Kerrisk
        Add subsection headings for each function

fts.3
    Michael Kerrisk
        Use better argument name for fts_children() and fts_set()
    Michael Kerrisk
        Fix minor error in FTSENT structure definition
    Michael Kerrisk
        Improve explanation of 'fts_errno'
    Michael Kerrisk
        Give a hint that there are further fields in the FTSENT structure
    Michael Kerrisk
        Clarify meaning of zero as 'instr' value for fts_set()

ftw.3
    Michael Kerrisk
        Correctly handle use of stat info for FTW_NS in example program
    Michael Kerrisk
        Clarify that stat buffer is undefined for FTW_NS

getline.3
    Michael Kerrisk
        EXAMPLE: better error handling
    Michael Kerrisk  [Kent Fredic]
        EXAMPLE: handle null bytes in input
    Jann Horn
        Document ENOMEM error case
            see the error handling in libio/iogetdelim.c
    Michael Kerrisk
        EXAMPLE: specify file to be opened as command-line argument
    Michael Kerrisk
        Use better variable name in example program

getmntent.3
    Michael Kerrisk  [Anders Thulin]
        Prefer '\\' as the escape to get a backslash
            See https://bugzilla.kernel.org/show_bug.cgi?id=191611

getopt.3
    Michael Kerrisk
        Reword discussion of error handling and reporting
            The existing description was hard to understand. Break
            it into a bullet list that separates out the details
            in a manner that is easier to parse.
    Michael Kerrisk
        Correct details of use of <stdio.h> to get getopt() declaration
    Michael Kerrisk  [John Wiersba]
        Remove some redundant text

mq_open.3
    Michael Kerrisk  [Adam Martindale]
        Include definition of the 'mq_attr' structure in this man page
            Make the reader's life a little easier by saving them from
            having to refer to mq_getattr(3).

mq_send.3
    Michael Kerrisk  [Adam Martindale]
        Refer to mq_overview(7) for details on range of message priority

__ppc_set_ppr_med.3
    Wainer dos Santos Moschetta
        Note need for _ARCH_PWR8 macro
            The _ARCH_PWR8 macro must be defined to get the
             __ppc_set_ppr_very_low() and __ppc_set_ppr_med_high()
            definitions.

printf.3
    Michael Kerrisk
        Document nonstandard 'Z' modifier
    Michael Kerrisk
        Document 'q' length modifier
    Michael Kerrisk  [Erik Roland van der Meer]
        Fix a small bug in example code
            Move the second call to va_end(ap) to above the if-block that
            precedes it, so that the va_list 'ap' will be cleaned up in
            all cases.
    Michael Kerrisk  [Nadav Har'El]
        As a nonstandard extension, GNU treats 'll' and 'L' as synonyms
            See https://bugzilla.kernel.org/show_bug.cgi?id=190341.
    Michael Kerrisk
        Add references to setlocale(3) in discussions of locales
    Michael Kerrisk
        SEE ALSO: remove bogus self reference (dprintf(3))

random.3
    Michael Kerrisk
        Relocate information of "optimal" value of initstate() 'n' argument
            The information was a bit hidden in NOTES.

random_r.3
    Michael Kerrisk  [Jan Ziak]
        'buf.state' must be initialized to NULL before calling initstate_r()
            See https://bugzilla.kernel.org/show_bug.cgi?id=192801.
    Michael Kerrisk
        Add some usage notes for setstate_r()
    Michael Kerrisk
        Note that 'buf' records a pointer to 'statebuf'
            See https://sourceware.org/bugzilla/show_bug.cgi?id=3662.
    Michael Kerrisk
        Add BUGS section pointing out the weirdness of the initstate_r() API

resolver.3
    Michael Kerrisk
        RES_AAONLY, RES_PRIMARY, RES_NOCHECKNAME, RES_KEEPTSIG are deprecated
            These options were never implemented; since glibc 2.25, they
            are deprecated.
    Michael Kerrisk
        The RES_NOIP6DOTINT is removed in glibc 2.25
    Michael Kerrisk
        Note that RES_BLAST was unimplemented and is now deprecated
    Michael Kerrisk
        RES_USE_INET6 is deprecated since glibc 2.25
    Michael Kerrisk
        RES_USEBSTRING was removed in glibc 2.25

resolver.3
resolv.conf.5
    Michael Kerrisk
        Note that RES_USEBSTRING defaults to off

scandir.3
    Michael Kerrisk  [Ian Jackson]
        Fix errors in example program
            See http://bugs.debian.org/848231.
    Michael Kerrisk
        Improve logic of the example program

scanf.3
    Michael Kerrisk
        Document the quote (') modifier for decimal conversions

sem_post.3
setjmp.3
    Michael Kerrisk
        SEE ALSO: add signal-safety(7)

sem_wait.3
    Michael Kerrisk  [Fabjan Sukalia]
        Remove statement that SA_RESTART does not cause restarting
            This has not been true since Linux 2.6.22. The description
            of EINTR maintains a reference to signal(7), which explains
            the historical details.

            See https://bugzilla.kernel.org/show_bug.cgi?id=192071

sleep.3
    Michael Kerrisk  [Mike Frysiner]
        Note that sleep() is implemented via nanosleep(2)
            See https://bugzilla.kernel.org/show_bug.cgi?id=73371.
    Michael Kerrisk  [Mike Frysinger]
        Note that sleep() sleeps for a real-time number of seconds
            See https://bugzilla.kernel.org/show_bug.cgi?id=73371.
    Michael Kerrisk
        Convert BUGS text to "Portability notes" subsection
            The existing text is not a bug, as such.
    Michael Kerrisk
        DESCRIPTION: minor reworking

strerror.3
    Heinrich Schuchardt
        Indicate reasonable buffer size for strerror_r() and strerror_l()
            Add a hint which buffer size is needed for
            strerror_r() and strerror_l().

strverscmp.3
    Michael Kerrisk  [Vivenzio Pagliari]
        Fix comparison error in example program

system.3
    Michael Kerrisk
        In the glibc implementation, fork handlers are not executed by system()

random.4
    Michael Kerrisk  [Jon Jensen]
        Note that entropy_avail will be a number in the range 0..4096

core.5
    Michael Kerrisk
        Clarify that dumping program's initial CWD is root directory
    Michael Kerrisk
        The target of core dump piping can also be a script

filesystems.5
    Michael Kerrisk
        SEE ALSO: add btrfs(5), nfs(5), tmpfs(5)

intro.5
    Michael Kerrisk
        Document the reality that by now Section 5 also covers filesystems
            There are by now, from various filesystem projects, various
            pages in Section 5 that document different filesystems.
            Change intro(5) to reflect that.

            Documented after following: http://bugs.debian.org/847998

proc.5
    Mike Frysinger  [Michael Kerrisk]
        Clarify /proc/pid/environ behavior
            /proc/pid/environ reflects process environment at
            *start* of program execution; it is set at time of execve(2)
    Michael Kerrisk
        Add reference to slabinfo(5) in discussion of /proc/meminfo 'Slab' field
    Michael Kerrisk
        Add entries for "keys" files that refer reader to keyrings(7)
    Michael Kerrisk
        Remove duplicate /proc/[pid]/seccomp entry
    Michael Kerrisk
        Mention other system calls that create 'anon_inode' file descriptors
            Mention a few other system calls that create file descriptors
            that display an 'anon_inode' symlink in /proc/PID/fd
    Michael Kerrisk
        Add some detail on overcommit_memory value 1
    Michael Kerrisk
        Add reference to vdso(7) in discussion of /proc/PID/maps

resolv.conf.5
    Michael Kerrisk
        ip6-bytestring was removed in glibc 2.25
    Michael Kerrisk
        The ipc-dotint and no-ip6-dotint options were removed in glibc 2.25
    Michael Kerrisk
        The 'inet6' option is deprecated since glibc 2.25

slabinfo.5
    Michael Kerrisk
        SEE ALSO: add slabtop(1)

capabilities.7
    Michael Kerrisk  [Casey Schaufler]
        Add subsection with notes to kernel developers
            Provide some notes to kernel developers considering how to choose
            which capability should govern a new kernel feature.
    Michael Kerrisk
        Further enhance the recommendation against new uses of CAP_SYS_ADMIN
    Michael Kerrisk
        Explicitly point from CAP_SYS_ADMIN to "Notes for kernel developers"
    Michael Kerrisk
        Add another case for CAP_DAC_READ_SEARCH
    Michael Kerrisk
        Refer to execve(2) for the reasons that file capabilities may be ignored
    Michael Kerrisk
        Document a new use of CAP_SYS_RESOURCE
    Michael Kerrisk
        Add some more operations governed by CAP_SYS_ADMIN
    Michael Kerrisk
        Adjust references to chattr(1) to point to ioctl_iflags(2)

environ.7
    Michael Kerrisk
        Mention prctl(2) PR_SET_MM_ENV_START and PR_SET_MM_ENV_END operations

inotify.7
    Michael Kerrisk
        Point out that inotify monitoring is inode based

ip.7
    Michael Kerrisk
        SEE ALSO: add ip(8)

man.7
uri.7
    Jakub Wilk
        Use "www.kernel.org" in example URLs
            Apparently www.kernelnotes.org is now a spam site.

mount_namespaces.7
    Michael Kerrisk  [Rob Landley]
        Rework the discussion of defaults for mount propagation types
            Add rather more detail. In particular, note the cases where the
            default propagation type is MS_PRIVATE vs MS_SHARED.

namespaces.7
    Michael Kerrisk
        EXAMPLE: fix an error in shell session
    Michael Kerrisk
        EXAMPLE: rename the example program
            Use a more generic name, since this program may be expanded
            in various ways in the future.
    Michael Kerrisk
        SEE ALSO: add ip-netns(8)
    Michael Kerrisk
        Remove content split out into ioctl_ns(2)

netlink.7
    Michael Kerrisk
        NETLINK_IP6_FW went away in Linux 3.5
    Michael Kerrisk
        NETLINK_W1 went away in Linux 2.6.18
    Michael Kerrisk
        Add NETLINK_SCSITRANSPORT to list
    Michael Kerrisk
        Add NETLINK_RDMA to list
    Michael Kerrisk
        NETLINK_FIREWALL was removed in Linux 3.5
    Michael Kerrisk
        NETLINK_NFLOG was removed in Linux 3.17
    Jakub Wilk
        Update libnl homepage URL
            The original URL is 404.

pid_namespaces.7
user_namespaces.7
    Michael Kerrisk
        Adjust references to namespaces(7) to ioctl_ns(2)

pid_namespaces.7
    Keno Fischer
        CLONE_SIGHAND|CLONE_VM|CLONE_NEWPID is no longer disallowed

pipe.7
    Michael Kerrisk
        Since Linux 4.9, pipe-max-size is ceiling for the default pipe capacity
    Michael Kerrisk
        Clarify that default pipe capacity is 16 pages
            The statement that the default pipe capacity is 65536 bytes
            is accurate only on systems where the page size is 4096B.
            See the use of PIPE_DEF_BUFFERS in the kernel source.

random.7
    Michael Kerrisk
        Mention getentropy(3)
    Michael Kerrisk
        SEE ALSO: add getentropy(3)
    Michael Kerrisk
        SEE ALSO: add getauxval(3)
            A small hint to the reader that some random bytes arrive
            in the auxiliary vector.

signal.7
    Michael Kerrisk
        SIGSYS: add reference to seccomp(2)
    Michael Kerrisk
        Change description of SIGSYS to "Bad system call"
            This is the more typical definition.
    Michael Kerrisk
        SIGPIPE: add reference to pipe(7)
    Michael Kerrisk
        SIGXFSZ: add reference to setrlimit(2)
    Michael Kerrisk
        Add a name for SIGEMT
    Michael Kerrisk
        SIGXCPU: add reference to setrlimit(2)
    Michael Kerrisk
        Migrated signal-safety discussion to new signal-safet(7) page

unix.7
    Michael Kerrisk  [Sergey Polovko]
        Since Linux 3.4, UNIX domain sockets support MSG_TRUNC
            This was correctly noted in recv(2), but the unix(7) page
            was not correspondingly updated for the Linux 3.4 change.
    Michael Kerrisk  [Willy Tarreau]
        Document ETOOMANYREFS for SCM_RIGHTS send exceeding RLIMIT_NOFILE limit

user_namespaces.7
    Michael Kerrisk
        Change page cross reference: keyctl(2) ==> keyrings(7)

ld.so.8
    Michael Kerrisk
        LD_BIND_NOT has effect only for function symbols
    Michael Kerrisk
        Describe use of LD_DEBUG with LD_BIND_NOT
    Michael Kerrisk
        In secure mode, LD_AUDIT restricts the libraries that it will load
    Michael Kerrisk
        LD_AUDIT understands $ORIGIN, $LIB, and $PLATFORM


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
