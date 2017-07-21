From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-4.12 released
Date: Fri, 21 Jul 2017 20:54:37 +0200
Message-ID: <60721c95-e900-5ff3-fe5d-005da4f7b4ee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

The Linux man-pages maintainer proudly announces:

    man-pages-4.12 - man pages for Linux

This release resulted from patches, bug reports, reviews, and comments
from around 30 contributors. This relatively small release consists of
just under 200 commits changing around 90 pages. 

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_4.12

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2017/07/man-pages-412-is-released.html

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

==================== Changes in man-pages-4.12 ====================

Released: 2017-07-13, London


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Alex Henrie <alexhenrie24-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Andi Kleen <andi-bz-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Arjun Shankar <arjun.is-xDe9EDckjEKzQB+pC5nmwQ@public.gmane.org>
Brad Bendily <bendily-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cameron Wright <wright18-lfcS8c3Mqgg@public.gmane.org>
Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Darrick J. Wong <darrick.wong-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
David Lewis <davlewi3-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
DJ Delorie <dj-Ht4Cp5ncgjRBDgjK7y7TUQ@public.gmane.org>
Douglas Caetano dos Santos <douglascs-6ANAkuZINJhwFqzsTH5u/w@public.gmane.org>
Dr. Tobias Quathamer <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Eric Biggers <ebiggers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Ferdinand Thiessen <f.thiessen-Mmb7MZpHnFY@public.gmane.org>
G. Branden Robinson <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Henry Bent <henry.r.bent-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Janne Snabb <snabb-wN/OigK0MJ0AvxtiuMwx3w@public.gmane.org>
Joe Brown <joe.brown.89-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>
Jorge Nerin <jnerin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Kirill Tkhai <ktkhai-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>
lilydjwg <lilydjwg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Long Wang <w@laoqinren.net>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Nadav Har'El <nyh-TS7m/3hpY0sOpacJJkBjfT4kX+cae0hd@public.gmane.org>
NeilBrown <neilb-IBi9RG/b67k@public.gmane.org>
Pavel Tikhomirov <ptikhomirov-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>
Quentin Rameau <quinq-UlqG2OPX9a0ue8ZPuPpd/Q@public.gmane.org>
Ruben Kerkhof <ruben-pkfekA+zf0jEimEGZCN+oA@public.gmane.org>
sulit <sulitsrc-H32Fclmsjq1BDgjK7y7TUQ@public.gmane.org>
石井大貴 <hiroki.ishii-GmhWrQMWH5w7YuNMryXyOw@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

ioctl_getfsmap.2
    Darrick J. Wong
        Document the GETFSMAP ioctl
            Document the new GETFSMAP ioctl that returns the physical layout of a
            (disk-based) filesystem.


Newly documented interfaces in existing pages
---------------------------------------------

namespaces.7
    Kirill Tkhai  [Michael Kerrisk]
        Document the /proc/[pid]/ns/pid_for_children file


Changes to individual pages
---------------------------

ldd.1
    Michael Kerrisk
        'objdump -p prog | grep NEEDED' doesn't give quite same info as 'ldd'

chmod.2
    Michael Kerrisk
        Put fchmod() feature test macro requirements in a more readable format
    Michael Kerrisk
        Note glibc 2.24 feature test macro requirements changes for fchmod()

chown.2
    Michael Kerrisk
        When file owner or group is changed, file capabilities are cleared
    Michael Kerrisk
        Changes to file owner by root also clear set-UID and set-GID bits

clone.2
    Michael Kerrisk
        Update BUGS to reflect fact that PID caching was removed in glibc 2.25

epoll_wait.2
    Michael Kerrisk
        Clarify semantics of returned 'data' field
            The returned 'data' is the 'data' most recently set via
            epoll_ctl().

get_mempolicy.2
    Michael Kerrisk  [Nadav Har'El, Andi Kleen]
        SYNOPSIS: fix return type of get_mempolicy()
            See https://bugzilla.kernel.org/show_bug.cgi?id=97051

getpid.2
    Carlos O'Donell, Michael Kerrisk
        Note that PID caching is removed as of glibc 2.25
            Since glibc 2.25 the PID cache is removed.

            Rationale given in the release notes:
            https://sourceware.org/glibc/wiki/Release/2.25#pid_cache_removal

ioctl.2
    Michael Kerrisk
        SEE ALSO: add ioctl_getfsmap(2)

ioctl_getfsmap.2
    Michael Kerrisk
        Fix ordering of sections
    Michael Kerrisk
        Add VERSIONS section
    Michael Kerrisk
        ERRORS: order alphabetically

madvise.2
    Michael Kerrisk
        Remove bogus text re POSIX_MADV_NOREUSE
            There is a POSIX_FADV_NOREUSE for posix_fadvise(),
            but no POSIX_MADV_NOREUSE for any API in POSIX.

membarrier.2
    Michael Kerrisk
        Add ENOSYS error for 'nohz_full' CPU setting

mount.2
    NeilBrown
        Revise description of MS_REMOUNT | MS_BIND
            MS_REMOUNT|MS_BIND affects all per-mount-point
            flag.  MS_RDONLY is only special because it,
            uniquely, is both a per-mount-point flag *and* a
            per-filesystem flag.

            So the sections of per-mount-point flags and
            MS_REMOUNT can usefully be clarified.

open.2
    Michael Kerrisk
        Note some further advantages of the *at() APIs

pipe.2
    Michael Kerrisk
        SEE ALSO: add tee(2) and vmsplice(2)

readv.2
    Michael Kerrisk
        glibc 2.26 adds library support for preadv2() and pwritev2()

sched_setaffinity.2
    Michael Kerrisk
        Mention cpuset cgroups as a cause of EINVAL error

seccomp.2
    Mike Frysinger
        Expand SECCOMP_RET_KILL documentation

sigaction.2
    Michael Kerrisk
        Note feature test macro requirements for 'si_code' constants
    Michael Kerrisk
        Add a subheading for the description of 'si_code'
    Michael Kerrisk
        TRAP_BRANCH and TRAP_HWBKPT are present only on IA64

sigaltstack.2
    Michael Kerrisk
        Note that specifying SS_ONSTACK in ss.ss_flags decreases portability
            In the Illumos source (which presumably mirrors its Solaris
            ancestry), there is this check in the sigaltstack()
            implementation:

                           if (ss.ss_flags & ~SS_DISABLE)
                                    return (set_errno(EINVAL));

            And in the FreeBSD source we find similar:

                            if ((ss->ss_flags & ~SS_DISABLE) != 0)
                                    return (EINVAL);
    Michael Kerrisk
        Note buggy addition of ss.ss_flags==SS_ONSTACK
            Note buggy addition of ss.ss_flags==SS_ONSTACK as a synonym
            for ss_flags==0. No other implemenation does this, AFAIK.
            And it was not needed :-(.
    Michael Kerrisk
        Specifying 'ss' returns the current settings without changing them
    Michael Kerrisk
        Give 'oss' argument a more meaningful name: 'old_ss'
    Michael Kerrisk
        Some minor reworking of the text
    Michael Kerrisk
        ERRORS: update description of EINVAL error

splice.2
tee.2
vmsplice.2
    Michael Kerrisk
        SEE ALSO: add pipe(7)

splice.2
    Michael Kerrisk
        ERRORS: split EINVAL error cases
    Michael Kerrisk
        ERRORS: add EINVAL for case where both descriptors refer to same pipe

timer_create.2
    Michael Kerrisk
        Document the CONFIG_POSIX_TIMERS option added in Linux 4.10

wait.2
    Michael Kerrisk
        Note glibc 2.26 changes to feature test macro requirements for waitid()

acosh.3
asinh.3
atanh.3
    Alex Henrie
        Remove C89 designation.
            See https://bugzilla.kernel.org/show_bug.cgi?id=196319

            [mtk: confirmed from review of draft of C90 standard]

bsd_signal.3
    Michael Kerrisk
        Note feature test macro requirements changes for glibc 2.26

dl_iterate_phdr.3
    Michael Kerrisk
        dl_iterate_phdr() shows the order in which objects were loaded
            dl_iterate_phdr() tells us not just which objects are
            loaded, but also the order in which they are loaded
            (the "link-map order"). Since the order is relevant for
            understanding symbol resolution, give the reader this clue.
    Michael Kerrisk
        Expand the code example, and show sample output
    Michael Kerrisk
        List values for the 'p_type' field

dlsym.3
    Michael Kerrisk
        _GNU_SOURCE is needed to get RTLD_DEFAULT and RTLD_NEXT definitions

flockfile.3
    Michael Kerrisk
        Note glibc 2.24 feature test macro requirement changes

fpathconf.3
    Michael Kerrisk
        Rework RETURN VALUE description to add more detail
    Michael Kerrisk
        Add an errors section
    Michael Kerrisk
        Largely rewrite the description of _PC_CHOWN_RESTRICTED
    Michael Kerrisk
        Rewrite description of _PC_PIPE_BUF
            The existing description was not accurate, and lacked details.

ftw.3
    Michael Kerrisk
        BUGS: document a probable glibc regression in FTW_SLN case
            See https://bugzilla.redhat.com/show_bug.cgi?id=1422736
            and http://austingroupbugs.net/view.php?id=1121.

getaddrinfo.3
    Quentin Rameau
        Fix _POSIX_C_SOURCE value for getaddrinfo()
            The correct _POSIX_C_SOURCE value is 200112L, not 201112L in features.h.

getcontext.3
    Carlos O'Donell
        Exemplar structure should use 'ucontext_t'.

getgrent.3
    Michael Kerrisk
        Note glibc 2.22 changes for feature test macro requirements

grantpt.3
ptsname.3
unlockpt.3
    Ferdinand Thiessen  [Michael Kerrisk]
        Update feature test macro-requirements for glibc 2.24

if_nametoindex.3
    Douglas Caetano dos Santos
        Add ENODEV error for if_nametoindex()

malloc.3
    Michael Kerrisk
        Document the reallocarray() added in glibc 2.26

nl_langinfo.3
    Michael Kerrisk
        Note feature test macro requirements for nl_langinfo_l()

posix_madvise.3
    Dr. Tobias Quathamer
        Remove paragraph about POSIX_FADV_NOREUSE
            POSIX_FADV_NOREUSE is documented for posix_fadvise, and a
            corresponding POSIX_MADV_NOREUSE flag is not specified by POSIX.
            See https://bugs.debian.org/865699

ptsname.3
    Michael Kerrisk  [Arjun Shankar]
        Since glibc 2.26, ptsname_r() no longer gives EINVAL for buf==NULL

rand.3
    Michael Kerrisk
        Note glibc 2.24 feature test macro requirement changes for rand_r()

resolver.3
    Michael Kerrisk
        Add basic notes on 'op' argument of res_nmkquery() and res_mkquery()

sigpause.3
    Michael Kerrisk
        Note glibc 2.26 changes to feature test macro requirements

sigwait.3
    Michael Kerrisk
        Note glibc 2.26 feature test macro changes

strtol.3
    Heinrich Schuchardt
        Mention 0X prefix
            The prefix 0x may be capitalized as 0X.

            See ISO/IEC 9899:1999.

sysconf.3
    Michael Kerrisk  [Pavel Tikhomirov]
        Rework RETURN VALUE description to add more detail
            Make the discussion clearer, and add a few details.
            Also, fix the problem report from Pavel Tikhomirov
            who noted that the man page falsely said that errno
            is not changed on a successful return.

            Addresses https://bugzilla.kernel.org/show_bug.cgi?id=195955
    Michael Kerrisk
        Add ERRORS section

ttyslot.3
    Michael Kerrisk
        Fix error in feature test macro requirements
    Michael Kerrisk
        Note feature test macro requirements changes in glibc 2.24
    Michael Kerrisk
        Clarify details of use of <stdlib.h> file

unlocked_stdio.3
    Michael Kerrisk
        Note glibc 2.24 feature test macro requirement changes

elf.5
    Michael Kerrisk
        SEE ALSO: add dl_iterate_phdr(3)

nsswitch.conf.5
    DJ Delorie
        Clarify group merge rules
            This minor patch clarifies when merging is not done,
            and how duplicate entries are merged.

proc.5
    Michael Kerrisk
        Document that 'iowait' field of /proc/stat is unreliable
            Text taken from Chao Fan's kernel commit 9c240d757658a3ae996.

slabinfo.5
    Michael Kerrisk  [Jorge Nerin]
        SEE ALSO: add some references to relevant kernel source files

tmpfs.5
    Michael Kerrisk
        SEE ALSO: add memfd_create(2), mmap(2), shm_open(3)

capabilities.7
    Michael Kerrisk
        Clarify the effect on process capabilities when UID 0 does execve(2)
    Michael Kerrisk
        Note effect on capabilities when a process with UID != 0 does execve(2)
    Michael Kerrisk  [David Lewis]
        Fix reversed descriptions of CAP_MAC_OVERRIDE and CAP_MAC_ADMIN
    Michael Kerrisk
        SEE ALSO: add filecap(8), netcap(8), pscap(8)

cgroup_namespaces.7
    Michael Kerrisk
        Add some further explanation of the example shell session
    Michael Kerrisk
        Fix a bug in shell session example

inode.7
    Michael Kerrisk
        Note glibc 2.24 feature test macro changes for S_IFSOCK and S_ISSOCK()

man.7
    G. Branden Robinson
        Undocument "URL" macro in man(7) in favor .UR+.UE

pid_namespaces.7
    Michael Kerrisk
        Mention /proc/[pid]/ns/pid_for_children

pipe.7
    Michael Kerrisk
        SEE ALSO: add tee(2) and vmsplice(2)

sigevent.7
    Michael Kerrisk
        Mention signal.h header file

signal.7
    Michael Kerrisk  [lilydjwg]
        Since Linux 3.8, read(2) on an inotify FD is restartable with SA_RESTART
            See https://bugzilla.kernel.org/show_bug.cgi?id=195711
    Michael Kerrisk
        read() from an inotify FD is no longer interrupted by a stop signal
            (Change was in Linux 3.8.)

tcp.7
    Michael Kerrisk
        Document value '2' for tcp_timestamps
            Since Linux 4.10, the value '2' is meaningful for tcp_timestamps
    Ruben Kerkhof
        Change default value of tcp_frto
            The default changed in c96fd3d461fa495400df24be3b3b66f0e0b152f9
            (Linux 2.6.24).

ld.so.8
    Michael Kerrisk
        Greatly expand the explanation of LD_DYNAMIC_WEAK
    Carlos O'Donell
        Expand DT_RUNPATH details.
            ld.so.8: Expand DT_RUNPATH details.

            Every 3 years we get asked why DT_RUNPATH doesn't work like DT_RPATH.
            The most recent question was here:
            https://www.sourceware.org/ml/libc-help/2017-06/msg00013.html

            We need to expand the description of DT_RUNPATH to cover this
            situation and explain that the DT_RUNPATH entries apply only to the
            immediate DT_NEEDED, not that of another, say dlopen'd child object.
    Michael Kerrisk
        Since glibc 2.2.5, LD_PROFILE is ignored in secure-execution mode
    Michael Kerrisk
        Make notes on secure-execute mode more prominent
            Place each note on secure-execution mode in a separate
            paragraph, to make it more obvious.
    Michael Kerrisk
        Note that libraries in standard directories are not normally set-UID
            In secure mode, LD_PRELOAD loads only libraries from standard
            directories that are marked set-UID. Note that it is unusual for
            a library to be marked in this way.
    Michael Kerrisk
        SEE ALSO: add elf(5)
    Michael Kerrisk
        Note version where secure-execution started ignoring LD_USE_LOAD_BIAS
    Michael Kerrisk
        Correct glibc version that ignores LD_SHOW_AUXV in secure-execution mode
            Ignored since 2.3.4 (not 2.3.5).
    Michael Kerrisk
        Rewrite LD_DEBUG_OUTPUT description and note that .PID is appended

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
