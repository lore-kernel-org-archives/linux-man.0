From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: man-pages-3.21 released
Date: Tue, 21 Apr 2009 17:02:25 +1200
Message-ID: <cfd18e0f0904202202l3f50bde9yd0085e0797a553e3@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

=A0 =A0man-pages-3.21.tar.gz - man pages for Linux

This release is now available for download at:

=A0http://www.kernel.org/pub/linux/docs/man-pages
=A0or ftp://ftp.kernel.org/pub/linux/docs/man-pages

The online changelog is available at
http://www.kernel.org/doc/man-pages/changelog.html
(blogged at
http://linux-man-pages.blogspot.com/2009/04/man-pages-321-is-released.h=
tml )
and the current version of the pages is browsable at
http://www.kernel.org/doc/man-pages/

You are receiving this message either because:

a) You contributed to the content of this release.

b) You are subscribed to linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (*).

c) I have information (possibly inaccurate) that you are the maintainer=
 of
a translation of the manual pages, or are the maintainer of the manual
pages set in a particular distribution, or have expressed interest in
helping with man-pages maintenance, or have otherwise expressed interes=
t in
being notified about man-pages releases. =A0If you don't want to receiv=
e such
messages from me, or you know of some other translator or maintainer wh=
o
may want to receive such notifications, send me a message.

Cheers,

Michael

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Changes in=
 man-pages-3.21 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2009-04-15, Los Gatos


Contributors
------------

The following people contributed notes, ideas, or patches that have
been incorporated in changes in this release:

=46rank Dana <ferdnyc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

pthread_setconcurrency.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0New page documenting pthread_setconcurrency(3) and
=A0 =A0 =A0 =A0pthread_getconcurrency(3)

pthread_yield.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0New page documenting pthread_yield(3)


New and changed links
---------------------

pthread_getconcurrency.3
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0New link to new pthread_setconcurrency(3)

Changes to individual pages
---------------------------

initrd.4
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Various minor wording improvements

initrd.4
=A0 =A0Frank Dana
=A0 =A0 =A0 =A0Add missing word in description

feature_test_macros.7
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Update for glibc 2.10 changes to <features.h>
=A0 =A0 =A0 =A0 =A0 =A0From glibc 2.10, <features.h> understands the va=
lues 200809
=A0 =A0 =A0 =A0 =A0 =A0for _POSIX_C_SOURCE and 700 for _XOPEN_SOURCE, a=
nd makes
=A0 =A0 =A0 =A0 =A0 =A0corresponding changes to defaults for other feat=
ure test macros.
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0Add an example program
=A0 =A0 =A0 =A0 =A0 =A0This example program makes it possible to explor=
e what
=A0 =A0 =A0 =A0 =A0 =A0feature test macros are set depending on the gli=
bc version
=A0 =A0 =A0 =A0 =A0 =A0and the macros that are explicitly set.

ldconfig.8
=A0 =A0Michael Kerrisk
=A0 =A0 =A0 =A0/etc/ld.so.conf also include libraries found in /lib and=
 /usr/lib
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
