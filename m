From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.31 released
Date: Sun, 14 Nov 2010 16:39:10 +0100
Message-ID: <AANLkTimEoiZfLL4buagT4+rVR21YbMqoSQgn0m4_9xaY@mail.gmail.com>
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

=C2=A0=C2=A0man-pages-3.31.tar.gz - man pages for Linux

This release is now available for download at:

=C2=A0=C2=A0http://www.kernel.org/pub/linux/docs/man-pages
=C2=A0 or ftp://ftp.kernel.org/pub/linux/docs/man-pages

The online changelog is available at
http://www.kernel.org/doc/man-pages/changelog.html (blogged at
http://linux-man-pages.blogspot.com/2010/11/man-pages-331-is-released.h=
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
releases. =C2=A0If you don't want to receive such messages from me, or =
you
know of some other translator or maintainer who may want to receive
such notifications, send me a message.

Cheers,

Michael

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Changes in=
 man-pages-3.31 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2010-11-12, Munich


Contributors
------------

The following people contributed notes, ideas, or patches that have
been incorporated in changes in this release:

Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
David Prevot <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org>
Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Krzysztof =C5=BBelechowski <giecrilj-n4IAqcmFnHAX1+iMCFCb4w@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>

Apologies if I missed anyone!


Newly documented interfaces in existing pages
---------------------------------------------

getrlimit.2
    Michael Kerrisk
        Added documentation of prlimit()
            prlimit() is new in kernel 2.6.36.

inotify.7
    Michael Kerrisk
        Document IN_EXCL_UNLINK
            This flag was added in Linux 2.6.36.
            See kernel commit 8c1934c8d70b22ca8333b216aec6c7d09fdbd6a6.


New and changed links
---------------------

prlimit.2
    Michael Kerrisk
        New link to getrlimit.2


Changes to individual pages
---------------------------

getrlimit.2
    Michael Kerrisk
        Remove unneeded text in DESCRIPTION

intro.2
    Michael Kerrisk
        Added various pages to SEE ALSO

kexec_load.2
    Michael Kerrisk
        Add kernel version where KEXEC_PRESERVE_CONTEXT first appeared
        Added kernel version number where KEXEC_ON_CRASH first appeared
        Fix copyright
            Make copyright in the name of Intel corporation
        VERSIONS: Fix version number
            kexec_load() was first implemented in 2.6.13, though the en=
try
            in the system call table was reserved starting in 2.6.7.

migrate_pages.2
    Michael Kerrisk
        SEE ALSO: Add reference to Documentation/vm/page_migration

sched_setaffinity.2
    Michael Kerrisk
        Add missing word "real" to "user ID"

syscalls.2
    Michael Kerrisk
        Fix kernel version number for kexec_load
            kexec_load() was first implemented in 2.6.13, though the en=
try
            in the system call table was reserved starting in 2.6.7.
    Michael Kerrisk
        Add prlimit() to list

intro.3
    Michael Kerrisk
        Added various pages to SEE ALSO

printf.3
    Michael Kerrisk
        Formatting fixes in example code

hostname.7
    Michael Kerrisk
        Small improvement to description of domains
            See: https://bugzilla.novell.com/show_bug.cgi?id=3D651900


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
