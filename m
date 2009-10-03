From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: man-pages-3.23 is released
Date: Sat, 3 Oct 2009 08:13:30 +0200
Message-ID: <cfd18e0f0910022313q61824b0fh34c21d3f18bdf71b@mail.gmail.com>
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

   man-pages-3.23.tar.gz - man pages for Linux

This release is now available for download at:

 http://www.kernel.org/pub/linux/docs/man-pages
 or ftp://ftp.kernel.org/pub/linux/docs/man-pages

The online changelog is available at
http://www.kernel.org/doc/man-pages/changelog.html
(blogged at
http://linux-man-pages.blogspot.com/2009/10/man-pages-323-release-my-bo=
ok.html )
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

Gidday,

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Changes in=
 man-pages-3.23 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2009-09-30, Munich


Contributors
------------

The following people contributed notes, ideas, or patches that have
been incorporated in changes in this release:

Aaron Gardner <aaron.j.gardner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Andrey Vihrov <vihrov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Georg Sauthoff <gsauthof-If1cxaH3S3JVgF+RW+Bo1SZEdBbF94EN@public.gmane.org>
Leslie P. Polzer <sky-A/mCt7huS1RhCjiJDEAuBxvVK+yQ3ZXh@public.gmane.org>
Marc Lehmann <debian-reportbug-zsXavz5zCAg@public.gmane.org>
Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Nicolas Fran=E7ois <nicolas.francois-Fa7rcPG4DJn7nK0/Xc0eeg@public.gmane.org>
Serge Hallyn <serue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Siward de Groot <siward-nv30jWqA7Mk@public.gmane.org>
rui rlex <rui.rlex-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Apologies if I missed anyone!


Changes to individual pages
---------------------------

execve.2
pipe.2
tee.2
fmemopen.3
mq_notify.3
qsort.3
    Michael Kerrisk
        Replace use of assert() by code that checks argc
            See http://bugzilla.kernel.org/show_bug.cgi?id=3D13569

            As noted by Andrey:
            The purpose of the assert macro, defined in <assert.h>,
            is to provide a tool to check for programming mistakes
            or program logic errors. However, the assert macro must
            never be used to perform checks for run time errors,
            since, with the NDEBUG macro defined, expressions within
            the assert macro invocations are not evaluated/checked
            for, resulting in behavior that was not originally intended=
=2E
            ...
            The pages affected in the core package are

            execve(2)
            pipe(2)
            tee(2)
            fmemopen(3)
            mq_notify(3)
            qsort(3)

getrusage.2
    Michael Kerrisk
        ru_inblock and ru_oublock are now implemented
            These fields of the rusage structure are filled in since
            Linux 2.6.22.

mmap.2
    Michael Kerrisk
        Add brief documentation of MAP_HUGETLB
            This flag is new in 2.6.32, and serves a similar
            purpose to the shmget() SHM_HUGETLB flag.

open.2
    Christoph Hellwig
        add some comments on O_SYNC and friends

poll.2
    Michael Kerrisk
        Clarify wording describing of 'nfds' argument.
            reported by: rui rlex <rui.rlex-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

semctl.2
    Nicolas Fran=E7ois
        Remove some redundant words

setpgid.2
    Michael Kerrisk
        Add an explanation of orphaned process groups

splice.2
tee.2
vmsplice.2
    Mark Hills
        Fix return type
            Since glibc 2.7, the return type for these functions
            is ssize_t (formerly it was long).

stat.2
    Nicolas Fran=E7ois
        Fix small bug in example program
            Since it is a failure, EXIT_FAILURE looks more appropriate
            than EXIT_SUCCESS.

umount.2
    Michael Kerrisk
        glibc only exposes MNT_DETACH and MNT_EXPIRE since version 2.11
            See http://sourceware.org/bugzilla/show_bug.cgi?id=3D10092

exit.3
    Michael Kerrisk
        Add a pointer to explanation of orphaned process groups in setp=
gid(2)

fflush.3
    Michael Kerrisk
        fflush() discards buffered input

ffs.3
    Michael Kerrisk
        Clarify that ffsl() and ffsll() are GNU extensions

getaddrinfo.3
    Michael Kerrisk
        Note nonstandard assumed hints.ai_flags value when hints is NUL=
L
            When hints is NULL, glibc assumes hints.ai_flags is
            AI_V4MAPPED|AI_ADDRCONFIG whereas POSIX says 0.
            According to Ulrich Drepper, glibc's behavior is better.

getmntent.3
    Mike Frysinger
        setmntent() argument is 'filename' not 'fp'
            The description of setmntent() formerly used the wrong
            argument name.

posix_fallocate.3
    Nicolas Fran=E7ois
        Fix reference to POSIX.1-2008
            The sentence mentions twice POSIX.1-2001.
            I guess the second one should be POSIX.1-2008.
            This should be checked in the standard.

setenv.3
    Michael Kerrisk
        Improve ERRORS section
            Add ENOMEM error; improve EINVAL description. Also, make
            RETURN VALUE section a little more accurate in its mention
            of errno.

strftime.3
    Nicolas Fran=E7ois
        Fix error in description: s/Monday/Thursday/

proc.5
    Nicolas Fran=E7ois
        Fix page cross reference
            max_user_watches is better explained in epoll(7) than inoti=
fy(7).

proc.5
    Michael Kerrisk
        dmesg is in section 1, not section 8

capabilities.7
    Michael Kerrisk
        FS UID manipulations affect CAP_LINUX_IMMUTABLE and CAP_MKNOD
            Nowadays, file system UID manipulations also affect
            CAP_LINUX_IMMUTABLE (since 2.6.3) and CAP_MKNOD (since 2.6.=
29).

capabilities.7
    Michael Kerrisk
        Fix version number for CAP_MKNOD in DS UID manipulations
            A recent patch said "since 2.6.29". It should have
            been "since 2.6.30".

capabilities.7
    Nicolas Fran=E7ois
        Reword a bad sentence in description of capability bounding set=
=2E

mq_overview.7
    Michael Kerrisk
        Change documented ranges for msg_max and msgsize_max
            Linux 2.6.28 changed the permissible ranges for
            these /proc files.

tcp.7
udp.7
    Nicolas Fran=E7ois
        Replace references to syctl interfaces with /proc

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Watch my Linux system programming book progress to publication!
http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
