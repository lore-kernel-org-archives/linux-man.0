From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.29 released
Date: Wed, 20 Oct 2010 14:12:41 +0200
Message-ID: <AANLkTi=R4qPddZgABNq-3PQbHF_2s1zAPExWTeo5k3tc@mail.gmail.com>
References: <AANLkTinR=4w5DkQQXr0U5tK55g1Wb_bCfj6BebU3yzoG@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTinR=4w5DkQQXr0U5tK55g1Wb_bCfj6BebU3yzoG-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces the release of
man-pages-3.29.

This release is now available for download at:

=A0http://www.kernel.org/pub/linux/docs/man-pages
=A0or ftp://ftp.kernel.org/pub/linux/docs/man-pages

The online changelog is available at
http://www.kernel.org/doc/man-pages/changelog.html (blogged at
http://linux-man-pages.blogspot.com/2010/10/man-pages-329-is-released.h=
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
 man-pages-3.29 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2010-10-19, Detroit


Contributors
------------

The following people contributed notes, ideas, or patches that have
been incorporated in changes in this release:

Balazs Scheidler <bazsi-eQ2WcARZHh0HWmgEVkV9KA@public.gmane.org>
David Prevot <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org>
Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Ivana Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Lennart Poettering <mzxreary-uLTowLwuiw4b1SvskN2V4Q@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Simon Paillard <simon.paillard-RGJHTEmuthQGuQl/6FzYuenJ6Cvpl5oe@public.gmane.org>
Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Thomas Jarosch <thomas.jarosch-XXsH3GEs1jrby3iVrkZq2A@public.gmane.org>
Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

subpage_prot.2
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0New page documenting the PowerPC-specific subpage_prot(2=
)

aio_init.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0New page documenting aio_init(3)


Newly documented interfaces in existing pages
---------------------------------------------

posix_fadvise.2
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Document the architecture-specific arm_fadvise64_64() sy=
stem call
=A0 =A0 =A0 =A0 =A0 =A0This ARM-specific system call fixes the argument=
 ordering
=A0 =A0 =A0 =A0 =A0 =A0for that architecture. Since Linux 2.6.14.

sync_file_range.2
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Document the architecture-specific sync_file_range2() sy=
stem call
=A0 =A0 =A0 =A0 =A0 =A0As described in commit edd5cd4a9424f22b0fa08bef5=
e299d41befd5622,
=A0 =A0 =A0 =A0 =A0 =A0the sync_file_range() argument order is broken f=
or some
=A0 =A0 =A0 =A0 =A0 =A0architectures (PowerPC, ARM, tile). The remedy w=
as a different
=A0 =A0 =A0 =A0 =A0 =A0system call using the right argument order on th=
ose architectures.

psignal.3
=A0 =A0Guillem Jover
=A0 =A0 =A0 =A0Document psiginfo()
=A0 =A0 =A0 =A0 =A0 =A0psiginfo() was added to glibc in version 2.10.
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Add details, VERSIONS, and BUGS for psiginfo()

ip.7
=A0 =A0Balazs Scheidler
=A0 =A0 =A0 =A0Document IP_RECVORIGDSTADDR
=A0 =A0 =A0 =A0Document IP_TRANSPARENT
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Document IP_FREEBIND
=A0 =A0 =A0 =A0 =A0 =A0Text based on input from Lennart Poettering and =
Balazs Scheidler.
=A0 =A0 =A0 =A0 =A0 =A0See https://bugzilla.kernel.org/show_bug.cgi?id=3D=
20082


New and changed links
---------------------

arm_fadvise64_64.2
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0New link to posix_fadvise.2

arm_sync_file_range.2, sync_file_range2.2
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0New links to sync_file_range.2

arrm_fadvise.2
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0New link to posix_fadvise.2

psiginfo.3
=A0 =A0Guillem Jover
=A0 =A0 =A0 =A0New link to psignal.3


Global changes
--------------

Many pages
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0global fix: s/Unix/UNIX/
=A0 =A0 =A0 =A0 =A0 =A0The man pages were rather inconsistent in the us=
e of "Unix"
=A0 =A0 =A0 =A0 =A0 =A0versus "UNIX". Let's go with the trademark usage=
=2E

Various pages
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Global fix: s/pseudo-terminal/pseudoterminal/

grantpt.3, ptsname.3, unlockpt.3, pts.4
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Global fix: s/pty/pseudoterminal/

recv.2, cmsg.3, unix.7
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0global fix: s/UNIX socket/UNIX domain socket/

fmtmsg.3, gethostbyname.3, termios.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Global fix: s/Unixware/UnixWare/


Changes to individual pages
---------------------------

inotify_rm_watch.2
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0SYNOPSIS: fix type of 'wd' argument

posix_fadvise.2
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Rewrite VERSIONS, noting that the system call is fadvise=
64()

syscalls.2
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Add the PowerPC-specific subpage_prot() system call
=A0 =A0 =A0 =A0Add sync_file_range2()

truncate.2
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Fix feature test macros

aio_cancel.3
aio_error.3
aio_fsync.3
aio_read.3
aio_return.3
aio_suspend.3
aio_write.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0SEE ALSO: Add lio_listio(3)

gai_cancel.3
gai_error.3
gai_suspend.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Make these into links
=A0 =A0 =A0 =A0 =A0 =A0In the previous release, these files were accide=
ntally made copies
=A0 =A0 =A0 =A0 =A0 =A0of getaddrinfo_a.3, instead of being made as lin=
k files.

getifaddrs.3
=A0 =A0Thomas Jarosch
=A0 =A0 =A0 =A0Prevent possible NULL pointer access in example program

malloc.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Emphasize that malloc() and realloc() do not initialize =
allocated memory

malloc_hook.3
=A0 =A0Ivana Varekova
=A0 =A0 =A0 =A0Warn that these functions are deprecated

strcpy.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Formatting fixes in strncpy() example implementation cod=
e

ip.7
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Reword NOTES on Linux-specific options

sigevent.7
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0SEE ALSO: Add aio_read(3), aio_write(3), and lio_listio(=
3)

unix.7
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Document the autobind feature
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Fix description of abstract socket names
=A0 =A0 =A0 =A0 =A0 =A0As reported by Lennart Poettering:
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0The part about "abstract" sockets is mis=
leading as it suggests
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0that the sockaddr returned by getsocknam=
e() would necessarily
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0have the size of sizeof(struct sockaddr)=
, which however is not
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0the case: getsockname() returns exactly =
the sockaddr size that
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0was passed in on bind(). In particular, =
two sockets that are
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bound to the same sockaddr but different=
 sizes are completely
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0independent.
=A0 =A0 =A0 =A0 =A0 =A0See https://bugzilla.kernel.org/show_bug.cgi?id=3D=
19812
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Fix description of "pathname" sockets
=A0 =A0 =A0 =A0 =A0 =A0As reported by Lennart Poettering:
=A0 =A0 =A0 =A0 =A0 =A0 =A0 The part about "pathname" sockets suggests =
usage of
=A0 =A0 =A0 =A0 =A0 =A0 =A0 sizeof(sa_family_t) + strlen(sun_path) + 1
=A0 =A0 =A0 =A0 =A0 =A0 =A0 for calculating the sockaddr size. Due to a=
lignment/padding
=A0 =A0 =A0 =A0 =A0 =A0 =A0 this is probably not a good idea. Instead, =
one should use
=A0 =A0 =A0 =A0 =A0 =A0 =A0 offsetof(struct sockaddr_un, sun_path) + st=
rlen() + 1
=A0 =A0 =A0 =A0 =A0 =A0 =A0 or something like that.
=A0 =A0 =A0 =A0 =A0 =A0See https://bugzilla.kernel.org/show_bug.cgi?id=3D=
19812


--
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
