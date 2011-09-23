From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.34 released
Date: Fri, 23 Sep 2011 10:14:51 +0200
Message-ID: <CAKgNAkh=Gh-CBYrG=CidZSQSvSj67RB6dS_cgWX726RQf+Aybg@mail.gmail.com>
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

    man-pages-3.34.tar.gz - man pages for Linux

Because of the kernel.org problems, the release artifacts are in
different locations than usual (and some of these changes may become
permanent):

This release tarball is available for download at:

    http://man7.org/linux/man-pages/download/

The online changelog is available at
http://man7.org/linux/man-pages/changelog.html#release_3.34 (blogged at
http://linux-man-pages.blogspot.com/2011/09/man-pages-334-is-released.h=
tml
) and the current version of the pages is browsable at
http://man7.org/linux/man-pages/

A git repository for man-pages can be found on github. You can clone
the repository with the command:

   git clone https://github.com/mkerrisk/man-pages.git

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Changes in=
 man-pages-3.34 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2011-09-23, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes and ideas that have been
incorporated in changes in this release:

Alan Curry <pacman-ptgZXYu0fikgsBAKwltoeQ@public.gmane.org>
Benjamin Poirier <benjamin.poirier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Brian M. Carlson <sandals-spVehEqlxw627WubY2PhZeTW4wlIGRCZ@public.gmane.org>
David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Doug Goldstein <cardoe-VPKZcK2rSRzQT0dZR+AlfA@public.gmane.org>
Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Paul Pluzhnikov <ppluzhnikov-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Stephen Cameron <scameron-3C9H9nn4BS4HL6m8NFMY+dBPR1lH4CV8@public.gmane.org>
Sunil Mushran <sunil.mushran-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

rt_sigqueueinfo.2
    Michael Kerrisk  [Stephan Mueller]
        New page for rt_sigqueueinfo(2) and rt_tgsigqueueinfo(2)
            This replaces the previous '.so' man page link file for
            rt_sigqueueinfo.2, which linked to this sigqueue() man page=
=2E

cciss.4
    Stephen M. Cameron
        New man page for cciss driver
            I obtained the information in this man page as a consequenc=
e
            of having worked on the cciss driver for the past several y=
ears,
            and having written considerable portions of it.
    Michael Kerrisk
        Copyedit by mtk

hpsa.4
    Stephen M. Cameron
        New man page for the hpsa driver
            I obtained the information in this man page as a consequenc=
e
            of being the main author of the hpsa driver.
    Michael Kerrisk
        Copyedits my mtk


Newly documented interfaces in existing pages
---------------------------------------------

fstatat.2
    Michael Kerrisk  [David Howells]
        Document AT_NO_AUTOMOUNT
	    This flag was added in Linux 2.6.38.

lseek.2
    Michael Kerrisk  [Eric Blake, Sunil Mushran]
        Document SEEK_HOLE and SEEK_DATA
            These flags, designed for discovering holes in a file,
            were added in Linux 3.1. Included comments from Eric
            Blake and Sunil Mushran.

madvise.2
    Doug Goldstein
        Add MADV_HUGEPAGE and MADV_NOHUGEPAGE
            Document the MADV_HUGEPAGE and MADV_NOHUGEPAGE flags added =
to
            madvise() in Linux 2.6.38.


New and changed links
---------------------

rt_tgsigqueueinfo.2
    Michael Kerrisk
        New link to new rt_sigqueueinfo.2 page

sigqueue.2
    Michael Kerrisk
        Create link to page that was relocated to section 3


Global changes
--------------

Various pages
    Michael Kerrisk
        Change reference to "sigqueue(2)" to "sigqueue(3)"


Changes to individual pages
---------------------------

fallocate.2
    Michael Kerrisk
        ERRORS: Add EPERM and ESPIPE errors

lseek.2
    Michael Kerrisk  [Alan Curry, Reuben Thomas]
        Remove suspect note about 'whence' being incorrect English

prctl.2
    Paul Pluzhnikov
        PR_SET_DUMPABLE makes process non-ptrace-attachable

readlink.2
    Guillem Jover
        Document using st_size to allocate the buffer
    Michael Kerrisk
        Added copyright text + changelog note for Guillem Jover's patch

sched_setscheduler.2
    Michael Kerrisk
        Document 2.6.39 changes to rules governing changes from
SCHED_IDLE policy
            Since Linux 2.6.39, unprivileged processes under the
            SCHED_IDLE policy can switch to another nonrealtime
            policy if their nice value falls within the range
            permitted by their RLIMIT_NICE limit.

tkill.2
    Michael Kerrisk
        SEE ALSO: Add rt_sigqueueinfo (2)

btowc.3, wctob.3
    Michael Kerrisk  [Brian M. Carlson]
        Add pointers to better, thread-safe alternative functions
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D6068=
99

fwide.3
    Michael Kerrisk
        Add _ISOC95_SOURCE to feature test macro requirements
            Since glibc 2.12, _ISOC95_SOURCE can also be used to expose
            prototype of this function.

index.3
    Michael Kerrisk  [Jon Grant]
        Fix text mentioning terminating null

pthread_sigqueue.3
    Michael Kerrisk
        Replace explicit mention of rt_tgsigqueueinfo() with SEE ALSO r=
eference

sigqueue.3
    Michael Kerrisk
        Move this page to section 3
            Now that the underlying system call rt_sigqueueinfo(2) is
            properly documented, move sigqueue() to Section 3, since
            it is really a library function.
    Michael Kerrisk
        Update text in line with existence of new rt_sigqueueinfo.2 pag=
e

wcsnlen.3
    Jon Grant
        Improve description of 'maxlen' argument
            It's worth clarifying 'maxlen' is in wide-char units, not b=
ytes.

wprintf.3
    Michael Kerrisk
        Add _ISOC95_SOURCE to feature test macro requirements
            Since glibc 2.12, _ISOC95_SOURCE can also be used to expose
            prototype of these functions.

feature_test_macros.7
    Michael Kerrisk
        Document _ISOC95_SOURCE
            _ISOC95_SOURCE was added in glibc 2.12 as a means
            to expose C90 Amendment 1 definitions.

ip.7
    Benjamin Poirier  [Neil Horman]
        Improve description of IP_MTU_DISCOVER

signal.7
    Michael Kerrisk
        SEE ALSO: Add rt_sigqueueinfo(2)


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
