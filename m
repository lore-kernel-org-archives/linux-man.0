From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: man-pages-3.16 released [resend to linux-man@vger]
Date: Tue, 13 Jan 2009 13:26:16 +1300
Message-ID: <cfd18e0f0901121626k448ef67jd3d07c56377dbd24@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

 man-pages-3.16.tar.gz - man pages for Linux

This release is now available for download at:

 http://www.kernel.org/pub/linux/docs/man-pages
 or ftp://ftp.kernel.org/pub/linux/docs/man-pages

The online changelog is available at
http://www.kernel.org/doc/man-pages/changelog.html
(blogged at
http://linux-man-pages.blogspot.com/2009/01/man-pages-316-is-released.html)
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

==================== Changes in man-pages-3.16 ====================

Released: 2009-01-13, Christchurch


Contributors
------------

The following people contributed notes, ideas, or patches that have
been incorporated in changes in this release:

Colin Watson <cjwatson-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Florentin Duneau <fduneau-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

pthread_getcpuclockid.3
   Michael Kerrisk
       New page documenting pthread_getcpuclockid(3)

libc.7
   Michael Kerrisk
       New page giving brief overview of C libraries on Linux

rtld-audit.7
   Michael Kerrisk
       New page documenting dynamic linker audting API


Newly documented interfaces in existing pages
---------------------------------------------

ld.so.8
   Petr Baudis
       Document LD_AUDIT
   Petr Baudis
       Document LD_POINTER_GUARD


New and changed links
---------------------

gethostid.2
   Michael Kerrisk
       New link to new page location in Section 3

sethostid.2
   Michael Kerrisk
       Change link to point to new page location in Section 3

sethostid.3
   Michael Kerrisk
       New link to relocated page in Section 3

glibc.7
   Michael Kerrisk
       New link to new libc.7


Global changes
--------------

syscalls.2
feature_test_macros.7
standards.7
   Michael Kerrisk
       SEE ALSO: add libc(7)

dlopen.3
ld.so.8
   Michael Kerrisk
       SEE ALSO: add rtld-audit(7)


Changes to individual pages
---------------------------

gethostid.2
   Michael Kerrisk
       Move to Section 3
           The interfaces documented in this page are purely glibc.

syscalls.2
   Michael Kerrisk
       Kernel 2.6.28 adds accept4()

clock_getres.3
   Michael Kerrisk
       SEE ALSO: Add pthread_getcpuclockid(3)

fmemopen.3
   Michael Kerrisk
       Fix VERSIONS information

gethostid.3
   Michael Kerrisk
       Before version 2.2, glibc stored the host ID in /var/adm/hostid
           Also: rewrite some text describing the /etc/hostid file, so that
           this location is referred to just once on the page.
   Michael Kerrisk
       RETURN VALUE: describe return value of sethostid()
   Michael Kerrisk
       Added BUGS section noting that ID can't be guaranteed to be unique
   Michael Kerrisk
       Added ERRORS section describing errors for sethostid()
   Michael Kerrisk
       Update section number to reflect relocation into Section 3

printf.3
   Michael Kerrisk
       Source and destination buffers may not overlap for *s*printf()
           http://sourceware.org/bugzilla/show_bug.cgi?id=7075

           Some existing code relies on techniques like the following to
           append text to a buffer:

               $ cat s.c
               #include <stdio.h>
               char buf[80] = "not ";
               main()
               {
                   sprintf(buf, "%sfail", buf);
               puts(buf);
               return 0;
               }

               $ cc s.c
               $ ./a.out
               not fail

           However, the standards say the results are undefined if source
           and destination buffers overlap, and with suitable compiler
           options, recent changes can cause unexpected results:

               $ cc -v 2>&1 | grep gcc
               gcc version 4.3.1 20080507 (prerelease) [gcc-4_3-branch
revision 135036] (SUSE Linux)
               $ cc -D_FORTIFY_SOURCE -O2 s.c
               $ ./a.out
               fail

readdir.3
   Michael Kerrisk
       Rewrite text describing 'dirent' fields standardized in POSIX.1
   Michael Kerrisk
       Clarify text for return value/errno setting for end-of-stream case

nscd.8
   Petr Baudis
       Correct NOTES section on reloading configuration files
           It behaved this way at least since
           "Sun Oct 18 15:02:11 1998 +0000",
           some four months after including the nscd implementation
           in glibc. But there does seem to be a short window between
           glibc-2.1 and glibc-2.1.3 when nscd -i was not available,
           I don't think it's worth muddling the point of the page
           with that, though.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
