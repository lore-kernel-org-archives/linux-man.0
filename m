From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: man-pages-2.77 released
Date: Thu, 31 Jan 2008 14:12:55 +0100
Message-ID: <47A1C957.5050004@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Heimlich <tropikhajma-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org>, Phil Endecott <phil_vonar_endecott-wZDNlLIRyE5g9hUCZPvPmw@public.gmane.org>, Thomas Huriaux <thomas.huriaux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vincent Lefevre <vincent-opTGSl+ZDNkdnm+yROfE0A@public.gmane.org>
Cc: Alain PORTAL <alain.portal-CD6X2pywdrkGaKE8qFNMvg@public.gmane.org>, base-system-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org, Christophe-MeO/4o4RY/8dnm+yROfE0A@public.gmane.org, Ivana Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Eduardo Madeira Fleury <efleury-xuelUoVDAHHQT0dZR+AlfA@public.gmane.org>, Ivana Varekova <feedback-GR7eSQ5yZPdAfugRpC6u6w@public.gmane.org>, =?ISO-8859-1?Q?Giulio_Daprel=E0?= <giulio-pvpjhgE6P/E@public.gmane.org>, "Martin (Joey) Schulze" <joey-1lCxjdRlhQ9g9hUCZPvPmw@public.gmane.org>, Thorsten Kukuk <kukuk-l3A5Bk7waGM@public.gmane.org>, Mohsen Pahlevanzadeh <mohsen-iPr4nGsj6FvziFbYTSYfcdi2O/JbrIOy@public.gmane.org>, Thorsten Kukuk <prabu.ayyappan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Subrata Modak <subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, ro-l3A5Bk7waGM@public.gmane.org, Aleksandr Blokhin <sass-u2l5PoMzF/Uox3rIn2DAYQ@public.gmane.org>, Senthil Kumar <senthilkumar_sen-ktR7oAotx3zQT0dZR+AlfA@public.gmane.org>, Stefan Puiu <stefanpuiuro-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, Kaveh Mousavi <kavehmz-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Stepan Kasal <kasal-+ZI9xUNit7I@public.gmane.org>, Elisa <lab-LS/GNBF6ldo@public.gmane.org>, "Michael Kerrisk (gmail)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Elisa <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mats Wichmann <mats.d>
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

    man-pages-2.77.tar.gz - man pages for Linux

This release is now available for download at:

    http://www.kernel.org/pub/linux/docs/man-pages
    or ftp://ftp.kernel.org/pub/linux/docs/man-pages

The online changelog is available at
http://www.kernel.org/doc/man-pages/changelog.html
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

==================== Changes in man-pages-2.77 ====================

Released: 2008-01-31


Contributors
------------

The following people contributed notes, ideas, or patches that have
been incorporated in changes in this release:

Pavel Heimlich <tropikhajma-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org>
Phil Endecott <phil_vonar_endecott-wZDNlLIRyE5g9hUCZPvPmw@public.gmane.org>
Thomas Huriaux <thomas.huriaux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Vincent Lefevre <vincent-opTGSl+ZDNkdnm+yROfE0A@public.gmane.org>
WANG Cong <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Apologies if I missed anyone!


Global changes
--------------

stdarg.3
bootparam.7
    Thomas Huriaux
        Fix broken use of single quotes at start of line,
        as per: http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=462636

Typographical or grammatical errors have been corrected in several places.

New pages
---------

remove_COLOPHON.sh
    mtk
        Script to remove the COLOPHON section from the man pages provided
        as command-line arguments.  This is useful to remove the COLOPHON
        sections from all of the man pages in two different release trees
        in order to do a "diff -ruN" to see the "real" differences
        between the trees.


Changes to individual pages
---------------------------

fcntl.2
    mtk
        Replace tables with .TP macros.

fork.2
    mtk
        Added discussion of directory streams.
        Removed "#include <sys/types>" from SYNOPSIS.
        Changed authorship notice.

futex.2
    mtk
        Add ENOSYS error to errors.
    Phil Endecott
        Explicitly describe return value in the event of an error.

inotify_add_watch.2
    mtk
        Minor wording changes.

splice.2
    WANG Cong
        Fix types for 2 and 4 arguments in splice prototype.

wait.2
    Phil Endecott
        Clarify description of return value for WNOHANG.

tkill.2
    mtk
        Rewrote DESCRIPTION; emphasized that tkill() is obsoleted by
        tgkill().

alloca.3
    mtk
        Change description in NAME section.
        Various rewrites and additions (including notes on longjmp() and
        SIGSEGV).
    mtk / Vincent Lefevre
        Weaken warning against use of alloca(), and
        point out some cases where it can be useful;
        as per http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=461100.

bootparam.7
    Pavel Heimlich
        Remove junk line.

inotify.7
    mtk
        Replace tables with .TP macros.

-- 
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/
Want to report a man-pages bug?  Look here:
http://www.kernel.org/doc/man-pages/reporting_bugs.html
