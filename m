From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.83 released
Date: Mon, 20 Apr 2015 07:14:28 +0200
Message-ID: <55348B34.8080404@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

    man-pages-3.83 - man pages for Linux

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.83

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2015/04/man-pages-383-is-released.h=
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
 man-pages-3.83 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2015-04-19, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Andreas Baak <andreas.baak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Andreas Dilger <adilger-m1MBpc4rdrD3fQ9qLvQP4Q@public.gmane.org>
cdlscpmv <cdlscpmv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Darrick J. Wong <darrick.wong-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Dima Tisnek <dimaqq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Eric Sandeen <sandeen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
=46abien Pichot <fpichot-TTZ4P4aT9ZLsq35pWSNszA@public.gmane.org>
=46elix Sedlmeier <sedlmeier-Mmb7MZpHnFY@public.gmane.org>
Gleb Fotengauer-Malinovskiy <glebfm-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Masanari Iida <standby24x7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Nikos Mavrogiannopoulos <nmav-c5N7Ur/I1ocdnm+yROfE0A@public.gmane.org>
Omar Sandoval <osandov-nWWhXC5lh1RBDgjK7y7TUQ@public.gmane.org>
Pierre Chifflier <pollux-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Robin H. Johnson <robbat2-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>
Vlastimil Babka <vbabka-AlSwsSmVLrQ@public.gmane.org>
Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>
William Woodruff <william-d4iiUcZhRQBWk0Htik3J/w@public.gmane.org>
YOSHIFUJI Hideaki <hideaki.yoshifuji-GmhWrQMWH5w7YuNMryXyOw@public.gmane.org>
Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

posix_madvise.3
    Michael Kerrisk
        New page documenting posix_madvise(3)

ftw.3
    Michael Kerrisk
        Reorganize the page to give primacy to nftw()
            nftw() is the better API, and POSIX.1-2008 marks ftw() obso=
lete.

Newly documented interfaces in existing pages
---------------------------------------------

getdents.2
    Michael Kerrisk  [Dima Tisnek]
        Document getdents64()
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D14795

mount.2
    Michael Kerrisk, Theodore Ts'o  [Eric Sandeen, Andreas Dilger,
    Omar Sandoval, Darrick J. Wong]
        Document MS_LAZYTIME

proc.5
    Michael Kerrisk
        Document /proc/sys/kernel/randomize_va_space
    Michael Kerrisk
        Document /proc/PID/fdinfo epoll format
    Michael Kerrisk
        Describe /proc/PID/fdinfo eventfd format
    Michael Kerrisk
        Document /proc/PID/fdinfo signalfd format


New and changed links
---------------------

newfstatat.2
    Michael Kerrisk
        New link to fstatat64.2

prlimit64.2
    Michael Kerrisk
        New link to getrlimit.2


Global changes
--------------

Various section 3 math pages
    Michael Kerrisk
        Note that these functions are also in POSIX.1-2001 and POSIX.1-=
2008


Changes to individual pages
---------------------------

getent.1
    Robin H. Johnson
        Document options
            The options to getent are now documented, after being aroun=
d for
            nearly a decade without changes.
    Michael Kerrisk
        Document help and version options

fallocate.2
    Michael Kerrisk
        Fix kernel version number for FALLOC_FL_ZERO_RANGE
            FALLOC_FL_ZERO_RANGE was added in 3.15, not 3.14.
    Michael Kerrisk
        Note that SMB3 added FALLOC_FL_ZERO_RANGE support in Linux 3.17

getrlimit.2
    Michael Kerrisk
        Note that the underlying system call for prlimit() is prlimit64=
()
    Michael Kerrisk
        Remove "_FILE_OFFSET_BITS =3D=3D 64" from prlimit() FTM require=
ments
            "_FILE_OFFSET_BITS =3D=3D 64" is not needed to get the prli=
mit()
            declaration.

ioctl_list.2
    Nikos Mavrogiannopoulos
        SIOCADDRT accepts in6_rtmsg in INET6 protocol
    Heinrich Schuchardt
        TFD_IOC_SET_TICKS
            timerfd_create.2 mentions TFD_IOC_SET_TICKS. We should add =
it to
            ioctl_list.2, too.

llseek.2
    Michael Kerrisk
        Advise reader to use lseek(2) instead
    Michael Kerrisk
        llseek() exists on 32-bit platforms to support seeking to large=
 offsets

madvise.2
    David Rientjes
        Specify MADV_REMOVE returns EINVAL for hugetlbfs
            madvise(2) actually returns with error EINVAL for MADV_REMO=
VE
            when used for hugetlb VMAs, not EOPNOTSUPP, and this has be=
en
            the case since MADV_REMOVE was introduced in commit f6b3ec2=
38d12
            ("madvise(MADV_REMOVE): remove pages from tmpfs shm backing
            store"). Specify the exact behavior.
    Michael Kerrisk
        SEE ALSO: add posix_madvise(2)

poll.2
    Michael Kerrisk  [Andreas Baak]
        SEE ALSO: add epoll(7)

posix_fadvise.2
    Michael Kerrisk
        Add "C library/kernel ABI differences" subsection

pread.2
    Michael Kerrisk
        Add "C library/kernel ABI differences" subsection

seccomp.2
    Michael Kerrisk  [Pierre Chifflier, Kees Cook]
        Note that seccomp_data is read-only

stat.2
    Michael Kerrisk
        Add some details on various "stat" versions
            Three versions of "stat" appeared on 32-bit systems,
            dealing with structures of different (increasing) sizes.
            Explain some of the details, and also note that the
            situation is simpler on modern 64-bit architectures.
    Michael Kerrisk
        Add mention of newfstatat()
            The underlying system call for fstatat() is newfstatat()
            on some architectures.

symlink.2
    Michael Kerrisk  [Jonny Grant]
        ERRORS: add linkpath=3D=3D"" case for ENOENT

syscalls.2
    Michael Kerrisk
        Remove prlimit()
            There really is only the prlimit64() system call.
    Michael Kerrisk
        Add some details about the "multiple versions of system calls"
            The multiple-system-call-version phenomenon is particularly=
 a
            feature of older 32-bit platforms. Hint at that fact in the=
 text.

timerfd_create.2
    Cyrill Gorcunov  [Michael Kerrisk]
        Document TFD_IOC_SET_TICKS ioctl() operation
    Michael Kerrisk
        Add some details to C library/kernel ABI differences

unshare.2
    Michael Kerrisk  [Fabien Pichot]
        Remove mention of "System V" from discussion of CLONE_NEWIPC
            These days, CLONE_NEWIPC also affects POSIX message queues.

asprintf.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

carg.3
    Michael Kerrisk
        Add introductory sentence explaining what these functions calcu=
late

ccos.3
    Ma Shimiao
        ATTRIBUTES: Note functions that are thread-safe
    Michael Kerrisk
        Add introductory sentence explaining what these functions calcu=
late

ccosh.3
    Michael Kerrisk
        Add introductory sentence explaining what these functions calcu=
late

cexp.3
    Ma Shimiao
        ATTRIBUTES: Note functions that are thread-safe

clock.3
    Ma Shimiao
        ATTRIBUTES: Note functions that is thread-safe

clog.3
    Michael Kerrisk
        Add introductory sentence explaining what these functions calcu=
late

csin.3
    Ma Shimiao
        ATTRIBUTES: Note functions that are thread-safe
    Michael Kerrisk
        Add introductory sentence explaining what these functions calcu=
late

csinh.3
    Ma Shimiao
        ATTRIBUTES: Note functions that are thread-safe
    Michael Kerrisk
        Add introductory sentence explaining what these functions calcu=
late

csqrt.3
    Ma Shimiao
        ATTRIBUTES: Note functions that are thread-safe
    Michael Kerrisk
        Simplify description of what  these functions calculate

ctan.3
    Ma Shimiao
        ATTRIBUTES: Note functions that are thread-safe
    Michael Kerrisk
        Add introductory sentence explaining what these functions calcu=
late

ctanh.3
    Ma Shimiao
        ATTRIBUTES: Note functions that are thread-safe
    Michael Kerrisk
        Add introductory sentence explaining what these functions calcu=
late

ctime.3
    Zeng Linggang
        ATTRIBUTES: Note functions that aren't thread-safe

exec.3
    Michael Kerrisk
        SYNOPSIS: Clarify calling signature for execl() and execlp()
    Michael Kerrisk  [Andreas Baak]
        Correct prototype for execle()
            Make the prototype shown into correct C.

ftw.3
    Michael Kerrisk  [Felix Sedlmeier]
        ftw() and nftw() differ for the non-stat-able symlink case
            The POSIX specification of ftw() says that an un-stat-able
            symlink may yield either FTW_NS or FTW_SL. The specificatio=
n
            of nftw() does not carry this statement.
    Michael Kerrisk
        CONFORMING TO: add POSIX.1-2008
    Michael Kerrisk
        Update POSIX version references in NOTES

getcwd.3
    Jann Horn  [Michael Kerrisk]
        Note behavior for unreachable current working directory
    Michael Kerrisk
        Add ENOMEM error

gethostbyname.3
    Michael Kerrisk  [Jonny Grant]
        Clarify that NO_ADDRESS and NO_DATA are synonyms
    Michael Kerrisk
        Add some detail for NO_DATA
            Text consistent with POSIX and FreeBSD's gethostbyname() ma=
n page.
    Zeng Linggang
        ATTRIBUTES: Note functions that aren't thread-safe

getnetent.3
    Zeng Linggang
        ATTRIBUTES: Note functions that aren't thread-safe

get_nprocs_conf.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

getutent.3
    Zeng Linggang
        ATTRIBUTES: Note functions that aren't thread-safe

glob.3
    Zeng Linggang
        ATTRIBUTES: Note functions that aren't thread-safe

insque.3
    Ma Shimiao
        ATTRIBUTES: Note functions that are thread-safe

login.3
    Zeng Linggang
        ATTRIBUTES: Note functions that aren't thread-safe

lseek64.3
    Michael Kerrisk
        Clarify details with respect to 32-bit and 64-bit systems

malloc.3
    Michael Kerrisk
        Add ENOMEM error

mbsnrtowcs.3
    Zeng Linggang
        ATTRIBUTES: Note function that isn't thread-safe

mbsrtowcs.3
    Zeng Linggang
        ATTRIBUTES: Note function that isn't thread-safe

mq_notify.3
    Michael Kerrisk
        Add "C library/kernel ABI differences" subsection

mq_open.3
    Michael Kerrisk  [Fabien Pichot]
        NOTES: explain differences from the underlying system call
            The check for the slash at the start of a pathname is done =
in glibc

openpty.3
    Zeng Linggang
        ATTRIBUTES: Note functions that aren't thread-safe

perror.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

posix_memalign.3
    Zeng Linggang
        ATTRIBUTES: Note functions that aren't thread-safe

printf.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe
    Walter Harms  [Michael Kerrisk]
        Simplify the example code

qsort.3
    Michael Kerrisk  [Rob Landley]
        alphasort() and versionsort() are not suitable for 'compar'
            In glibc 2.10, the prototypes of alphasort() and versionsor=
t()
            were changed so that the arguments switched from 'const voi=
d *' to
            'const struct dirent **', to match the POSIX.1-2008 specifi=
cation
            of alphasort(). As such, compiler warnings will result if
            these functions are used as the arguments of qsort().

                warning: passing argument 4 of 'qsort' from incompatibl=
e
                pointer type
                expected '__compar_fn_t' but argument is of type
                'int (*)(const struct dirent **, const struct dirent **=
)'

            Therefore, remove the ancient NOTES text suggesting that
            alphasort() and versionsort() can be used as suitable
            'compar' arguments for qsort().

realpath.3
    Michael Kerrisk  [Jon Grant]
        Add ENOMEM error

scandir.3
    Michael Kerrisk
        glibc 2.10 changed the argument types for alphasort() and versi=
onsort()
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

scanf.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

setnetgrent.3
    Zeng Linggang
        ATTRIBUTES: Note functions that aren't thread-safe

significand.3
    Ma Shimiao
        ATTRIBUTES: Note functions that are thread-safe

strcasecmp.3
    Michael Kerrisk  [Jonny Grant]
        Clarify that strcasecmp() does a byte-wise comparison
    Michael Kerrisk
        CONFORMING TO: add POSIX.1-2008

unlocked_stdio.3
    Zeng Linggang
        ATTRIBUTES: Note functions that aren't thread-safe

updwtmp.3
    Zeng Linggang
        ATTRIBUTES: Note functions that aren't thread-safe

wcrtomb.3
    Zeng Linggang
        ATTRIBUTES: Note function that isn't thread-safe

wcsnrtombs.3
    Zeng Linggang
        ATTRIBUTES: Note function that isn't thread-safe

wcsrtombs.3
    Zeng Linggang
        ATTRIBUTES: Note function that isn't thread-safe

wordexp.3
    Zeng Linggang
        ATTRIBUTES: Note functions that aren't thread-safe

wprintf.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

proc.5
    Michael Kerrisk
        Describe "mnt_id" field of /proc/PID/fdinfo
    Michael Kerrisk
        Note that abstract sockets are included in /proc/net/unix
    Michael Kerrisk
        Update description /proc/sys/unix 'Type' field
            The existing text was very crufty. UNIX domain sockets
            support more than SOCK_STREAM for a _very_ long time now.
    Michael Kerrisk
        Add some detail to /proc/PID/timers
    Michael Kerrisk  [Vlastimil Babka]
        Enhance discussion of /proc/PID/status 'VmSwap' field
            Based on https://lwn.net/Articles/634978/

epoll.7
    Michael Kerrisk
        SEE ALSO: add poll(2) and select(2)

icmp.7
    YOSHIFUJI Hideaki/=E5=90=89=E8=97=A4=E8=8B=B1=E6=98=8E
        Document net.ipv4.ping_group_range knob

nptl.7
    Michael Kerrisk
        Add reference to timer_create(2)

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
