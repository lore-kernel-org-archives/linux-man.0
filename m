From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-4.02 released
Date: Sun, 09 Aug 2015 08:16:46 +0200
Message-ID: <55C6F04E.3080208@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

    man-pages-4.02 - man pages for Linux

This release includes various new man pages and makes changes
in nearly 400 other pages, based on input and contributions from
around 15 people.

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_4.01

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2015/08/man-pages-402-is-released.h=
tml

The current version of the pages is browsable at:
http://man7.org/linux/man-pages/

You are receiving this message either because:

a) You contributed to the content of this release.

b) You are subscribed to linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org or
   libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org

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
 man-pages-4.02 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2015-08-08, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Dilyan Palauzov <dilyan.palauzov-L8B2PhUVQgrYtjvyW6yDsg@public.gmane.org>
Gabriel F. T. Gomes <gftg-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Gleb Fotengauer-Malinovskiy <glebfm-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Goswin von Brederlow <goswin-v-b-S0/GAf8tV78@public.gmane.org>
Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Jonathan David Amery <jdamery-r13Lp6Jqpi2aja+aTFvgrQ@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Mike Kravetz <mike.kravetz-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Nicholas Miell <nmiell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Nikola Forr=C3=B3 <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Yaarit <yaarit-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

dladdr.3
    Michael Kerrisk
        New page documenting dladdr() and dladdr1()
            Relocate/rewrite dladdr() text formerly contained in dlopen=
(3).

            Add documentation of dladdr1().
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

dlerror.3
    Michael Kerrisk
        Migrate dlerror(3) to new separate man page
    Michael Kerrisk
        Note that the returned message may be in a statically allocated=
 buffer
    Michael Kerrisk
        Note that the returned string does not include a trailing newli=
ne
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

dlinfo.3
    Michael Kerrisk
        New page describing dlinfo(3)
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

dlopen.3
    Michael Kerrisk
        This page was substantially rewritten and enhanced. Notably:
        * the dladdr(), dlsym, dlvsym(), and dlerror() content were mov=
ed
          to separate new pages;
        * documentation for dlmopen was added;
        * and other changes as noted below.
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe
    Michael Kerrisk
        Move atexit() discussion under "Initialization and Finalization=
"
    Michael Kerrisk
        Move discussion of _init() and _fini() to NOTES
    Michael Kerrisk
        Rework the discussion of initialization and finalization functi=
ons
            Deemphasize the obsolete _init/_fini and give more prominen=
ce
            to gcc constructors/destructors.
    Michael Kerrisk
        dlclose() will unload the object when all references have been =
released
    Michael Kerrisk
        EXAMPLE: Remove mention of "-rdynamic"
            That option isn't needed for compiling and running this pro=
gram.
    Michael Kerrisk
        Remove reference to ld.so info page
            The command "info ld.so" simply shows the man page...
    Michael Kerrisk
        Add VERSIONS section
    Michael Kerrisk
        Reorganize conformance information for 'flags'

dlsysm.3
    Michael Kerrisk
        Move dlsym() and dlvsym() content to new separate page
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe


Newly documented interfaces in existing pages
---------------------------------------------

dlopen.3
    Michael Kerrisk, Carlos O'Donell
        Document dlmopen(3)

nl_langinfo.3
    Sam Varshavchik, Michael Kerrisk
        Add documentation for nl_langinfo_l(3)

__ppc_set_ppr_med.3
    Gabriel F. T. Gomes
        Document PPC functions providing access to PPR
            GNU C Library 2.18 adds functions (__ppc_set_ppr_low(3),
            __ppc_set_ppr_med(3), __ppc_set_ppr_med_low(3)) that provid=
e
            access to the Program Priority Register (PPR).

__ppc_yield.3
    Gabriel F. T. Gomes
        Document PPC performance-hint functions
            GNU C Library 2.18 adds functions __ppc_yield(3), __ppc_mdo=
io(3),
            and __ppc_mdoom(3) that can be used provide a hint that
            performance could be improved if shared resources are relea=
sed
            for use by other processors.


New and changed links
---------------------

dladdr1.3
    Michael Kerrisk
        New link to (new) dladdr(3) page

dlmopen.3
    Michael Kerrisk
        New link to dlopen.3

dlvsym.3
    Michael Kerrisk
        Adjust link to point to new self-contained dlsym(3) page

nl_langinfo_l.3
    Michael Kerrisk
        New link to nl_langinfo.3

__ppc_mdoio.3
    Gabriel F. T. Gomes
        New link to __ppc_yield.3

__ppc_mdoom.3
    Gabriel F. T. Gomes
        New link to __ppc_yield.3

__ppc_set_ppr_low.3
    Gabriel F. T. Gomes
        New link to __ppc_set_ppr_med.3

__ppc_set_ppr_med_low.3
    Gabriel F. T. Gomes
        New link to __ppc_set_ppr_med.3


Global changes
--------------

Very many pages
    Michael Kerrisk
        Update CONFORMING TO section to reflect POSIX.1-2001 and POSIX.=
1-2008
        details. (By now, I believe all pages should be up to date with
        respect to appropriately mentioning POSIX.1-2001 and POSIX.1-20=
08.)

ldd.1
sprof.1
execve.2
dlopen.3
ld.so.8
    Michael Kerrisk
        Prefer "shared object" over "shared library"
            The man pages variously use "shared library" or "shared obj=
ect".
            Try to more consistently use one term ("shared object"), wh=
ile
            also pointing out on a few pages that the terms are synonym=
ous.


Changes to individual pages
---------------------------

accept.2
    Michael Kerrisk
        Add mention of POSIX.1-2008 regarding EAGAIN vs EWOULDBLOCK

bpf.2
    Daniel Borkmann
        Various updates/follow-ups to address some fixmes
            A couple of follow-ups to the bpf(2) man-page, besides othe=
rs:

             * Description of map data types
             * Explanation on eBPF tail calls and program arrays
             * Paragraph on tc holding ref of the eBPF program in the k=
ernel
             * Updated ASCII image with tc ingress and egress invocatio=
ns
             * __sync_fetch_and_add() and example usage mentioned on ar=
rays
             * minor reword on the licensing and other minor fixups

execve.2
    Michael Kerrisk
        Reword text on POSIX and #!

io_getevents.2
    Michael Kerrisk
        Note return value on interruption by a signal handler
    Michael Kerrisk
        Clarify details of return value for timeout-expired case
    Michael Kerrisk
        Clarify and extend discussion of 'timeout' argument

mmap.2
    Michael Kerrisk
        Note that 'length' need not be a page-size multiple for munmap(=
)
    Michael Kerrisk  [David Rientjes, David Rientjes, Mike Kravetz]
        Describe mmap()/munmap() argument requirements for huge-page ma=
ppings
    Michael Kerrisk
        Move discussion of timestamps to NOTES
            A straight move; no changes to the content.
            This content is better placed in NOTES.

seccomp.2
    Michael Kerrisk
        SEE ALSO: mention libseccomp pages
        SEE ALSO: add scmp_sys_resolver(1)

sigaction.2
    Michael Kerrisk
        Correct the list of flags that were added in POSIX.1-2001

socketpair.2
    Michael Kerrisk  [Goswin von Brederlow]
        Clarify use of SOCK_* flags in 'type' argument
            See http://bugs.debian.org/794217

atexit.3
    Michael Kerrisk
        SEE ALSO: add dlopen(3)

clock_getcpuclockid.3
    Michael Kerrisk
        Improve wording of EPERM error
            It's imprecise to say that this is an "optional" error
            in POSIX.1.

dl_iterate_phdr.3
    Michael Kerrisk
        Note that 'size' allows callback() to discover structure extens=
ions
    Michael Kerrisk
        SEE ALSO: add dladdr(3)
    Michael Kerrisk
        CONFORMING TO: note that this function appears on some other sy=
stems

fseeko.3
    Michael Kerrisk
        Remove crufty NOTES section
            This ancient System V detail is unneeded.

getutent.3
    Michael Kerrisk
        Mention POSIX.1-2008 for the "utmpx" functions

iconv_close.3
iconv_open.3
    Michael Kerrisk
        CONFORMING TO: change "UNIX98" to "SUSv2"

malloc.3
    Michael Kerrisk
        Change "UNIX 98" to "SUSv2"

mktemp.3
    Gleb Fotengauer-Malinovskiy
        Reference mkdtemp(3) in addition to mkstemp(3)
            Mention mkdtemp(3) as another secure alternative to mktemp(=
3).

            See also https://sourceware.org/bugzilla/show_bug.cgi?id=3D=
2898.

mq_receive.3
mq_send.3
    Michael Kerrisk
        Clarify discussion of 'timeout'
            In particular, remove the word 'ceiling', which falsely
            suggests that the call might return prematurely.

nl_langinfo.3
    Michael Kerrisk
        Explicitly describe the return value on success
    Michael Kerrisk
        POSIX specifies that the caller may not modify the returned str=
ing
    Michael Kerrisk
        Enhance RETURN VALUE description
            Note some further cases where returned string may be
            invalidated or overwritten.

perror.3
    Michael Kerrisk
        Reformat CONFORMING to information
    Michael Kerrisk
        Note that 'sys_errlist' and 'sys_nerr' are not in POSIX.1

posix_openpt.3
    Michael Kerrisk
        Reword text regarding systems that don't have posix_openpt()

printf.3
    Michael Kerrisk
        CONFORMING TO: update details for dprintf() and vdprintf()

setlogmask.3
    Michael Kerrisk
        Remove useless statement in CONFORMING TO
            Saying that the description in PSOX.1-2001 is flawed,
            without saying what the fla is, is not helpful.
            (And no, I don't know what the flaw is.)

shm_open.3
    Michael Kerrisk
        Add POSIX.1-2008 details regarding group ID of new shared memor=
y object

strfmon.3
    Michael Kerrisk
        Fix erroneous CONFORMING to
            strfmon() is in POSIX.1.

fanotify.7
    Heinrich Schuchardt
        Clarify effects of file moves
            If files or directories are moved to other mounts, the inod=
e is
            deleted. Fanotify marks are lost.

mq_overview.7
    Michael Kerrisk
        Remove unneeded CONFORMING TO section

nptl.7
    Michael Kerrisk  [Nicholas Miell]
        Note that i386 and x86-64 binaries can't share mutexes

sched.7
    Nikola Forr=C3=B3
        Fix descriptions of sched_get_priority_max() / sched_get_priori=
ty_min()

sem_overview.7
    Michael Kerrisk
        Remove unneeded CONFORMING TO section

shm_overview.7
    Michael Kerrisk
        Remove unneeded CONFORMING TO section

sigevent.7
    Michael Kerrisk
        Remove unneeded CONFORMING TO section

symlink.7
    Michael Kerrisk
        Update with POSIX.1-2008 details for link(2)

ld.so.8
    Michael Kerrisk  [Jonathan David Amery]
        Items in LD_LIBRARY_PATH can also be delimited by semicolons
            See http://bugs.debian.org/794559.

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
