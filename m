From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.59 and man-pages-3.60 are released
Date: Tue, 18 Feb 2014 15:40:47 +0100
Message-ID: <530370EF.4070206@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer slightly less proudly than usual announc=
es:

    man-pages-3.59 - man pages for Linux
    man-pages-3.60 - man pages for Linux

Release 3.59 was exclusively about re-encoding various pages, and the
changelog, to UTF-8. Unfortunately, some encoding errors were *introduc=
ed*
in two pages, and I decided to just do a quick small 3.60 release
that fixes those errors.

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.59
    http://man7.org/linux/man-pages/changelog.html#release_3.60

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2014/02/man-pages-359-is-released.h=
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
 man-pages-3.59 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2014-02-16, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Weizhou Pan <cs.wzpan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Apologies if I missed anyone!


Global changes
--------------

Various pages
    Peter Schiffer, Michael Kerrisk  [Weizhou Pan]
        Convert pages containing non-ASCII in source code comments to u=
se UTF-8
            Done using a slightly modified version of Peter Schiffer's
            convert_to_utf_8.sh script. The script was modified so as *=
not*
            a "coding:" marker to the groff source. For now, we'll only=
 put
            that marker on pages that contain non-ASCII characters in t=
he
            rendered text.

            See https://bugzilla.kernel.org/show_bug.cgi?id=3D60807

armscii-8.7
cp1251.7
iso_8859-1.7
iso_8859-10.7
iso_8859-11.7
iso_8859-13.7
iso_8859-14.7
iso_8859-15.7
iso_8859-16.7
iso_8859-2.7
iso_8859-3.7
iso_8859-4.7
iso_8859-5.7
iso_8859-6.7
iso_8859-7.7
iso_8859-8.7
iso_8859-9.7
koi8-r.7
koi8-u.7
    Peter Schiffer, Michael Kerrisk  [Weizhou Pan]
        Convert pages containing non-ASCII to use UTF-8
            Done using Peter Schiffer's convert_to_utf_8.sh script.
            These pages containing non-ASCII in the rendered characters=
, and
            so the script inserts a "coding:" marker into the groff sou=
rce.

            See https://bugzilla.kernel.org/show_bug.cgi?id=3D60807


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Changes in=
 man-pages-3.60 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2014-02-18, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
D. Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Kalle Olavi Niemitalo <kon-X3B1VOXEql0@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>

Apologies if I missed anyone!


Changes to individual pages
---------------------------
sigvec.3
    Michael Kerrisk  [Kalle Olavi Niemitalo]
        Fix error in code snippet
            s/sigpause/sigmask/

armscii-8.7
cp1251.7
iso_8859-1.7
iso_8859-10.7
iso_8859-11.7
iso_8859-13.7
iso_8859-14.7
iso_8859-15.7
iso_8859-16.7
iso_8859-2.7
iso_8859-3.7
iso_8859-4.7
iso_8859-5.7
iso_8859-6.7
iso_8859-7.7
iso_8859-8.7
iso_8859-9.7
koi8-u.7
    Michael Kerrisk  [Simon Paillard]
        Remove comment that glyphs in column 4 may not display correctl=
y
            With the conversion to UTF-8, the glyphs in column 4 of the
            tables in these pages will display regardless of whether th=
e
            environment is configured for the corresponding character s=
et.

iso_8859-11.7
iso_8859-13.7
    D. Barbier  [Simon Paillard]
        Fix encoding mistakes in 5f7f4042b8848127d852c6fa7c02e31ccfaeea=
e5
            Fixed via:

              for f in iso_8859-11 iso_8859-13; do
                cp man7/$f.7 $f
                iconv -f utf8 -t latin1 $f | iconv -f iso-${f#iso_} -t =
utf8 > man7/$f.7
              done

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
