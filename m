From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.76 released
Date: Thu, 01 Jan 2015 10:00:43 +0100
Message-ID: <54A50CBB.2090304@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Gidday, and Happy New Year,

We've just passed 12k commits in the project, and this release,=20
my 158th, marks my recent tenth anniversary as maintainer of
the man-pages project. So ... the Linux man-pages maintainer=20
proudly announces:

    man-pages-3.76 - man pages for Linux

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.76

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2015/01/man-pages-376-is-released.h=
tml

The current version of the pages is browsable at:
http://man7.org/linux/man-pages/

A few changes in this release that may be of interest to readers of
this list are given below.

Cheers,

Michael

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Changes in=
 man-pages-3.76 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2014-12-31, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Adam Jiang <jiang.adam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Andrea Balboni <andrea.balboni-rcYM44yAMweonA0d6jMUrA@public.gmane.org>
Andreas Schwab <schwab-l3A5Bk7waGM@public.gmane.org>
Bernhard Walle <bernhard-X9USDgGjgfuzQB+pC5nmwQ@public.gmane.org>
Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
David Wragg <david-vIJKVkNGfPnYtjvyW6yDsg@public.gmane.org>
=46lorian Westphal <fw-HFFVJYpyMKqzQB+pC5nmwQ@public.gmane.org>
Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Huxiaoxiang <huxiaoxiang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Jonathan Wakely <jwakely-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>
Kamezawa Hiroyuki <kamezawa.hiroyu-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Manuel L=C3=B3pez-Ib=C3=A1=C3=B1ez <lopezibanez-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Mel Gorman <mgorman-l3A5Bk7waGM@public.gmane.org>
Michael Gehring <mg-oeg5PcxPhrw@public.gmane.org>
Michael Haardt <michael-8s1n8bisGiQ@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Scott Harvey <scott.harvey-nSGZJWG/ZnXz/TQy74m3OQ@public.gmane.org>
Siddhesh Poyarekar <siddhesh.poyarekar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Simon Newton <nomis52-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sven Hoexter <sven-jJOYKVDXsn5H4x6Dk/4f9A@public.gmane.org>
Tobias Werth <werth-n+aIp8eCc/CzQB+pC5nmwQ@public.gmane.org>
Weijie Yang <weijie.yang.kh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Will Newton <will.newton-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
=E5=88=98=E6=B9=83 <liupai_work-9Onoh4P/yGk@public.gmane.org>
=E5=B0=B9=E6=9D=B0 <writalnaie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

adjtimex.2
    Laurent Georget
        Add fields in struct timex description
            This patch updates the man page with the new fields added i=
n
            struct timex since last edition of the man page.
    Laurent Georget [Michael Kerrisk]
        Document ADJ_TAI
    Michael Kerrisk
        Improve description of ADJ_OFFSET_SINGLESHOT
    Michael Kerrisk
        Add brief documentation of ADJ_MICRO and ADJ_NANO
    Michael Kerrisk
        Reformat return value list
            And remove numeric values, since they're not needed
    Michael Kerrisk
        Other 'modes' bits are ignored on ADJ_OFFSET_*
            Other bits in 'modes' are ignored if modes contains
            ADJ_OFFSET_SINGLESHOT or ADJ_OFFSET_SS_READ.
    Michael Kerrisk
        Add nanosecond details
            Fixes https://bugzilla.kernel.org/show_bug.cgi?id=3D61171.
    Michael Kerrisk
        Document ADJ_OFFSET_SS_READ
    Michael Kerrisk
        Reformat 'times' flags as list
            And remove numeric values, since they're not needed.
    Michael Kerrisk
        Note effect of ADJ_NANO for ADJ_SETOFFSET
    Michael Kerrisk
        Add comment noting that timex structure contains padding bytes
    Michael Kerrisk
        Add more details to description of 'tai' field
    Michael Kerrisk
        Note meaning of "PLL" abbreviation
    Michael Kerrisk
        Clarify which 'timex' field is used by each 'modes' bit
    Michael Kerrisk
        Document timex 'status' bits
    Michael Kerrisk
        Clarify treatment of other 'modes' bits for ADJ_OFFSET_*
    Michael Kerrisk
        Update RFC number: RFC 5905 obsoletes RFC 1305
    Michael Kerrisk
        Briefly document ADJ_SETOFFSET
    Michael Kerrisk
        Note PPS (pulse per second) fields in timex structure

sigreturn.2
    Michael Kerrisk
        Add (a lot) more detail on the signal trampoline
            And rewrite much of the page.


Newly documented interfaces in existing pages
---------------------------------------------

proc.5
    Bernhard Walle
        Document /proc/thread-self
            /proc/thread-self has been introduced in Linux 3.17 with
            commit 0097875bd41528922fb3bb5f348c53f17e00e2fd.
    Sven Hoexter [Michael Kerrisk, Kamezawa Hiroyuki]
        Document "VmSwap" field of /proc/[pid]/status
    Florian Westphal
        Document /proc/net/netfilter/nfnetlink_queue


Changes to individual pages
---------------------------

localedef.1
    Marko Myllynen
        Mention default path for compiled files

clock_nanosleep.2
    Michael Kerrisk
        Note that 'clock_id' can also be a CPU clock ID

epoll_ctl.2
    Michael Kerrisk
        Regular files and directories can't be monitored with epoll_ctl=
()

ioctl.2
    Heinrich Schuchardt
        Rename 'd' argument to 'fd' in text
            In most other manpages file descriptors are called 'fd'.
            This patches renames attribute 'd' to 'fd'.

madvise.2
    Michael Kerrisk
        VERSIONS: Support for madvise() is now configurable
            Support for this system call now depends on the
            CONFIG_ADVISE_SYSCALLS configuration option.

open.2
    Michael Kerrisk
        Enhance rationale discussion for openat() and friends

posix_fadvise.2
    Mel Gorman
        Document the behavior of partial page discard requests
            It is not obvious from the interface that partial page disc=
ard'
            requests are ignored. It should be spelled out.
    Michael Kerrisk  [Weijie Yang]
        ERRORS: Since 2.6.16, the kernel correctly deals with the ESPIP=
E case
    Michael Kerrisk
        Support for fadvise64() is now configurable
            Support for this system call now depends on the
            CONFIG_ADVISE_SYSCALLS configuration option.

prctl.2
    Andreas Schwab
        Correct description of null-termination in PR_GET_NAME and PR_S=
ET_NAME
            The size of the process name has always been at most 16 byt=
e
            _including_ the null terminator.  This also means that the
            name returned by PR_GET_NAME is always null-terminated.
    Michael Kerrisk
        PR_SET_NAME silently truncates strings that exceed 16 bytes

restart_syscall.2
    Michael Kerrisk
        Add some text explaining why restart_syscall() exists

sched_setaffinity.2
    Michael Kerrisk
        NOTES: Add paragraph on how to discover set of CPUs available o=
n system
    Michael Kerrisk
        SEE ALSO: add nproc(1) and lscpu(1)

select.2
    Michael Kerrisk
        SEE ALSO: add restart_syscall(2)

semop.2
    Michael Kerrisk
        Add note that interrupted semtimedop() returns 'timeout' unchan=
ged
    Michael Kerrisk
        Remove information about semtimedop() EAGAIN that is repeated e=
lsewhere
    Michael Kerrisk
        Add subsection head for semtimedop()

setsid.2
    Michael Kerrisk
        Rewrite some pieces and add some details
            Among other changes, add an explanation of why setsid() can=
't
            be called from a process group leader

sgetmask.2
    Michael Kerrisk
        Since 3.16, support for these system calls is configurable
            Support for these calls is now dependent on the setting of =
the
            CONFIG_SGETMASK_SYSCALL option.

sigaction.2
    Michael Kerrisk
        Document SA_RESTORER
    Michael Kerrisk
        Add some detail on the sa_restorer field
    Michael Kerrisk
        SEE ALSO: add sigreturn(2)

splice.2
    Michael Kerrisk
        Reformat description of 'fd_in' and 'off_in' to improve readabi=
lity

syscall.2
    Michael Kerrisk
        SEE ALSO: add errno(3)

syscalls.2
    Michael Kerrisk
        SEE ALSO: add errno(3)
    Michael Kerrisk
        3.19 adds execveat()
    Michael Kerrisk
        Add bpf(2) to list

tee.2
    Michael Kerrisk
        Add shell session demonstrating use of the example program

tkill.2
    Michael Kerrisk  [Rich Felker]
        Remove bogus text saying tgid=3D=3D-1 makes tgkill() equivalent=
 to tkill()

abort.3
    Michael Kerrisk
        Note that SIGABRT is raised as though raise(3) is called
            Also note that abort() is POSIX.1-2008 compliant.

cmsg.3
    David Wragg
        Ensure buf is suitably aligned in sending example
            Inspection of the definition of CMSG_FIRSTHDR (both in glib=
c and
            the suggested definition in RFC3542) shows that it yields t=
he
            msg_control field.  So when sending, the pointer placed in
            msg_control should be suitably aligned as a struct cmsghdr.
            In the sending example, buf was declared as a bare char arr=
ay,
            and so is not necessarily suitably aligned.

            The solution here involves placing buf inside a union, and =
is
            based on the sockets/scm_rights_send.c sample from The Linu=
x
            Programming Interface "dist" source code collection.

exp10.3
    Michael Kerrisk
        Before glibc 2.19, exp() did not give ERANGE error on underflow
            http://sources.redhat.com/bugzilla/show_bug.cgi?id=3D6787

ftw.3
    Michael Kerrisk
        FTW_CHDIR has no effect on the 'fpath' argument passed to fn()

getopt.3
    Michael Kerrisk  [Jonny Grant]
        Ensure that 'nsecs' is used

ilogb.3
    Michael Kerrisk  [Will Newton]
        Since glibc 2.16, ilogb() does correctly diagnose domain errors

memcmp.3
    Michael Haardt
        Document return value for n=3D=3D0 case
    Michael Haardt
        Warn against use of memcmp() for comparing security-critical da=
ta

mq_open.3
    Michael Kerrisk
        Document the O_CLOEXEC flag
    Michael Kerrisk
        Place 'flags' constants in alphabetical order

pow.3
    Manuel L=C3=B3pez-Ib=C3=A1=C3=B1ez
        Add note on performance characteristics of pow()

pthread_setschedparam.3
    Simon Newton
        Fix logic error in example program
            The example program will crash if -A is used, since 'attr'
            is uninitialized.

                $ ./a.out  -A
                *** Error in `./a.out': free(): invalid pointer: 0xb779=
c3c4 ***
                Aborted (core dumped)
    =E5=88=98=E6=B9=83
        Small fixes to example program

sigvec.3
    Michael Kerrisk
        Starting with version 2.21, glibc no longer exports sigvec()

sysconf.3
    Josh Triplett
        Document _SC_NGROUPS_MAX
            Already documented in getgroups(2), but not in sysconf(3).

termios.3
    Michael Kerrisk
        SEE ALSO: add tset(1)

tgamma.3
    Michael Kerrisk
        Since glibc 2.18, errno is correctly set to EDOM when (x =3D=3D=
 -infinity))

wordexp.3
    Carlos O'Donell
        Make it clear that WRDE_NOCMD prevents command substitution
            The use of WRDE_NOCMD prevents command substitution. If the=
 flag
            WRDE_NOCMD is set then no command substitution shall occur =
and
            the error WRDE_CMDSUB will be returned if such substitution=
 is
            requested when processing the words.

            The manual page as-is makes it seem like the command substi=
tution
            occurs, and an error is returned *after* the substitution.
            This patch clarifies that.

locale.5
    Marko Myllynen
        Describe the formats of values
            locale(5) describes what a locale should define but doesn't
            spell out how (in what format). The patch attempts to addre=
ss
            this, it also has few trivial additional enhancements.

            * Reference to locale(7) for category descriptions.
            * Clarify first_workday in NOTES a bit.
            * Add upstream BZ reference for two missing LC_ADDRESS fiel=
ds.
    Marko Myllynen
        Fix miscoded character

resolv.conf.5
    Jan Chaloupka
        Add missing no-tld-query option
            Based on commit [1], ithe no-tld-query option exists for
            resolv.conf configuration file.  Description of this option
            is provided in [2]. This patch just copies this option
            into resolv.conf.5 man page. Plus changes 'a' member
            into 'an' before 'unqualified name as if it ...'
            on the third line of [2]. Based on [3], this option
            was added in glibc 2.14 as solving [4] bug.

            [1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdif=
f;h=3Df87dfb1f11c01f2ccdc40d81e134cd06b32e28e8
            [2] http://www.daemon-systems.org/man/resolv.conf.5.html ma=
n page.
            [3] https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3D=
NEWS;h=3D952f32af17e7fb49c4c1a305de673a13075bfaf5;hb=3Df87dfb1f11c01f2c=
cdc40d81e134cd06b32e28e8
            [4] https://sourceware.org/bugzilla/show_bug.cgi?id=3D12734

credentials.7
    Josh Triplett
        Cross-reference getgroups(2)
            Since credentials.7 discusses supplementary GIDs, it should
            reference getgroups(2).

fanotify.7
    Heinrich Schuchardt
        Allow relative paths in example
            The current example code requires passing an absolute
            path to the mount to be watched.

            By passing AT_FDCWD to fanotify_mark it can use both
            absolute and relative paths.
    Heinrich Schuchardt
        fallocate(2) creates no events
            fallocate(2) should create FAN_MODIFY events but does not.
    Heinrich Schuchardt [Michael Kerrisk]
        fanotify notifies only events generated on the same mount
            Unfortunately, fanotify does not inform listeners for all p=
aths
            under which a touched filesystem object is visible, but onl=
y the
            listener using the same path as the process touching the
            filesystem object.
    Heinrich Schuchardt
        Update BUGS to note bugs still not fixed in 3.17
            I bumped the Linux version number in the BUGS section to 3.=
17.

inotify.7
    Heinrich Schuchardt
        fallocate(2) does not trigger inotify events
            Calling fallocate(2) does not result in inotify events.

locale.7
    Marko Myllynen
        Improve LOCPATH description
            LOCPATH is ignored by privileged programs.

            Add locale archive references.

            Add FILES section.

man-pages.7
    Michael Kerrisk  [Laurent Georget]
        Clarify that SEE ALSO entries may refer to pages from other pro=
jects

signal.7
    Michael Kerrisk
        Mention other "slow devices"
            Reads from eventfd(2), signalfd(2), timerfd(2), inotify(7),
            and fanotify(7) file descriptors are also slow operations
            that are restartable.
    Michael Kerrisk
        Fix SO_RECVTIMEO/ SO_SENDTIMEO confusion in text
    Michael Kerrisk
        Since Linux 3.8, reads on inotify(7) file descriptors are resta=
rtable
    Michael Kerrisk
        inotify(7) reads no longer show the odd EINTR error after SIGCO=
NT
            Since kernel 3.7, reads from inotify(7) file descriptors no=
 longer
            show the (Linux oddity) behavior of failing with EINTR when=
 the
            process resumes after a stop signal + SIGCONT.
    Michael Kerrisk
        SEE ALSO: add sigreturn(2)

unix.7
    Michael Kerrisk  [Scott Harvey]
        Fix buglet in code snippet in BUGS section

ld.so.8
    Carlos O'Donell
        Add --inhibit-cache option
            The dynamic loader has 6 options, only 5 are documented.
            This patch documents the sixth option i.e. `--inhibit-cache=
`.
    Jonathan Wakely  [Siddhesh Poyarekar]
        Correct documentation of $ORIGIN
            As noted by Siddhesh:

                The ld.so man page says:

                    $ORIGIN (or equivalently ${ORIGIN})
                        This expands to the directory containing the
                        application executable.  Thus, an application l=
ocated
                        in somedir/app could be compiled with

                This is incorrect since it expands to the directory con=
taining
                the DSO and not the application executable.  This seems=
 like
                deliberate behaviour in dl-object.c, so it needs to be =
fixed in
                the man page.

            See http://stackoverflow.com/questions/26280738/what-is-the=
-equivalent-of-loader-path-for-rpath-specification-on-linux/26281226#26=
281226

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
