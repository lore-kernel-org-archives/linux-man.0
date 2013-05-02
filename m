From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.51 released
Date: Thu, 2 May 2013 09:20:05 +0200
Message-ID: <CAKgNAkjkkN32G2VZ42+sgD96RRJL4mpK1jFfN54Bw7_7-6LxJQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

    man-pages-3.51 - man pages for Linux

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.51

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2013/04/man-pages-351-is-released.h=
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
 man-pages-3.51 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2013-04-17, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Andreas Jaeger <aj-l3A5Bk7waGM@public.gmane.org>
Andrew Clayton <andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
Brian M. Carlson <sandals-spVehEqlxw627WubY2PhZeTW4wlIGRCZ@public.gmane.org>
Changhee Han <ch0.han-Hm3cg6mZ9cc@public.gmane.org>
Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Damien Grassart <damien-Uo5SsgSf8ZRWk0Htik3J/w@public.gmane.org>
David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Krzysztof Konopko <krzysztof.konopko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Kyle McMartin <kyle-pfcGkIkfWfAsA/PxXw9srA@public.gmane.org>
Mark H Weaver <mhw-StlzRsPvAncdnm+yROfE0A@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Nicolas Hillegeer <nicolas-jJtG57l/RRZ54TAoqtyWWQ@public.gmane.org>
Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Radek Pazdera <rpazdera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Ralph Loader <suckfish-OA6R/WnsTSZ02iOg2JU2CQ@public.gmane.org>
Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
The Wanderer <wanderer-97jfqw80gc6171pxa8y+qA@public.gmane.org>

Apologies if I missed anyone!


Newly documented interfaces in existing pages
---------------------------------------------

sched_rr_get_interval.2
    Michael Kerrisk
        Document /proc/sys/kernel/sched_rr_timeslice_ms

proc.5
    Pavel Emelyanov
        Document /proc/[pid]/map_files directory
            This directory was added in Linux v3.3 and provides info ab=
out
            files being mmap-ed in a way very similar to how /proc/[pid=
]/fd
            works.

            v2: Added examples of how links look like and noted depende=
ncy
            on kernel config option CONFIG_CHECKPOINT_RESTORE.
    Michael Kerrisk
        Document /proc/sys/kernel/shm_rmid_forced

capabilities.7
    Michael Kerrisk
        Document /proc/sys/kernel/cap_last_cap


Global changes
--------------

Various pages
    Michael Kerrisk
        Global fix: fix placement of word "only"

Various pages
    Simon Paillard
        License headers: consistent format

Various pages
    Michael Kerrisk
        Global fix: s/since kernel/since Linux/

Various System V IPC pages in Section 2
    Michael Kerrisk
        Add "System V" to .TH line and text
            Make it clear that these pages relate to System V IPC,
            not POSIX IPC.


Changes to individual pages
---------------------------

access.2
    Michael Kerrisk  [The Wanderer]
        Clarify RETURN VALUE for F_OK
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D7052=
93

alarm.2
    Michael Kerrisk
        Correct the description of behavior when 'seconds' is 0

clone.2
    Michael Kerrisk  [Peter Schiffer]
        Add prototype for syscall to SYNOPSIS
            And further clarify the distinction between the system call
            and the wrapper function in the introductory text.
    Michael Kerrisk
        Update feature test macro requirements
            The requirements quietly changed changed in glibc 2.14

            See also http://www.sourceware.org/bugzilla/show_bug.cgi?id=
=3D4749
    Michael Kerrisk  [Mike Frysinger]
        Clarify differences between clone2() syscall and wrapper functi=
on
    Michael Kerrisk  [Mike Frysinger]
        Note those architectures where the sys_clone argument order dif=
fers
    Michael Kerrisk  [Mike Frysinger]
        Add short subsection noting that blackfin, m68k, and sparc are =
different
    Michael Kerrisk
        Move clone2() text to subsection in description
            The description of ia64 clone2() should follow the discussi=
on
            of the raw system call interface.
    Michael Kerrisk
        Change subhead for ia64 discussion

getcpu.2
    Michael Kerrisk
        Recommend that 'tcache' should be specified as NULL nowadays

io_cancel.2
    Jeff Moyer, Michael Kerrisk  [Cyril Hrubis]
        Improve description

io_destroy.2
    Jeff Moyer
        Improve description
            The description was rather vague, citing a "list of I/O con=
texts"
            and stating that it "can" cancel outstanding requests.  Thi=
s
            update makes things more concrete so that the reader knows =
exactly
            what's going on.

io_getevents.2
    Jeff Moyer
        The 'timeout' argument is not updated
            I looked back through the kernel code, and the timeout was
            never updated in any case.  I've submitted a patch upstream
            to change the comment above io_getevents.

io_setup.2
    Jeff Moyer
        Clarify nr_events
            nr_events is technically the number of completion events th=
at can
            be stored in the completion ring.  The wording of the man p=
age:
            "capable of receiving at least nr_events" seems dubious to =
me,
            only because I worry that folks might interpret that to mea=
n
            'nr_events' total, instead of 'nr_events' concurrently.

            Further, I've added information on where to find the per-us=
er
            limit on 'nr_events', /proc/sys/fs/aio-max-nr.  Let me know=
 if
            you think that is not relevant.

listxattr.2
    Michael Kerrisk
        Explain use of 'size' argument

lseek.2
    Michael Kerrisk  [Andreas Jaeger]
        _GNU_SOURCE must be defined to get SEEK_DATE and SEEK_HOLE defi=
nitions
            See http://sourceware.org/bugzilla/show_bug.cgi?id=3D15312

mmap.2
    Michael Kerrisk
        Add pointers to relevant /proc files described in proc(5)

posix_fadvise.2
pread.2
readahead.2
sync_file_range.2
truncate.2
    Michael Kerrisk
        Refer to syscall(2) for ABI semantics on certain 32-bit archite=
ctures
            Also: in sync_file_range.2 and posix_fadvise.2 remove descr=
iption
            of conventional calling signature as flawed, and in
            posix_fadvise.2, de-emphasize focus on ARM, and rather phra=
se
            as a more general discussion of certain architectures.

readdir.2
    Michael Kerrisk
        readdir(2) doesn't exist on x86-64

semop.2
    Michael Kerrisk
        Clarify the discussion of 'semadj'

shmctl.2
    Michael Kerrisk
        Refer to proc(5) for description of /proc/sys/kernel/shm_rmid_f=
orced

syscall.2
    Changhee Han
        Add notes that caution users when passing arguments to syscall(=
)
            For example, passing 'long long' on ARM-32 requires special
            treatment.
    Mike Frysinger [Michael Kerrisk]
        Document the exact calling convention for architecture system c=
alls
    Mike Frysinger  [Kyle McMartin]
        Add PA-RISC details under calling conventions
    Michael Kerrisk  [Mike Frysinger]
        Refine discussion of ARM and other ABIs

syscalls.2
    Michael Kerrisk
        Update kernel version number at start of list

umask.2
    Michael Kerrisk
        SEE ALSO: add acl(5)

unshare.2
    Michael Kerrisk
        Update feature test macro requirements
            The requirements quietly changed changed in glibc 2.14

            See also http://www.sourceware.org/bugzilla/show_bug.cgi?id=
=3D4749

fopencookie.3
    Michael Kerrisk  [Ralph Loader]
        Correct definition of cookie_io_functions_t

pthread_setname_np.3
    Andrew Clayton
        The thread argument is passed in by value

readir.3
seekdir.3
telldir.3
    Michael Kerrisk
        Eliminate the implication that these functions deal with "offse=
ts"
            The directory position dealt with by the readdir() and
            friends is not a simple file offset in modern file systems.
            Typically, it is some kind of cookie value. Add text and
            make other changes to these pages to eliminate the
            implication that this is an offset, and warn the reader
            that directory positions should be treated strictly as
            opaque values.

            In the process, rename the 'offset' argument of seekdir(3)
            to 'loc', and add some text to readdir(3) to note that
            the 'd_off' field is the same value returned by telldir(3)
            at the current directory position.

            See also https://lwn.net/Articles/544298/

scalb.3
    Mark H Weaver
        Fix prototypes for scalbf() and scalbl()

sched_getcpu.3
    Michael Kerrisk
        Update feature test macro requirements
            The requirements quietly changed changed in glibc 2.14

            See also http://www.sourceware.org/bugzilla/show_bug.cgi?id=
=3D4749

ualarm.3
    Michael Kerrisk  [Nicolas Hillegeer]
        Add note on the behavior when 'usecs' is zero
            POSIX.1-2001 does not specify the behavior in this case
            and no other system that I checked documented the behavior.
            Probably, most or all systems do what Linux does in this
            case: cancel any pending alarm, just as alarm(0) does.
            Add that info in NOTES.

elf.5
    Mike Frysinger
        Add byte positions for all EI_xxx fields
            When describing e_ident, most of the EI_xxx defines mention=
 the
            exact byte number.  This is useful when manually hacking an=
 ELF
            with a hex editor.  However, the last few fields don't do t=
his,
            which means you have to count things up yourself.
            Add a single word to each so you don't have to do that.

proc.5
    Michael Kerrisk
        Refer to sched_rr_get_interval(2) for info on sched_rr_timeslic=
e_ms
            Since Linux 3.9, /proc/sys/kernel/sched_rr_timeslice_ms can
            be used to change the SCHED_RR quantum.
    Michael Kerrisk
        SEE ALSO: Add sysctl(8)
    Krzysztof Konopko
        Simplify the example of printing out environ
            The binutils package contains a very handy utility to
            print out null-byte delimited strings from a file.  This
            can replace a rather complex expression with cat(1)
            provided as an example for printing out /proc/[pid]/environ=
=2E
    Michael Kerrisk
        Update /proc/PID/maps example
            Update to 64-bit example that includes "[heap]", "[stack],
            and "[vdso]"
    Michael Kerrisk
        Formatting fixes for /proc/PID/maps
    Mike Frysinger
        Document the "pathname" field of /proc/PID/maps
    Michael Kerrisk
        Add reference to capabilities(7) for /proc/sys/kernel/cap_last_=
cap
    Michael Kerrisk
        /proc/PID/maps: add a reference to mmap(2)

ip.7
    Radek Pazdera
        Document IP_MULTICAST_ALL
            This commit adds documentation for the IP_MULTICAST_ALL soc=
ket
            option.

            The option was added to the Linux kernel in 2.6.31:

                Author Nivedita Singhvi <niv-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
                Commit f771bef98004d9d141b085d987a77d06669d4f4f

            The description is based on a previous one [3] posted by th=
e
            original author of the code -- Nivedita, but it is slightly
            re-worded.

            I tested it myself and it works as described.

            References:
                [1]
http://lxr.free-electrons.com/source/net/ipv4/ip_sockglue.c#L972
                [2] http://lxr.free-electrons.com/source/net/ipv4/igmp.=
c#L2267
                [3] http://patchwork.ozlabs.org/patch/28902/

units.7
    Brian M. Carlson
        units should use an actual =B5
            The units(7) man page uses an ASCII u in place of the actua=
l Greek
            letter mu.  Since we're in the twenty-first century, with
            UTF-8-compatible terminals and terminal emulators, we shoul=
d use
            the actual letter =B5 instead of an ASCII approximation.

            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D7047=
87
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
