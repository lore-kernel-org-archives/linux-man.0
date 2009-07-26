From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: man-pages-3.22 released
Date: Sun, 26 Jul 2009 07:10:10 +0200
Message-ID: <cfd18e0f0907252210p4766334dl77fcf08fa59bbda5@mail.gmail.com>
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

   man-pages-3.22.tar.gz - man pages for Linux

This release is now available for download at:

 http://www.kernel.org/pub/linux/docs/man-pages
 or ftp://ftp.kernel.org/pub/linux/docs/man-pages

The online changelog is available at
http://www.kernel.org/doc/man-pages/changelog.html
(blogged at
http://linux-man-pages.blogspot.com/2009/07/man-pages-322-is-released.h=
tml )
and the current version of the pages is browsable at
http://www.kernel.org/doc/man-pages/

You are receiving this message either because:

a) You contributed to the content of this release.

b) You are subscribed to linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (*).

c) I have information (possibly inaccurate) that you are the maintainer=
 of
a translation of the manual pages, or are the maintainer of the manual
pages set in a particular distribution, or have expressed interest in
helping with man-pages maintenance, or have otherwise expressed interes=
t in
being notified about man-pages releases.  If you don't want to receive =
such
messages from me, or you know of some other translator or maintainer wh=
o
may want to receive such notifications, send me a message.

Cheers,

Michael

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Changes in=
 man-pages-3.22 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2009-07-25, Munich


Contributors
------------

The following people contributed notes, ideas, or patches that have
been incorporated in changes in this release:

Adrian Dewhurst <sailor-rBIaV6dsCWf30BxdvE/MCQ@public.gmane.org>
Alexander Lamaison <awl03-CezfXpuMXD6Fxr2TtlUqVg@public.gmane.org>
Bryan =D8stergaard <kloeri-k5O9xmZG+kVAfugRpC6u6w@public.gmane.org>
Christopher Head <chead-EynCeXvFgoheoWH0uzbU5w@public.gmane.org>
Doug Goldstein <cardoe-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
=46lorentin Duneau <fduneau-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Gokdeniz Karadag <gokdenizk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
KOSAKI Motohiro <kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Lucian Adrian Grijincu <lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Reimar D=F6ffinger <Reimar.Doeffinger-Mmb7MZpHnFY@public.gmane.org>
Ricardo Garcia <rg3.zeluan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Rui Rlex <rui.rlex-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Shachar Shemesh <shachar-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Tolga Dalman <tdalman-PWUXgD0Mw7jQPojr80n/Gg@public.gmane.org>
ku roi <kuroibox-LWAfsSFWpa4@public.gmane.org>
sobtwmxt <sobtwmxt-VThn6mlTRQFChFL4AGkBsw@public.gmane.org>

Apologies if I missed anyone!


Changes to individual pages
---------------------------

clone.2
    Michael Kerrisk
        Rewrite crufty text about number of args in older version of cl=
one()
                Some bit rot had crept in regarding the discussion of t=
he
                number of arguments in older versions of this syscall.
                Simplify the text to just say that Linux 2.4 and earlie=
r
                didn't have ptid, tls, and ctid arguments.

                See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D=
533868
    Michael Kerrisk
        Fix version number for CLONE_NEWIPC
            It's 2.6.19, not 2.4.19.
    Michael Kerrisk
        Fix errors in argument names in text (ptid, ctd)

execve.2
    Mike Frysinger
        Remove erroneous statement that pending signal set is cleared
        on execve(2).

fcntl.2
    Michael Kerrisk
        The kernel source file mandatory.txt is now mandatory-locking.t=
xt
    Michael Kerrisk
        The Documentation/* files are now in Documentation/filesystems

flock.2
    Michael Kerrisk
        Remove unneeded reference to Documentation/mandatory.txt
            Mandatory locks are only implemented by fcntl() locking
    Michael Kerrisk
        The Documentation/* files are now in Documentation/filesystems

fork.2
    Jeff Moyer
        Document fork() behaviour for the Linux native AIO io_context
            It was noted on lkml that the fork behaviour is documented
            for the POSIX AIO calls, but not for the Linux native calls=
=2E
            Here is a patch which adds a small blurb that folks will
            hopefully find useful.

            Upon fork(), the child process does not inherit the
            io_context_t data structures returned by io_setup,
            and thus cannot submit further asynchronous I/O or
            reap event completions for said contexts.

getdents.2
    Michael Kerrisk
        The d_type field is fully supported on Btrfs

mount.2
    Michael Kerrisk
        Document MS_STRICTATIME, update description of MS_RELATIME
            Starting with Linux 2.6.30, the MS_RELATIME behavior became
            the default, and MS_STRICTATIME is required to obtain the
            traditional semantics.

poll.2
    Michael Kerrisk
        Remove EBADF error from ERRORS
            As reported by Motohiro:

            "man poll" describe this error code.

            >ERRORS
            > EBADF  An invalid file descriptor was given in one of the=
 sets.

            but current kernel implementation ignore invalid file descr=
iptor,
            not return EBADF.
            ...

            In the other hand, SUSv3 talk about

            > POLLNVAL
            >  The specified fd value is invalid. This flag is only val=
id in the
            >  revents member; it shall ignored in the events member.

            and

            > If the value of fd is less than 0, events shall be ignore=
d, and
            > ireevents shall be set to 0 in that entry on return from =
poll().

            but, no desribe EBADF.
            (see
http://www.opengroup.org/onlinepubs/009695399/functions/poll.html)

            So, I think the implementation is correct.

            Why don't we remove EBADF description?

sigaction.2
    Michael Kerrisk
        EWxpand description of si_utime and si_stime fields of siginfo_=
t

stat.2
    Michael Kerrisk
        Improve wording of ENOTDIR error

syscalls.2
    Michael Kerrisk
        Ad preadv() and pwritev(), new in kernel 2.6.30

wait.2
    Gokdeniz Karadag
        Document CLD_DUMPED and CLD_TRAPPED si_code values

daemon.3
    Michael Kerrisk
        Clarify discussion of 'noclose' and 'nochdir' arguments

ffs.3
    Petr Baudis
        SEE ALSO: add memchr(3)

fmemopen.3
    Petr Baudis
        Relocate BUGS section to correct position
    Petr Baudis
        NOTES: there is no file descriptor associated with the returned=
 stream
            Alexander Lamaison pointed out that this is not obvious
            from the documentation, citing an example with passing the
            FILE * handle to a function that tries to fstat() its
            fileno() in order to determine the buffer size.
    Michael Kerrisk
        CONFORMING TO: remove note that these functions are GNU extensi=
ons
            That sentence is now redundant, since these functions
            are added in POSIX.1-2008.

lockf.3
    Michael Kerrisk
        Clarify relationship between fcntl() and lockf() locking

memchr.3
    Petr Baudis
        SEE ALSO: add ffs(3)

readdir.3
    Michael Kerrisk
        The d_type field is fully supported on Btrfs

setjmp.3
    Mike Frysinger
        Fix typo and clarify RETURN description
            The word "signal" was duplicated in NOTES, and the RETURN
            section refers to setjmp() and sigsetjmp(), and mentions
            longjmp(), but not siglongjmp().

strcmp.3
    Petr Baudis
        SEE ALSO: add strverscmp(3)

strcpy.3
    Mark Hills
        SEE ALSO: Add strdup(3)

complex.7
    Michael Kerrisk
        Add missing header file for example program
    Reimar D=F6ffinger
        Fix type used in example code
        man complex (from release 3.18) contains the following code:
            complex z =3D cexp(I * pi);
        Reading the C99 standard, "complex" is not a valid type,
        and several compilers (Intel ICC, ARM RVCT) will refuse to comp=
ile.
        It should be
            double complex z =3D cexp(I * pi); instead.

environ.7
    Michael Kerrisk
        Note that last element in environ array is NULL
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D5286=
28
    Michael Kerrisk
        Wording fixes

mq_overview.7
    Michael Kerrisk
        Note that mkdir and mount commands here need superuser privileg=
e
    Michael Kerrisk
        Fix example showing contents of /dev/mqueue file

standards.7
    Michael Kerrisk
        Remove references to dated books
            Gallmeister and Lewine are rather old books. Probably,
            there are better books to consult nowadays, and anyway,
            this man page isn't intended to be a bibliography.

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Watch my Linux system programming book progress to publication!
http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
