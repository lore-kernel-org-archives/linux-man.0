From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.44 released
Date: Fri, 16 Nov 2012 07:22:13 +0100
Message-ID: <CAKgNAkg0upRG3_Ch+bnMy-1xLKjNwfDy1Eq=CB5KvKKe4G55wA@mail.gmail.com>
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

    man-pages-3.44.tar.gz - man pages for Linux

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    http://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.44

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2012/11/man-pages-344-is-released.h=
tml

The current version of the pages is browsable at:
http://man7.org/linux/man-pages/

You are receiving this message either because:

a) You contributed to the content of this release.

b) You are subscribed to linux-man-u79uwXL29TaiAVqoAR/hOA@public.gmane.org

c) I have information (possibly inaccurate) that you are the
maintainer of a translation of the manual pages, or are the maintainer
of the manual pages set in a particular distribution, or have
expressed interest in helping with man-pages maintenance, or have
otherwise expressed interest in being notified about man-pages
releases.  If you don't want to receive such messages from me, or you
know of some other translator or maintainer who may want to receive
such notifications, send me a message.

Cheers,

Michael

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Changes in=
 man-pages-3.44 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2012-11-07, Barcelona


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Bert Hubert <bert.hubert-dxZxOz86jR8sYtaaK7K+xw@public.gmane.org>
David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
James Youngman <jay-mXXj517/zsQ@public.gmane.org>
Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Lars Wirzenius <liw-X3B1VOXEql0@public.gmane.org>
Lucas De Marchi <lucas.de.marchi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>
Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Thomas Habets <thomas-NmolrwyTDqqzQB+pC5nmwQ@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

delete_module.2
    Michael Kerrisk
        Rewrite to Linux 2.6+ reality
    Michael Kerrisk
        Change license and copyright
            There is now nothing left of the original FSF-copyrighted
            page. So, change the copyright and license.
    Michael Kerrisk  [Lucas De Marchi, Rusty Russell]
        Substantial reorganization after comments from Rusty Russell
            Rusty notes that O_NONBLOCK is almost always used in
            practice. Therefore, it would be better to reorganize
            the page to consider that "the default".

init_module.2
    Michael Kerrisk
        Rewrite to Linux 2.6+ reality
    Michael Kerrisk
        Change copyright and license
            Little of the original page now remains. Change
            copyright and license
    Michael Kerrisk  [Rusty Russell]
        Changes after review comments from Rusty Russell
    Kees Cook
        Add various pieces describing Linux 2.6+ behavior
            Pieces take from, or inspired by, a patch sent by Kees.

getauxval.3
    Michael Kerrisk
        Document getauxval() function added in glibc 2.16


Global changes
--------------

Various pages
    Michael Kerrisk
        Global fix: Use consistent capitalization in NAME section
            The line(s) in the NAME section should only use capitals
            where English usage dictates that. Otherwise, use
            lowercase throughout.

Various pages
    Michael Kerrisk
        Global fix: "userspace" =3D=3D> "user space" or "user-space"
            Existing pages variously use "userspace or "user space".
            But, "userspace" is not quite an English word.
            So change "userspace" to "user space" or, when used
            attributively, "user-space".


Changes to individual pages
---------------------------

clock_getres.2
clock_nanosleep.2
    Michael Kerrisk
        Linking with -lrt is no longer needed from glibc 2.17 onward

create_module.2
    Michael Kerrisk
        Note that this system call is present only in kernels before 2.=
6
    Michael Kerrisk
        Note that ENOSYS probably indicates kernel 2.6+

execve.2
    Michael Kerrisk
        Document treatment of PR_SET_PDEATHSIG on execve()
    Michael Kerrisk
        Document treatment of SECBIT_KEEP_CAPS securebits flag on execv=
e()

fork.2
    Michael Kerrisk
        Note treatment of default timer slack value on fork()

getdomainname.2
    Simon Paillard  [Lars Wirzenius]
        Point out that these calls relate to NIS, not DNS
            See http://bugs.debian.org/295635

get_kernel_syms.2
    Michael Kerrisk
        Note that this system call is present only in kernels before 2.=
6

ipc.2
    Michael Kerrisk
        Update note on architectures that don't have ipc()
            Replace mention of ia64 with x86-64 and ARM.

link.2
    Michael Kerrisk
        Add EPERM error triggered by /proc/sys/fs/protected_hardlink

prctl.2
    Michael Kerrisk
        Mention Documentation/prctl/no_new_privs.txt for PR_SET_NO_NEW_=
PRIVS
    Kees Cook
        update seccomp sections for mode 2 (BPF)
            This adds a short summary of the arguments used
            for "mode 2" (BPF) seccomp.
    Michael Kerrisk
        Small improvements to PR_SET_SECCOMP discussion
            Note type of 'arg3' for SECCOMP_MODE_FILTER.
            Add pointer to Documentation/prctl/seccomp_filter.txt.
    Michael Kerrisk
        Note 'seccomp' semantics with respect to fork(), execve(), and =
prctl()
    Michael Kerrisk
        Document PR_SET_TIMERSLACK and PR_GET_TIMERSLACK
    Michael Kerrisk
        Reword PR_SET_NAME and PR_GET_NAME in terms of threads
            Plus tfix
    Kees Cook
        document PR_SET_NO_NEW_PRIVS, PR_GET_NO_NEW_PRIVS
            This adds a short description of the no_new_privs bit,
            as described in Documentation/prctl/no_new_privs.txt.

ptrace.2
    Michael Kerrisk
        Clarify that some operations are not present on all architectur=
es
            PTRACE_GETREGS, PTRACE_SETGREFS, PTRACE_GETFPREGS,
            and PTRACE_GETSPREGS are not present on all architectures.
            PTRACE_SYSEMU and PTRACE_SYSEMU_SINGLESTEP are present only
            on x86.

            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1223=
83

query_module.2
    Michael Kerrisk
        Add a few words clarifying reference to /sys/module
    Michael Kerrisk
        Note that this system call is present only in kernels before 2.=
6
    Michael Kerrisk
        Note that ENOSYS probably indicates kernel 2.6+
    Michael Kerrisk
        SEE ALSO: Add modinfo(8) and lsinfo(8)
    Michael Kerrisk
        Move some information in NOTES to VERSIONS

socketcall.2
    Michael Kerrisk
        Update note on architectures that don't have socketcall()
            Replace mention of ia64 with x86-64 and ARM.

times.2
    Thomas Habets
        Recommend clock_gettime(2) as alternative to times(2)

clock_getcpuclockid.3
    Michael Kerrisk
        Linking with -lrt is no longer needed from glibc 2.17 onward

fts.3
    Simon Paillard  [James Youngman]
        Improve description of physical vs. logical tree walking
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D6335=
05

getenv.3
    Michael Kerrisk
        SEE ALSO: add getauxval(3)

proc.5
    Michael Kerrisk
        Document /proc/meminfo
            Info mostly taken from Documentation/filesystems/proc.txt
            and Documentation/vm/hugetlbpage.txt.
    Michael Kerrisk
        Default for /proc/sys/fs/protected_{hardlinks,symlinks} is now =
0
            The default setting of 1 in/proc/sys/fs/protected_hardlinks
            and /proc/sys/fs/protected_symlinks caused one too many
            breakages for Linus's taste, so commit 561ec64ae67e changed
            the default for both files to 0.
        Note system call error yielded by /proc/sys/fs/protected_symlin=
ks
            Note that violating 'protected_symlinks' restrictions
            causes system calls to fail with the error EACCES.
    Michael Kerrisk
        Since Linux 2.6.27, /proc/sys/kernel/modprobe depends on CONFIG=
_MODULES

ipv6.7
    Bert Hubert
        Document IPV6_RECVPKTINFO

man-pages.7
    Michael Kerrisk
        Note rules for capitalization in NAME section

time.7
    Michael Kerrisk
        Add a subsection on timer slack

ld.so.8
    Michael Kerrisk
        SEE ALSO: add getauxval(3)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
