From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: man-pages-2.70 released
Date: Thu, 06 Dec 2007 10:21:01 +0100
Message-ID: <4757BEFD.9080605@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "M. Alain PORTAL" <alain.portal-GANU6spQydw@public.gmane.org>, base-system-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org, Christophe-MeO/4o4RY/8dnm+yROfE0A@public.gmane.org, Ivana Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Eduardo Madeira Fleury <efleury-xuelUoVDAHHQT0dZR+AlfA@public.gmane.org>, feedback@en
List-Id: linux-man@vger.kernel.org

Gidday,

Some news:

* man-pages now has a website:

      http://www.kernel.org/doc/man-pages

  The site includes HTML versions of the current set of man-pages.

* Since man-pages-2.69, each man page now includes a COLOPHON
  section at the end of the page which indicates the version of
  man-pages in which this page is released, and also contains a
  pointer to the man-pages web site.

Back to the program as usual...

The Linux man-pages maintainer proudly announces:

    man-pages-2.70.tar.gz - man pages for Linux

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

==================== Changes in man-pages-2.70 ====================

Released: 2007-12-06


Global changes
--------------

Many pages
    mtk
        Remove section numbers for page references where the
        reference refers to the page itself.  (This stops man2html
        producing links from a page back to itself.)

Typographical or grammatical errors have been corrected in several places.



Changes to individual pages
---------------------------

get_mempolicy.2
    mtk
        Add CONFORMING TO section.

io_getevents.2
    mtk
        Remove redundant SEE ALSO entry.

mbind.2
    mtk
        Add CONFORMING TO section.

msgop.2
    mtk
        Remove redundant SEE ALSO entries.

sigprocmask.2
    mtk
        Remove redundant SEE ALSO entry.

splice.2
    mtk
        Remove redundant SEE ALSO entry.
        Add SEE ALSO referring to vmsplice(2).

csin.3
    mtk
        Remove redundant SEE ALSO entry.
        Add SEE ALSO referring to ccos(3).

gethostbyname.3
    mtk
        Add gethostbyaddr_r to NAME section.

rint.3
    mtk
        Remove redundant SEE ALSO entry.

sigsetops.3
    mtk
        Minor rewording.

epoll.7
    mtk
        Minor rewording.

-- 
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/


-
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
