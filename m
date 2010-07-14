From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.25 released
Date: Wed, 14 Jul 2010 08:46:50 +0200
Message-ID: <AANLkTimFhgy1auqHPLliL-udiVhoeyTzNiE26dEoaZc_@mail.gmail.com>
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

=A0 =A0man-pages-3.25.tar.gz - man pages for Linux

This release is now available for download at:

=A0http://www.kernel.org/pub/linux/docs/man-pages
=A0or ftp://ftp.kernel.org/pub/linux/docs/man-pages

The online changelog is available at
http://www.kernel.org/doc/man-pages/changelog.html (blogged at
http://linux-man-pages.blogspot.com/2010/06/man-pages-325-is-released.h=
tml
) and the current version of the pages is browsable at
http://www.kernel.org/doc/man-pages/

You are receiving this message either because:

a) You contributed to the content of this release.

b) You are subscribed to linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (*).

c) I have information (possibly inaccurate) that you are the
maintainer of a translation of the manual pages, or are the maintainer
of the manual pages set in a particular distribution, or have
expressed interest in helping with man-pages maintenance, or have
otherwise expressed interest in being notified about man-pages
releases. =A0If you don't want to receive such messages from me, or you
know of some other translator or maintainer who may want to receive
such notifications, send me a message.

Cheers,

Michael

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Changes in=
 man-pages-3.25 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2010-06-20, Munich


Contributors
------------

The following people contributed notes, ideas, or patches that have
been incorporated in changes in this release:

Alexander E. Patrakov
Andi Kleen
Andrew Klossner
Andre Goddard Rosa
Bo Borgerson
Christian Franke
Daisuke HATAYAMA
David Sommerseth
Denis Barbier
Eric Blake
=46ang Wenqi
=46rancesco Cosoleto
Gernot Tenchio
Hugh Dickins
Ivana Hutarova Varekova
Jan Blunck
Jan Engelhardt
Jan Kara
Jeff Barry
Manfred Schwarb
Mark Hills
Martin (Joey) Schulze
Michael Kerrisk
Mihai Paraschivescu
Mike Frysinger
Miklos Szeredi
Petr Baudis
Petr Gajdos
Petr Uzel
Pierre Habouzit
Reuben Thomas
Rob Landley
Robert Wohlrab
Serge E. Hallyn
Tolga Dalman
Tom Swigg
Walter Harms
Yuri Kozlov

Apologies if I missed anyone!


New and rewritten pages
-----------------------

migrate_pages.2
    Andi Kleen
        New page documenting migrate_pages(2).
            Andi's text based on the move_pages.2 page;
            additional edits by mtk.
            migrate_pages(2) was new in Linux 2.6.16.

quotactl.2
    Jan Kara
        Major updates
            Update the page to consolidate information from the
            outdated man-pages quotactl.2 page and the quotactl.2
            page in the "quota-tools" pachage. The page in "quota-tools=
"
            has now been dropped by Jan Kara, so that there is just one
            canonical quotactl.2 page (in pan-pages).
    Michael Kerrisk
            Various other pieces added to the page by mtk.


Newly documented interfaces in existing pages
---------------------------------------------

fcntl.2
    Michael Kerrisk
        Document F_SETPIPE_SZ and F_GETPIPE_SZ
            These commands, new in kernel 2.6.35, set and get the capac=
ity
            of pipes.

madvise.2
    Andi Kleen
        Document MADV_HWPOISON
    Michael Kerrisk
        Added documentation of MADV_MERGEABLE and MADV_UNMERGEABLE
            These flags (used for Kernel Samepage Mergeing, KSM)
            are new in 2.6.32.
    Andi Kleen
        Document MADV_SOFT_OFFLINE
            This operation was added in Linux 2.6.33.

mmap.2
    Michael Kerrisk
        Document MAP_UNINITIALIZED flag
            New in Linux 2.6.33.

prctl.2
    Andi Kleen
        Document the hwpoison prctls in 2.6.32

sched_setscheduler.2
    Michael Kerrisk
        Document SCHED_RESET_ON_FORK
            New in Linux 2.6.32

umount.2
    Michael Kerrisk
        Document UMOUNT_NOFOLLOW
            New in Linux 2.6.34.

mkstemp.3
    Michael Kerrisk
        Document mkstemps() and mkostemps()
            These functions are new in glibc 2.11. They allow the templ=
ate
            string to include a suffix after the "XXXXXX" string.

proc.5
    Michael Kerrisk
        Document /proc/sys/vm/memory_failure_early_kill
            New in 2.6.32. Description based on the text in
            Documentation/sysctl/vm.txt.
    Michael Kerrisk
        Document /proc/sys/vm/memory_failure_recovery
            New in Linux 2.6.32.  Description based on the text in
            Documentation/sysctl/vm.txt.
    Michael Kerrisk
        Document /proc/sys/fs/pipe-max-size

socket.7
    Jan Engelhardt
        Document SO_DOMAIN and SO_PROTOCOL
            These read-only socket options were new in Linux 2.6.32.


New and changed links
---------------------

fstatvfs.2
    Michael Kerrisk
        Adjust link to point to Section 3

fstatvfs.3
statvfs.2
    Michael Kerrisk
        New link to page relocated to Section 3

mkstemps.3
mkostemps.3
    Michael Kerrisk
        New links to mkstemp.3
            mkstemp.3 now describes mkstemps(3) and mkostemps(3).

timer_create.2
timer_delete.2
timer_getoverrun.2
timer_settime.2
getline.3
    Michael Kerrisk
        Add 'L' to constants in feature test macro specifications
            Be consistent with POSIX, which uses constants such as 2008=
09L.


Global changes
--------------

open.2
sync_file_range.2
umount.2
    Michael Kerrisk
        Global fix: s/filesystem/file system/


Changes to individual pages
---------------------------

fcntl.2
    Michael Kerrisk
        Note that glibc 2.11 papers over the kernel F_GETOWN bug
            Since version 2.11, glibc works around the kernel limitatio=
n for
            process groups IDs < 4096 by implementing F_GETOWN via F_GE=
TOWN_EX.

futex.2
    Michael Kerrisk
        Various fixes in SEE ALSO

getpriority.2
nice.2
    Francesco Cosoleto
        Move renice from section 8 to section 1

getrusage.2
    Mark Hills
        Add ru_maxrss
            See kernel commit 1f10206.
    Mark Hills
        Description of maintained fields
            These descriptions are taken from NetBSD 5.0's getrusage(2)=
=2E
    Michael Kerrisk
        Enhanced description of various fields

mlock.2
    Michael Kerrisk
        /proc/PID/status VmLck shows how much memory a process has lock=
ed
            After a note from Tom Swigg, it seems sensible mention VmLc=
k here.

mount.2
    Petr Uzel
        Fix incorrect path

move_pages.2
    Andi Kleen
        Clarify includes/libraries

mremap.2
    Michael Kerrisk
        Clarify existence of fifth argument.

msgctl.2
semctl.2
shmctl.2
    Francesco Cosoleto
        Move ipcs from section 8 to section 1

open.2
    Michael Kerrisk
        Remove ambiguity in text on NFS and O_EXCL.

poll.2
    Michael Kerrisk
        Fix discussion of ppoll() timeout argument
            1. Rename ppoll)(_ argument to "timeout_ts" to distinguish =
it
               from the poll() argument in the text.
            2. More accurately describe the poll() call that is equival=
ent
               to ppoll().

posix_fadvise.2
    Michael Kerrisk
        Add sync_file_range(2) under SEE ALSO

prctl.2
    Michael Kerrisk
        Correct PR_SET_KEEPCAPS description
            The "keep capabilities" flag only affects the treatment of
            permitted capabilities, not effective capabilities.
            Also: other improvements to make the PR_SET_KEEPCAPS text c=
learer.

select_tut.2
    Michael Kerrisk
        Fix bug in example program

sigaction.2
    Michael Kerrisk
        Add TRAP_BRANCH and TRAP_HWBKPT to si_code values for SIGTRAP
    Michael Kerrisk
        Rearrange text describing fields set by sigqueue(2)
    Michael Kerrisk
        Add details for signals sent by POSIX message queue notificatio=
ns
    Michael Kerrisk
        Improve description of various siginfo_t fields
    Michael Kerrisk
        Add some details for SIGTRAP and si_trapno
    Andi Kleen
        Document hwpoison signal extensions

statfs.2
    Michael Kerrisk
        Bring statfs struct type declarations closer to glibc reality
    Fang Wenqi
        Add definition EXT4_SUPER_MAGIC =3D 0xEF53
    Michael Kerrisk
        Document f_frsize field.

statvfs.2
    Michael Kerrisk
        Move this page to section 3 (since it's a library call)

swapon.2
    Ivana Hutarova Varekova
        Note effect of iCONFIG_MEMORY_FAILURE on MAX_SWAPFILES
            From 2.6.32, MAX_SWAPFILES is decreased by 1 if the kernel =
is
            built with CONFIG_MEMORY_FAILURE.

syscalls.2
    Michael Kerrisk
        Bring system call list up to date with Linux 2.6.33
    Michael Kerrisk
        Fix kernel version number for utimes()

cproj.3
    Michael Kerrisk
        Note fix for C99 conformance in glibc 2.12.

crypt.3
    Petr Baudis
        Correct note on key portion significance
            As Marcel Moreaux notes:

                The Linux manpage for crypt()[1] contains the following
                statement as the last sentence of the NOTES section:

                    In the SHA implementation the entire key is signifi=
cant
                    (instead of only the first 8 bytes in MD5).

                It should probably say "DES" where it says "MD5" (and m=
aybe
                "MD5/SHA" where it says "SHA"), because in MD5 password=
 hashing,
                the entire key is significant, not just the first 8 byt=
es.

            This patch fixes the wording.

fmemopen.3
    Michael Kerrisk
        Bug fix in example program

ftw.3
    Michael Kerrisk
        Note that if 'fn' changes CWD, the results are undefined
    Michael Kerrisk
        Clarify description of fpath argument
            As reported by Pierre Habouzit, 'fpath' is not relative
            to 'dirpath'. It is either relative to the calling process'=
s
            current working directory (if 'dirpath' was relative), or i=
t
            is absolute (if 'dirpath' was absolute).

getaddrinfo.3
    Christian Franke
        Fix a field name mixup: s/ai_family/ai_flags/

getline.3
    Robert Wohlrab
        Remove unneeded check before free()
            The manpage of getline shows an example with an extra NULL =
pointer
            check before it calls free. This is unneeded according to f=
ree(3):

                 If ptr is NULL, no operation is performed.

            This patch removes the "if" check.

            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D5725=
08

log.3
log10.3
log2.3
    Jan Engelhardt
        Add cross-references to other-base logarithmic functions

opendir.3
    Petr Baudis
        Specify feature test macro requirements for fdopendir(3)
            Currently, there is no note on the fact that fdopendir() is
            POSIX.2008-only.

openpty.3
    Eric Blake
        Use const as appropriate
    Michael Kerrisk
        Note glibc version that added "const" to function arguments
    Michael Kerrisk
        Explicitly note that these functions are not in POSIX

resolver.3
    Michael Kerrisk
        Fix declaration of dn_comp() in SYNOPSIS
            Remove the second 'exp_dn' from the calling signature.

termios.3
    Michael Kerrisk
        Change NOFLSH text to speak of characters, not signals

core.5
    Michael Kerrisk
        Update description of coredump_filter
            Kernel 2.6.24 added MMF_DUMP_ELF_HEADERS.
            Kernel 2.6.28 added MMF_DUMP_HUGETLB_PRIVATE and
            MMF_DUMP_HUGETLB_SHARED.

elf.5
    Daisuke HATAYAMA
        Document PN_XNUM extension
            In linux-2.6.34-rc1, an ELF core extension was added; user-=
land
            tools manipulating ELF core dump such as gdb and binutils h=
as
            already been modified before; so elf.5 needs to be modified
            accordingly.

            You can follow information on the ELF extension via the LKM=
L post:
            http://lkml.org/lkml/2010/1/3/103
            Date        Mon, 04 Jan 2010 10:06:07 +0900 (JST)
            Subject     ... elf coredump: Add extended numbering suppor=
t

            This Linux-specific extension was added in kernel 2.6.34.

            Reviewed-by: Petr Baudis

    Michael Kerrisk
        Remove EI_BRAND
            As reported by Yuri Kozlov  and confirmed by Mike Frysinger=
,
            EI_BRAND is not in GABI
            (http://www.sco.com/developers/gabi/latest/ch4.eheader.html=
)
            It looks to be a BSDism
    Michael Kerrisk
        Remove words under '.note': "described below"
            The existing text is broken, because there is
            no '"Note Section" format' describe below. Simplest
            solution is to remove the words "described below".

filesystems.5
    Jeff Barry
        Add discussion of ntfs and ext4

proc.5
    Michael Kerrisk
        Simplify description of /proc/sys and /proc/sys/fs
            In the description of these directories, there's no need
            to list all the files and subdirectories that they contain;
            that information is provided by the entries that follow.

services.5
    Yuri Kozlov
        Remove crufty reference to nonexistent BUGS section

capabilities.7
    Michael Kerrisk
        Document CAP_SYS_RESOURCE and F_SETPIPE_SZ
            With CAP_SYS_RESOURCE, a process can increase pipe capacity=
 above
            /proc/sys/ps/pipe-max-size.
    Michael Kerrisk
        Add get_robust_list() info under CAP_SYS_PTRACE
    Michael Kerrisk
        Add MADV_HWPOISON under CAP_SYS_ADMIN

signal.7
    Michael Kerrisk
        Make a clearer statement about nonportable aspect of signal(2)
            Make a clearer statement that signal(2) is less portable fo=
r
            establishing a signal handler.

socket.7
    Michael Kerrisk
        Use consistent language to describe read-only socket options

udp.7
    Michael Kerrisk
        Add FIONREAD warning.
            Warn that FIONREAD can't can't distinguish case of a zero-l=
ength
            datagram from the case where no datagrams are available.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
