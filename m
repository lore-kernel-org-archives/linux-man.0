From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: man-pages-2.76 released
Date: Mon, 14 Jan 2008 12:06:54 +0100
Message-ID: <478B424E.1010407@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alain Portal <aportal-CD6X2pywdrkGaKE8qFNMvg@public.gmane.org>, Carlo Marcelo Arenas Belon <carenas-kLeDWSohozoJb6fo7hG9ng@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>, Trond Myklebust <tro>
Cc: Alain PORTAL <alain.portal-CD6X2pywdrkGaKE8qFNMvg@public.gmane.org>, base-system-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org, Christophe-MeO/4o4RY/8dnm+yROfE0A@public.gmane.org, Ivana Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Eduardo Madeira Fleury <efleury-xuelUoVDAHHQT0dZR+AlfA@public.gmane.org>, feedback-GR7eSQ5yZPdAfugRpC6u6w@public.gmane.org, =?ISO-8859-1?Q?Giulio_Daprel=E0?= <giulio-pvpjhgE6P/E@public.gmane.org>, "Martin (Joey) Schulze" <joey-1lCxjdRlhQ9g9hUCZPvPmw@public.gmane.org>, Thorsten Kukuk <kukuk-l3A5Bk7waGM@public.gmane.org>, Mohsen Pahlevanzadeh <mohsen-iPr4nGsj6FvziFbYTSYfcdi2O/JbrIOy@public.gmane.org>, prabu.ayyappan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Subrata Modak <subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, ro-l3A5Bk7waGM@public.gmane.org, Aleksandr Blokhin <sass-u2l5PoMzF/Uox3rIn2DAYQ@public.gmane.org>, Senthil Kumar <senthilkumar_sen-ktR7oAotx3zQT0dZR+AlfA@public.gmane.org>, Stefan Puiu <stefanpuiuro-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, Kaveh Mousavi <kavehmz-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Stepan Kasal <kasal-+ZI9xUNit7I@public.gmane.org>, Elisa <lab-LS/GNBF6ldo@public.gmane.org>, "Michael Kerrisk (gmail)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mats Wichmann <mats.d.wichmann-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

    man-pages-2.76.tar.gz - man pages for Linux

This release is now available for download at:

    http://www.kernel.org/pub/linux/docs/man-pages
    or ftp://ftp.kernel.org/pub/linux/docs/man-pages

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
by sending a message to majordomo-jcmN7YZNQjL9qxiX1TGQuw@public.gmane.org, with the body:

    subscribe linux-man

==================== Changes in man-pages-2.76 ====================

Released: 2008-01-14


Contributors
------------

The following people contributed notes, ideas, or patches that have
been incorporated in changes in this release:

Alain Portal <aportal-CD6X2pywdrkGaKE8qFNMvg@public.gmane.org>
Carlo Marcelo Arenas Belon <carenas-kLeDWSohozoJb6fo7hG9ng@public.gmane.org>
Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Trond Myklebust <trond.myklebust-41N18TsMXrtuMpJDpNschA@public.gmane.org>

Apologies if I missed anyone!


Global changes
--------------

longjmp.3
printf.3
scanf.3
setbuf.3
setjmp.3
sk98lin.4
environ.7
    mtk
        Rework/remove use of ".ad" macros.

ioctl_list.2
mlock.2
mprotect.2
mremap.2
syslog.2
cfree.3
mpool.3
offsetof.3
rpc.3
stdin.3
    mtk
        Fix unbalanced quotes in formatting macros.

ftok.3
    mtk
        s/i-node/inode/, for consistency with other pages and POSIX.1-2001.

Typographical or grammatical errors have been corrected in several places.


Changes to individual pages
---------------------------

chown.2
    mtk
        Minor wording change.

dup.2
    mtk
        Reordered text in DESCRIPTION and added some details for dup2().

open.2
    Trond Myklebust / mtk
        Minor fix to O_EXCL changes in previous release.

gettid.2
    mtk
        Rewrote DESCRIPTION; noted that thread ID is not the same
        thing as a POSIX thread ID.

pipe.2
    mtk
        Rewrote DESCRIPTION; minor additions to EXAMPLE text.

umask.2
    mtk
        A few rewrites and additions.

strptime.3
    Carlo Marcelo Arenas Belon / mtk
        Add "#define _XOPEN_SOURCE" to example program.

initrd.4
    mtk
        Use quotes more consistently in formatting macros.

random.4
    mtk, after a report by Daniel Kahn Gilmor
        Add 2.6 details for /proc/sys/kernel/random/poolsize.
        as per http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=459232.

pthreads.7
    mtk
        Minor changes.

spufs.7
    mtk / Jeremy Kerr
        s/MultiSource Synchronization/MultiSource Synchronization (MSS)/


-- 
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/
Want to report a man-pages bug?  Look here:
http://www.kernel.org/doc/man-pages/reporting_bugs.html
