From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.58 released
Date: Fri, 14 Feb 2014 16:14:02 +0100
Message-ID: <52FE32BA.1050809@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

    man-pages-3.58 - man pages for Linux

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.58

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2014/02/man-pages-358-is-released.h=
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
 man-pages-3.58 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2014-02-11, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
David Pr=C3=83=C2=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
=46abrice Bauzac <libnoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Network Nut <sillystack-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Ola Olsson <ola1olsson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Simone Piccardi <piccardi-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org>
Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
=D0=9C=D0=B0=D1=80=D0=BA =D0=9A=D0=BE=D1=80=D0=B5=D0=BD=D0=B1=D0=B5=D1=80=
=D0=B3 <socketpair-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
=E6=9C=AA=E5=8D=B7=E8=B5=B7=E7=9A=84=E6=B5=AA <ayjj_8109-9uewiaClKEY@public.gmane.org>

Apologies if I missed anyone!


Newly documented interfaces in existing pages
---------------------------------------------

pipe.2
    Michael Kerrisk
        Document the pipe2() O_DIRECT flag added in Linux 3.4

packet.7
    Daniel Borkmann
        Document PACKET_QDISC_BYPASS
            New in Linux 3.14.


Global changes
--------------

Various pages
    Simon Paillard
        Formatting fix: add space between function and () if BR or IR
            Detected through the regex:
                git grep -P '^\.(BR|IR) [\w]*\([\d]*\)$'

Various pages
    Simon Paillard
        Formatting fix: add space between word and punctuation if BR or=
 IR
            Detected through the regex:
                git grep -P '^\.(BR|IR) [^ ]*[,\.]$'

            Could probably be extended to match more cases and fix in p=
erl.

Various pages
    Michael Kerrisk
        Use Oxford comma

gettid.2
restart_syscall.2
passwd.5
socket.7
    Michael Kerrisk
        Fix order of SEE ALSO entries


Changes to individual pages
---------------------------

epoll_wait.2
    Michael Kerrisk  [Network Nut]
        Remove word "minimum" from the description of 'timeout'

epoll_wait.2
poll.2
select.2
    Michael Kerrisk
        Go into more detail on timeout and when call will cease blockin=
g

getxattr.2
listxattr.2
removexattr.2
setxattr.2
    Michael Kerrisk  [Fabrice Bauzac]
        Correct header file is <sys/xattr.h> (not <xattr/xattr.h>)
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D70141

msgctl.2
    Cyril Hrubis
        Add note about ignored arg to IPC_RMID

prctl.2
    Michael Kerrisk  [=C3=90=C2=9C=C3=90=C2=B0=C3=91=C2=80=C3=90=C2=BA =
=C3=90=C2=9A=C3=90=C2=BE=C3=91=C2=80=C3=90=C2=B5=C3=90=C2=BD=C3=90=C2=B1=
=C3=90=C2=B5=C3=91=C2=80=C3=90=C2=B3]
        PR_SET_PDEATHSIG value is preserved across execve(2)

recv.2
    Michael Kerrisk
        Rework and reorganize the text in various parts of the page.
        Isolate details specific to recv() vs recvfrom() vs recvmsg()
            Place details specific to each system call under a
            a separate subheading.
        Rework discussion of 'src_addr' and 'addrlen' for recvfrom()
        Add description of 'buf' and 'len' in recvfrom() section
        'addrlen' should be 0 (*not* NULL) when 'src_addr' is NULL
        Improve text describing recvfrom() call that is equivalent to r=
ecv()
    Michael Kerrisk  [=C3=A6=C2=9C=C2=AA=C3=A5=C2=8D=C2=B7=C3=A8=C2=B5=C2=
=B7=C3=A7=C2=9A=C2=84=C3=A6=C2=B5=C2=AA]
        Describe the various cases where the return value can be 0

shmctl.2
    Michael Kerrisk
        Note that 'buf' is ignored for IPC_RMID

symlinkat.2
    Michael Kerrisk
        Make argument names consistent with symlink(2) page

isalpha.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions isalnum(), isalpha(), isascii(), isblank(),
            iscntrl(), isdigit(), isgraph(), islower(), isprint(),
            ispunct(), isspace(), isupper() and isxdigit() are thread s=
afe.

isatty.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function isatty() is thread safe.

isgreater.3
    Peng Haitao
        ATTRIBUTES: Note macros that are thread-safe
            The macros isgreater(), isgreaterequal(), isless(),
            islessequal(), islessgreater() and isunordered() are thread=
 safe.

iswalnum.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread safe with exceptions
            The function iswalnum() is thread safe with exceptions.

iswalpha.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread safe with exceptions
            The function iswalpha() is thread safe with exceptions.

iswblank.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread safe with exceptions
            The function iswblank() is thread safe with exceptions.

iswcntrl.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread safe with exceptions
            The function iswcntrl() is thread safe with exceptions.

lockf.3
    Michael Kerrisk  [Simone Piccardi]
        Fix incorrect argument mentioned under EINVAL error

pthread_kill.3
    Michael Kerrisk
        Add feature test macro requirements

pthread_sigmask.3
    Michael Kerrisk
        Add feature test macro requirements

strtoul.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread safe with exceptions
            The functions strtoul(), strtoull() and strtouq() are threa=
d safe
            with exceptions.

nscd.conf.5
    Peter Schiffer
        Add note about default values

proc.5
    Michael Kerrisk
        SEE ALSO: Add some further kernel Documentation/sysctl files

man-pages.7
    Michael Kerrisk
        ATTRIBUTES sections come after VERSIONS
            Peng Haitao has consistently ordered the ATTRIBUTES after
            VERSIONS, so adjust the text in man-pages.7

vdso.7
    Michael Kerrisk
        Add words "virtual dynamic shared object" in DESCRIPTION

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
