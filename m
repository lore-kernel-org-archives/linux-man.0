From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.28 is released
Date: Tue, 12 Oct 2010 07:53:03 +0200
Message-ID: <AANLkTik=i3d5D6uk=9N-fMOM=T3PX8m=OpG2tUVRMBJ2@mail.gmail.com>
References: <AANLkTikRWwU4B9ht541wRNyzVPO9ch8GEK0DxuGPuxQV@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTikRWwU4B9ht541wRNyzVPO9ch8GEK0DxuGPuxQV-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

=A0man-pages-3.28.tar.gz - man pages for Linux

This release is now available for download at:

=A0http://www.kernel.org/pub/linux/docs/man-pages
=A0or ftp://ftp.kernel.org/pub/linux/docs/man-pages

The online changelog is available at
http://www.kernel.org/doc/man-pages/changelog.html (blogged at
http://linux-man-pages.blogspot.com/2010/10/man-pages-328-is-released.h=
tml
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
releases. =A0If you don't want to receive such messages from me, or you
know of some other translator or maintainer who may want to receive
such notifications, send me a message.

Cheers,

Michael

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Changes in=
 man-pages-3.28 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2010-10-04, Munich


Contributors
------------

The following people contributed notes, ideas, or patches that have
been incorporated in changes in this release:

Andries E. Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
Landijk <landijk-user-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Lennart Poettering <mzjro-uLTowLwuiw7k1uMJSBkQmQ@public.gmane.org>
Michael Haardt <michael-8s1n8bisGiQ@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

getaddrinfo_a.3
=A0 =A0Petr Baudis
=A0 =A0 =A0 =A0New page documenting getaddrinfo_a()
=A0 =A0 =A0 =A0 =A0 =A0The page also documents gai_suspend(), gai_cance=
l(),
=A0 =A0 =A0 =A0 =A0 =A0and gai_error().

aio.7
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0New page providing an overview of POSIX asynchronous I/O


Newly documented interfaces in existing pages
---------------------------------------------

exec.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Document execpe()
=A0 =A0 =A0 =A0 =A0 =A0This function was added to glibc in version 2.11=
=2E
=A0 =A0 =A0 =A0 =A0 =A0Also various other small rewrites in the page.


New and changed links
---------------------

gai_cancel.3
gai_error.3
gai_suspend.3
=A0 =A0Petr Baudis
=A0 =A0 =A0 =A0New links to new getaddrinfo_a.3 page

error_one_per_line.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0 Fix misnamed link file (was error_on_per_line.3)

execvpe.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0New link to exec.3

sigstack.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0New link to sigaltstack.2
=A0 =A0 =A0 =A0 =A0 =A0No new programs should use sigstack(3). Point th=
e user to the
=A0 =A0 =A0 =A0 =A0 =A0better sigalstack(2), whose man page briefly men=
tions sigstack(3).

vlimit.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0New link to getrlimit.2
=A0 =A0 =A0 =A0 =A0 =A0No new programs should use vlimit(3). Point the =
user to the
=A0 =A0 =A0 =A0 =A0 =A0better setrlimit(2), whose man page briefly ment=
ions vlimit(3).

vtimes.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0New link to getrusage.2
=A0 =A0 =A0 =A0 =A0 =A0No new programs should use vtimes(3). Point the =
user to the
=A0 =A0 =A0 =A0 =A0 =A0better getrusage(2), whose man page briefly ment=
ions vtimes(3).


Global changes
--------------

Various pages
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Switch to American usage: "-wards" =3D=3D> "-ward"
=A0 =A0 =A0 =A0 =A0 =A0American English uses "afterward" in preference =
to "afterwards",
=A0 =A0 =A0 =A0 =A0 =A0and so on

chdir.2
chmod.2
chown.2
gethostname.2
getsid.2
pread.2
setpgid.2
sigaltstack.2
stat.2
truncate.2
wait.2
dirfd.3
getsubopt.3
mkdtemp.3
mkstemp.3
siginterrupt.3
strdup.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Simplify feature test macro requirements


Changes to individual pages
---------------------------

getrlimit.2
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Add mention of the ancient vlimit() function

getrusage.2
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Add mention of the ancient vtimes() function

io_cancel.2
io_destroy.2
io_getevents.2
io_setup.2
io_submit.2
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0SEE ALSO: add aio(7)

sched_setscheduler.2
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0ERRORS: note that NULL 'param' yields EINVAL

stat.2
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Note feature test macro requirements for blkcnt_t and bl=
ksize_t

timer_create.2
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Standardize on name 'sevp' for sigevent argument

truncate.2
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Correct and simplify ftruncate() feature test macro requ=
irements
=A0 =A0 =A0 =A0 =A0 =A0The glibc 2.12 feature test macro requirements f=
or ftruncate() are
=A0 =A0 =A0 =A0 =A0 =A0buggy; see http://sourceware.org/bugzilla/show_b=
ug.cgi?id=3D12037.
=A0 =A0 =A0 =A0 =A0 =A0Corrected the requirements in the SYNOPSIS, and =
added a BUGS
=A0 =A0 =A0 =A0 =A0 =A0section describing the problem in glibc 2.12.

aio_cancel.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Add pointer to aio(7) for example program
=A0 =A0 =A0 =A0Refer the reader to aio(7) for a description of the aioc=
b structure
=A0 =A0 =A0 =A0CONFORMING TO: Add POSIX.1-2008; add VERSIONS section

aio_error.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Wording improvements in RETURN VALUE
=A0 =A0 =A0 =A0Add pointer to aio(7) for example program
=A0 =A0 =A0 =A0Refer the reader to aio(7) for a description of the aioc=
b structure
=A0 =A0 =A0 =A0CONFORMING TO: Add POSIX.1-2008; add VERSIONS section

aio_fsync.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Refer the reader to aio(7) for a description of the aioc=
b structure
=A0 =A0 =A0 =A0CONFORMING TO: Add POSIX.1-2008; add VERSIONS section

aio_read.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Various minor rewordings and additions
=A0 =A0 =A0 =A0Add pointer to sigevent(7) for details of notification o=
f I/O completion
=A0 =A0 =A0 =A0Add pointer to aio(7) for example program
=A0 =A0 =A0 =A0Refer the reader to aio(7) for a description of the aioc=
b structure
=A0 =A0 =A0 =A0CONFORMING TO: Add POSIX.1-2008; add VERSIONS section

aio_return.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Improve description in RETURN VALUE
=A0 =A0 =A0 =A0Add pointer to aio(7) for example program
=A0 =A0 =A0 =A0Refer the reader to aio(7) for a description of the aioc=
b structure
=A0 =A0 =A0 =A0CONFORMING TO: Add POSIX.1-2008; add VERSIONS section

aio_suspend.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Various additions and rewordings.
=A0 =A0 =A0 =A0 =A0 =A0Give some arguments more meaningful names.
=A0 =A0 =A0 =A0 =A0 =A0More explicitly describe the 'nitems' argument.
=A0 =A0 =A0 =A0 =A0 =A0Explicitly note that return is immediate if an I=
/O operation
=A0 =A0 =A0 =A0 =A0 =A0has already completed.
=A0 =A0 =A0 =A0 =A0 =A0Note that aio_error(3) should be used to scan th=
e aiocb list
=A0 =A0 =A0 =A0 =A0 =A0after a successful return.
=A0 =A0 =A0 =A0 =A0 =A0Add references to other relevant pages.
=A0 =A0 =A0 =A0 =A0 =A0Various other pieces rewritten.
=A0 =A0 =A0 =A0Refer the reader to aio(7) for a description of the aioc=
b structure
=A0 =A0 =A0 =A0CONFORMING TO: Add POSIX.1-2008; add VERSIONS section

aio_write.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Add pointer to sigevent(7) for details of notification o=
f I/O completion
=A0 =A0 =A0 =A0Various minor rewordings and additions
=A0 =A0 =A0 =A0Refer the reader to aio(7) for a description of the aioc=
b structure
=A0 =A0 =A0 =A0CONFORMING TO: Add POSIX.1-2008; add VERSIONS section

clearenv.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Fix error in feature test macro requirements

dysize.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Remove crufty statement about old SCO bug

exec.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Add feature test macro requirements for execvpe()
=A0 =A0 =A0 =A0Rewrite description of PATH and mention _CS_PATH
=A0 =A0 =A0 =A0Note execvp() and execlp() behavior for filename contain=
ing a slash

getaddrinfo.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Add SEE ALSO reference to new getaddrinfo_a.3 page

gethostbyname.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Fix formatting of feature test macros

getw.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Fix feature test macros

malloc.3
=A0 =A0Landijk
=A0 =A0 =A0 =A0Remove editorializing comments on memory overcommitting
=A0 =A0 =A0 =A0 =A0 =A0See https://bugzilla.kernel.org/show_bug.cgi?id=3D=
19332
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Various minor reorganizations and wording fix-ups

mq_notify.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Standardize on name 'sevp' for sigevent argument

nl_langinfo.3
=A0 =A0Michael Haardt
=A0 =A0 =A0 =A0Make it clear that nl_langinfo() interacts with setlocal=
e()
=A0 =A0 =A0 =A0Add an example program

posix_openpt.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Fix feature test macro requirements

rand.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Remove duplicate #include in example program

strtok.3
=A0 =A0Petr Baudis
=A0 =A0 =A0 =A0Add reference to strtok() example in getaddrinfo(3)

inotify.7
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Added section noting limitations and caveats of inotify

sigevent.7
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Add SEE ALSO reference to new getaddrinfo_a.3 page
=A0 =A0 =A0 =A0Add SEE ALSO referring to new aio(7) page

suffixes.7
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Change explanation of ".rpm" to "RPM software package"


--
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
