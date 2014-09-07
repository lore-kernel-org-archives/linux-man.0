From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.72 released
Date: Sun, 07 Sep 2014 07:00:13 -0700
Message-ID: <540C64ED.1000409@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

    man-pages-3.72 - man pages for Linux

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.72

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2014/09/man-pages-372-is-released.html

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


==================== Changes in man-pages-3.72 ====================

Released: 2014-09-07, Mountain View


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Christian von Roques <roques-DeIDFP5fInQ@public.gmane.org>
Holger Hans Peter Freyther <holger-/0vNEYwyzy+/WdZNMWml2A@public.gmane.org>
Michael Haardt <michael-8s1n8bisGiQ@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>
Sorin Dumitru <sdumitru-+zzKsuq53OdBDgjK7y7TUQ@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

memusage.1
    Peter Schiffer, Michael Kerrisk  [Jan Chaloupka]
        New page for glibc memusage(1) command

memusagestat.1
    Peter Schiffer  [Jan Chaloupka, Michael Kerrisk]
        New page for glibc memusagestat(1) command

mtrace.1
    Peter Schiffer  [Jan Chaloupka]
        New page describing the glibc mtrace(1) command


Changes to individual pages
---------------------------

connect.2
    Michael Haardt
        Note that a new socket should be used if connect() fails

fcntl.2
    Michael Kerrisk
        One must define _GNU_SOURCE to get the F_OFD_* definitions

poll.2, select.2
    Rusty Russell
        Fix erroneous description of "available for write".
            POSIX says: "POLLOUT Normal data may be written without
            blocking.".  This "may" is misleading, see the POSIX
            write page:

                Write requests to a pipe or FIFO shall be handled in the
                same way as a regular file with the following exceptions:
                ...
                If the O_NONBLOCK flag is clear, a write request may cause
                the thread to block, but on normal completion it shall
                return nbyte.
                ...
                When attempting to write to a file descriptor (other than a
                pipe or FIFO) that supports non-blocking writes and cannot
                accept the data immediately:

                If the O_NONBLOCK flag is clear, write() shall block the
                calling thread until the data can be accepted.

                If the O_NONBLOCK flag is set, write() shall not block the
                thread. If some data can be written without blocking the
                thread, write() shall write what it can and return the
                number of bytes written. Otherwise, it shall return -1 and
                set errno to [EAGAIN].

            The net result is that write() of more than 1 byte on a
            socket, pipe or FIFO which is "ready" may block: write()
            (unlike read!) will attempt to write the entire buffer and
            only return a short write under exceptional circumstances.

            Indeed, this is the behaviour we see in Linux:

            https://github.com/rustyrussell/ccan/commit/897626152d12d7fd13a8feb36989eb5c8c1f3485
            https://plus.google.com/103188246877163594460/posts/BkTGTMHDFgZ

errno.3
    Michael Kerrisk
        SEE ALSO: add errno(1)

rtnetlink.3
    Holger Hans Peter Freyther
        Fix parameters for the send() call in the example

inotify.7
    Michael Kerrisk
        IN_OPEN and IN_CLOSE_NOWRITE can also occur for directories
    Michael Kerrisk
        IN_CLOSE_WRITE occurs only for files (not monitored directory)
    Michael Kerrisk
        IN_MODIFY is generated for files only (not monitored directories)
    Michael Kerrisk
        IN_ACCESS occurs only for files inside directories
            IN_ACCESS does not occur for monitored directory.

packet.7
    Sorin Dumitru
        Fix include file
            It looks like most of the socket options from this man pages
            are not defined in <netpacket/packet.h>. They are defined in
            <linux/if_packet.h> so we should include that one.

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
