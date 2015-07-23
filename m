From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-4.01 released
Date: Thu, 23 Jul 2015 20:50:33 +0200
Message-ID: <55B13779.1010901@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

    man-pages-4.01 - man pages for Linux

This release includes two new man pages and makes changes=20
in over 100 other pages, based on input and contributions from=20
nearly 50 people.

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_4.01

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2015/07/man-pages-401-is-released.h=
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
 man-pages-4.01 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2015-07-23, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
Andries E. Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Arjun Shankar <arjun-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Ashish Sangwan <a.sangwan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Ben Woodard <woodard-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Christoph Thompson <cjsthompson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cortland Setlow <cortland.setlow-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
David Leppik <dleppik-wDACTJb33xtWk0Htik3J/w@public.gmane.org>
Dilyan Palauzov <dilyan.palauzov-L8B2PhUVQgrYtjvyW6yDsg@public.gmane.org>
Doug Klima <cardoe-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Eric B Munson <emunson-JqFfY2XvxFXQT0dZR+AlfA@public.gmane.org>
=46lorian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Hack NDo <hackndo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Jens Axboe <axboe-b10kYP2dOMg@public.gmane.org>
Jian Wen <wenjianhn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Joerg Roedel <jroedel-l3A5Bk7waGM@public.gmane.org>
Julian Orth <ju.orth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Laszlo Ersek <lacos-hjAHdpL4VZo5Z0SDYBDJZg@public.gmane.org>
Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Mehdi Aqadjani Memar <m.aqadjanimemar-oe7qfRrRQfcprfpi5Sxi9A@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Michal Hocko <mhocko-AlSwsSmVLrQ@public.gmane.org>
Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Mike Hayward <hayward-AB0c8HnZplU@public.gmane.org>
Miklos Szeredi <miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org>
Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Namjae Jeon <namjae.jeon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Nathan Lynch <nathan_lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
P=C3=A1draig Brady <P@draigBrady.com>
Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Scot Doyle <lkml14-enLWO88E2pdl57MIdRCFDg@public.gmane.org>
Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Tobias Stoeckmann <tobias-te0W2B6tFQkGQOE+iOL5gA@public.gmane.org>
Tulio Magno Quites Machado Filho <tuliom-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Uwe Kleine-K=C3=B6nig <uwe+debian-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Ville Skytt=C3=A4 <ville.skytta-X3B1VOXEql0@public.gmane.org>
Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
=E6=96=87=E5=89=91 <wenjianhn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

bpf.2
    Alexei Starovoitov, Michael Kerrisk  [Daniel Borkmann]
        New page documenting bpf(2)

__ppc_get_timebase.3
    Tulio Magno Quites Machado Filho
        New page documenting __ppc_get_timebase() and __ppc_get_timebas=
e_freq()
            Glibc 2.16 was released with a new function for the Power
            architecture that can read its Time Base Register.
            Glibc 2.17 adds a function to read the frequency at which t=
he Time
            Base Register of Power processors is updated.

queue.3
    Michael Kerrisk  [David Leppik, Doug Klima]
        Reimport from latest FreeBSD page
            Long ago, Doug Klima noted that many macros were not
            documented in the queue(3) page. Fix by reimporting from
            latest [1] FreeBSD man page.

            [1] Revision 263142, Modified Fri Mar 14 03:07:51 2014 UTC

            This also fixes https://sourceware.org/bugzilla/show_bug.cg=
i?id=3D1506

            This time, I'll learn from past mistakes and not convert
            from 'mdoc' to 'man' macros.
    Michael Kerrisk
        Use subsections in DESCRIPTION
    Michael Kerrisk
        Remove SEE ALSO reference to nonexistent tree(3)
    Michael Kerrisk
        Use real hyphens in code samples
    Michael Kerrisk
        Comment out text for functions not in glibc
    Michael Kerrisk
        Replace HISTORY with CONFORMING TO


Newly documented interfaces in existing pages
---------------------------------------------

rename.2
    Michael Kerrisk  [Miklos Szeredi]
        Document RENAME_WHITEOUT
            Heavily based on text by Miklos Szeredi.


New and changed links
---------------------

__ppc_get_timebase_freq.3
    Tulio Magno Quites Machado Filho
        New link to new __ppc_get_timebase(3) page

LIST_EMPTY.3
LIST_FIRST.3
LIST_FOREACH.3
LIST_HEAD_INITIALIZER.3
LIST_INSERT_BEFORE.3
LIST_NEXT.3
SLIST_EMPTY.3
SLIST_ENTRY.3
SLIST_FIRST.3
SLIST_FOREACH.3
SLIST_HEAD.3
SLIST_HEAD_INITIALIZER.3
SLIST_INIT.3
SLIST_INSERT_AFTER.3
SLIST_INSERT_HEAD.3
SLIST_NEXT.3
SLIST_REMOVE.3
SLIST_REMOVE_HEAD.3
STAILQ_CONCAT.3
STAILQ_EMPTY.3
STAILQ_ENTRY.3
STAILQ_FIRST.3
STAILQ_FOREACH.3
STAILQ_HEAD.3
STAILQ_HEAD_INITIALIZER.3
STAILQ_INIT.3
STAILQ_INSERT_AFTER.3
STAILQ_INSERT_HEAD.3
STAILQ_INSERT_TAIL.3
STAILQ_NEXT.3
STAILQ_REMOVE.3
STAILQ_REMOVE_HEAD.3
TAILQ_CONCAT.3
TAILQ_EMPTY.3
TAILQ_FIRST.3
TAILQ_FOREACH.3
TAILQ_FOREACH_REVERSE.3
TAILQ_HEAD_INITIALIZER.3
TAILQ_INSERT_BEFORE.3
TAILQ_LAST.3
TAILQ_NEXT.3
TAILQ_PREV.3
TAILQ_SWAP.3
    Michael Kerrisk
        New links to queue.3


Global changes
--------------

Various pages
    Michael Kerrisk  [Andries E. Brouwer]
        Remove "ABI" from "C library/kernel ABI differences" subheading=
s
            The "ABI" doesn't really convey anything significant in
            the title. These subsections are about describing differenc=
es
            between the kernel and (g)libc interfaces.


Changes to individual pages
---------------------------

intro.1
    Michael Kerrisk  [Andries E. Brouwer]
        Drop intro paragraph on '$?' shell variable
            As Andries notes, this piece of text is rather out of place=
 in
            a page that was intended to provide a tutorial introduction=
 for
            beginners logging in on a Linux system.

locale.1
    Marko Myllynen
        A minor output format clarification
            A minor clarification for the locale output format which wa=
s
            brought up at
            https://sourceware.org/bugzilla/show_bug.cgi?id=3D18516.

            For reference, see
            https://sourceware.org/bugzilla/show_bug.cgi?id=3D18516
            http://pubs.opengroup.org/onlinepubs/9699919799/utilities/l=
ocale.html

        Add CONFORMING TO section

capget.2
    Julian Orth
        Clarify that hdrp->pid=3D=3D0 is equivalent gettid() not getpid=
()

chroot.2
    Jann Horn
        chroot() is not intended for security; document attack
            It is unfortunate that this discourages this use of chroot(=
2)
            without pointing out alternative solutions - for example,
            OpenSSH and vsftpd both still rely on chroot(2) for securit=
y.

            Bind mounts should theoretically be usable as a replacement=
, but
            currently, they have a similar problem (CVE-2015-2925) that=
 hasn't
            been fixed in ~6 months, so I'd rather not add it to the ma=
npage
            as a solution before a fix lands.

clock_getres.2
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

eventfd.2
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

execve.2
    Michael Kerrisk
        Elaborate on envp/argv as NULL behavior

_exit.2
    Michael Kerrisk
        Open stdio frames are not flushed, temporary files are deleted
            Many years ago, text was added to the page saying that it i=
s
            implementation-dependent whether stdio streams are flushed =
and
            whether temporary are removed. In part, this change appears=
 to
            be because POSIX.1-2001 added text related to this point.
            However, that seems to have been an error in POSIX, and the
            text was subsequently removed for POSIX.1-2008. See
            https://collaboration.opengroup.org/austin/interps/document=
s/9984/AI-085.txt
            Austin Group Interpretation reference 1003.1-2001 #085

fallocate.2
    Namjae Jeon  [Michael Kerrisk]
        Document FALLOC_FL_INSERT_RANGE
    Michael Kerrisk
        Since Linux 4.2, ext4 supports FALLOC_FL_INSERT_RANGE

fcntl.2
    Michael Kerrisk
        OFD locks are proposed for inclusion in the next POSIX revision

getrlimit.2
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

getrusage.2
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

gettid.2
    Michael Kerrisk
        Note that for a thread group leader, gettid() =3D=3D getpid()

iopl.2
    Michael Kerrisk
        Remove some historical libc5 and glibc 1 details
            These details are ancient, and long ago ceased to be releva=
nt.

ioprio_set.2
    Michael Kerrisk  [Jens Axboe]
        Document meaning of ioprio=3D=3D0

mlock.2
    Michael Kerrisk  [Mehdi Aqadjani Memar]
        Document another ENOMEM error case
            ENOMEM can occur if locking/unlocking in the middle of a re=
gion
            would increase the number of VMAs beyond the system limit (=
64k).

mmap.2
    Michal Hocko  [Eric B Munson]
        Clarify MAP_POPULATE
            David Rientjes has noticed that MAP_POPULATE wording might =
promise
            much more than the kernel actually provides and intends to =
provide.
            The primary usage of the flag is to pre-fault the range. Th=
ere is
            no guarantee that no major faults will happen later on. The=
 pages
            might have been reclaimed by the time the process tries to =
access
            them.
    Michal Hocko  [Eric B Munson]
        Clarify MAP_LOCKED semantics
            MAP_LOCKED had a subtly different semantic from mmap(2)+mlo=
ck(2)
            since it has been introduced.
            mlock(2) fails if the memory range cannot get populated to
            guarantee that no future major faults will happen on the ra=
nge.
            mmap(MAP_LOCKED) on the other hand silently succeeds even i=
f
            the range was populated only partially.

            Fixing this subtle difference in the kernel is rather awkwa=
rd
            because the memory population happens after mm locks have b=
een
            dropped and so the cleanup before returning failure (munloc=
k)
            could operate on something else than the originally mapped =
area.

            E.g. speculative userspace page fault handler catching SEGV=
 and
            doing mmap(fault_addr, MAP_FIXED|MAP_LOCKED) might discard =
portion
            of a racing mmap and lead to lost data. Although it is not =
clear
            whether such a usage would be valid, mmap page doesn't expl=
icitly
            describe requirements for threaded applications so we canno=
t
            exclude this possibility.

            This patch makes the semantic of MAP_LOCKED explicit and su=
ggests
            using mmap + mlock as the only way to guarantee no later ma=
jor
            page faults.
    Michael Kerrisk
        ERRORS: point out that ENOMEM can occur even for munmap()

mprotect.2
    Michael Kerrisk
        Note ENOMEM error that can occur when we reach limit on maximum=
 VMAs

open.2
read.2
write.2
    Michael Kerrisk  [Mike Hayward]
        Clarify that O_NONBLOCK is a no-op for regular files and block =
devices

perf_event_open.2
    Vince Weaver  [Joerg Roedel]
        Exclude_host/exclude_guest clarification
            This patch relates to the exclude_host and exclude_guest bi=
ts added
            by the following commit:

               exclude_host, exclude_guest; Linux 3.2
                    commit a240f76165e6255384d4bdb8139895fac7988799
                    Author: Joerg Roedel <joerg.roedel-5C7GfCeVMHo@public.gmane.org>
                    Date:   Wed Oct 5 14:01:16 2011 +0200

                        perf, core: Introduce attrs to count in either =
host or guest mode

            The updated manpage text clarifies that the "exclude_host" =
and
            "exclude_guest" perf_event_open() attr bits only apply in t=
he
            context of a KVM environment and are currently x86 only.
    Vince Weaver
        Document PERF_SAMPLE_REGS_INTR
            This patch relates to the addition of PERF_SAMPLE_REGS_INTR
            support added in the following commit:

                perf_sample_regs_intr; Linux 3.19
                commit 60e2364e60e86e81bc6377f49779779e6120977f
                Author: Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

                        perf: Add ability to sample machine state on in=
terrupt

            The primary difference between PERF_SAMPLE_REGS_INTR and th=
e
            existing PERF_SAMPLE_REGS_USER is that the new support will
            return kernel register values.  Also if precise_ip is
            set higher than 0 then the PEBS register state will be retu=
rned
            rather than the saved interrupt state.

            This patch incorporates feedback from Stephane Eranian and
            Andi Kleen.

prctl.2
seccomp.2
    Michael Kerrisk
        Clarify that SECCOMP_SET_MODE_STRICT disallows exit_group(2)
            These days, glibc implements _exit() as a wrapper around
            exit_group(2). (When seccomp was originally introduced, thi=
s was
            not the case.) Give the reader a clue that, despite what gl=
ibc is
            doing, what SECCOMP_SET_MODE_STRICT permits is the true _ex=
it(2)
            system call, and not exit_group(2).

pread.2
read.2
readv.2
sendfile.2
write.2
    Michael Kerrisk
        Clarify that Linux limits transfers to a maximum of 0x7ffff000 =
bytes
            See https://bugs.debian.org/629994 and
            https://bugs.debian.org/630029.

pread.2
    Michael Kerrisk
        Rewrite RETURN VALUE section
            (Also drop the text on pwrite() returning zero; that seems =
bogus.)

ptrace.2
    Michael Kerrisk  [Vegard Nossum]
        PTRACE_O_TRACEEXIT clarification

readv.2
    Michael Kerrisk
        Remove BUGS heading
            The text on mixing  I/O syscalls and stdio is a general poi=
nt
            of behavior. It's not a bug as such.

recv.2
send.2
    Michael Kerrisk
        Explain some subtleties of MSG_DONTWAIT versus O_NONBLOCK

rename.2
    Michael Kerrisk
    Michael Kerrisk
        Note that RENAME_NOREPLACE can't be employed with RENAME_EXCHAN=
GE

sched_setaffinity.2
    Michael Kerrisk
        Add an example program
    Michael Kerrisk  [Florian Weimer]
        Explain how to deal with 1024-CPU limitation of glibc's cpu_set=
_t type
    Michael Kerrisk
        Mention the use of the 'isolcpus' kernel boot option

sched_setattr.2
    Julian Orth
        Remove a const attribute
            The attr argument of sched_setattr was documented as const =
but the
            kernel will modify the size field of this struct if it cont=
ains an
            invalid value. See the documentation of the size field for =
details.

seccomp.2
    Michael Kerrisk
        SEE ALSO: add bpf(2)

send.2
    Michael Kerrisk
        Expand on subtleties of MSG_NOSIGNAL versus ignoring SIGPIPE

sigaltstack.2
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

socket.2
    Stephan Mueller
        Update documentation reference for AF_ALG

truncate.2
    Michael Kerrisk
        ERRORS: ftruncate() can fail if the file descriptor is not writ=
able

utimensat.2
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe
            After research, We think utimensat() and futimens() are thr=
ead-safe.
            But, there are not markings of utimensat() and futimens() i=
n glibc
            document.

clearenv.3
    Zeng Linggang
        ATTRIBUTES: Note function that is not thread-safe

dl_iterate_phdr.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

error.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are/aren't thread-safe

fexecve.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

fpurge.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

fread.3
    Andries E. Brouwer
        Clarify terminology
            In the "RETURN VALUE" section the word item is in italics
            as if it were one of the function parameters. But the word
            "item" occurs here for the first time, earlier the text
            uses "element". [Patch improves this.]

fts.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are/aren't thread-safe

getaddrinfo.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

getaddrinfo_a.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

getauxval.3
    Michael Kerrisk
        File capabilities also trigger AT_SECURE
    Michael Kerrisk
        (Briefly) document AT_HWCAP2

getgrent_r.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are/aren't thread-safe

gethostbyname.3
    Michael Kerrisk  [Laszlo Ersek]
        Remove mention of IPv6 addresses, which are not supported
            As reported by Laszlo Ersek:

                gethostbyname(3) fails to resolve the IPv6 address "::1=
",
                but the manual page says: "If name is an IPv4 or IPv6 a=
ddress,
                no lookup is performed and gethostbyname() simply copie=
s name
                into the h_name field [...]".

                Debian bug report:
                http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D4557=
62

                glibc bug report:
                http://sourceware.org/bugzilla/show_bug.cgi?id=3D5479

                SUSv3 link for gethostbyname(3):
                http://www.opengroup.org/onlinepubs/000095399/functions=
/gethostbyname.html

                It seems that the glibc behavior is conformant, and the=
 manual
                page is in error.

getifaddrs.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

getnameinfo.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

getnetent_r.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

getprotoent.3
    Zeng Linggang
        ATTRIBUTES: Note functions that aren't thread-safe

getprotoent_r.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

getpw.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

getpwent_r.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are/aren't thread-safe

getrpcent.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are/aren't thread-safe

getrpcent_r.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

getrpcport.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

getservent.3
    Zeng Linggang
        ATTRIBUTES: Note functions that aren't thread-safe

getservent_r.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

gsignal.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

key_setsecret.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

malloc_get_state.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

malloc_info.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

malloc_stats.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

malloc_trim.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

MB_LEN_MAX.3
    Michael Kerrisk
        Clarify meaning of MB_LEN_MAX
    Michael Kerrisk  [P=C3=A1draig Brady]
        MB_LEN_MAX is 16 in modern glibc versions

memcpy.3
    Michael Kerrisk
        NOTES: describe the glibc 2.13 changes that revealed buggy appl=
ications
            Adding a note on this point seems worthwhile as a way of
            emphasizing the point that the buffers must not overlap.

mq_notify.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

perror.3
    Michael Kerrisk
        Some wording improvements and clarifications

profil.3
    Zeng Linggang
        ATTRIBUTES: Note function that is not thread-safe

psignal.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

pthread_attr_init.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe
    Michael Kerrisk
        Use "%zd" for printing size_t in example code

pthread_attr_setaffinity_np.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

pthread_cancel.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

pthread_cleanup_push.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

pthread_create.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

pthread_detach.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

pthread_getattr_np.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

pthread_join.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

pthread_setname_np.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

pthread_tryjoin_np.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

putgrent.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

rcmd.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are/aren't thread-safe

resolver.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

rpc.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

rpmatch.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

sem_close.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

sem_open.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

setaliasent.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are/aren't thread-safe

setlocale.3
    Marko Myllynen
        Update CONFORMING TO
            http://pubs.opengroup.org/onlinepubs/9699919799/functions/s=
etlocale.html

setlocale.3
    Marko Myllynen
        Tweak C/POSIX locale portability description
            As discussed earlier, the current description might be a li=
ttle
            bit too stringent, let's avoid the issue by describing the
            portability aspect on a slightly higher level.

            References:

            http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1=
_chap06.html
            http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1=
_chap07.html
            http://pubs.opengroup.org/onlinepubs/9699919799/functions/s=
etlocale.html

shm_open.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

strfmon.3
    Marko Myllynen
        Document strfmon_l(3)
            Describe strfmon_l(3).

            http://pubs.opengroup.org/onlinepubs/9699919799/functions/s=
trfmon.html
    Marko Myllynen
        Fix CONFORMING TO
            AFAICS strfmon(3) is now defined in POSIX and the glibc
            implementation is as specified there.

            http://pubs.opengroup.org/onlinepubs/9699919799/functions/s=
trfmon.html
    Marko Myllynen
        Rewrite the example
            I think the example is more accurate when we use the exact
            locale names and also the Euro sign where appropriate.

xcrypt.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

xdr.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

console_codes.4
    Scot Doyle  [Pavel Machek, Michael Kerrisk]
        Add CSI sequence for cursor blink interval
            Add a Console Private CSI sequence to specify the current
            console's cursor blink interval. The interval is specified
            as a number of milliseconds until the next cursor display
            state toggle, from 50 to 65535.

null.4
    Michael Kerrisk
        Note that reads from /dev/zero are interruptible since Linux 2.=
6.31

core.5
    Michael Kerrisk
        Mention 'coredump_filter' boot option

host.conf.5
    Michael Kerrisk
        Wording fix: s/resolv+/the resolver library/
            The term "resolv+" seems to be historical cruft.

hosts.equiv.5
    Carlos O'Donell
        Fix format, clarify IdM needs, and provide examples.
            In some recent work with a Red Hat customer I had the oppor=
tunity
            to discuss the fine nuances of the ruserok() function and r=
elated
            API which are used to implement rlogin and rsh.

            It came to my attention after working with QE on some autom=
ated
            internal testing that there were no good examples in the ho=
sts.equiv
            manual page showing how the format was supposed to work for=
 this
            file and for ~/.rhosts, worse the "format" line showed that=
 there
            should be spaces between arguments when that would clearly =
lead
            to incorrect behaviour. In addition some things that the fo=
rmat
            allows you to write are just wrong like "-host -user" which=
 makes
            no sense since the host is already rejected, and should be =
written
            as "host -user" instead. I added notes in the example to ma=
ke it
            clear that "-host -user" is invalid.

            I fixed three things:

            (a) The format line.
            - Either +, or [-]hostname, or +@netgrp or -@netgrp.
            - Either +, or [-]username, or +@netgrp or -@netgrp.
            - You must specify something in the hostname portion so rem=
ove
              optional brackets.

            (b) Clarify language around credentials
            - If the host is not trusted you must provide credentials t=
o
              the login system and that could be anything really and it
              depends on your configuration e.g. PAM or whatever IdM yo=
u have.

            (c) Provide real-world examples
            - Provide several real world examples and some corner case
              examples for how you would write something. Hopefully oth=
ers
              can add examples as they see fit.
    Michael Kerrisk  [Carlos O'Donell, Arjun Shankar]
        Improve explanation in EXAMPLE

locale.5
    Marko Myllynen
        Document map to_inpunct, map to_outpunct
            See e.g. fa_IR for reference.
    Marko Myllynen
        Document class in LC_CTYPE
            See e.g. the locale zh_CN and

            http://en.cppreference.com/w/cpp/string/wide/towctrans
            http://en.cppreference.com/w/cpp/string/wide/wctrans
    Marko Myllynen
        Add iconv(1) reference
    Marko Myllynen
        Document character transliteration
            See e.g. da_DK for reference.

            (Not sure should we actually provide an example here?)
    Marko Myllynen
        Document era keywords
            This patch completes the LC_TIME section - since these era
            keywords are so tightly coupled, I'm providing them as a
            single patch.

            Based on
            http://pubs.opengroup.org/onlinepubs/009695399/basedefs/xbd=
_chap07.html
            http://www.open-std.org/jtc1/SC22/WG20/docs/n972-14652ft.pd=
f
    Marko Myllynen
        Document default_missing
    Marko Myllynen
        Document outdigit and alt_digits
            See e.g. fa_IR for reference.
    Marko Myllynen
        Refer to locale(7) more prominently
            It's probably a good idea to refer to locale(7) so that a r=
eader
            can check what a category is about before describing them i=
n
            detail.
    Marko Myllynen
        Document charclass and charconv
            See e.g. the locales ja_JP and ko_KR and

            http://en.cppreference.com/w/cpp/string/wide/towctrans
            http://en.cppreference.com/w/cpp/string/wide/wctrans
    Marko Myllynen
        Copy is not exclusive in LC_CTYPE and LC_COLLATE
            See e.g. da_DK for reference.
    Marko Myllynen
        Remove the FIXME for timezone
            The timezone of LC_TIME is not in POSIX, only 6 (out of ~30=
0)
            glibc locales define it, the glibc code comment below from
            glibc.git/programs/ld-time.c seems to suggest it's not a go=
od
            idea, and there's been a proposal in upstream [1] to remove=
 the
            existing timezone definitions from glibc locales so I think
            it's actually better to leave this one undocumented:

            /* XXX We don't perform any tests on the timezone value sin=
ce this is
               simply useless, stupid $&$!@...  */

            1) https://sourceware.org/ml/libc-alpha/2015-06/msg00098.ht=
ml

            Move the remaining LC_COLLATE FIXMEs together while at it.
    Marko Myllynen
        Fix country_isbn format
            Both plain numbers and Unicode code points are used in
            glibc locales but checking the code reveals that country_is=
bn
            is handled like the rest of its category expect for country=
_num
            which was clarified earlier.
    Marko Myllynen
        Sort according to the standard
            Sort the options so that those defined in POSIX are listed =
first,
            then followed by those defined in ISO/IEC TR 14652 in the o=
rder
            of common convention in many widely used glibc locales.

            Actual descriptions are unchanged.

            http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1=
_chap07.html
    Marko Myllynen
        Refer to strftime(3) where appropriate
            The relationship between the locale time format syntax
            and strftime() cannot be considered as obvious.
    Marko Myllynen
        Document map "totitle"
            See e.g. locales/i18n for reference.
    Michael Kerrisk  [Marko Myllynen]
        Remove BUGS section saying man page is not complete
            To some degree, this is true of many pages. And anyway, thi=
s
            page is much better after recent work by Marko.

proc.5
    Michael Kerrisk
        List /proc/vmstat fields
    Michael Kerrisk
        Tweak /proc/vmstat text
    Michael Kerrisk
        Add /proc/crypto entry with a pointer to further information
    Michael Kerrisk  [Kees Cook]
        Document /proc/sys/kernel/sysctl_writes_strict
            Based on text in Documentation/sysctl/kernel.txt.
    Michael Kerrisk
        Move misordered /proc/[pid]/timers entry
    Michael Kerrisk
        Refer to bpf(2) for explanation of /proc/sys/net/core/bpf_jit_e=
nable

repertoiremap.5
    Marko Myllynen
        Symbolic names AKA mnemonics
            A long time ago in glibc, repertoire maps were used (but th=
ey
            were removed already in 2000), those mapping files were nam=
ed
            as mnemonics, so "mnemonic" is a term that would almost
            certainly come up if somebody studies glibc side (perhaps e=
ven
            the related standards like ISO 9945 [which I don't have acc=
ess
            to]) so I thought it's worth to mention to term in the man =
page
            to make sure we're talking about the same thing, otherwise
            someone might wonder is that something different or not.

            IOW, symbolic names and mnemonics are often used interchang=
eably,
            let's mention the other often used term in the page, too.

capabilities.7
    Michael Kerrisk
        CAP_SYS_ADMIN allows calling bpf(2)

locale.7
    Marko Myllynen
        LC_CTYPE determines transliteration rules on glibc systems

packet.7
    =E6=96=87=E5=89=91  [Cortland Setlow]
        Fix description of binding a packet socket to an interface

pty.7
    NeilBrown  [Peter Hurley]
        Clarify asynchronous nature of PTY I/O
            A PTY is not like a pipe - there may be delayed between dat=
a
            being written at one end and it being available at the othe=
r.

            This became particularly apparent after
                 commit f95499c3030f
                ("n_tty: Don't wait for buffer work in read() loop")
            in Linux 3.12

            See also the mail thread at https://lkml.org/lkml/2015/5/1/=
35
                Date    Mon, 04 May 2015 12:32:04 -0400
                From    Peter Hurley <>
                Subject Re: [PATCH bisected regression] input_available=
_p()
                            sometimes says 'no' when it should say 'yes=
'

rtld-audit.7
    Ben Woodard
        Use correct printf() specifier for pointer types
            In the example code you used %x rather than %p in the examp=
le
            code for an audit library. The problem is that it truncates=
 the
            pointers on 64b platforms. So you get something like:

            la_symbind64(): symname =3D strrchr sym->st_value =3D 0x7f4=
b8a3f8960
            ndx =3D 222 flags =3D 0x0 refcook =3D 8b53e5c8 defcook =3D =
8b537e30

            rather than:

            la_symbind64(): symname =3D fclose sym->st_value =3D 0x7fa4=
52dd49b0
            ndx =3D 1135 flags =3D 0x0 refcook =3D 0x7fa453f395c8 defco=
ok =3D 0x7fa453f32e30

            This has bitten me a handful of times when playing around w=
ith
            audit test libraries to investigate its behavior.

sched.7
    Michael Kerrisk
        Remove ancient, wildly optimistic prediction about future of RT=
 patches
            It seems the patches were not merged by 2.6.30...

socket.7
    Michael Kerrisk
        SEE ALSO: add bpf(2)

vdso.7
    Nathan Lynch  [Mike Frysinger]
        Update for ARM
            The 32-bit ARM architecture in Linux has gained a vDSO as o=
f the
            4.1 release.  (I was the primary author.)

            Document the symbols exported by the ARM VDSO.

            Accepted kernel submission:
            http://lists.infradead.org/pipermail/linux-arm-kernel/2015-=
March/332573.html

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
