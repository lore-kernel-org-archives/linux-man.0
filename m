From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.75 released
Date: Thu, 16 Oct 2014 11:17:12 +0200
Message-ID: <543F8D18.1010001@gmail.com>
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

    man-pages-3.75 - man pages for Linux

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.75

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2014/10/man-pages-375-is-released.h=
tml

The current version of the pages is browsable at:
http://man7.org/linux/man-pages/

A few changes in this release that may be of interest to readers of
this list are given below.

Cheers,

Michael


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Changes in=
 man-pages-3.75 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2014-10-15, D=C3=BCsseldorf


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Robert Schweikert <rjschwei-IBi9RG/b67k@public.gmane.org>
Tetsuo Handa <penguin-kernel-1yMVhJb1mP/7nzcFbJAaVXf5DAMn2ifp@public.gmane.org>
Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

pthread_rwlockattr_setkind_np.3
    Robert Schweikert  [Michael Kerrisk]
        New page documenting pthread_rwlockattr_[sg]etkind_np(3)
            Documents pthread_rwlockattr_setkind_np(3) and
            pthread_rwlockattr_getkind_np(3).


New and changed links
---------------------

pthread_rwlockattr_getkind_np.3
    Robert Schweikert
        New link to pthread_rwlockattr_setkind_np(3)


Changes to individual pages
---------------------------

readlink.2
    Michael Kerrisk  [Jonny Grant]
        Add free() call to example program

readv.2
    Michael Kerrisk
        The raw preadv() and pwritev() syscalls split 'offset' into 2 a=
rguments

signal.7
    Michael Kerrisk
        pthread_mutex_lock() and pthread_cond_wait() are restartable
            pthread_mutex_lock(, pthread_cond_wait(), and related APIs =
are
            automatically restarted if interrupted by a signal handler.

unix.7
    Michael Kerrisk  [Carlos O'Donell, David Miller, Tetsuo Handa]
        Various additions and rewordings
            Notable changes:
            * Clarify some details for pathname sockets.
            * Add some advice on portably coding with pathname sockets.
            * Note the "buggy" behavior for pathname sockets when
              the supplied pathname is 108 bytes (after a report by
              Tetsuo Handa).


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
