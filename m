From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.77 released
Date: Sat, 10 Jan 2015 17:18:24 +0100
Message-ID: <54B150D0.6050104@gmail.com>
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

    man-pages-3.77 - man pages for Linux

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.76

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2015/01/man-pages-377-is-released.h=
tml

The current version of the pages is browsable at:
http://man7.org/linux/man-pages/

A few changes in this release that may be of interest to readers of
this list are given below.

Cheers,

Michael


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Changes in=
 man-pages-3.77 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2015-01-10, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Alexandre Bique <bique.alexandre-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Andre Majorel <aym-xunil-Bi/FLWfhfolQFI55V6+gNQ@public.gmane.org>
Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Dave Hansen <dave.hansen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Ignat Loskutov <ignat.loskutov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Jeff Epler <jepler-ixP+gI44yfQ4d9/VWYMlNA@public.gmane.org>
J=C3=A9r=C3=B4me Pouiller <jezz-kPcTzGkeZgAdnm+yROfE0A@public.gmane.org>
Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Masanari Iida <standby24x7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Michael Haardt <michael-8s1n8bisGiQ@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Troy Davis <troy-EyOyorkO9KA@public.gmane.org>
Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Will Drewry <wad-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

seccomp.2
    Kees Cook, Michael Kerrisk, Will Drewry  [Andy Lutomirski]
        New page documenting seccomp(2)
            Combines documentation from prctl, in-kernel seccomp_filter=
=2Etxt
            and dropper.c, along with details specific to the new syste=
m call.


Newly documented interfaces in existing pages
---------------------------------------------

netlink.7
    Stephan Mueller  [Michael Kerrisk]
        Add NETLINK_CRYPTO


Changes to individual pages
---------------------------

adjtimex.2
    Laurent Georget  [Richard Cochran, Jeff Epler]
        Clarify the 'ppm scaling' used in struct timex
            This patch makes explicit and clarifies the unit used for
            the fields "freq", "ppsfreq" and "stabil" in struct timex.
    Michael Kerrisk  [Masanari Iida]
        Note that TIME_ERROR is the modern synonym for TIME_BAD

perf_event_open.2
    Vince Weaver
        Clarify the PERF_FLAG_FD_* flags
            This change clarifies the behavior of the PERF_FLAG_FD_OUTP=
UT and
            PERF_FLAG_FD_NO_GROUP flags to perf_event_open(), and remov=
es
            the related FIXME comments.

            While writing tests to validate the behavior of these flags=
 I
            discovered that PERF_FLAG_FD_OUTPUT has been broken since t=
he
            2.6.35 kernel release.

prctl.2
    Dave Hansen [Michael Kerrisk]
        Add description of Intel MPX calls
            The 3.19 kernel will have support for Intel MPX, including
            a pair of new prctl() calls (PR_MPX_ENABLE_MANAGEMENT and
            PR_MPX_DISABLE_MANAGEMENT) for enabling and disabling the
            kernel's management of the "bounds tables".  Add a
            descriptions of the interface.
    Michael Kerrisk
        Add mention of seccomp(2) under PR_SET_SECCOMP
    Michael Kerrisk
        Suggest /proc/PID/status "Seccomp" as alternative to PRCTL_GET_=
SECCOMP
    Michael Kerrisk
        SIGKILL can also occur PRCTL_GET_SECCOMP in SECCOMP_MODE_FILTER=
 mode
    Kees Cook  [Andy Lutomirski]
        Document SECCOMP_MODE_FILTER vs EFAULT
            This notes the distinction made between EINVAL and EFAULT w=
hen
            attempting to use SECCOMP_MODE_FILTER with PR_SET_SECCOMP.

setns.2
pid_namespaces.7
    Mike Frysinger
        Elaborate discussion of the PID namespace descendant limitation
            The setns(2) man page already mentions that CLONE_NEWPID ma=
y only
            be used with descendant namespaces, but this nuance could b=
e
            listed in a few more places so it is not missed.

shmget.2
    Michael Kerrisk  [Akihiro Motoki]
        Make wording of SHMALL description a little clearer

sigaction.2
    Michael Kerrisk
        Add siginfo_t fields for SECCOMP_RET_TRAP

memchr.3
strstr.3
    Alexandre Bique
        Reference memmem(3) in SEE ALSO section

memcmp.3
    Michael Kerrisk  [Michael Haardt]
        NOTES: add some detail on avoiding memcmp() of cryptographic da=
ta
            Wording largely based on comments from Michael Haardt.

pthread_tryjoin_np.3
    J=C3=A9r=C3=B4me Pouiller  [Michael Kerrisk]
        Document EINVAL error for pthread_timedjoin_np()

mem.4
    Elie De Brauwer
        /dev/kmem depends on CONFIG_DEVKMEM
    Elie De Brauwer
        Correct /dev/port group in example
            mem.4 mentions that group for /dev/port should be set to 'm=
em'
            However, all other files (/dev/mem and /dev/kmem) use the k=
mem
            group in their examples and on my system /dev/port belongs =
to
            kmem. Hence the 'mem' group was probably a typo:
    Elie De Brauwer
        Add CONFIG_STRICT_DEVMEM
            Since 2.6.26 the CONFIG_NONPROMISC_DEVMEM options limits th=
e
            physical addresses which can be accessed through /dev/mem.

random.4
    Heinrich Schuchardt
        Describe handling of O_NONBLOCK
            /dev/random and /dev/urandom treat O_NONBLOCK differently.
            This should be described in the manpage.
    Heinrich Schuchardt
        Mention PRNG used by urandom
            /dev/urandom uses a pseudo-random number generator to repla=
ce
            missing entropy.

proc.5
    Michael Kerrisk
        Document "Seccomp" field of /proc/PID/status

epoll.7
    Michael Kerrisk  [Ignat Loskutov]
        Use epoll_create1() rather than epoll_create() in the code exam=
ple
            epoll_create1() is more or less the preferred API for new
            applications, since it allows for some flags and avoids the
            misdesigned epoll_create() argument, and so it seems sensib=
le
            to use that in the example, rather than epoll_create().

tcp.7
    Troy Davis
        Clarify tcp_tw_recycle on Internet-facing hosts
            Clarify that tcp_tw_recycle will break communication with m=
any
            general-purpose remote Internet hosts (namely, remote NAT d=
evices)
            even when the Linux device itself is not behind NAT.


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
