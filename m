From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.70 released
Date: Wed, 09 Jul 2014 15:05:10 +0200
Message-ID: <53BD3E06.40709@gmail.com>
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

    man-pages-3.70 - man pages for Linux

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.70

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2014/07/man-pages-370-is-released.h=
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
 man-pages-3.70 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2014-07-08, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
=46lorian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Nadav Har'El <nyh-TS7m/3hpY0sOpacJJkBjfT4kX+cae0hd@public.gmane.org>
NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Robert P. J. Day <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Tomi Salminen <tlsalmin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>
Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
=D0=9A=D0=B8=D1=80=D0=B8=D0=BB=D0=BB <kirillnow-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

sprof.1
    Michael Kerrisk [Marko Myllynen]
        New page for the glibc sprof(1) command


Newly documented interfaces in existing pages
---------------------------------------------

epoll_ctl.2
    NeilBrown
        Document EPOLLWAKEUP

epoll.7
    NeilBrown
        Document EPOLLWAKEUP


Changes to individual pages
---------------------------

iconv.1
iconvconfig.8
    Marko Myllynen
        Clarify gconv file terminology a bit

ldd.1
    Michael Kerrisk
        SEE ALSO: add sprof(1)

connect.2
    Michael Kerrisk
        ERRORS: add EPROTOTYPE
            See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D708=
394

dup.2
    Michael Kerrisk  [Rich Felker]
        Fix erroneous discussion regarding closing 'newfd' before calli=
ng dup2()
            And propose a workaround if the caller cares about catching
            close() time errors.

            See http://stackoverflow.com/questions/23440216/race-condit=
ion-when-using-dup2#comment36888604_23444465
            and http://austingroupbugs.net/view.php?id=3D411
    Michael Kerrisk
        Rework and enhance discussion of dup2()
            In particular, note that dup2() performs the steps of closi=
ng
            and reusing 'newfd' atomically.
    Michael Kerrisk
        Add subhead for dup3()

epoll_ctl.2
    Michael Kerrisk
        BUGS: EPOLLWAKEUP is silently ignored without CAP_BLOCK_SUSPEND
            If the caller does not have CAP_BLOCK_SUSPEND, then EPOLLWA=
KEUP
            is silently ignored.

fcntl.2
    Michael Kerrisk  [Tomi Salminen]
        The return value for F_SETPIPE_SZ is the pipe capacity
    Michael Kerrisk
        ERRORS: Document ENOTDIR error for F_NOTIFY
    Michael Kerrisk
        Use proper page cross-references in F_NOTIFY discussion
    Michael Kerrisk
        Suggest the use of real-time signals with F_NOTIFY

getitimer.2
    Michael Kerrisk
        Rewrite a few pieces to clarify some details

inotify_add_watch.2
    Michael Kerrisk
        Clarify that the target of a watch is an i-node
            The target of a watch is an i-node, not a pathname. Clarify
            the text to prevent the reader possibly misunderstanding
            that establishing watches by two different links to the sam=
e
            file might create different watch descriptors.

open.2
    Michael Kerrisk  [=D0=9A=D0=B8=D1=80=D0=B8=D0=BB=D0=BB]
        O_CLOEXEC is also one the flags not ignored when O_PATH is spec=
ified

pipe.2
    Elie De Brauwer
        PIPE_BUF is defined in limits.h
            To make use of PIPE_BUF in an application one should includ=
e
            <limits.h>.  Adding a reference to this inclusion.

poll.2
    Michael Kerrisk  [Nadav Har'El]
        The negate-fd-to-ignore technique does not work for file descri=
ptor 0
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D79411

set_tid_address.2
    Michael Kerrisk  [Rich Felker]
        Use "thread" rather than "process" in DESCRIPTION
    Michael Kerrisk
        SEE ALSO: add gettid(2)

shmop.2
    Michael Kerrisk
        Explain SHMLBA in much more detail

splice.2
    Michael Kerrisk
        Document EAGAIN error
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D48641

syscalls.2
    Carlos O'Donell
        Add prlimit64(2)
            While trying to reconcile the new features in glibc with th=
e
            documented entries in the linux kernel man pages I noticed =
that
            glibc exports prlimit64 for use by 32-bit applications (as =
does
            the linux kernel), but that prlimit64 was not defined in th=
e
            syscalls list or in the prlimit-related page.

            This is not the complete fix for this, but I don't have the=
 time
            to explain why and when prlimit64 should be used (or how it=
 should
            be used safely). Therefore I'm just patching the syscalls.2=
 list
            to show that prlimit64 exists and was added in 2.6.36 (veri=
fied
            with git by checking out the tags before and after).

syslog.2
    Michael Kerrisk
        Rework introductory paragraph
    Michael Kerrisk  [Robert P. J. Day]
        Rework text describing loglevels
            The kernel header file mentioned in the discussion of the K=
ERN_*
            constants has morphed and is no longer exported inside glib=
c.
            And the definitions of the constants themselves changed sub=
tly
            with kernel commit 04d2c8c83d0e3ac5f78aeede51babb3236200112=
=2E
            So, rewrite the description of the constants to be a bit mo=
re
            abstract.
    Michael Kerrisk
        Rewrite parts of the page, and import /proc/sys/kernel/printk
            * Move /proc/sys/kernel/printk from proc(5) to this page,
              and correct various details in the discussion of that fil=
e.
            * Rewrite and correct various other details on the page.
            * Clean out some crufty text.
            * Miscellaneous minor fixes.
    Michael Kerrisk
        Update SYSLOG_ACTION_CONSOLE_OFF + SYSLOG_ACTION_CONSOLE_ON des=
cription
            Details changed in Linux 2.6.32

tee.2
    Michael Kerrisk
        Document EAGAIN error
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D48641

vmsplice.2
    Michael Kerrisk
        Document EAGAIN error
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D48641

ether_aton.3
    Michael Kerrisk
        Make description of ether_line() bug a little more informative

mallopt.3
    Michael Kerrisk  [Florian Weimer]
        MALLOC_MMAP_THRESHOLD_ and MALLOC_MMAP_MAX_ *do* work in setgid=
 programs
            My testing on this point was bogus, overlooking details of
            strace(1)'s behavior with setuid programs.

            See https://sourceware.org/bugzilla/show_bug.cgi?id=3D12155

printf.3
    Michael Kerrisk  [Rich Felker]
        Remove libc4 and libc5 details
            Rich Felker noted that "scare text" in the man page warned =
about
            the use of snprintf() on libc, and that some people had cit=
ed
            this as a reason not to use snprintf().  Linux libc is now
            ancient history, so there is no real need to keep that text=
=2E
            But, while we're at it, we may as well clear out all of the
            other ancient libc4 and libc5 pieces in the page. They are
            nowadays more clutter than help.
    Michael Kerrisk
        SUSv3 and later agree with C99 for the snprintf() return value
            Determined by inspection of the SUSv3 and SUSv4 specificati=
ons.
    Michael Kerrisk
        Remove some old text about glibc 2.0 changes
            We probably don't now need such ancient info.
    Michael Kerrisk
        Update references to standards for C and S conversion specifier=
s

profil.3
    Michael Kerrisk
        SEE ALSO: add sprof(1)

charmap.5
    Marko Myllynen
        Various minor updates and improvements
            - more precise title
            - extend description a bit
            - document previously omitted WIDTH_DEFAULT
    Marko Myllynen
        Remove accidental ISO C compliance reference
            glibc refers in locale/programs/charmap.c to ISO C 99 secti=
on
            7.17.(2) and ISO C 99 section 5.2.1.(3) that if a character=
 map
            is not ASCII compatible then the locale using it is not ISO=
 C
            compliant. This does not state anything about the character=
 set
            itself.

proc.5
    Michael Kerrisk
        Replace /proc/sys/kernel/printk discussion with reference to sy=
slog(2)
            It makes more sense to have the /proc/sys/kernel/printk wit=
h
            the related material in syslog(2).
    Michael Kerrisk
        Rewrite /proc/sys/kernel/printk description

inotify.7
    Michael Kerrisk
        Clarify which events are generated for watched directories
            Really, with respect to watched directories, events fall in=
to
            three classes (not two, as was shown):

            * Events that can be generated only for the watched directo=
ry.
            * Events that can be generated only for objects that are in=
side
              the watched directory.
            * Events that can be generated both for the watched directo=
ry
              and for objects inside the directory.

            So, mark these three classes more clearly in the list of in=
otify
            events.
    Heinrich Schuchardt  [Michael Kerrisk]
        BUGS: Note possible bug triggered by watch descriptor reuse
            Watch descriptor IDs are returned by inotify_add_watch().
            When calling inotify_rm_watch() an IN_IGNORE is placed on t=
he
            inotify queue pointing to the ID of the removed watch.

            inotify_add_watchi() should not return a watch descriptor I=
D for
            which events are still on the queue but should return an
            unused ID.

            Unfortunately, the existing Kernel code does not provide su=
ch a
            guarantee.

            Actually, in rare cases watch descriptor IDs are returned b=
y
            inotify_add_watch() for which events are still on the inoti=
fy
            queue.

            See https://bugzilla.kernel.org/show_bug.cgi?id=3D77111
    Michael Kerrisk
        Add further detail to the watch descriptor reuse bug
            As well as inotify_rm_watch(), file deletion and unmounting=
 a
            filesystem can also cause a watch descriptor to be deleted.
    Michael Kerrisk
        The watch descriptor reuse bug may be hard to hit in practice
            Explain the circumstances in detail, indicating that the
            bug may be very unlikely to occur in practice.
    Michael Kerrisk
        Clarify description of IN_EXCL_UNLINK
            Clarify the text a little, in particular making it clearer
            that the target of a watch is an i-node (not a pathname).
    Michael Kerrisk
        Clarify IN_ONESHOT explanation
            Make it clearer that the target of monitoring is an i-node,
            not a pathname.
    Michael Kerrisk
        Make comment on 'mask' field more accurate

libc.7
    Michael Kerrisk
        Clarify man-pages policy on documenting C libraries other tahn =
glibc
    Michael Kerrisk
        Use absolute dates in discussion of libc vs glibc

pipe.7
    Elie De Brauwer
        Add reference that the pipe capacity can be changed
            In fcntl(2) F_SETPIPE_SZ, F_GETPIPE_SZ and
            /proc/sys/fs/pipe-max-size are defined, however
            pipe(7) still defines the pipe capacity as being
            a static entity. Adding a reference to fcntl(2).
    Michael Kerrisk  [Walter Harms]
        Clarify that since 2.6.35, 65535 bytes is the default pipe capa=
city

ld.so.8
    Michael Kerrisk
        Clarify that LD_PROFILE can specify just a single shared object
    Michael Kerrisk
        Clarify that LD_PROFILE output is appended to target file
            The LD_PROFILE output is appended to any existing
            contents of the target file.
    Michael Kerrisk
        SEE ALSO: add sprof(1)

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
