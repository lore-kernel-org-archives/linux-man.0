From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.73 released
Date: Sun, 21 Sep 2014 13:58:44 +0200
Message-ID: <541EBD74.7090806@gmail.com>
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

    man-pages-3.73 - man pages for Linux

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.73

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2014/09/man-pages-373-is-released.h=
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
 man-pages-3.73 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2014-09-21, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Eric W. Biederman <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
J. Bruce Fields <bfields-uC3wQj2KruNg9hUCZPvPmw@public.gmane.org>
Justin Cormack <justin-ZoT6X9xF4iYMLht0+yDdMwC/G2K4zDHf@public.gmane.org>
Lorenzo Beretta <lory.fulgi-97W46K3QqA41GQ1Ptb7lUw@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Serge E. Hallyn <serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org>
Serge Hallyn <serge.hallyn-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Vasily Kulikov <segoon-cxoSlKxDwOJWk0Htik3J/w@public.gmane.org>
Vincent Lefevre <vincent-buymaDBGzMOsTnJN9+BGXg@public.gmane.org>
Vitaly Rybnikov <frodox-ytc+IHgoah0@public.gmane.org>
Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

namespaces.7
    Michael Kerrisk  [Eric W. Biederman]
        New page providing overview of Linux namespaces

pid_namespaces.7
    Michael Kerrisk  [Eric W. Biederman, Vasily Kulikov, Rob Landley,
                      Serge Hallyn]
        New page describing PID namespaces

user_namespaces.7
    Michael Kerrisk  [Eric W. Biederman, Andy Lutomirski, Serge Hallyn]
        New page describing user namespaces.


Newly documented interfaces in existing pages
---------------------------------------------

clone.2
    Eric W. Biederman  [Michael Kerrisk]
        Document CLONE_NEWUSER for creating a new user namespace

setns.2
    Eric W. Biederman, Michael Kerrisk
        Document the PID, user, and mount namespace support
            Document CLONE_NEWPID, CLONE_NEWUSER, and CLONE_NEWNS flags=
=2E

unshare.2
    Michael Kerrisk  [Eric W. Biederman]
        Document CLONE_NEWPID
    Michael Kerrisk  [Eric W. Biederman]
        Document CLONE_NEWUSER
    Michael Kerrisk
        Document CLONE_THREAD, CLONE_SIGHAND, and CLONE_VM


Changes to individual pages
---------------------------

clone.2
    Michael Kerrisk
        Move some CLONE_NEWNET text to namespaces.7
    Michael Kerrisk
        Move some CLONE_NEWUTS text 2 to namespaces.7
    Michael Kerrisk
        Move some CLONE_NEWIPC text to namespaces.7
    Michael Kerrisk
        Reword discussion of CLONE_NEWNS, removing text also in namespa=
ces(7)
    Michael Kerrisk
        Standardize text on CLONE_NEW* flags and CAP_SYS_ADMIN
    Michael Kerrisk
        EINVAL if (CLONE_NEWUSER|CLONE_NEWPID) && (CLONE_THREAD|CLONE_P=
ARENT)
    Michael Kerrisk
        Add more detail on the meaning of CLONE_SYSVSEM

flock.2
    Michael Kerrisk  [J. Bruce Fields]
        Don't mention "classical BSD" in discussion of fcntl()/flock in=
teraction
            The noninteraction of flock(2) and fcntl(2) locks does
            not seem to be classical BSD semantics (at least, checking
            the 4.4BSD sources suggest that the lock types do interact,
            although there have been other systems also where fcntl()
            and flock() locks do not interact). So, fix the text
            discussing "classical BSD" lock semantics.

getunwind.2
    Michael Kerrisk  [Yuri Kozlov]
        Fix description of return value
            s/size of unwind table/size of the unwind data/

mount.2
    Eric W. Biederman
        Clarify use of 'mountflags' and 'data' for MS_REMOUNT

reboot.2
    Michael Kerrisk  [Justin Cormack, Eric W. Biederman]
        Document effect of reboot() inside PID namespaces

semop.2
    Michael Kerrisk
        Refer to clone(2) for semantics of CLONE_SYSVSEM and semadj lis=
ts

seteuid.2
setgid.2
setresuid.2
setreuid.2
setuid.2
    Michael Kerrisk
        EINVAL can occur if UID/GID is not valid in caller's user names=
pace

setns.2
    Michael Kerrisk  [Eric W. Biederman]
        Clarify capabilities required for reassociating with a mount na=
mespace
    Michael Kerrisk
        Specify kernel version on each CLONE_NEW* flag
            And remove text on flags from VERSIONS.

unshare.2
    Michael Kerrisk
        Add an example program
    Michael Kerrisk
        Clarify semantics of CLONE_SYSVSEM
    Michael Kerrisk
        CLONE_SYSVSEM does not require CAP_SYS_ADMIN
    Michael Kerrisk
        Note flags implied by CLONE_THREAD and CLONE_VM

clock.3
    Michael Kerrisk  [Vincent Lefevre]
        The implementation uses clock_gettime() was to improve *accurac=
y*
            (The man page text mistakenly used the word "precision".)

drand48.3
    Michael Kerrisk  [Lorenzo Beretta]
        Remove crufty text about SVID 3 marking drand48() obsolete
            See http://bugs.debian.org/758293

proc.5
    Michael Kerrisk
        Move /proc/[pid]/mounts text to namespaces.7
    Michael Kerrisk
        Move /proc/[pid]/mountstats text to namespaces.7

capabilities.7
    Michael Kerrisk
        Refer reader to user_namespaces(7) for a discussion of capabili=
ties
    Michael Kerrisk
        Document CAP_SETUID and CAP_SETGID for user namespace mappings
    Michael Kerrisk
        setns() needs CAP_SYS_ADMIN in the *target* namespace
    Michael Kerrisk
        Since Linux 3.8, user namespaces no longer require CAP_SYS_ADMI=
N

mq_overview.7
    Michael Kerrisk
        Refer to namespaces(7) for info on POSIX MQs and IPC namespaces

svipc.7
    Michael Kerrisk
        Refer to namespaces(7) for info on System V IPC and IPC namespa=
ces

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
