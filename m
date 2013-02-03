From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.46 released
Date: Mon, 4 Feb 2013 00:03:49 +0100
Message-ID: <CAKgNAkjYMh68CAQjx9vmbS4s+gNYs_umA11xf6qDdpJdWr0-gQ@mail.gmail.com>
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

    man-pages-3.46 - man pages for Linux

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    http://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.46

A short summary of the release is blogged at:
linux-man-pages.blogspot.com/2013/02/man-pages-346-is-released.html

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
 man-pages-3.46 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2013-01-27, Canberra


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Andrew Perepechko <andrew_perepechko-qCPWdT176rRBDgjK7y7TUQ@public.gmane.org>
C=E9dric Boutillier <cedric.boutillier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Daan Spitz <daan.f.spitz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Garrett Cooper <yanegomi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
James Noble <James.Noble-c3YU+qzk/GXuufBYgWm87A@public.gmane.org>
Justin Lebar <justin.lebar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Lucas De Marchi <lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>
Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Maxin B. John <maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Michal Gorny <mgorny-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Peter Budny <bigpeteb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Peter Lekeynstein <lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>
Samuel Thibault <sthibault-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Starlight <starlight.2013q1-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org>
Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>
Wolfgang Rohdewald <wolfgang-zdKOYOBJ9IsPyMaTEpOvjQ@public.gmane.org>
Zsb=E1n Ambrus <ambrus-4iFmikrsyIeT9ig0jae3mg@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

kcmp.2
    Cyrill Gorcunov, Michael Kerrisk
        New page for kcmp(2)


Newly documented interfaces in existing pages
---------------------------------------------

init_module.2
    Michael Kerrisk  [Kees Cook, Rusty Russell, Lucas De Marchi]
        Document finit_module(2)
    Rusty Russell  [Lucas De Marchi, Kees Cook]
        Document finit_module() 'flags' argument
            Document MODULE_INIT_IGNORE_MODVERSIONS and
            MODULE_INIT_IGNORE_VERMAGIC. (Some edits by mtk.)


New and changed links
---------------------

finit_module.2
    Michael Kerrisk
        New link to init_module.2

__after_morecore_hook.3
__free_hook.3
__malloc_initialize_hook.3
__memalign_hook.3
__realloc_hook.3
    Michael Kerrisk
        New link to malloc_hook.3


Global changes
--------------

Various pages
    Michael Kerrisk
        Global fix: s/tty/terminal/


Changes to individual pages
---------------------------

clone.2
    Michael Kerrisk
        Add kernel versions for various CLONE_* constants
    Michael Kerrisk
        CLONE_NEWIPC governs mechanisms that don't have filesystem path=
names
    Michael Kerrisk
        CLONE_NEWIPC doesn't mount the POSIX MQ file system
    Michael Kerrisk
        Add an example program (CLONE_NEWUTS)
    Michael Kerrisk
        Some reworking of CLONE_NEWIPC text
            No substantial content changes.
    Michael Kerrisk
        SEE ALSO: add kcmp(2)
        SEE ALSO: add setns(2)

fallocate.2
    Michael Kerrisk
        FALLOC_FL_* flags are defined in glibc only since 2.18

getxattr.2
removexattr.2
setxattr.2
    Michael Kerrisk  [Andrew Perepechko, ]
        Note that ENOATTR is a synonym for ENODATA
            Various people have pointed out that strace(1) shows ENODAT=
A
            for the case where the named attribute does not exist, or
            the process has no access to this attribute. ENODATA
            and ENOATTR are in fact defined as synonyms. Point this out
            in the man page, so that people understand the strace(1) in=
fo.

            See https://bugzilla.kernel.org/show_bug.cgi?id=3D51871

getxattr.2
listxattr.2
removexattr.2
setxattr.2
    Michael Kerrisk
        Put errors under ERRORS section
            The errno values on these pages were listed in a nonstandar=
d
            way under the RETURN VALUE section. Put them in ERRORS sect=
ions.

init_module.2
    Michael Kerrisk  [Rusty Russell]
        ERRORS: Add errors for module signatures (EBADMSG, ENOKEY)

link.2
mkdir.2
mknod.2
open.2
rename.2
symlink.2
write.2
mkfifo.3
    Mark Hills
        Document EDQUOT error
            The return error EDQUOT is not documented in open(2), write=
(2),
            symlink(2) etc.

            Whether inodes or disk blocks are required for each functio=
n
            is something I based on received wisdom and BSD documentati=
on,
            rather than tracing the code to the kernel. For symlink(2)
            this certainly depends on the file system type.

listxattr.2
    Michael Kerrisk  [Theodore Ts'o]
        Fix RETURN VALUE description
            On success, 0 may be returned, so change wording from
            "positive number" to "nonnegative number".

outb.2
    Michael Kerrisk
        Add SYNOPSIS

prctl.2
    Kees Cook
        Document PR_SET_PTRACER
            Document the Yama LSM's prctl handler that allows processes=
 to
            declare ptrace restriction exception relationships via
            PR_SET_PTRACER.
    Michael Kerrisk
        Make it explicit that PR_SET_PTRACER replaces previous setting
            The attribute is a scalar, not a list.
    Shawn Landden
        Document EINVAL error for PR_SET_PTRACER
    Michael Kerrisk
        Document PR_GET_TID_ADDRESS

ptrace.2
    Michael Kerrisk
        Document PTRACE_O_EXITKILL
    Michael Kerrisk
        Place PTRACE_SETOPTIONS list in alphabetical order

query_module.2
    Michael Kerrisk
        Must be called using syscall(2)
            Yes, the call is way obsolete, but add this info
            for completeness.

recvmmsg.2
    Elie De Brauwer
        Add/correct kernel version info for recvmmsg() and MSG_WAITFORN=
ONE
            This patch isolates the since/version related fixes as requ=
ested.
            This change introduces the following delta:
             * The page states it was added in 2.6.32 but it is only ad=
ded
                2.6.33 (ref: http://kernelnewbies.org/Linux_2_6_33)
             * The MSG_WAITFORONE flag was in turn only added in 2.6.34
               (ref: http://kernelnewbies.org/Linux_2_6_34)
    Elie De Brauwer
        Add an example program

setns.2
    Michael Kerrisk
        Add example program

sigaction.2
    Michael Kerrisk  [Zsb=E1n Ambrus]
        Note feature test macro requirements for 'siginfo_t'
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D52931

syscalls.2
    Michael Kerrisk
        Add kern_features(2)
    Michael Kerrisk
        Add utrap_install(2)
            Sparc-specific, present since ancient times
    Michael Kerrisk
        Add finit_module(2)

sysctl.2
    Michael Kerrisk  [Garrett Cooper]
        ERRORS: EACCES as a synonym for EPRM
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D46731
            and http://thread.gmane.org/gmane.linux.ltp/11413/focus=3D9=
57635
                From: Garrett Cooper <yanegomi <at> gmail.com>
                Subject: Re: [LTP] [PATCH] sysctl03: sysctl returns
EACCES after 2.6.33-rc1
                Newsgroups: gmane.linux.kernel, gmane.linux.ltp
                Date: 2010-03-04 18:35:33 GMT

unshare.2
    Michael Kerrisk
        Update NOTES on unimplemented flags
    Michael Kerrisk
        Fix text problems in description of CLONE_FS
    Michael Kerrisk
        SEE ALSO: add kcmp(2)
        SEE ALSO: add setns(2)
    Michael Kerrisk
        Reorder CLONE_NEWUTS entry in list

difftime.3
    Michael Kerrisk  [Michal Gorny]
        Remove crufty text about 'time_t' on "other systems"
            Back in 2006, some text came in via Debian patches that see=
ms
            crufty. Remove it.

            See https://bugzilla.kernel.org/show_bug.cgi?id=3D46731

getaddrinfo.3
getnameinfo.3
    Michael Kerrisk  [Peter Budny]
        Fix some confused references to function names
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D52741

getspnam.3
    Michael Kerrisk  [Wolfgang Rohdewald]
        ERRORS: Add EACCES
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D52681

__setfpucw.3
    Michael Kerrisk
        Add proper page cross refs for alternate functions

core.5
proc.5
    Kees Cook
        Clarify suid_dumpable versus core_pattern
            In Linux 3.6, additional requirements were placed on core_p=
attern
            when suid_dumpable is set to 2. Document this and include c=
ommit
            references.
    Justin Lebar
        statm's "shared" field refers to pages backed by files
            I noticed that statm's "shared" field doesn't match the sum=
 of
            all the "shared" entries in smaps [1].

            The kernel docs explain that statm's "shared" field is "num=
ber of
            pages that are shared (i.e. backed by a file)" [2].  smaps =
appears
            to call a page shared if it's mapped by at least two proces=
ses,
            which explains this discrepancy.

            I'm not a kernel hacker, but it appears to me they do mean =
"i.e."
            and not "e.g." in the statm description: In
            fs/proc/task_mmu.c::task_statm, I see

                *shared =3D get_mm_counter(mm, MM_FILEPAGES);

            Here's a patch which updates the man page to match the (hop=
efully
            correct) kernel docs.

            [1] https://bugzilla.mozilla.org/show_bug.cgi?id=3D807181
            [2]
http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux.git;a=3Dblob=
;f=3DDocumentation/filesystems/proc.txt;h=3Da1793d670cd01bd374eddf54ffd=
fc768504291ff;hb=3DHEAD

proc.5
    Kees Cook
        Put /proc/sys/kernel/hotplug in alphabetical order
    Kees Cook
        Document /proc/sys/kernel/dmesg_restrict
    Kees Cook
        Linux 3.4 changed permissions needed to change kptr_restrict
    Michael Kerrisk  [Samuel Thibault, Simon Paillard]
        Add field numbers for /proc/PID/stat
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D5534=
13
        Add numbering to /proc/stat "cpu" fields
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D5534=
13
    Michael Kerrisk
        Reorganize text describing /proc/stat "cpu" fields
    Michael Kerrisk
        Rewording of suid_dumpable text after comments from Kees Cook
    Michael Kerrisk  [Samuel Thibault, Simon Paillard]
        Add field numbers for /proc/[pid]/statm
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D5534=
13
    Michael Kerrisk
        Document /proc/stat "cpu" "nice_guest" field
            Info taken from commit ce0e7b28fb75cb003cfc8d0238613aaf1c55=
e797
    Michael Kerrisk  [Peter Lekeynstein]
        Document /prod/[pid]/oom_score_adj
            Text taken directly from Documentation/filesystems/proc.txt=
,
            with some light editing.

            See https://bugzilla.kernel.org/show_bug.cgi?id=3D50421

shells.5
    Michael Kerrisk
        Add /etc/bash to list of example shells

ttytype.5
    Michael Kerrisk
        Add proper xref for termcap and terminfo pages

capabilities.7
    Michael Kerrisk
        Add kcmp(2) under CAP_SYS_PTRACE

man-pages.7
    Michael Kerrisk
        Update description of Section 7

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
