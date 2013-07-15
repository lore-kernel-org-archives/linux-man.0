From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.52 released
Date: Mon, 15 Jul 2013 11:27:20 +0200
Message-ID: <CAKgNAkha4MjbpAk-7nhcOH6Joysn7YfHmaJeHGANEwO+qX7bWQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

    man-pages-3.52 - man pages for Linux

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.52

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2013/07/man-pages-352-is-released.h=
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
 man-pages-3.52 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2013-07-04, Christchurch


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Andrea Remondini <andrea-zF+CBELTIi/h2jUh8lbIsg@public.gmane.org>
Anthony Foiani <anthony.foiani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Dan Jacobson <jidanni-8D0D3YcSAvhAfugRpC6u6w@public.gmane.org>
David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Eric S. Raymond <esr-4uCgticg2UFBDgjK7y7TUQ@public.gmane.org>
Georg Sauthoff <mail-vzQcyvifq/Y@public.gmane.org>
Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
J=C3=A9r=C3=A9mie Galarneau <jeremie.galarneau-vg+e7yoeK/dWk0Htik3J/w@public.gmane.org>
Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Manuel Traut <manut-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
=D0=9C=D0=B0=D1=80=D0=BA =D0=9A=D0=BE=D1=80=D0=B5=D0=BD=D0=B1=D0=B5=D1=80=
=D0=B3 <socketpair-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Peter LaDow <petela-OhJBICGVGq3cUClb0tpMAg@public.gmane.org>
Petr Gajdos <pgajdos-AlSwsSmVLrQ@public.gmane.org>
Regid <regid23-9epcXJ+zteU@public.gmane.org>
Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Simone Piccardi <piccardi-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org>
Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>

Apologies if I missed anyone!


Newly documented interfaces in existing pages
---------------------------------------------

perf_event_open.2
    Vince Weaver
        Add PERF_IOC_FLAG_GROUP documentation
            The perf_event_open() ENABLE/DISABLE/RESET ioctls can take =
an
            argument, PERF_IOC_FLAG_GROUP.  This wasn't documented at a=
ll
            until about a year ago (despite the support being there fro=
m
            the beginning) so I missed this when initially writing
            the man page.

socket.7
    Pavel Emelyanov, Michael Kerrisk
        Document SO_PEEK_OFF option
            Since Linux 3.4 there appeared an ability to specify the
            offset in bytes from which the data will be MSG_PEEK-ed.
            Describe this socket option in the socket(7) page, where
            all the other socket options are described.


Global changes
--------------

Various pages
    Michael Kerrisk
        Convert inline formatting (\fX...\fP) to dot-directive formatti=
ng

readdir.2
asprintf.
getline.3
getlogin.3
pthread_setname_np.3
readdir.3
strerror.3
    Michael Kerrisk  [Jon Grant]
        Clarify that terminating null byte is '\0'


Changes to individual pages
---------------------------

execve.2
    Peter LaDow
       Add envp to the Linux notes about NULL pointers
            During the review of static analysis results, we discovered=
 a
            functional, but non-portable, use of execve().  For example=
:

                char *cmd[] =3D { "/path/to/some/file", NULL };
                execve(cmd[0], cmd, NULL);

            The call succeeds.  Yet, the static analysis tool (rightly)
            pointed out that envp could be dereferenced.  But digging i=
nto
            glibc and the kernel, it appears that like argv, envp when =
NULL
            is treated as if it were an empty list.

            So, to clear things up, I'm submitting this patch to update=
 the
            man page to indicate that envp is treated like argv.

fallocate.2
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

io_setup.2
    Cyril Hrubis  [Jeff Moyer]
        Clarify the nr_events parameter
            Currently the io_setup.2 man page describes what the kernel=
 really
            does, i.e., that the resulting context may be able to hold =
more
            than the 'nr_event's operations because the memory allocate=
d in
            kernel is rounded to be multiple of page size.

            It is better not to expose this implementation detail and
            simply state that the resulting context is suitable for
            'nr_events' operations.

perf_event_open.2
    Vince Weaver
        Clarify the perf_event_open() wakeup_events/wakeup_watermark fi=
elds
            Clarify the perf_event_open() wakeup_events/wakeup_watermar=
k
            fields a bit, based on info from kernel commit cfeb1d90a1b1=
=2E
    Vince Weaver
        Update to match the Linux 3.10 release
            This patch updates the perf_event_open() documentation to i=
nclude
            new interfaces added in the 3.10 kernel.

            It also documents a few [To be documented] instances left o=
ver
            from the 3.7 kernel.
    Vince Weaver
        Small correction to description of 'flags' argument

prctl.2
    Michael Kerrisk
        Note equivalents of PR_SET_NAME
            pthread_setname_np() and pthread_getname_np() and
            /proc/self/task/TID/comm provide access to the same
            attribute.

pread.2
    Michael Kerrisk  [=D0=9C=D0=B0=D1=80=D0=BA =D0=9A=D0=BE=D1=80=D0=B5=
=D0=BD=D0=B1=D0=B5=D1=80=D0=B3]
        pread() and pwrite() are especially useful in multithreaded app=
lications

recv.2
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

semctl.2
    Michael Kerrisk  [Simone Piccardi]
        'sem_nsems' is 'unsigned long' since Linux 2.4

shmget.2
    Michael Kerrisk
        Rewrite RETURN VALUE and mention that 'errno' is set on error

sigaction.2
    Michael Kerrisk  [Brian Norris]
        RETURN VALUE: mention that 'errno' is set on error

signal.2
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

sigpending.2
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

sigprocmask.2
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

sigsuspend.2
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

syscall.2
    Mike Frysinger
        Document s390/s390x calling convention

a64l.3
    Peng Haitao
        ATTRIBUTES: Note function that is not thread-safe
            The function l64a() is not thread safe.

abs.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions abs(), labs(), llabs() and imaxabs() are
            thread-safe.

aio_error.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function aio_error() is thread safe.

aio_return.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function aio_return() is thread safe.

alloca.3
    Adrian Bunk
        Correct information on getting non-inlined version with gcc+gli=
bc
            - remove the incorrect information that -fno-builtin would =
help
            - add -std=3Dc11 to the list of strict options
            - emphasize more that both the gcc option and not including
              alloca.h are needed
            - add the #ifdef from the glibc alloca.h to make the situat=
ion
              clearer

bindresvport.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            Before glibc 2.17, bindresvport() is not thread-safe.
            Since glibc 2.17, it is thread-safe, the patch can refer to=
 URL:
            http://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Df6d=
a27e53695ad1cc0e2a9490358decbbfdff5e5

canonicalize_file_name.3
    Michael Kerrisk
        Put CONFORMING TO section in right location

catgets.3
    Michael Kerrisk  [Jon Grant]
        Clarify that null byte is '\0'

ceil.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions ceil(), ceilf() and ceill() are thread safe.

cimag.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions cimag(), cimagf() and cimagl() are thread saf=
e.

clock_getcpuclockid.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function clock_getcpuclockid() is thread safe.

conj.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions conj(), conjf() and conjl() are thread safe.

crypt.3
    Peng Haitao
        ATTRIBUTES: Note function that is not thread-safe
            The function crypt() is not thread safe.

ctermid.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread safe with exceptions
            The function ctermid() is thread safe with exceptions.

dirfd.3
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

drand48.3
    Peng Haitao
        ATTRIBUTES: Note functions that are not thread-safe
            The functions drand48(), erand48(), lrand48(), nrand48(),
            mrand48(), jrand48(), srand48(), seed48() and lcong48() are
            not thread safe.

ecvt.3
    Peng Haitao
        ATTRIBUTES: Note functions that are not thread-safe
            The functions ecvt() and fcvt() return a string located in =
a
            static buffer which is overwritten by the next call to the
            functions, so they are not thread-safe.

encrypt.3
    Peng Haitao
        ATTRIBUTES: Note functions that are not thread-safe
            The functions encrypt() and setkey() are not thread safe.

ether_aton.3
    Peng Haitao
        ATTRIBUTES: Note functions that are not thread-safe
            The functions ether_aton() and ether_ntoa() are not thread =
safe.

fcloseall.3
    Peng Haitao
        ATTRIBUTES: Note function that is not thread-safe
            The function fcloseall() is not thread safe.

ferror.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions ferror(), clearerr(), feof() and fileno() are
            thread safe.

fgetgrent.3
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

fgetpwent.3
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

fgetwc.3
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

fmtmsg.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            Before glibc 2.16, fmtmsg() is not thread-safe.
            Since glibc 2.16, it is thread-safe, the patch can refer to=
 URL:
            http://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D772=
4defcf8873116fe4efab256596861eef21a94

fputwc.3
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

getdate.3
    Peng Haitao
        ATTRIBUTES: Note functions that are and aren't thread-safe

getgrent.3
    Peng Haitao
        ATTRIBUTES: Note function that is not thread-safe
            The function getgrent() is not thread safe.

getgrnam.3
    Peng Haitao
        ATTRIBUTES: Note functions that are and aren't thread-safe

getline.3
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

getlogin.3
    Peng Haitao
        ATTRIBUTES: Note function that is not thread-safe
            The function getlogin() is not thread safe.
            The function cuserid() is thread-safe with exceptions.
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

getpass.3
    Peng Haitao
        ATTRIBUTES: Note functions that are not thread-safe

getpwent.3
    Peng Haitao
        ATTRIBUTES: Note function that is not thread-safe
            The function getpwent() is not thread safe.

getpwnam.3
    Peng Haitao
        ATTRIBUTES: Note functions that are and aren't thread-safe

getspnam.3
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

getttyent.3
    Peng Haitao
        ATTRIBUTES: Note functions that are not thread-safe

getusershell.3
    Peng Haitao
        ATTRIBUTES: Note functions that are not thread-safe
            The functions getusershell(), setusershell() and endusershe=
ll()
            are not thread safe.

getutent.3
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

hsearch.3
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

hsearch.3
    Peng Haitao
        ATTRIBUTES: Note functions that are not thread-safe
            The functions hsearch(), hcreate() and hdestroy() are not
            thread-safe.

localeconv.3
    Peng Haitao
        ATTRIBUTES: Note functions that are not thread-safe
            The function localeconv() returns a pointer to a structure =
which
            might be overwritten by subsequent calls to localeconv() or=
 by
            calls to setlocale(), so it is not thread-safe.
    Peng Haitao
        Add RETURN VALUE section

malloc_info.3
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

mblen.3
    Peng Haitao
        ATTRIBUTES: Note function that is not thread-safe
            The function mblen() is not thread safe.

mbrlen.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread safe with exceptions
            The function mbrlen() is thread safe with exceptions.

mbrtowc.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread safe with exceptions
            The function mbrtowc() is thread safe with exceptions.

mktemp.3
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

modf.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions modf(), modff() and modfl() are thread safe.

popen.3
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

pthread_attr_setinheritsched.3
    Michael Kerrisk
        Note the scheduling attributes affected by this function

pthread_attr_setschedparam.3
pthread_attr_setschedpolicy.3
pthread_attr_setscope.3
    Michael Kerrisk  [Manuel Traut, Siddhesh Poyarekar]
        The inherit-scheduler attribute must be set to PTHREAD_EXPLICIT=
_SCHED
            In order for the attributes set by these functions to have
            an effect, the caller must use pthread_attr_setinheritsched=
(3)
            to set the inherit-scheduler attribute of the attributes ob=
ject
            to PTHREAD_EXPLICIT_SCHED.

ptsname.3
    Peng Haitao
        ATTRIBUTES: Note function that is not thread-safe
            The function ptsname() is not thread safe.

putenv.3
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

putpwent.3
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

qecvt.3
    Peng Haitao
        ATTRIBUTES: Note functions that are not thread-safe
            The functions qecvt() and qfcvt() are not thread-safe.

random.3
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error
    Michael Kerrisk
        Add EINVAL error for setstate()
    Michael Kerrisk
        BUGS: inistate() does not return NULL on error
            http://sourceware.org/bugzilla/show_bug.cgi?id=3D15380

random_r.3
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

readdir.3
    Peng Haitao
        ATTRIBUTES: Note functions that are not thread-safe
            The data returned by readdir() may be overwritten by subseq=
uent
            calls to readdir() for the same directory stream, so it is =
not
            thread-safe.

re_comp.3
    Peng Haitao
        ATTRIBUTES: Note functions that are not thread-safe
            The functions re_comp() and re_exec() are not thread safe.

rexec.3
    Peng Haitao
        ATTRIBUTES: Note functions that are not thread-safe
            The functions rexec() and rexec_af() are not thread safe.

round.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions round(), roundf() and roundl() are thread saf=
e.

scalbln.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions scalbn(), scalbnf(), scalbnl(), scalbln(),
            scalblnf() and scalblnl() are thread safe.

scandir.3
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

siginterrupt.3
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

signbit.3
    Peng Haitao
        ATTRIBUTES: Note macro that is thread-safe
            The macro signbit() is thread safe.

sigsetops.3
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

stdio_ext.3
    Peng Haitao
        ATTRIBUTES: Note functions that are not thread-safe
            The functions __fbufsize(), __fpending(), __fpurge() and
            __fsetlocking() are not thread safe.

strdup.3
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

strerror.3
    Peng Haitao
        ATTRIBUTES: Note function that is not thread-safe
            The function strerror() is not thread safe.

strftime.3
    Michael Kerrisk
        Clarify details of return value
    Michael Kerrisk
        BUGS: 'errno' is not set if the result string would exceed 'max=
' bytes

strtok.3
    Peng Haitao
        ATTRIBUTES: Note function that is not thread-safe
            The function strtok() is not thread safe.
    Michael Kerrisk  [Georg Sauthoff]
        Add more detail on the operation of strtok()
            Add a number of missing details on the operation of strtok(=
)

tempnam.3
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

timegm.3
    J=C3=A9r=C3=A9mie Galarneau
        copy the string returned by getenv()
            The example of a portable version of timegm() uses the stri=
ng
            returned by getenv() after calling setenv() on the same
            environment variable. The tz string may be invalid as per
            getenv.3:

                    "The string pointed to by the return value of geten=
v()
                     may be statically allocated, and can be modified b=
y a
                     subsequent call to getenv(), putenv(3), setenv(3),=
 or
                     unsetenv(3)."

tmpnam.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread safe with exceptions
            The function tmpnam() is thread safe with exceptions.

trunc.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions trunc(), truncf() and truncl() are thread saf=
e.

ttyname.3
    Michael Kerrisk
        ATTRIBUTES: Note functions that are and aren't thread-safe

ttyslot.3
    Michael Kerrisk
        ATTRIBUTES: Note functions that are not thread-safe

usleep.3
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

wcsdup.3
    Michael Kerrisk
        RETURN VALUE: mention that 'errno' is set on error

core.5
    Michael Kerrisk
        Implicitly adding the PID to a core filename was dropped in 2.6=
=2E27

proc.5
    Michael Kerrisk
        Document /proc/[pid]/fd/ anon_inode symlinks
    Mike Frysinger
        Document /proc/[pid]/fd/ symlinks a bit more
            Describe the type:[inode] syntax used in this dir

bootparam.7
    Michael Kerrisk  [Dan Jacobson]
        Remove outdated text on LILO and LoadLin
            Strike the discussion of LILO and LoadLin, which
            are long obsolete, and make a brief mention of GRUB.
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D6040=
19
    Regid
        Remove mention of the deprecated rdev(8)
            The deprecated rdev(8) command was removed from util-linux =
in 2010.
            See
https://git.kernel.org/?p=3Dutils/util-linux/util-linux.git;a=3Dcommit;=
h=3Da3e40c14651fccf18e7954f081e601389baefe3fO
    Andrea Remondini
        Document the 'resume' boot parameter

inotify.7
    Michael Kerrisk  [Jon Grant]
        Clarify that null byte is '\0'

iso_8859-2.7
    Eric S. Raymond
        Remove incorrect reference to nonexistent groff glyph \[shc]
            The reference incorrectly attempted to duplicate an
            actual soft hyphen (hex 0xad) just before it in the file.

man-pages.7
    Peng Haitao
        Add description of "ATTRIBUTES"
            "ATTRIBUTES" section can mention thread safety,
            cancellation safety, and async-cancel-safety.

socket.7
    Michael Kerrisk
        Note that 'optval' for socket options is an 'int' in most cases

tcp.7
    Michael Kerrisk
        Note that 'optval' for socket options is an 'int' in most cases

udp.7
    Michael Kerrisk
        Note that 'optval' for socket options is an 'int' in most cases
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
