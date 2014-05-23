From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.67 released
Date: Fri, 23 May 2014 06:07:41 +0200
Message-ID: <537EC98D.7060808@gmail.com>
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

    man-pages-3.67 - man pages for Linux

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.67

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2014/05/man-pages-367-is-released.h=
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
 man-pages-3.67 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2014-05-21, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Aurelien Jarno <aurelien-rXXEIb44qovR7s880joybQ@public.gmane.org>
Bill Allombert <ballombe-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Davidlohr Bueso <davidlohr-VXdhtT5mjnY@public.gmane.org>
Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Ingo Schwarze <schwarze-mcycREo4Un4@public.gmane.org>
Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Juri Lelli <juri.lelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Lucas De Marchi <lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Steven Stewart-Gallus <sstewartgallus00-QKvm5KDIoDa7M0a00MdBSQ@public.gmane.org>
T=C3=B6r=C3=B6k Edwin <edwin-VR+441gm9a+sTnJN9+BGXg@public.gmane.org>
William Morriss <wjmelements-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

sched_setattr.2
    Michael Kerrisk, Peter Zijlstra [Juri Lelli]
        New page describing sched_setattr(2) and sched_getattr(2)

system.3
    Michael Kerrisk
        Rewrote large parts of the page and added a number of details


Newly documented interfaces in existing pages
---------------------------------------------

sched.7
    Peter Zijlstra, Michael Kerrisk  [Juri Lelli]
        Document SCHED_DEADLINE

New and changed links
---------------------

renameat2.2
    Michael Kerrisk
        New link to rename.2

sched_getattr.2
    Michael Kerrisk
        New link to new sched_setattr


Changes to individual pages
---------------------------

bind.2
    Michael Kerrisk
        ERRORS: Add EADDRINUSE for ephemeral port range exhaustion

chown.2
    Michael Kerrisk
        NOTES: Add some subheadings

connect.2
    Michael Kerrisk  [William Morriss]
        ERRORS: Add EADDRNOTAVAIL for ephemeral port range exhaustion
            Verified from testing and the kernel source.
            See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D745=
775
    Michael Kerrisk
        Remove mention of ip_local_port_range under EAGAIN error

create_module.2
delete_module.2
init_module.2
query_module.2
    Michael Kerrisk  [Lucas De Marchi]
        Clarify glibc header file declaration/ABI wrapper details
            create_module(), delete_module(), init_module(), and
            query_module() are not declared in header files, but
            through an accident of history glibc provides an ABI
            for them that it continues to maintain, for
            compatibility reasons.

execve.2
    Michael Kerrisk  [Steven Stewart-Gallus]
        Note SIGKILL case when execve() fails beyond the point of no re=
turn
    Michael Kerrisk
        NOTES: Add a subheading and reorder paragraphs

fanotify_init.2
    Heinrich Schuchardt [Michael Kerrisk]
        Document range of permitted flags for event_f_flags
            With a new patch included in the mm tree, event_f_flags is
            checked for allowable values.

fcntl.2
    Michael Kerrisk
        Add "file locking" subheading under NOTES

fork.2
    Michael Kerrisk
        ERRORS: SCHED_DEADLINE tasks can fail with EAGAIN
            SCHED_DEADLINE tasks can fail with EAGAIN unless the
            reset-on-fork flag is set.

futex.2
    Michael Kerrisk
        Note that there is no glibc wrapper

getpriority.2
    Rasmus Villemoes
        Fix prototypes for getpriority() and setpriority()
            The who argument has type id_t (which happens to be u32 on =
linux).

get_robust_list.2
    Rasmus Villemoes
        Add <sys/types.h> to synopsis of get_robust_list()
            If one were to implement wrappers for [gs]et_robust_list() =
using the
            given prototypes, one would also have to include sys/types.=
h to get
            a definition of size_t.

getrusage.2
    Michael Kerrisk  [Bill Allombert]
        _GNU_SOURCE must be defined to obtain RUSAGE_THREAD definition
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D7465=
69

link.2
open.2
    Andy Lutomirski [Michael Kerrisk]
        Update AT_EMPTY_PATH and O_PATH documentation

listen.2
    Michael Kerrisk
        ERRORS: Add EADDRINUSE for ephemeral port range exhaustion

mbind.2
    Rasmus Villemoes
        Fix prototype for mbind(2)
            The nmask argument is const. The return type in numaif.h is=
 long.
            (Well, at least <numaif.h> says nmask is const. The current=
 kernel
            does not define it as a const argument, but sys_mbind() onl=
y
            passes it to get_nodes(), which does treat it as const.)

msgop.2
    Davidlohr Bueso [Michael Kerrisk]
        Enhance description of "full queue" criteria

poll.2
    Rasmus Villemoes
        Add <signal.h> to synopsis for ppoll()
            One needs to #include <signal.h> to get the definition of t=
he
            type (sigset_t) of the mask argument to ppoll().

readlink.2
    Rasmus Villemoes
        Fix return type of readlinkat()

recv.2
    Michael Kerrisk
        Clarify details of msg_name and msg_namelen fields

recvmmsg.2
    Michael Kerrisk
        Describe timeout bug
            See FIXME https://bugzilla.kernel.org/show_bug.cgi?id=3D753=
71
            and http://thread.gmane.org/gmane.linux.man/5677

remap_file_pages.2
    Andy Lutomirski [Christoph Hellwig, Andy Lutomirski]
        remap_file_pages() has no benefit for real files
            Linux commit 3ee6dafc677a68e461a7ddafc94a580ebab80735 cause=
d
            remap_file_pages to be emulated when used on real file.

sched_get_priority_max.2
    Michael Kerrisk
        'policy' can also be SCHED_DEADLINE

sched_setaffinity.2
    Rasmus Villemoes
        Fix prototype for sched_setaffinity()
            The mask argument is const.

sched_setparam.2
    Michael Kerrisk
        ERRORS: mark errors that apply just for sched_setparam()
    Michael Kerrisk
        ERRORS: Add EINVAL for invalid arguments
    Michael Kerrisk
        SEE ALSO: add sched_setattr(2)

sched_setscheduler.2
    Michael Kerrisk
        ERRORS: mark errors that apply just to sched_setscheduler()
    Michael Kerrisk
        ERRORS: add EINVAL case for pid < 0
    Michael Kerrisk
        ERRORS: separate out EINVAL cases

semget.2
    Michael Kerrisk
        NOTES: Add subheadings and reorder paragraphs

semop.2
    Rasmus Villemoes
        Fix prototypes for semop() and semtimedop()
            The nsops arguments have type size_t, not unsigned, and the
            timeout argument of semtimedop() is const.
    Michael Kerrisk
        NOTES: Add a subheading

send.2
    Michael Kerrisk
        Add details on various 'msghdr' fields
    Michael Kerrisk
        ERRORS: Add EAGAIN for ephemeral port range exhaustion
    Michael Kerrisk
        Add some subheadings under DESCRIPTION

shmget.2
    Michael Kerrisk
        NOTES: Add a subheading

stat.2
    Michael Kerrisk  [Aurelien Jarno]
        Describe feature test macro requirements for file type test mac=
ros
            See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D728=
240
    Michael Kerrisk
        Update FTM requirements for lstat()
    Michael Kerrisk
        Split discussion of 'st_mode' fields into type and permissions
    Michael Kerrisk
        Move text on S_I*() macros to follow text on S_I* macros
            That ordering is more logical

stime.2
    Rasmus Villemoes
        Fix prototype for stime()
            The argument is const, both according to the actual header =
files and
            according to <http://www.sco.com/developers/devspecs/vol1a.=
pdf>.

syscall.2
    Rasmus Villemoes
        Fix prototype for syscall()
            The first argument and the return value of syscall() has ty=
pe long,
            not int.

getopt.3
    Michael Kerrisk
        EXAMPLE: Add subheadings to distinguish the two example program=
s

malloc.3
    Michael Kerrisk
        Reword text referring to mallopt(3)
            Linux libc is no longer "recent"; drop mention of it.

pthread_attr_setinheritsched.3
pthread_attr_setschedparam.3
pthread_attr_setschedpolicy.3
pthread_setaffinity_np.3
pthread_setschedparam.3
pthread_setschedprio.3
pthread_yield.3
pthreads.7
    Michael Kerrisk
        Change references to "sched_setscheduler(2)" to "sched(7)"
            Change consistent with the fact that the scheduling overvie=
w
            page is now sched(7) not sched_setscheduler(2).

pthread_attr_setstackaddr.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions pthread_attr_setstackaddr() and
            pthread_attr_getstackaddr() are thread safe.

pthread_attr_setstacksize.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions pthread_attr_setstacksize() and
            pthread_attr_getstacksize() are thread safe.

pthread_kill.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function pthread_kill() is thread safe.

pthread_kill_other_threads_np.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function pthread_kill_other_threads_np() is thread safe=
=2E

pthread_self.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function pthread_self() is thread safe.

pthread_setcancelstate.3
    Michael Kerrisk
        Add paragraph breaks to "Asynchronous cancelability" subsection

pthread_setcancelstate.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions pthread_setcancelstate() and
            pthread_setcanceltype() are thread safe.
    Michael Kerrisk
        NOTES: Add some subheadings

pthread_setschedparam.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions pthread_setschedparam() and pthread_getschedp=
aram()
            are thread safe.

pthread_setschedprio.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function pthread_setschedprio() is thread safe.

pthread_sigmask.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function pthread_sigmask() is thread safe.

pthread_sigqueue.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function pthread_sigqueue() is thread safe.

pthread_testcancel.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function pthread_testcancel() is thread safe.

pthread_yield.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function pthread_yield() is thread safe.

remquo.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions remquo(), remquof() and remquol() are thread =
safe.

rtime.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function rtime() is thread safe.

sched_getcpu.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function sched_getcpu() is thread safe.

stpcpy.3
    Ingo Schwarze
        Note some history of stpcpy()
            Quoting Ingo:
            I just noticed that the stpcpy(3) manual contains a specula=
tion
            that appears to be untrue on closer investigation:  That fu=
nction
            did not originate in MS DOS, but in Lattice C on AmigaDOS.

            Here is a patch against the git master HEAD to fix that, an=
d add
            some more historical information.  To provide some backgrou=
nd and
            allow you to more easily verify the correctness of the patc=
h, i'm
            appending my mail to <misc-7YlrpqBBQ3VAfugRpC6u6w@public.gmane.org>, where i'm giving s=
ome
            more details about the history and pointing to some primary
            sources.  That mail also contains the (similar, but shorter=
)
            patch i just committed to the OpenBSD manual page.

strcasecmp.3
    Michael Kerrisk  [Aurelien Jarno, T=C3=B6r=C3=B6k Edwin]
        Explain why strcasecmp()+strncasecmp() are also declared in <st=
ring.h>
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D7294=
36

strcpy.3
    Michael Kerrisk
        NOTES: Add a subheading

fd.4
    Michael Kerrisk  [Sam Varshavchik]
        Fix floppy disk device names
            The naming convention shown in the page was ancient.
            Now, the page is consistent with Documentation/devices.txt
            (where it is noted that "The use of the capital letters
            D, H and E for the 3.5" models have been deprecated, since
            the drive type is insignificant for these devices"

proc.5
    Michael Kerrisk
        Document /proc/timer_stats
    Michael Kerrisk
        (Briefly) document /proc/timer_list
    Michael Kerrisk
        Add /proc/sys/kernel/{sched_rt_period_us,sched_rt_runtime_us}
            Reference sched(7) for an explanation of these two files

capabilities.7
    Michael Kerrisk
        Mention sched_setattr(2) under CAP_SYS_NICE

cpuset.7
    Michael Kerrisk
        SEE ALSO: add sched(7)

credentials.7
    Michael Kerrisk
        Mention sched_getattr() as a place where credentials are checke=
d

fanotify.7
    Heinrich Schuchardt  [Jan Kara]
        BUGS: error events can be lost when reading from fanotify FD
    Michael Kerrisk  [Heinrich Schuchardt]
        Fix description of FAN_EVENT_NEXT()
            FAN_EVENT_NEXT() does not update 'meta'; rather, it returns=
 a
            pointer to the next metadata structure. In addition, genera=
lly
            rework the description to be a bit clearer and more detaile=
d.
    Heinrich Schuchardt
        Document FAN_EVENT_METADATA_LEN

ip.7
    Michael Kerrisk
        Note cases where an ephemeral port is used
    Michael Kerrisk
        Remove BUGS text on glibc failing to declare in_pktinfo
    Michael Kerrisk
        Clarify 'ip_local_port_range' and mention the term "ephemeral p=
orts"
    Michael Kerrisk
        Note some more details about assignment of ephemeral ports
    Michael Kerrisk
        BUGS: ephemeral port range exhaustion is diagnosed inconsistent=
ly
            Different system calls use different 'errno' values to diag=
nose
            exhaustion of the ephemeral port range.

sched.7
    Michael Kerrisk
        Document sched_rt_period_us and sched_rt_runtime_us /proc files
            And rework and relocate the text on dealing with runaway
            real-time processes.
    Michael Kerrisk
        Mention sched_setattr(2) in list of APIs that can change polici=
es
    Michael Kerrisk
        sched_setattr(2) can also be used to set 'nice' value
    Michael Kerrisk
        Remove mention of sched_setscheduler() when talking about sched=
_priority
            There are nowadays multiple ways to set sched_priority (and
            in fact there always were, since we also had sched_setparam=
(2)).
    Michael Kerrisk
        SEE ALSO: Add Documentation/scheduler/sched-design-CFS.txt
    Michael Kerrisk
        Don't mention sched_setscheduler(2) in discussions of setting p=
olicies
            In a couple of places, sched_setscheduler(2) is mentioned a=
s the
            way of setting policies. But now there is sched_setattr(2) =
as
            well, rewrite the text in a more generic way.
    Michael Kerrisk
        Rework summary text describing sched_setattr(2) and sched_getat=
tr(2)
            Note that these APIs are a superset of sched_setscheduler(2=
)
            and sched_getscheduler(2).
    Michael Kerrisk
        Remove crufty text relating to sched_setscheduler()
            All of the removed text is in sched_setscheduler(2) and
            should have been trimmed from this page.
    Michael Kerrisk
        SEE ALSO: Mention more files in Documentation/scheduler/ direct=
ory

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
