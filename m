From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: man-pages-3.18 released
Date: Tue, 10 Feb 2009 14:33:25 +1300
Message-ID: <4990D965.2030804@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday,

I've happy to announce

  man-pages-3.18.tar.gz - man pages for Linux

my one hundredth release since I took over maintainership in 2004.

This release is now available for download at:

  http://www.kernel.org/pub/linux/docs/man-pages
  or ftp://ftp.kernel.org/pub/linux/docs/man-pages

The online changelog is available at
http://www.kernel.org/doc/man-pages/changelog.html
(blogged at
http://linux-man-pages.blogspot.com/2009/02/man-pages-318-is-released.html)
and the current version of the pages is browsable at
http://www.kernel.org/doc/man-pages/

You are receiving this message either because:

a) You contributed to the content of this release.

b) You are subscribed to linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (*).

c) I have information (possibly inaccurate) that you are the maintainer of
a translation of the manual pages, or are the maintainer of the manual
pages set in a particular distribution, or have expressed interest in
helping with man-pages maintenance, or have otherwise expressed interest in
being notified about man-pages releases.  If you don't want to receive such
messages from me, or you know of some other translator or maintainer who
may want to receive such notifications, send me a message.

Cheers,

Michael

(*) linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org is the man pages discussion list.  Subscribe
by sending a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, with the body:

  subscribe linux-man

==================== Changes in man-pages-3.18 ====================

Released: 2009-02-10, Christchurch


Contributors
------------

The following people contributed notes, ideas, or patches that have
been incorporated in changes in this release:

Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Bastien ROUCARIES <roucaries.bastien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Christian Siebert <christian.siebert-d5r08XYpnrkaBlGTGt4zH4SGEyLTKazZ@public.gmane.org>
Christopher Head <chead-EynCeXvFgoheoWH0uzbU5w@public.gmane.org>
Florentin Duneau <fduneau-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Guillem Jover <guillem-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Lefteris Dimitroulakis <edimitro-6VGm6rrshF0@public.gmane.org>
Lucio Maciel <luciofm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Satyam Sharma <ssatyam-GzeMgTWoQaeuj8VC67ciSw@public.gmane.org>
Sebastian Kienzl <seb-O0gdCS+Gcp8@public.gmane.org>
Timo Sirainen <tss-X3B1VOXEql0@public.gmane.org>
Vegard Nossum <vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

armscii-8.7
    Lefteris Dimitroulakis
        New page documenting ArmSCII-8 character set

iso_8859-11.7
    Lefteris Dimitroulakis
        New page documenting ISO 8859-11 character set

iso_8859-4.7
    Lefteris Dimitroulakis
        New page documenting ISO 8859-4 character set

iso_8859-6.7
    Lefteris Dimitroulakis
        New page describing ISO 8859-6 character set

pthread_kill.3
    Michael Kerrisk
        New page documenting pthread_kill(3)

pthread_kill_other_threads_np.3
    Michael Kerrisk
        New page documenting pthread_kill_other_threads_np(3)

pthread_sigmask.3
    Michael Kerrisk
        New page documenting pthread_sigmask(3)


Newly documented interfaces in existing pages
---------------------------------------------

clock_getres.3
    Michael Kerrisk
        Document CLOCK_MONOTONIC_RAW, new in 2.6.28


New and changed links
---------------------

clock_gettime.2
clock_settime.2
clock_getres.3
clock_gettime.3
clock_settime.3
    Michael Kerrisk
        Update links to reflect the fact that clock_* pages are now in
        Section 2

iso-8859-11.7
iso_8859_11.7
    Michael Kerrisk
        New links to new iso_8859-11.7

iso-8859-4.7
iso_8859_4.7
latin4.7
    Michael Kerrisk
        New links to new iso_8859-4.7

iso-8859-6.7
iso_8859_6.7
    Michael Kerrisk
        New links to new iso_8859-6.7

tis-620.7
    Michael Kerrisk
        New link to new iso_8859-11.7


Global changes
--------------

clock_nanosleep.2
getrusage.2
timerfd_create.2
clock.3
clock_getcpuclockid.3
ftime.3
pthread_create.3
pthread_getcpuclockid.3
pthread_tryjoin_np.3
sem_wait.3
time.7
    Michael Kerrisk
        Global fix: Fix xrefs to clock_*.? pages to reflect move to section 2

clock_nanosleep.2
execve.2
fork.2
nanosleep.2
sigaction.2
timerfd_create.2
pthread_getcpuclockid.3
ualarm.3
usleep.3
pthreads.7
time.7
    Michael Kerrisk
        Global fix: s/(3)/(2)/ in section number xrefs for timer_*() API
            The POSIX timers API is implemented (mostly) within the kernel,
            so thse interfaces are system calls.  Although there are as yet
            no man pages, when they are added they should be in Section 2,
            not 3.  Therefore fix those pages that currently refer to these
            interfaces as being in Section 3.


Changes to individual pages
---------------------------

capget.2
    Andi Kleen
        Add some details and relocate a paragraph
            While writing a little program using capset
            I found the capset manpage quite light on crucial
            details and I had to resort to RTFS.

            This patch improves the points I found unclear
            and also moves one misplaced paragraph around.

clock_getres.2
    Michael Kerrisk
        Move page from Section 3 to Section 2

eventfd.2
    Michael Kerrisk
        glibc eventfd() supports the use of eventfd2() since version 2.9

fork.2
    Michael Kerrisk
        SEE ALSO: add daemon(3)

getdents.2
    Michael Kerrisk
        Remove unneeded HAVE_D_TYPE from example program
            Since d_type will always just return DT_UNKNOWN before
            kernel 2.6.4, we don't need to use a conditional for
            determining whether we use this flag.

nanosleep.2
    Michael Kerrisk
        Relocated misplaced BUGS heading

select_tut.2
    Michael Kerrisk
        Clean up error checking in example program (no semantic changes)
    Michael Kerrisk
        Many parts tidied and rewritten
            Remove some redundant text, clarify various pieces,
            tidy example code, etc.
    Michael Kerrisk
        Bug fixes + rewrites in example program
            Sebastien pointed out that the first example program
            wrongly thinks it can count signals.
            Also, some further rewrites by mtk.

socket.2
    Michael Kerrisk
        BUGS: Remove discussion SOCK_UUCP
            As time goes on, this sentence becomes less a piece of humor,
            and more a puzzle.

stat.2
    Michael Kerrisk
        Note that open(O_NOATIME) also causes st_atime not to be updated

timerfd_create.2
    Michael Kerrisk
        Add BUGS noting that timerfd supports fewer clock types than
        timer_create()

btowc.3
    Michael Kerrisk
        SEE ALSO: add wctob(3)

clock_getcpuclockid.3
    Michael Kerrisk
        SEE ALSO: add pthread_getcpuclockid(3)

cos.3
    Michael Kerrisk
        SEE ALSO: add sincos(3)

fexecve.3
    Timo Sirainen
        Note that fexecve() depends on a mounted /proc
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=514043
    Michael Kerrisk
        CONFORMING TO: note addition of fexecve() in POSIX.1-2008
    Michael Kerrisk
        'fd' must be opened read-only and refer to a file that is executable

fmemopen.3
    Michael Kerrisk
        CONFORMING TO: note that these functions are in POSIX.1-2008

getifaddrs.3
    Lucio Maciel
        Fix memory leak in example program
    Petr Baudis
        Various small fixes

getpwnam.3
    Michael Kerrisk
        SEE ALSO: add getspnam(3)

getumask.3
    Michael Kerrisk
        Updated glibc version number in NOTES

ilogb.3
    Michael Kerrisk
        SEE ALSO: add significand(3)

intro.3
    Michael Kerrisk
        SEE ALSO: add libc(7)

isalpha.3
    Michael Kerrisk
        Fix statement that isalpa() is obsolete; should be isascii()
            http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=512709
    Michael Kerrisk
        SEE ALSO: add toascii(3)

mq_notify.3
    Michael Kerrisk
        Add cross reference to pthread_attr_init(3)

pthread_attr_setaffinity_np.3
    Michael Kerrisk
        SYNOPSIS: Fix declaration of 'attr'

pthread_getcpuclockid.3
    Michael Kerrisk
        SYNOPSIS: fix type of 'thread'

qsort.3
    Michael Kerrisk
        EXAMPLE: remove unnecessary "#include <stdlib.h>"

random.3
    Michael Kerrisk
        SEE ALSO: add random_r(3)

remainder.3
    Michael Kerrisk
        SEE ALSO: add div(3)

scandir.3
    Michael Kerrisk
        CONFORMING TO: alphasort() and scandir() are added to POSIX.1-2008
    Michael Kerrisk
        CONFORMING TO: note that versionsort() was added to glibc in
        version 2.1

sem_wait.3
    Michael Kerrisk
        SEE ALSO: add clock_getime(2)

significand.3
    Michael Kerrisk
        Add CONFORMING TO noting that this function is unstandardized

sigwait.3
    Michael Kerrisk
        Add EXAMPLES section referring to pthread_sigmask(3)

sin.3
    Michael Kerrisk
        SEE ALSO: add sincos(3)

stpcpy.3
    Michael Kerrisk
        Add BUGS section noting the possibility of buffer overruns
    Michael Kerrisk
        Add missing pieces/fix various problems in example program
    Michael Kerrisk
        CONFORMING TO: stpcpy() is nowadays on the BSDs
    Michael Kerrisk
        SEE ALSO: add stpcpy.3

wcscasecmp.3
    Michael Kerrisk
        CONFORMING TO: note that this function is added in POSIX.1-2008

wcsdup.3
    Michael Kerrisk
        CONFORMING TO: note that this function was added in POSIX.1-2008

wcsncasecmp.3
    Michael Kerrisk
        CONFORMING TO: note that this function is added in POSIX.1-2008

wctob.3
    Michael Kerrisk
        SEE ALSO: add btowc(3)

proc.5
    Michael Kerrisk
        Remove mention of epoll/max_user_instances
            (Since this interface appeared in 2.6.28, and then
            disappeared in 2.6.29.)

ascii.7
    Michael Kerrisk
        Update SEE ALSO list to include pages added in 3.17
    Michael Kerrisk
        SEE ALSO: add recently added iso_8859-*(7) pages

epoll.7
    Michael Kerrisk
        remove documentation of /proc/sys/fs/epoll/max_user_instances
            This /proc interface appeared in 2.6.28. but will be
            removed in 2.6.29.

            Also, document change in default value of
            /proc/sys/fs/epoll/max_user_watches (was 1/32 of lowmem,
            now 1/25 of lowmem).

koi8-r.7
    Michael Kerrisk
        SEE ALSO: add koi8-u(7); remove crufty text

standards.7
    Michael Kerrisk
        Update to note that latest POSIX/SUS was ratified in 2008

time.7
    Michael Kerrisk
        SEE ALSO: add pthread_getcpuclockid(3)

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
