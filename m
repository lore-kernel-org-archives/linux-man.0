From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.27 released
Date: Wed, 22 Sep 2010 19:13:16 +0200
Message-ID: <AANLkTi=LMGvWdHoaTu7uCim7t3POBNk=AxjDDyxkDHP+@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

  man-pages-3.27.tar.gz - man pages for Linux

This release is now available for download at:

 http://www.kernel.org/pub/linux/docs/man-pages
 or ftp://ftp.kernel.org/pub/linux/docs/man-pages

The online changelog is available at
http://www.kernel.org/doc/man-pages/changelog.html (blogged at
http://linux-man-pages.blogspot.com/2010/09/man-pages-327-is-released.html
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
releases.  If you don't want to receive such messages from me, or you
know of some other translator or maintainer who may want to receive
such notifications, send me a message.

Cheers,

Michael

==================== Changes in man-pages-3.27 ====================

Released: 2010-09-22, Nuernberg


Contributors
------------

The following people contributed notes, ideas, or patches that have
been incorporated in changes in this release:

caishuxian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Denis Silakov <silakov-ufN2psIa012HXe+LvDLADg@public.gmane.org>
der Mouse <mouse-NcIlfYlhY41Ekk/fuQG8RGD2FQJk+8+b@public.gmane.org>
Jan Kratochvil  <jan.kratochvil-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Jim Belton <jim.belton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Jiri Olsa <jolsa-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
KOSAKI Motohiro <kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Matthew Flaschen <matthew.flaschen-/4noJB3qBVQ3uPMLIKxrzw@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Ozgur Gurcan <ozgur.gurcan-vcqoFEiXU/AczSlqHMVBIP3zm4ADWneb@public.gmane.org>
Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Remi Denis-Courmont <remi-AzDNUFsAnHasTnJN9+BGXg@public.gmane.org>
Tanaka Akira <akr-Z4CJNWi2dO8@public.gmane.org>
Tim Stoakes <tim-TvTPyCxgtD3R7s880joybQ@public.gmane.org>
W. Trevor King <wking-lbwBIqCsw6A3uPMLIKxrzw@public.gmane.org>
Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

sigevent.7
    Petr Baudis, Michael Kerrisk
        New page to centralize description of sigevent structure
            Several interfaces use this structure. Best to centralize the
            common details in one place. Content taken from the existing
            timerfd_create.2 and mq_open.3 pages, with additions by
            Petr Baudis and Michael Kerrisk.


Newly documented interfaces in existing pages
---------------------------------------------

ip.7
    Jiri Olsa
        Document IP_NODEFRAG
            This option is new in Linux 2.6.36

unix.7
    Michael Kerrisk
        Document SIOCINQ ioctl() operation


Global changes
--------------

_exit.2
brk.2
chdir.2
chmod.2
chown.2
chroot.2
clock_nanosleep.2
getdtablesize.2
gethostname.2
getpagesize.2
getsid.2
killpg.2
mknod.2
mknodat.2
posix_fadvise.2
pread.2
readlink.2
setpgid.2
setpgid.2
setreuid.2
sigaltstack.2
stat.2
symlink.2
sync.2
truncate.2
vfork.2
wait.2
wait4.2
a64l.3
abs.3
acos.3
acosh.3
asin.3
asinh.3
atan.3
atan2.3
atanh.3
atoi.3
cbrt.3
ceil.3
clock_getcpuclockid.3
copysign.3
cos.3
cosh.3
dirfd.3
div.3
dprintf.3
ecvt.3
erf.3
erfc.3
exp.3
exp2.3
expm1.3
fabs.3
fdim.3
fexecve.3
ffs.3
floor.3
fma.3
fmax.3
fmemopen.3
fmin.3
fmod.3
fpclassify.3
frexp.3
fwide.3
gamma.3
gcvt.3
getcwd.3
getdate.3
getgrent.3
gethostid.3
getpass.3
getpwent.3
getsubopt.3
getw.3
hypot.3
ilogb.3
insque.3
isalpha.3
isgreater.3
iswblank.3
j0.3
j0.3
ldexp.3
lockf.3
log.3
log10.3
log1p.3
log2.3
logb.3
lrint.3
lround.3
mbsnrtowcs.3
mkdtemp.3
mkstemp.3
mktemp.3
modf.3
mq_receive.3
mq_send.3
nan.3
nextafter.3
posix_fallocate.3
posix_memalign.3
pow.3
printf.3
qecvt.3
random.3
realpath.3
remainder.3
remquo.3
rint.3
rint.3
round.3
scalb.3
scalbln.3
scanf.3
siginterrupt.3
signbit.3
sigset.3
sin.3
sinh.3
sqrt.3
stpcpy.3
stpncpy.3
strdup.3
strdup.3
strnlen.3
strsignal.3
strtod.3
strtol.3
strtoul.3
tan.3
tanh.3
tgamma.3
trunc.3
ttyslot.3
ualarm.3
usleep.3
wcpcpy.3
wcpncpy.3
wcscasecmp.3
wcsdup.3
wcsncasecmp.3
wcsnlen.3
wcsnrtombs.3
wprintf.3
    Michael Kerrisk
        Add/fix/update feature test macro requirements in SYNOPSIS
            Various changes to:
            * Update feature test requirements to note changes in
              recent glibc releases
            * Correct errors in feature test macro requirements
            * Add feature test macro requirements to pages where
              the requirements were not previously stated.

accept.2
clone.2
dup.2
fallocate.2
pipe.2
readahead.2
sched_setaffinity.2
unshare.2
CPU_SET.3
endian.3
euidaccess.3
fexecve.3
getpt.3
getpw.3
getumask.3
getutmp.3
gnu_get_libc_version.3
makedev.3
matherr.3
mbsnrtowcs.3
memfrob.3
pthread_attr_setaffinity_np.3
pthread_getattr_np.3
pthread_setaffinity_np.3
pthread_tryjoin_np.3
tcgetsid.3
wcscasecmp.3
wcsncasecmp.3
wcsnlen.3
wcsnrtombs.3
wcswidth.3
rtld-audit.7
    Michael Kerrisk
        SYNOPSIS: Add reference to feature_test_macros(7)
            These pages specify feature test macros in the function
            prototypes. Add a reference to feature_test_macros(7),
            so that readers are pointed to the information that
            feature test macros must be defined before including
            *any* header file.

clock_nanosleep.2
clock_getcpuclockid.3
getnetent_r.3
getprotoent_r.3
getrpcent_r.3
getservent_r.3
sigwait.3
    Michael Kerrisk
        RETURN VALUE: Note that "positive error numbers" are listed in ERRORS

fcntl.2
intro.2
open.2
poll.2
ftw.3
intro.3
matherr.3
system.3
tmpnam.3
unix.7
    Michael Kerrisk
        Note that feature test macros must be defined before *any* includes
            Programmers often make the mistake of including a feature test
            macro only after having already included some header files.
            This patch adds some text at opportune places to remind
            programmers to do things the right way.

index.3
stpcpy.3
strcasecmp.3
strcat.3
strchr.3
strcmp.3
strcoll.3
strcpy.3
strdup.3
strfry.3
strpbrk.3
strsep.3
strspn.3
strstr.3
strtok.3
strxfrm.3
    Michael Kerrisk
        SEE ALSO: Add reference to string(3)
            The idea here is to provide a route to discover other
            string functions.

armscii-8.7
cp1251.7
iso_8859-3.7
iso_8859-5.7
iso_8859-6.7
iso_8859-8.7
iso_8859-10.7
iso_8859-11.7
iso_8859-13.7
iso_8859-14.7
koi8-u.7
    Denis Barbier
        Fix decimal values in encoding tables
            Octal and hexadecimal values are right, but there are some
            off-by one errors in decimal values.  Correct values are
            printed by this command:

              perl -pi -e 'if (s/^([0-7]+)\t([0-9]+)\t([0-9a-fA-F]+)//)
                {printf "%03o\t%d\t%s", hex($3), hex($3), $3;};' man7/*.7


Changes to individual pages
---------------------------

capget.2
    Michael Kerrisk
        SYNOPSIS: Remove unneeded "undef _POSIX_SOURCE"

fcntl.2
    Michael Kerrisk
        Add feature test macro requirements for F_GETOWN and F_SETOWN

fcntl.2
    Michael Kerrisk
        Note feature test macro requirements for F_DUPFD_CLOEXEC

getrlimit.2
    Michael Kerrisk
        Document units for RLIMIT_RTTIME limit
            This limit is in microseconds

            http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=596492

lseek.2
    Michael Kerrisk
        Removed note about return type on ancient systems

mount.2
    Michael Kerrisk
        Definitions of various MS_* constants only appeared in glibc 2.12
            See http://sourceware.org/bugzilla/show_bug.cgi?id=11235

stat.2
    Michael Kerrisk
        Update information on nanosecond timestamp fields
            Update feature test macro requirements for exposing these fields.
            Note that these fields are specified in POSIX.1-2008.

timer_create.2
    Michael Kerrisk
        Factor out generic material that was moved to new sigevent(7) page

aio_fsync.3
    Michael Kerrisk
        Add reference to new sigevent(7) page

atanh.3
    Michael Kerrisk
        glibc 2.10 fixed pole error bug
            http://sourceware.org/bugzilla/show_bug.cgi?id=6759
            was resolved.

cerf.3
    Michael Kerrisk
        Make it clearer that this function is unimplemented

cos.3
    Michael Kerrisk
        errno is now correctly set to EDOM on a domain error
            http://sources.redhat.com/bugzilla/show_bug.cgi?id=6780
            was (silently) resolved.

expm1.3
    Michael Kerrisk
        errno is now correctly set to ERANGE on a range error
            http://sources.redhat.com/bugzilla/show_bug.cgi?id=6788
            was (silently) resolved.

fmod.3
    Michael Kerrisk
        errno is now correctly set to EDOM for the x==inf domain error
            http://sources.redhat.com/bugzilla/show_bug.cgi?id=6784
            was (silently) resolved.

insque.3
    Michael Kerrisk
        Noted prev == NULL bug in glibc 2.4 and earlier
            As noted by Remi Denis-Courmont, glibc nowadays allows
            'prev' to be NULL, as required by POSIX for initializing
            a linear list. But in glibc 2.4 and earlier, 'prev' could
            not be NULL. Add a BUGS section noting this.

            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=551201
    Michael Kerrisk
        Added info on circular lists, and initializing circular lists
    Michael Kerrisk
        Added example program

lgamma.3
    Michael Kerrisk
        glibc 2.10 fixed pole error bug
            http://sourceware.org/bugzilla/show_bug.cgi?id=6777
            was (silently) resolved.

log2.3
    Matthew Flaschen
        log2() function does not conform to C89
            log2(), log2f(), and log2l() do not conform to C89.
            They are defined in C99.  See http://flash-gordon.me.uk/ansi.c.txt
            and http://www.schweikhardt.net/identifiers.html

mq_notify.3
    Michael Kerrisk
        Factor out generic material that was moved to new sigevent(7) page

pow.3
    Michael Kerrisk
        errno is now correctly set to ERANGE on a pole error
            http://sources.redhat.com/bugzilla/show_bug.cgi?id=6776
            was (silently) resolved.

pthread_kill_other_threads_np.3
    Michael Kerrisk
        CONFORMING TO: Note meaning of "_np" suffix

rand.3
    Michael Kerrisk
        Clarify description of range of returned value
    Michael Kerrisk
        Add an example program
    Michael Kerrisk
        Expand description of rand_r()

random.3
    W. Trevor King
        Update initstate() return value description to match glibc

readdir.3
    Michael Kerrisk
        Clarify that "positive error numbers" are listed in ERRORS
            Reported-by fkater-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org

rexec.3
    Michael Kerrisk
        SYNOPSIS: Add header file and feature test macro requirements

sigpause.3
    Michael Kerrisk
        Correct discussion of when BSD vs SysV version is used in glibc

sin.3
    Michael Kerrisk
        errno is now correctly set to EDOM on a domain error
            http://sources.redhat.com/bugzilla/show_bug.cgi?id=6781
            was (silently) resolved.

tan.3
    Michael Kerrisk
        errno is now correctly set to EDOM on a domain error
            http://sources.redhat.com/bugzilla/show_bug.cgi?id=6782
            was (silently) resolved.

wcscasecmp.3
wcsncasecmp.3
wcsnlen.3
    Michael Kerrisk
        Added VERSIONS section

boot.7
    Yuri Kozlov
        Update list of major Linux distributions

feature_test_macros.7
    Michael Kerrisk
        Make text on required placement of macros more prominent
            Move the text that notes the requirement that feature test macros
            must be defined before including any header files to the top of
            the page, and highlight the text further, so that the reader will
            not miss this point.

pthreads.7
signal.7
    Michael Kerrisk
        Add SEE ALSO reference to new sigevent(7) page

tcp.7
    Michael Kerrisk
        Clarify header file details for SIOCINQ and SIOCOUTQ
            Also note synonymous FIONREAD and TIOCOUTQ.

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
