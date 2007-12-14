From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: man-pages-2.71 released
Date: Fri, 14 Dec 2007 09:47:13 +0100
Message-ID: <47624311.70303@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Sigler <linux.kernel-GANU6spQydw@public.gmane.org>, Josh Triplett <josh-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org>, Pascal MALAISE <malaise@magi>
Cc: "M. Alain PORTAL" <alain.portal-GANU6spQydw@public.gmane.org>, base-system-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org, Christophe-MeO/4o4RY/8dnm+yROfE0A@public.gmane.org, Ivana Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Eduardo Madeira Fleury <efleury-xuelUoVDAHHQT0dZR+AlfA@public.gmane.org>, feedback-GR7eSQ5yZPdAfugRpC6u6w@public.gmane.org, =?ISO-8859-1?Q?Giulio_Daprel=E0?= <giulio-pvpjhgE6P/E@public.gmane.org>, "Martin (Joey) Schulze" <joey-1lCxjdRlhQ9g9hUCZPvPmw@public.gmane.org>, Thorsten Kukuk <kukuk-l3A5Bk7waGM@public.gmane.org>, Mohsen Pahlevanzadeh <mohsen-iPr4nGsj6FvziFbYTSYfcdi2O/JbrIOy@public.gmane.org>, prabu.ayyappan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Subrata Modak <subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, ro-l3A5Bk7waGM@public.gmane.org, Aleksandr Blokhin <sass-u2l5PoMzF/Uox3rIn2DAYQ@public.gmane.org>, Senthil Kumar <senthilkumar_sen-ktR7oAotx3zQT0dZR+AlfA@public.gmane.org>, Stefan Puiu <stefanpuiuro-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, Kaveh Mousavi <kavehmz-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Stepan Kasal <kasal-+ZI9xUNit7I@public.gmane.org>, Elisa <lab-LS/GNBF6ldo@public.gmane.org>, "Michael Kerrisk (gmail)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mats Wichmann <mats.d.wichmann-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday,

Some news:

* man-pages now has an (irregularly updated) blog.

      http://linux-man-pages.blogspot.com/

* man-pages now has a website:

      http://www.kernel.org/doc/man-pages

  The site includes HTML versions of the current set of man-pages.

* Since man-pages-2.69, each man page now includes a COLOPHON
  section at the end of the page which indicates the version of
  man-pages in which this page is released, and also contains a
  pointer to the man-pages web site.

Back to the program as usual...

The Linux man-pages maintainer proudly announces:

    man-pages-2.71.tar.gz - man pages for Linux

This release is now available for download at:

    http://www.kernel.org/pub/linux/docs/man-pages
    or ftp://ftp.kernel.org/pub/linux/docs/man-pages

    (Note the s/manpages/man-pages/ in these paths;
    a symlink with the old path will exist for
    a limited time.)

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
(man-pages maintenance is supported by Google, as a Google engineer 20%
project.)

(*) linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org is the man pages discussion list.  Subscribe
by sending a message to majordomo-jcmN7YZNQjL9qxiX1TGQuw@public.gmane.org, with the body:

    subscribe linux-man

==================== Changes in man-pages-2.71 ====================

Released: 2007-12-17


Contributors
------------

The following people contributed notes, ideas, or patches that have
been incorporated in changes in this release:

Alain PORTAL <alain.portal-GANU6spQydw@public.gmane.org>
John Sigler <linux.kernel-GANU6spQydw@public.gmane.org>
Josh Triplett <josh-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org>
Mats Wichmann <mats.d.wichmann-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Pascal MALAISE <malaise-nJJpUPIbDOA@public.gmane.org>
Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>

Apologies if I missed anyone!


Global changes
--------------

err.3
fts.3
getloadavg.3
queue.3
rcmd.3
rexec.3
stdin.3
elf.5
operator.7
    mtk
        Replaced the use of mdoc macros on these pagess with man
        macros.  The only pages in man-pages that still use
        mdoc macros are mdoc.7 and mdoc.samples.7.

Typographical or grammatical errors have been corrected in several places.


Deleted pages
-------------

TODO
    mtk
        This information is now on the website.


Changes to individual pages
---------------------------

Changes.old
    mtk
        Reformat various change log entries to use a consistent format.
        Expand Debian bug report numbers to be URLs.
        Other minor tidy-ups.

fcntl.2
    mtk
        Document the F_DUPFD_CLOEXEC operation, which is
        new in kernel 2.6.24.

listen.2
    Josh Triplett
        Fix incorrect path for somaxconn.

getpw.3
    Alain PORTAL
        Add ENOENT error to ERRORS.

sysconf.3
    Mats Wichmann
        Add documentation of _SC_NPROCESSORS_CONF and _SC_NPROCESSORS_ONLN.

tty.4
    John Sigler
        Add tty_ioctl(4) to SEE ALSO list.

regex.7
    Pascal MALAISE <malaise-nJJpUPIbDOA@public.gmane.org>
        Separate text on back regerences from that describing basic regexps,
        as per http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=379829.
    mtk
        Remove crufty text about word boundaries.


-- 
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/
Want to report a man-pages bug?  Look here:
http://www.kernel.org/doc/man-pages/reporting_bugs.html



-
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
