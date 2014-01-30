From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.57 released
Date: Thu, 30 Jan 2014 16:08:13 +0100
Message-ID: <52EA6ADD.7030804@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "Michael Kerrisk (gmail)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

    man-pages-3.57 - man pages for Linux

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.57

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2014/01/man-pages-357-is-released.h=
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

PS In passing, it's worth noting that the number of projects whose man =
pages
are rendered at http://man7.org/linux/man-pages/ has now grown to more =
than 70
(http://man7.org/linux/man-pages/dir_by_project.html).
The goal of these renderings is twofold:

* To provide a set of online renderings that are up to date (in many ca=
ses,=20
  the pages are pulled directly from the corresponding source code repo=
sitory
  when the online renderings are updated) and whose origin and timestam=
p are
  clearly documented on the rendered pages.

* To short circuit the task of reporting bugs in the man pages, all of =
the
  rendered pages add a COLOPHON that identifies the project home page a=
nd
  (in most cases) includes a specific email address for reporting bugs=20
  or the URL of a project web page with instructions on how to report b=
ugs.
  With luck, this means that users are more likely to actually report b=
ugs
  in man pages.

I am open to adding further (relevant) projects to the set of rendered =
pages;
see http://blog.man7.org/2013/05/adding-further-man-pages-to-html.html

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Changes in=
 man-pages-3.57 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2014-01-24, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Andre Majorel <aym-xunil-Bi/FLWfhfolQFI55V6+gNQ@public.gmane.org>
Andrey Vagin <avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Axel Beckert <abe-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Bernhard Walle <bernhard-X9USDgGjgfuzQB+pC5nmwQ@public.gmane.org>
Brandon Edens <bedens-lndS8KVcD7rQT0dZR+AlfA@public.gmane.org>
Eliezer Tamir <eliezer.tamir-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Gioele Barabucci <gioele-jeERWPXkMA9eoWH0uzbU5w@public.gmane.org>
Ian Abbott <abbotti-GUHe90Wt2aFaa/9Udqfwiw@public.gmane.org>
Jerry Chu <hkchu-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Jonas Jonsson <jonas-p4BucIDcVy3iH4Lt12DN6A@public.gmane.org>
Marc Lehmann <debian-reportbug-zsXavz5zCAg@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
Simone Piccardi <piccardi-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org>
Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Thomas Posch <man-pages-rFD0ZvQNamoRTZDQkHJ3v7NAH6kLmebB@public.gmane.org>
Tilman Schmidt <tilman-ZTO5kqT2PaM@public.gmane.org>
Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
=D0=9C=D0=B0=D1=80=D0=BA =D0=9A=D0=BE=D1=80=D0=B5=D0=BD=D0=B1=D0=B5=D1=80=
=D0=B3 <socketpair-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Apologies if I missed anyone!


Newly documented interfaces in existing pages
---------------------------------------------

msgop.2
    Michael Kerrisk
        Document MSG_COPY

open.2
    Michael Kerrisk, Andy Lutomirski
        Document O_TMPFILE
            O_TMPFILE is new in Linux 3.11

perf_event_open.2
    Vince Weaver  [Andi Kleen]
        PERF_SAMPLE_TRANSACTION support in Linux 3.13
            The following patch adds descriptions of the new perf_event=
_open.2
            PERF_SAMPLE_TRANSACTION sample type as added in Linux 3.13.

            The descriptions are based on information provided by Andi =
Kleen,
            both in the e-mail

                [PATCH 1/6] perf, core: Add generic transaction flags v=
5

            sent to the linux-kernel list as well as an e-mail

                [PATCH] Document transaction flags in perf_event_open m=
anpage

            sent to the linux-man list.

            The implementation is based heavily on the Intel Haswell
            processor.  Documentation can be found at this page:
            http://software.intel.com/en-us/blogs/2013/05/03/intelr-tra=
nsactional-synchronization-extensions-intelr-tsx-profiling-with-linux-0
            as well as in section 18.11.5.1 of volume 3 of the
            Intel 64 and IA-32 Architecture Software Developer's Manual=
=2E

ptrace.2
    Andrey Vagin
        Add description for PTRACE_PEEKSIGINFO
            Retrieve signals without removing them from a queue.
    Andrey Vagin
        Add description for PTRACE_GETSIGMASK and PTRACE_SETSIGMASK
            These two commands allow to examine and change mask of bloc=
ked
            signals.

socket.7
    Eliezer Tamir
        Add description for SO_BUSY_POLL
            Add description for the SO_BUSY_POLL socket option.

tcp.7
    Michael Kerrisk  [Jerry Chu]
        Document TCP_USER_TIMEOUT
            Text slightly adapted from Jerry Chu's (excellent) commit
            message (commit dca43c75e7e545694a9dd6288553f55c53e2a3a3).
    Michael Kerrisk
        Document TCP_CONGESTION


Global changes
--------------

Various pages
    Michael Kerrisk
        Reword to avoid use of "etc."

Various pages
    Peng Haitao  [Andre Majorel]
        Make wording around thread-safety and setlocale() more precise

getdate.3
strptime.3
locale.5
    Michael Kerrisk
        Replace "weekday" with less ambiguous language
            Notwithstanding POSIX's use of the term "weekday", in every=
day
            English, "weekday" is commonly understood to mean a day in =
the
            set [Monday..Friday] (vs one of the "weekend" days).


Changes to individual pages
---------------------------

epoll_wait.2
    Michael Kerrisk  [Jonas Jonsson]
        Clarify wording of EINTR error
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D66571

faccessat.2
    Michael Kerrisk
        Note that the system call takes only three arguments

fallocate.2
    Michael Kerrisk
        Note filesystems that support  FALLOC_FL_PUNCH_HOLE operation

fcntl.2
    Michael Kerrisk
        BUGS: The O_SYNC and O_DSYNC flags are not modifiable using F_S=
ETFL
    Michael Kerrisk
        Add susbsections under BUGS
            There's several bugs listed. It's helpful to mark
            them separately.
    Michael Kerrisk
        POSIX.1 specifies F_SETOWN and F_GETOWN for sockets/SIGURG

getrlimit.2
    Michael Kerrisk  [=D0=9C=D0=B0=D1=80=D0=BA =D0=9A=D0=BE=D1=80=D0=B5=
=D0=BD=D0=B1=D0=B5=D1=80=D0=B3]
        Note that rlim_cur can be set lower than current resource consu=
mption

getsockopt.2
    Michael Kerrisk
        SEE ALSO: add ip(7) and udp(7)

keyctl.2
    Michael Kerrisk
        SEE ALSO: mention Documentation/security/keys.txt

linkat.2
    Michael Kerrisk
        Add ENOENT for O_TMPFILE created with O_EXCL
    Michael Kerrisk
        ERRORS: Add EINVAL

lseek.2
    Michael Kerrisk
        Note which filesystems support SEEK_HOLE/SEEK_DATA

msgop.2
    Michael Kerrisk
        Note that MSG_EXCEPT is Linux-specific

open.2
    Michael Kerrisk
        Update CONFORMING TO
            Add POSIX.1-2008.  Add mention of O_TMPFILE.
            Update text on various flags that were added in POSIX.1-200=
8, and
            whose definitions can, since glibc 2.12, be obtained by sui=
tably
            defining _POSIX_C_SOURCE or _XOPEN_SOURCE
    Michael Kerrisk
        Add pointer in description to BUGS, for O_ASYNC limitation
    Michael Kerrisk
        Remove crufty duplicate text on modifying file status flags

ptrace.2
    Michael Kerrisk
        Add details to descriptions of PTRACE_GETSIGMASK and PTRACE_SET=
SIGMASK

select.2
    Michael Kerrisk  [Marc Lehmann]
        RETURN VALUE: Fix discussion of treatment of file descriptor se=
ts
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D5743=
70

syscalls.2
    Michael Kerrisk
        Remove madvise1() from main list
            madvise1() is one of the system calls that was never
            implemented, and listed toward the bottom of the page.

timer_create.2
    Michael Kerrisk
        Add pointer to proc(5) for info on /proc/[pid]/timers

unlinkat.2
    Michael Kerrisk  [Mike Frysinger:]
        ERRORS: Add EISDIR
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D29702

ferror.3
    Michael Kerrisk
        clearerr(), feof(), and ferror() are also POSIX-conformant
    Michael Kerrisk  [Reuben Thomas]
        CONFORMING TO: add fileno()

gets.3
    Ian Abbott
        SEE ALSO: add fgets(3)

mq_receive.3
mq_send.3
    Michael Kerrisk  [Simone Piccardi]
        SYNOPSIS: s/unsigned/unsigned int/

printf.3
    Michael Kerrisk
        Small reorganization of text in EXAMPLE

rand.3
    Michael Kerrisk
        s/unsigned/unsigned int/ in example

stpcpy.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function stpcpy() is thread safe.

stpncpy.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function stpncpy() is thread safe.

strcat.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions strcat() and strncat() are thread safe.

strchr.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions strchr(), strrchr() and strchrnul() are threa=
d safe.

strcmp.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions strcmp() and strncmp() are thread safe.

strftime.3
    Brandon Edens
        Change "week day" to "day of week"
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D68861

strstr.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread safe with exceptions
            The function strstr() is thread safe.
            The function strcasestr() is thread safe with exceptions.

strtod.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread safe with exceptions
            The functions strtod(), strtof() and strtold() are thread s=
afe
            with exceptions.

strtoimax.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread safe with exceptions
            The functions strtoimax() and strtoumax() are thread safe w=
ith
            exceptions.

strtol.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread safe with exceptions
            The functions strtol(), strtoll() and strtoq() are thread s=
afe
            with exceptions.

tcgetpgrp.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions tcgetpgrp() and tcsetpgrp() are thread safe.

tcgetsid.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function tcgetsid() is thread safe.

core.5
    Bernhard Walle
        Mention that %E exists since Linux 3.0
            '%E' in the 'core_pattern' has been introduced in kernel co=
mmit
            57cc083ad9e1bfeeb4a0ee831e7bb008c8865bf0 which was included=
 in
            version 3.0. Add that information to the manual page.

filesystems.5
    Michael Kerrisk  [Axel Beckert]
        Add reference to proc(5) for more details on /proc/filesystems
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D7355=
90

locale.5
    Michael Kerrisk
        SEE ALSO: add locale(7)

proc.5
    Michael Kerrisk
        Document /proc/[pid]/timers
    Michael Kerrisk
        Update discussion of wchan
            Remove crufty reference to /etc/psdatabase in /proc/PID/sta=
t.
            Add /proc/PID/wchan.

            See https://bugs.launchpad.net/ubuntu/+source/manpages/+bug=
/737452

environ.7
    Michael Kerrisk  [Gioele Barabucci]
        Correct reference to locale(7) (not locale(5))
            locale(7) is the right place for details of the LC_*
            environment variables.

            See http://bugs.debian.org/638186
    Michael Kerrisk
        Improve references for discussion of locale environment variabl=
es
    Michael Kerrisk
        SEE ALSO: add catopen(3)
    Michael Kerrisk
        SEE ALSO: add locale(5)

man-pages.7
    Michael Kerrisk
        Prefer "usable" over "useable"

netdevice.7
    Tilman Schmidt
        Document SIOCGIFCONF case ifc_req=3D=3DNULL
            Add the missing description of the possibility to call SIOC=
GIFCONF
            with ifc_req=3D=3DNULL to determine the needed buffer size,=
 as
            described in
            http://lkml.indiana.edu/hypermail/linux/kernel/0110.1/0506.=
html
            and verified against source files net/core/dev_ioctl.c and
            net/ipv4/devinet.c in the current kernel git tree.
            This functionality has been present since the beginning of =
the 2.6
            series. It's about time it gets documented.

            While I'm at it, also generally clarify the section on
            SIOCGIFCONF.

standards.7
    Michael Kerrisk
        Enhance description of V7
    Michael Kerrisk
        Add C11

tcp.7
    Michael Kerrisk
        Describe format of tcp_*_congestion_control /proc files
            Describe format of tcp_allowed_congestion_control and
            tcp_available_congestion_control.

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
