From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-4.13 released
Date: Fri, 15 Sep 2017 15:39:23 +0200
Message-ID: <051864bb-92e5-63df-6825-2c63360ff73d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

    man-pages-4.13 - man pages for Linux

This release resulted from patches, bug reports, reviews, and 
comments from around 40 contributors. The release is rather 
larger than average. (The context diff runs to more than 90k 
lines.) The release includes more than 350 commits and contains 
some fairly wide-ranging formatting fix-ups that meant that all 
1028 existing manual pages saw some change(s). In addition, 
5 new manual pages were added.

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_4.13

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2017/09/man-pages-413-is-released.html

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

==================== Changes in man-pages-4.13 ====================

Released: 2017-09-15, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Aleksa Sarai <asarai-l3A5Bk7waGM@public.gmane.org>
Alex Henrie <alexhenrie24-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Benjamin Peterson <bp-FdlSlcb4kYoEmBOxnfisBw@public.gmane.org>
Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Darrick J. Wong <darrick.wong-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
David Wilder <dwilder-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Dennis Knorr <dennis.knorr-EnyPcy3oyxIb1SvskN2V4Q@public.gmane.org>
Don Brace <don.brace-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>
Douglas Caetano dos Santos <douglascs-6ANAkuZINJhwFqzsTH5u/w@public.gmane.org>
Elliott Hughes <enh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Fabio Scotoni <fabio-VLnxIkhT3pI@public.gmane.org>
Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Jason Noakes <jjnoakes-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>
Jonas Grabber <jobegrabber-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Li Zhijian <lizhijian-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Mark Wielaard <mark-S8vpcOIGcCXYtjvyW6yDsg@public.gmane.org>
Meelis Roos <mroos-Y27EyoLml9s@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
NeilBrown <neilb-IBi9RG/b67k@public.gmane.org>
Otto Ebeling <oebeling-YEAOTlfEoH7f77WrBdCPMDwVj7d+iGoU@public.gmane.org>
Paul Eggert <eggert-764C0pRuGfqVc3sceRu5cw@public.gmane.org>
Rick Jones <rick.jones2-ZPxbGqLxI0U@public.gmane.org>
Sage Weil <sage-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Sergey Z. <zhurxx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Shrikant Giridhar <shrikantgiridhar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Stephan Müller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>
Sukadev Bhattiprolu <sukadev-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Tej Chajed <tchajed-3s7WtUTddSA@public.gmane.org>
Thiago Jung Bauermann <bauerman-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Vincent Bernat <vincent-5wNQGcxKXm8AvxtiuMwx3w@public.gmane.org>
Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Ильдар Низамов <niya3-JGs/UdohzUI@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

pthread_mutex_consistent.3
    Yubin Ruan, Michael Kerrisk
        New page documenting pthread_mutex_consistent(3)

pthread_mutexattr_getpshared.3
    Michael Kerrisk
        New page for pthread_mutexattr_getpshared(3) and pthread_mutexattr_setpshared(3)

pthread_mutexattr_init.3
    Michael Kerrisk
        New page for pthread_mutexattr_init(3) and pthread_mutexattr_destroy(3)

pthread_mutexattr_setrobust.3
    Yubin Ruan, Michael Kerrisk
        New page for pthread_mutexattr_setrobust(3) and pthread_mutexattr_getrobust(3)

sysfs.5
    Michael Kerrisk  [Mark Wielaard]
        New page documenting the sysfs filesystem
            Just a skeleton page so far, but perhaps it will be filled out
            over time.


Newly documented interfaces in existing pages
---------------------------------------------

fcntl.2
    Jens Axboe, Michael Kerrisk
        Describe the set/get write hints commands that are added in Linux 4.13
            Document F_GET_RW_HINT, F_SET_RW_HINT, F_GET_FILE_RW_HINT, and
            F_SET_FILE_RW_HINT.

ioctl_tty.2
    Aleksa Sarai, Michael Kerrisk
        Add TIOCGPTPEER documentation

kcmp.2
    Cyrill Gorcunov
        Add KCMP_EPOLL_TFD description

keyctl.2
    Eugene Syromyatnikov
        Document the KEYCTL_RESTRICT_KEYRING operation
    Eugene Syromyatnikov  [Stephan Müller]
        Document the ability to provide KDF parameters in KEYCTL_DH_COMPUTE


New and changed links
---------------------

pthread_mutexattr_destroy.3
    Michael Kerrisk
        New link to new pthread_mutexattr_init.3 page

pthread_mutexattr_getrobust.3
pthread_mutexattr_getrobust_np.3
pthread_mutexattr_setrobust_np.3
    Michael Kerrisk
        New links to new pthread_mutexattr_setrobust.3 page

pthread_mutexattr_setpshared.3
    Michael Kerrisk
        New link to new pthread_mutexattr_getpshared.3 page


Global changes
--------------

Various pages
    Michael Kerrisk
        Use .EX/.EE for EXAMPLE programs

Various pages
    Michael Kerrisk
        Use consistent markup for code snippets
            Change .nf/.fi to .EX/.EE

Various pages
    Michael Kerrisk
        Use consistent markup for code snippets
            The preferred form is

                .PP/.IP
                .in +4n
                .EX
                <code>
                .EE
                .in
                .PP/.IP

Various pages
    Michael Kerrisk
        Formatting fix: replace blank lines with .PP/.IP
            Blank lines shouldn't generally appear in *roff source (other
            than in code examples), since they create large vertical
            spaces between text blocks.

Various pages
    Michael Kerrisk  [Bjarni Ingi Gislason]
        Add a non-breaking space between a number and a unit (prefix)
            Based on a patch by Bjarni Ingi Gislason.

Various pages
    Michael Kerrisk  [Bjarni Ingi Gislason]
        Use en-dash for ranges
            Based on a patch by Bjarni Ingi Gislason.

A few pages
    Michael Kerrisk
        Fix misordering of sections
    Michael Kerrisk
        Fix order of SEE ALSO entries


Changes to individual pages
---------------------------

ldd.1
    Michael Kerrisk
        Add more detail on ldd security implications, noting glibc 2.27 changes

add_key.2
backtrace.3
syslog.3
    Michael Kerrisk
        Fix misordered SEE ALSO entries

add_key.2
request_key.2
keyrings.7
    Eugene Syromyatnikov
        Update Linux documentation pointers

chown.2
    Michael Kerrisk
        Update kernel version in note on support for grpid/nogrpid mount options
            There has been no change since Linux 2.6.25, so update the
            kernel version to 4.12.

execve.2
    Michael Kerrisk
        SEE ALSO: add get_robust_list(2)

getrandom.2
    Michael Kerrisk  [Fabio Scotoni]
        SYNOPSIS: make return type of getrandom() 'ssize_t'
            This accords with glibc headers and the Linux kernel source.

getrlimit.2
    Thiago Jung Bauermann
        Mention unit used by RLIMIT_CORE and RLIMIT_FSIZE
    Michael Kerrisk
        Note that RLIMIT_AS and RLIMIT_DATA are rounded down to system page size
    Michael Kerrisk
        Mention unit for RLIMIT_DATA

getrlimit.2
mmap.2
malloc.3
    Jonas Grabber
        RLIMIT_DATA affects mmap (2) since Linux 4.7

get_robust_list.2
    Michael Kerrisk
        Detail the operation of robust futex lists
    Michael Kerrisk
        Since Linux 2.6.28, robust futex lists also have an effect for execve(2)
    Michael Kerrisk
        Clarify that "thread ID" means "kernel thread ID"
    Michael Kerrisk
        SEE ALSO: add pthread_mutexattr_setrobust(3)

ioctl_getfsmap.2
    Darrick J. Wong
        Correct semantics of FMR_OF_LAST flag

ioctl_userfaultfd.2
    Mike Rapoport
        Document replacement of ENOSPC with ESRCH
    Mike Rapoport
        Update uffdio_api.features description
            There is no requirement that uffdio_api.features must be zero
            for newer kernels. This field actually defines what features
            space would like to enable.

io_submit.2
    Sage Weil
        Acknowledge possibility of short return
            Note that the return value may be a value less than 'nr'
            if not all iocbs were queued at once.

ipc.2
    Michael Kerrisk
        SEE ALSO: add svipc(7)

keyctl.2
    Eugene Syromyatnikov
        mention keyctl_dh_compute(3) and keyctl_dh_compute_alloc (3)
            These functions have been added in keyutils 1.5.10
    Eugene Syromyatnikov
        Mention ENOMEM in ERRORS
    Eugene Syromyatnikov
        Update kernel documentation path reference

move_pages.2
    Otto Ebeling  [Michael Kerrisk]
        Note permission changes that occurred in Linux 4.13

mprotect.2
    Michael Kerrisk  [Shrikant Giridhar]
        Add warning about the use of printf() in the example code

open.2
    NeilBrown
        Improve O_PATH documentation
            - fstatfs is now permitted.
            - ioctl isn't, and is worth listing explicitly
            - O_PATH allows an automount point to be opened with
              triggering the mount.

prctl.2
seccomp.2
    Eugene Syromyatnikov
        Update pointer to in-kernel seccomp documentation

prctl.2
ptrace.2
    Eugene Syromyatnikov
        Update pointer to in-kernel Yama documentation

prctl.2
    Eugene Syromyatnikov
        Update pointer to in-kernel no_new_privs flag documentation

readlink.2
    Michael Kerrisk  [Jason Noakes]
        Fix an off-by-one error in example code

seccomp.2
    Kees Cook
        Clarify SECCOMP_RET_KILL kills tasks not processes

select_tut.2
    Michael Kerrisk  [Sergey Z.]
        Clarify an ambiguity with respect to select() and EAGAIN
            See https://bugzilla.kernel.org/show_bug.cgi?id=196345

set_tid_address.2
    Elliott Hughes
        Note that there's no glibc wrapper for set_tid_address()

socket.2
    Michael Kerrisk  [Yubin Ruan]
        socket() uses the lowest available file descriptor

_syscall.2
    Michael Kerrisk
        Remove redundant comment from EXAMPLE
            A discussion of the nroff source of the manual
            page isn't very useful...

sysfs.2
    Michael Kerrisk
        Add a pointer to sysfs(5) to help possibly confused readers
    Michael Kerrisk
        Make it clearer near the start of the page that sysfs(2) is obsolete

timer_create.2
    Michael Kerrisk
        Strengthen the warning about use of printf() in the example program
    Michael Kerrisk
        Update cross reference: signal(7) should be signal-safety(7)

umount.2
    NeilBrown
        Revise MNT_FORCE description
            MNT_FORCE does not allow a busy filesystem to be unmounted.  Only
            MNT_DETACH allows that.  MNT_FORCE only tries to abort pending
            transactions, in the hope that might help umount not to block,

            Also, other filesystems than NFS support MNT_FORCE.

unshare.2
    Eugene Syromyatnikov
        Update pointer to in-kernel unshare documentation

wait.2
    Michael Kerrisk  [Ильдар Низамов]
        POSIX.1-2008 TC1 clarifies treatment of 'si_pid' for waitid() WNOHANG

cmsg.3
    Sukadev Bhattiprolu
        Add a scatter/gather buffer to sample code
    Michael Kerrisk
        Reorganize the text somewhat (no content changes)

crypt.3
    Konstantin Shemyak  [Michael Kerrisk]
        Add description of previously undocumented 'rounds' parameter
    Konstantin Shemyak
        Encryption isn't done with SHA-xxx, but with a function based on SHA-xxx
    Konstantin Shemyak
        Clarify that ending of the salt string with '$' is optional

exit.3
    Michael Kerrisk
        Mention the prctl(2) PR_SET_PDEATHSIG operation
    Michael Kerrisk
        SEE ALSO: add get_robust_list(2)
    Michael Kerrisk
        Add a heading to delimit discussion of signals sent to other processes

exp2.3
    Alex Henrie
        Remove C89 designation

log1p.3
    Alex Henrie
        Document fixes to give EDOM or ERANGE on error

matherr.3
    Michael Kerrisk
        Note that glibc 2.27 removes the 'matherr' mechanism
    Michael Kerrisk
        Remove crufty feature test macro requirements

pow10.3
    Michael Kerrisk
        Note that pow10() is now obsolete in favor of exp10()
            Also, the pow10() functions are no longer supported by glibc,
            starting with version 2.27.

sincos.3
    Michael Kerrisk
        Note that sincos() is intended to be more efficient than sin() + cos()

cciss.4
hpsa.4
    Eugene Syromyatnikov  [Don Brace, Meelis Roos]
        Mention cciss removal in Linux 4.14
            During the Linux 4.13 development cycle, the cciss driver has been
            removed in favor of the hpsa driver, which has been amended with
            some legacy board support.

initrd.4
proc.5
bootparam.7
    Eugene Syromyatnikov
        Update pointer to in-kernel initrd documentation

initrd.4
    Eugene Syromyatnikov
        Update pointer to in-kernel root over NFS documentation

intro.4
    Michael Kerrisk
        SEE ALSO: add mknod(1) and mknod(2)

host.conf.5
    Michael Kerrisk
        Add cross-reference to hosts(5)

locale.5
    Marko Myllynen
        Refer to existing locales for encoding details
            Since I don't think it would make sense to try to have different
            explanation for each glibc version on the locale(5) man page, I'm
            proposing that we apply the below patch so that we refer to
            existing locale definition files in general and not spell out the
            exact format or any certain locale as a definitive guideline.

nologin.5
    Michael Kerrisk
        Add a sentence explaining why nologin is useful

proc.5
    Eugene Syromyatnikov
        Document removal of htab-reclaim sysctl file
            This PPC-specific sysctl option has been removed in Linux 2.4.9.2,
            according to historic Linux repository commit log.
    Eugene Syromyatnikov
        Add description for cpuN lines in /proc/stat
    Eugene Syromyatnikov
        Add description for softirq line in /proc/stat
    Eugene Syromyatnikov
        Document removal of timer_stats file
    Michael Kerrisk
        Note Linux 4.9 changes to privileges for /proc/[pid]/timerslack_ns
    Michael Kerrisk
        Show command used to mount /proc
    Michael Kerrisk
        Explicitly note in intro that some /proc files are writable
    Eugene Syromyatnikov
        Update pointer to in-kernel SysRq documentation
    Michael Kerrisk
        SEE ALSO: add sysfs(5)
    Eugene Syromyatnikov
        Update pointer to in-kernel security keys documentation
    Benjamin Peterson
        Fix path to binfmt_misc docs
    Eugene Syromyatnikov
        Update pointer to in-kernel MTRR documentation
    Eugene Syromyatnikov
        Update reference to kernel's crypto API documentation

tzfile.5
    Paul Eggert
        Sync from tzdb upstream
            This makes tzfile.5 a copy of the tzdb version, except that the
            tzdb version's first line is replaced by man-pages boilerplate.
            The new version documents version 3 format, among other things.
            Also, it removes the "Summary of the timezone information file
            format" section, which should no longer be needed due to
            improvements in the the part of the man page.

capabilities.7
    Michael Kerrisk
        Note semantics for a program that is set-UID-root and has capabilities
            Note semantics for a program that is both set-user-ID-root and has
            file capabilities.
    Michael Kerrisk  [Dennis Knorr]
        Note that a set-UID-root program may have an empty file capabilite set

cgroups.7
    Michael Kerrisk
        SEE ALSO: systemd-cgls(1)

cpuset.7
    Eugene Syromyatnikov
        Update pointer to in-kernel cpusets documentation

keyrings.7
    Eugene Syromyatnikov
        Document description restriction for logon keys
            "logon" type has additional check that enforces colon-separated
            prefix in key descriptions.
    Eugene Syromyatnikov
        Add pointers to kernel's documentation
            Mostly because of assymmetric-keys.txt, which is outside
            security/keys for some reason.

man-pages.7
    Michael Kerrisk
        Expand the guidance on formatting code snippets

netlink.7
    David Wilder
        Change buffer size in example code about reading netlink message
    Michael Kerrisk  [Rick Jones]
        Add a comment on 8192 buffer size in example code

pthreads.7
    Michael Kerrisk
        SEE ALSO: add pthread_mutexattr_destroy(3) and pthread_mutexattr_init(3)

signal.7
    Michael Kerrisk
        Since glibc 2.26, SIGUNUSED is no longer defined

tcp.7
    Vincent Bernat
        tcp_tw_recycle is removed from Linux 4.12
            And it is completely broken.

unicode.7
    Eugene Syromyatnikov
        Update pointer to in-kernel Unicode terminal support documentation

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
