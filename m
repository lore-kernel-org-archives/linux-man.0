From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: man-pages-3.17 released
Date: Thu, 22 Jan 2009 01:25:15 +1300
Message-ID: <4977142B.9020101@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

  man-pages-3.17.tar.gz - man pages for Linux

This release is now available for download at:

  http://www.kernel.org/pub/linux/docs/man-pages
  or ftp://ftp.kernel.org/pub/linux/docs/man-pages

The online changelog is available at
http://www.kernel.org/doc/man-pages/changelog.html
(blogged at
http://linux-man-pages.blogspot.com/2009/01/man-pages-317-is-released.h=
tml)
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
being notified about man-pages releases.  If you don't want to receive =
such
messages from me, or you know of some other translator or maintainer wh=
o
may want to receive such notifications, send me a message.

Cheers,

Michael


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Changes in=
 man-pages-3.17 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2009-01-19, Hobart


Contributors
------------

The following people contributed notes, ideas, or patches that have
been incorporated in changes in this release:

Adeodato Sim=F3 <dato-JJw9D8aLpibbgu9M4EVuLg@public.gmane.org>
Bastien ROUCARIES <roucaries.bastien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Davide Libenzi <davidel-AhlLAIvw+VEjIGhXcJzhZg@public.gmane.org>
Lefteris Dimitroulakis <edimitro-6VGm6rrshF0@public.gmane.org>
Mads Martin Joergensen <mmj-DPg9a1PvQD0@public.gmane.org>
Marc Lehmann <schmorp-ulOdryinso2ELgA04lAiVw@public.gmane.org>
Martin (Joey) Schulze <joey-1lCxjdRlhQ9g9hUCZPvPmw@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Vegard Nossum <vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

endian.3
    Michael Kerrisk
        New page documenting byte order conversion functions
            Document functions (new in glibc 2.9) for conversion betwee=
n
            host byte order and big-/little- endian byte order:
            htobe16(), htole16(), be16toh(), le16toh(),
            htobe32(), htole32(), be32toh(), le32toh(),
            htobe64(), htole64(), be64toh(), le64toh()

getifaddrs.3
    Petr Baudis
        New page documenting getifaddrs(3) and freeifaddrs(3)
            Many edits and changes of Petr's initial draft by mtk

cp1251.7
    Lefteris Dimitroulakis
        New page documenting CP 1251 (Windows Cyrillic) character set

iso-8859-10.7
    Lefteris Dimitroulakis
        New page documenting ISO 8859-10 character set

iso_8859-13.7
    Lefteris Dimitroulakis
        New page documenting ISO 8859-13 character set

iso_8859-14.7
    Lefteris Dimitroulakis
        New page documenting ISO 8859-14 character set

iso_8859-3.7
    Lefteris Dimitroulakis
        New page documenting ISO 8859-3 character set

iso_8859-5.7
    Lefteris Dimitroulakis
        New page documenting ISO 8859-5 character set

iso_8859-8.7
    Lefteris Dimitroulakis
        New page documenting ISO 8859-8 character set

koi8-u.7
    Lefteris Dimitroulakis
        New page documenting KOI8-U character set


Newly documented interfaces in existing pages
---------------------------------------------

epoll.7
    Michael Kerrisk
        Document /proc interfaces for limiting kernel memory usage
            Document the following /proc files that were added in
            Linux 2.6.28:
            /proc/sys/fs/epoll/max_user_instances
            /proc/sys/fs/epoll/max_user_watches

netdevice.7
    Michael Kerrisk
        Document recently added interface flags
            IFF_LOWER_UP (since Linux 2.6.17)
            IFF_DORMANT (since Linux 2.6.17)
            IFF_ECHO (since Linux 2.6.25)

            Documentation taken from comments in <linux/if.h>


New and changed links
---------------------

freeifaddrs.3
    Michael Kerrisk
        New link to new getifaddrs.3

htobe16.3
htole16.3
be16toh.3
le16toh.3
htobe32.3
htole32.3
be32toh.3
le32toh.3
htobe64.3
htole64.3
be64toh.3
le64toh.3
    Michael Kerrisk
        New links to new endian.3

iso-8859-10.7
iso_8859_10.7
latin6.7
    Michael Kerrisk
        New links to new iso_8859-10.7

iso-8859-13.7
iso_8859_13.7
latin7.7
    Michael Kerrisk
        New links to new iso_8859-13.7

iso-8859-14.7
iso_8859_14.7
latin8.7
    Michael Kerrisk
        New links to new iso_8859-14.7

iso-8859-3.7
iso_8859_3.7
latin3.7
    Michael Kerrisk
        New links to new iso_8859-3.7

iso-8859-5.7
iso_8859_5.7
    Michael Kerrisk
        New links to new iso_8859-5.7

iso-8859-8.7
iso_8859_8.7
    Michael Kerrisk
        New links to new iso_8859-8.7


Changes to individual pages
---------------------------

bind.2
    Michael Kerrisk
        SEE ALSO: Add getifaddrs(3)

epoll_create.2
    Michael Kerrisk
        Document EMFILE error
            This error is encountered when the limit imposed by
            /proc/sys/fs/epoll/max_user_instances is encountered.
    Michael Kerrisk
        Clarify distinction between epoll instance and epoll file descr=
iptor
            Reword so that the notion of an epoll instance is made clea=
r,
            and made distinct from the notion of an epoll file descript=
or.
            Some other minor rewordings also.

epoll_ctl.2
    Michael Kerrisk
        Reordered parts of the text
    Michael Kerrisk
        Introduce notion of epoll instance
            Introduce notion of epoll instance as distinct from
            epoll file descriptor.  Plus other wording clean-ups.
    Michael Kerrisk
        Document ENOSPC error (new in Linux 2.6.28)
            This error results when the limit imposed by
            /proc/sys/fs/epoll/max_user_watches is encountered.

epoll_wait.2
    Michael Kerrisk
        Introduce the notion of an epoll instance into text

getdents.2
    Michael Kerrisk
        Before kernel < 2.6.4, 'd_type' was effectively always DT_UNKNO=
WN

gethostid.2
    Michael Kerrisk
        Rename file (was misnamed gethostd.2 in previous release)

getsockname.2
    Michael Kerrisk
        SEE ALSO: Add getifaddrs(3)

signalfd.2
    Michael Kerrisk
        Fix description of fork() semantics
            The page text described the semantics of the initial
            implementation of signalfd().  These were changed early on,
            but the man page wasn't updated.

byteorder.3
    Michael Kerrisk
        SEE ALSO: add endian(3)

longjmp.3
    Michael Kerrisk
        Clarify wording re saving/restoring signal mask
    Michael Kerrisk
        siglongjmp() restores signal mask iff 'savesigs' was non-zero
            Note that siglongjmp() restores signal mask if, and only
            if, 'savesigs' argument of sigsetjmp() was non-zero.  (Prev=
ious
            text omitted the "and only if".)

memccpy.3
    Michael Kerrisk
        Fix CONFORMING TO: s/C99/POSIX.1-2001/
    Michael Kerrisk
        If the memory areas overlap, the results are undefined

sethostid.3
    Michael Kerrisk
        Rename file (was misnamed sethostd.3 in previous release)

setjmp.3
    Michael Kerrisk
        Clarify wording re saving/restoring signal mask
    Michael Kerrisk
        Clarify when setjmp() provides BSD vs System V signal mask sema=
ntics

strsep.3
    Michael Kerrisk
        BUGS: explicitly list problems afflicting strsep()
            Previously, the page said this function suffered the same
            problems as strtok(), but in fact strsep() doesn't suffer
            from all of the same problems as strtok(), so explicitly
            list just the problems of strsep() in the strsep.3 page.

proc.5
    Michael Kerrisk
        Add pointer to epoll(7) for description of epoll /proc files

epoll.7
    Michael Kerrisk
        Various wording changes to improve clarity and consistency


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
