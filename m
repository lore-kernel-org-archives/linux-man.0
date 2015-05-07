From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-4.00 released
Date: Thu, 07 May 2015 13:07:56 +0200
Message-ID: <554B478C.4010203@gmail.com>
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

    man-pages-4.00 - man pages for Linux

My 3.xx minor release numbers were getting rather high, and it seems an=
=20
apposite moment to also bump to a 4.xx release.

This is a somewhat larger than usual release, in part because I've been
dredging bugzilla reports and old mails that fell off the table. 3 new=20
man pages have been added and around 90 pages have seen updates, based=20
on input and contributions from somewhat more than 50 people.

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_4.00

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2015/05/man-pages-400-is-released.h=
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
 man-pages-4.00 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2015-05-07, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Advait Dixi <advaitdixit-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Alain Kalker <a.c.kalker-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Andreas Gruenbacher <agruenba-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Andreas Heiduk <asheiduk-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Askar Safin <safinaskar-JGs/UdohzUI@public.gmane.org>
Brice Goglin <Brice.Goglin-MZpvjPyXg2s@public.gmane.org>
Cameron Norman <camerontnorman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Chris Metcalf <cmetcalf-kv+TWInifGbQT0dZR+AlfA@public.gmane.org>
Christophe Lohr <Christophe.Lohr-+sCGM1tQGJejRLBOWInFB+yrfmlZI2zM@public.gmane.org>
Christopher Head <chead-FFSPH+S42+Y@public.gmane.org>
Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
David Wilcox <davidvsthegiant-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Denis Du <denisdu-4VtgCsEi+FIybS5Ee8rs3A@public.gmane.org>
Egmont Koblinger <egmont-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
=46ilipe Brandenburger <filbranden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
=46ilipus Klutiero <chealer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
=46lorian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
=46r=C3=A9d=C3=A9ric Maria <frederic.maria-GANU6spQydw@public.gmane.org>
Gleb Fotengauer-Malinovskiy <glebfm-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Graham Shaw <gdshaw-1YjpMCWsJptAfugRpC6u6w@public.gmane.org>
Gregor Jasny <igjasny-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Guy Harris <guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Ian Pilcher <arequipeno-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Jason Newton <nevion-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
J. Bruce Fields <bfields-uC3wQj2KruNg9hUCZPvPmw@public.gmane.org>
Jiri Pirko <jpirko-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Joachim Wuttke <j.wuttke-97/bSmCnXvjoK6nBLMlh1Q@public.gmane.org>
Joern Heissler <contact-pbvhy9/vjlfAiHgwPnP32rNAH6kLmebB@public.gmane.org>
Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Joonas Salo <salo.joonas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Jussi Lehtola <jussilehtola-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
Kirill A. Shutemov <kirill.shutemov-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
KOSAKI Motohiro <kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Laurence Gonsalves <laurence-IXX7sqgBUuUXtBFVwdE/iw@public.gmane.org>
Magnus REFTEL <magnus.xm.reftel-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Regid Ichira <regid23-9epcXJ+zteU@public.gmane.org>
Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Steinar H. Gunderson <sgunderson-jG/AHqQBv7lBDgjK7y7TUQ@public.gmane.org>
St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
Stephane Fillod <fillods-iA+eEnwkJgzk1uMJSBkQmQ@public.gmane.org>
Tetsuo Handa <from-linux-kernel-1yMVhJb1mP/7nzcFbJAaVXf5DAMn2ifp@public.gmane.org>
Thomas Hood <jdthood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Urs Thuermann <urs-5sm3ckEb1NlYFmeL5InDC7NAH6kLmebB@public.gmane.org>
Vasiliy Kulikov <segooon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Vegard Nossum <vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Weijie Yang <weijie.yang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
William Woodruff <william-d4iiUcZhRQBWk0Htik3J/w@public.gmane.org>
Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

get_phys_pages.3
    William Woodruff
        Document get_phys_pages() and get_avphys_pages()

loop.4
    Urs Thuermann, Michael Kerrisk
        New page documenting the loop device

xattr.7
    Andreas Gruenbacher
        Import attr(5) man page from the 'attr' project
            After discussions with Andreas Gruenbacher, it makes sense =
to
            move this page into man-pages, since it mostly relates to
            kernel details. Since this is an overview page,
            we'll move it to Section 7.
    Michael Kerrisk
         Rename page
            "xattr" is a more meaningful name than "attr" (it resonates
            with the names of the system calls), so as long as we are
            moving the page to a new section, we'll change the name as =
well,
            and retain an acl(5) link so that old references remain val=
id.


Newly documented interfaces in existing pages
---------------------------------------------

mmap.2
    Michael Kerrisk  [Andi Kleen]
        Document MAP_HUGE_2MB, MAP_HUGE_1GB, and MAP_HUGE_SHIFT

shmget.2
    Michael Kerrisk  [Andi Kleen]
        Document SHM_HUGE_2MB, SHM_HUGE_1GB, and SHM_HUGE_SHIFT

resolver.3
    Michael Kerrisk  [Jonathan Nieder]
        Add descriptions of some other resolver functions
            Add res_ninit(), res_nquery(), res_nsearch(),
            and res_nquerydomain(), res_nmkquery(), res_nsend().

tty_ioctl.4
    Fr=C3=A9d=C3=A9ric Maria  [Stephane Fillod, Andreas Heiduk]
        Document TIOCMIWAIT and TIOCGICOUNT
    Michael Kerrisk
        Document TIOCGEXCL
    Michael Kerrisk
        Document TIOGCPKT
    Michael Kerrisk
        Document TIOCSPTLCK
    Michael Kerrisk
        Document TIOCGPTLCK


New and changed links
---------------------

CMSG_DATA.3
    Michael Kerrisk
        New link to cmsg(3)

CMSG_LEN.3
    Michael Kerrisk
        New link to cmsg(3)

dprintf.3
    Michael Kerrisk
        Convert to a link to printf.3

get_avphys_pages.3
    William Woodruff
        New link to new get_phys_pages.3 page

res_ninit.3
res_nmkquery.3
res_nquery.3
res_nquerydomain.3
res_nsearch.3
res_nsend.3
    Michael Kerrisk
        New links to resolver(3) man page

loop-control.4
    Michael Kerrisk
        New link to loop.4

attr.5
    Michael Kerrisk
        New link to xattr(7)


Global changes
--------------

chown.2
execve.2
prctl.2
truncate.2
proc.5
capabilities.7
ld.so.8
    Michael Kerrisk
        Tighter wording: 'mode bit' rather than 'permission bit'
            For sticky, set-UID, and set-GID mode bits (as used in POSI=
X).


Changes to individual pages
---------------------------

add_key.2
keyctl.2
request_key.2
    Michael Kerrisk
        SEE ALSO: add keyrings(7)

add_key.2
request_key.2
    Michael Kerrisk
        SEE ALSO: add keyctl(3)

epoll_ctl.2
    Michael Kerrisk
        After EPOLLHUP, EOF will be seen only after all data has been c=
onsumed

epoll_wait.2
    Michael Kerrisk
        Clarify that signal mask treatment in epoll_pwait() is per-thre=
ad
            s/sigprocmask()/pthread_sigmask()/

fcntl.2
    Michael Kerrisk  [Vegard Nossum]
        Note an F_SETSIG corner case

get_mempolicy.2, set_mempolicy
    Brice Goglin
        Policy is per thread, not per process

getxattr.2
listxattr.2
removexattr.2
setxattr.2
capabilities.7
    Michael Kerrisk
        Adjust "attr(5)" references to "xattr(7)"

ioctl.2
    Michael Kerrisk
        SEE ALSO: add console_ioctl(2) and tty_ioctl(2)

listxattr.2
xattr.7
    Michael Kerrisk
        Describe listxattr(2) E2BIG error and document it as a BUG

mkdir.2
    Michael Kerrisk
        Wording fixes + point reader at stat(2) for explanation of file=
 mode
    Michael Kerrisk  [Andreas Gr=C3=BCnbacher]
        Further tweaks to text on S_ISVTX and 'mode' argument

mknod.2
    Michael Kerrisk
        Rewordings + point reader at stat(2) for details of mode bits

mmap.2
    Michael Kerrisk
        Remove text that implies that munmap() syncs MAP_SHARED mapping=
 to file
            The existing text in this page:

                   MAP_SHARED Share  this  mapping.   Updates to the ma=
pping
                              are visible to other processes that  map =
 this
                              file,  and are carried through to the und=
erly=E2=80=90
                              ing  file.   The  file  may  not  actuall=
y  be
                              updated until msync(2) or munmap() is cal=
led.

            implies that munmap() will sync the mapping to the underlyi=
ng
            file. POSIX doesn't require this, and some light reading of=
 the
            code and some light testing (fsync() after munmap() of a la=
rge
            file) also indicates that Linux doesn't do this.

msync.2
    Michael Kerrisk
        Rework text of DESCRIPTION
            Rewrite the text somewhat, for easier comprehension.
            No (intentional) changes to factual content

nfsservctl.2
    Michael Kerrisk  [J. Bruce Fields]
        Note that nfsservctl() was replaced by files in nfsd filesystem

open.2
    Michael Kerrisk  [Andreas Gruenbacher]
        open() honors the S_ISVTX, S_ISUID, and S_ISGID bits in 'mode'
    Michael Kerrisk
        Tighten wording: use 'mode bit' rather than 'permission bit'
    Michael Kerrisk  [NeilBrown]
        BUGS: O_CREAT | O_DIRECTORY succeeds if pathname does not exist

poll.2
    Michael Kerrisk  [Ian Pilcher]
        Clarify that signal mask treatment in ppoll() is per-thread
            s/sigprocmask()/pthread_sigmask()/
    Michael Kerrisk  [Sam Varshavchik]
        After POLLHUP, EOF will be seen only after all data has been co=
nsumed
    Michael Kerrisk
        Make it clearer which bits are ignored in 'events'

prctl.2
    Michael Kerrisk  [David Wilcox, Filipe Brandenburger]
        Note that "parent" for purposes of PR_SET_DEATHSIG is a *thread=
*
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D43300

sendfile.2
    Michael Kerrisk  [Jason Newton]
        Note that sendfile does not support O_APPEND for 'out_fd'
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D82841
    Michael Kerrisk  [Gregor Jasny]
        RETURN VALUE: note the possibility of "short sends"
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D97491
    Michael Kerrisk  [Askar Safin]
        Clarify text on 'out_fd' and regular files in Linux 2.4
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D86001

shutdown.2
    Michael Kerrisk  [St=C3=A9phane Aulery]
        BUGS: UNIX domain sockets now detect invalid 'how' values
            Bug fixed in Linux 3.7.
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D47111

sigaction.2
    Michael Kerrisk
        Refer the reader to fcntl(2) F_SETSIG for further details on si=
_fd

stat.2
    Jann Horn
        Add note about stat() being racy
    Andreas Gruenbacher
        Improve description of some mode constants
    Michael Kerrisk  [Andreas Gr=C3=BCnbacher]
        Remove excessive leading zeros on some constants
    Michael Kerrisk
        Add text on POSIX terms "file mode bits" and "file permission b=
its"
            Recent changes to various pages employ this distinction.
    Michael Kerrisk
        Tighten wording: use 'mode bit' rather than 'permission bit'
            According to POSIX, the the 9 UGO*RWX bits are permissions,=
 and
            'mode' is used to refer to collectively to those bits plus =
sticky,
            set-UID, and set_GID bits.

syslog.2
    Michael Kerrisk
        SEE ALSO: add dmesg(1)

umask.2
open.2
mknod.2
mkdir.2
    Andreas Gruenbacher
        Explain what default ACLs do
            Explain the effect that default ACLs have (instead of the u=
mask)
            in umask.2.  Mention that default ACLs can have an affect i=
n
            open.2, mknod.2, and mkdir.2.

unshare.2
    Michael Kerrisk  [Florian Weimer]
        Give the reader a hint that unshare() works on processes or thr=
eads
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D59281

atexit.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

bsearch.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

cmsg.3
    Michael Kerrisk  [Christopher Head]
        Fix error in SCM_RIGHTS code sample
            Remove erroneous second initialization of msg.msg_controlle=
n
            in the example code for SCM_RIGHTS.
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D15952

CPU_SET.3
    Chris Metcalf
        Clarify language about "available" cpus
            The CPU_SET.3 man page uses the adjective "available" when
            explaining what the argument to CPU_SET() means.  This is
            confusing, since "available" isn't well-defined.  The kerne=
l
            has a set of adjectives (possible, present, online, and act=
ive)
            that qualify cpus, but normally none of these are what the
            cpu_set_t bit index means: it's just "which cpu", using the
            kernel's internal numbering system, even if that cpu isn't
            possible or present.

            This change removes the word "available" and adds a sentenc=
e
            warning that cpu sets may not be contiguous due to dynamic
            cpu hotplug, etc.

err.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

ftw.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

gethostbyname.3
    Carlos O'Donell
        NSS plugins searched first
    Carlos O'Donell
        "order" is obsolete

gethostid.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are/aren't thread-safe

getmntent.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are/aren't thread-safe

get_nprocs_conf.3
    Michael Kerrisk
        Use exit() rather than return in main()

getopt.3
    Michael Kerrisk  [Guy Harris]
        Remove crufty BUGS section
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D90261

iconv_close.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

inet_ntop.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

longjmp.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

lsearch.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

mcheck.3
    Zeng Linggang
        ATTRIBUTES: Note functions that aren't thread-safe

on_exit.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

printf.3
    Michael Kerrisk  [Egmont Koblinger]
        Merge dprintf() and vdprintf() discussion into this page
    Michael Kerrisk
        SEE ALSO: add puts(3)
    Michael Kerrisk
        Move return value discussion to proper RETURN VALUE section

putpwent.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

qsort.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

regex.3
    Michael Kerrisk  [Laurence Gonsalves]
        Fix error in description of 'cflags'
            'cflags' is a bit mask of *zero* (not one) or more flags.

resolver.3
    St=C3=A9phane Aulery
        Add info about RES_INSECURE1 and RES_INSECURE2 option in debug =
mode

scanf.3
    Joern Heissler
        Improve description of %n specifier

setjmp.3
    Zeng Linggang
        ATTRIBUTES: Note functions that are thread-safe

setlocale.3
    Zeng Linggang
        ATTRIBUTES: Note function that isn't thread-safe

setlogmask.3
    Zeng Linggang
        ATTRIBUTES: Note function that isn't thread-safe

sleep.3
    Zeng Linggang
        ATTRIBUTES: Note function that isn't thread-safe

strsignal.3
    Zeng Linggang
        ATTRIBUTES: Note function that isn't thread-safe

sysconf.3
    Zeng Linggang
        ATTRIBUTES: Note function that is thread-safe

undocumented.3
    William Woodruff
        Remove documented functions

tty_ioctl.4
    Michael Kerrisk  [Denis Du]
        Fix error in code example

proc.5
    Michael Kerrisk  [Cameron Norman, Vasiliy Kulikov]
        Document /proc mount options
            Document the 'hidepid' and 'gid' mount options that were ad=
ded in
            Linux 3.3.  See https://bugzilla.kernel.org/show_bug.cgi?id=
=3D90641
            Based on text by Vasiliy Kulikov in
            Documentation/filesystems/proc.txt.
    Michael Kerrisk  [Kirill A. Shutemov]
        Improve description of /proc/PID/status
    Guillem Jover
        Document /proc/PID/exe behaviour on unlinked pathnames
    Michael Kerrisk  [Weijie Yang]
        Document /proc/PID/status VmPMD

resolv.conf.5
    St=C3=A9phane Aulery  [Thomas Hood]
        Document use-vc option added to glibc 2.14
            Fix Ubuntu bug #1110781:
            https://bugs.launchpad.net/ubuntu/+source/manpages/+bug/111=
0781
    St=C3=A9phane Aulery  [Thomas Hood]
        Document RES_SNGLKUPREOP
            Fix Ubuntu bug #1110781:
            https://bugs.launchpad.net/ubuntu/+source/manpages/+bug/111=
0781

tzfile.5
    Sam Varshavchik
        Add various details on version 2 format

aio.7
    Michael Kerrisk
        Add details and update URL for OLS 2003 paper on AIO

bootparam.7
    Michael Kerrisk  [Alain Kalker]
        Update discussion of 'debug' option
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D97161
    Michael Kerrisk
        Summary of multiple changes: remove cruft from this page.
            Much of the detail on hardware specifics in this page dates
            from the 20th century. (The last major update to this page =
was in
            man-pages-1.14!) It's hugely out of date now (many of these
            devices disappeared from the kernel years ago.) So, I've ta=
ken
            a large scythe to the page to remove anything that looks
            seriously dated. In the process, the page has shrunk to les=
s
            than 50% of its previous size.
    Michael Kerrisk
        Remove "buff=3D" details
            This seems to have gone away in Linux 2.2.
    Michael Kerrisk
        Remove crufty "Mouse drivers" options
    Michael Kerrisk
        Remove crufty "General non-device-specific boot arguments" opti=
ons
    Michael Kerrisk
        Remove crufty "Hard disks" options
    Michael Kerrisk
        Remove crufty "mem=3D" details
    Michael Kerrisk
        Remove crufty details on IBM MCA bus devices
    Michael Kerrisk
        Remove 'swap=3D" details
            This seems to have gone away in Linux 2.2,
    Michael Kerrisk
        Remove crufty floppy disk driver options
            In the specific case of floppy drives: the drivers still
            exist, but it's been a while since most of saw these device=
s
            in the wild. So, just refer the reader to the kernel source
            file for details. (The detail in this man page was after al=
l
            originally drawn from that file.)
        Remove crufty "ISDN drivers" options
    Michael Kerrisk
        Remove crufty "line printer driver" options
    Michael Kerrisk
        Remove crufty "Serial port drivers" options
    Michael Kerrisk
        Remove crufty reference to CONFIG_BUGi386
            That option disappeared in Linux 2.4.
    Michael Kerrisk
        Remove crufty text
            "bootsetups array" dates from Linux 2.0.
    Michael Kerrisk
        Remove crufty "Video hardware" options
    Michael Kerrisk
        Remove crufty SCSI device driver options

fanotify.7
    Michael Kerrisk  [Heinrich Schuchardt]
        Since Linux 3.19, fallocate(2) generates FAN_MODIFY events

inotify.7
    Michael Kerrisk  [Heinrich Schuchardt]
        Since Linux 3.19, fallocate(2) generates IN_MODIFY events

ip.7
    Michael Kerrisk
        Explain how IP_ADD_MEMBERSHIP determines its argument type
    Michael Kerrisk  [Jiri Pirko, Magnus REFTEL]
        Clarify details of the IP_MULTICAST_IF socket option
    Michael Kerrisk  [Advait Dixi]
        Remove dubious text that says that SO_PRIORITY set IP TOS
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D35852
    Michael Kerrisk
        Relocate misplaced text describing ENOPROTOOPT error

packet.7
    Graham Shaw
        Add sll_protocol to list of required fields for outbound packet=
s

pthreads.7
    Michael Kerrisk  [KOSAKI Motohiro]
        Using thread IDs whose lifetime has expired gives undefined beh=
avior
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D53061

raw.7
    Michael Kerrisk  [Tetsuo Handa]
        For incoming datagrams, sin_port is set to zero
    Michael Kerrisk
        Mention sendto(), recvfrom(), and so on when discussing address=
 format
            This gives the reader a little context for the following
            discussion of 'sin_port'.
    Michael Kerrisk
        Remove crufty reference to <netinet/in.h>
    Michael Kerrisk
        Replace reference to RFC 1700 with pointer to IANA protocol num=
ber list

signal.7
    Michael Kerrisk  [Steinar H. Gunderson]
        Clarify that I/O operations on disks are not interrupted by sig=
nals
            See https://bugzilla.kernel.org/show_bug.cgi?id=3D97721

unix.7
    Michael Kerrisk  [Christophe Lohr]
        Remove mention of UNIX_PATH_MAX
            This kernel constant is not exposed to user space.
    Michael Kerrisk
        Note the 108 bytes for sun_path is how things are done on Linux
            And refer the reader to NOTES for discussion of portability=
=2E

xattr.7
    Michael Kerrisk
        Document EA limits for Btrfs
    Michael Kerrisk
        Document VFS-imposed limits on EAs
            VFS imposes a 255-byte limit on EA names, and a 64kB limit =
on
            EA values.
    Michael Kerrisk
        The ext[234] block limitation applies to sum of all EAs
            It is not a per-EA limit.
    Michael Kerrisk
        Clarify permissions required to work with 'user' EAs
    Michael Kerrisk
        ext2 and ext3 no longer need mounting with 'user_xattr' for use=
r EAs
    Michael Kerrisk
        Add various relevant pages to SEE ALSO
    Michael Kerrisk
        Add CONFORMING TO section
    Michael Kerrisk
        Modify headings to man-pages norms
    Michael Kerrisk
        Btrfs also supports extended attributes
    Michael Kerrisk
        File capabilities are implemented using *security* attributes
            Not *system* attributes
    Michael Kerrisk
        Describe limit on EA values for JFS, XFS, and Reiserfs
    Michael Kerrisk
        Explicitly mention some of the xattr system calls in DESCRIPTIO=
N
            Naming the system calls helps to orient the reader

nscd.8
    Michael Kerrisk
        Add mention of 'services' and 'netgroup' databases
            This makes the page consistent with nscd.conf(5).

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
