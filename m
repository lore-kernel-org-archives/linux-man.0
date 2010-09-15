From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.26 released
Date: Wed, 15 Sep 2010 20:41:29 +0200
Message-ID: <AANLkTin7ohXo-swfKuOs1+0Y11MM92+HzWmOY6eMWgVz@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

   man-pages-3.26.tar.gz - man pages for Linux

This release is now available for download at:

 http://www.kernel.org/pub/linux/docs/man-pages
 or ftp://ftp.kernel.org/pub/linux/docs/man-pages

The online changelog is available at
http://www.kernel.org/doc/man-pages/changelog.html (blogged at
http://linux-man-pages.blogspot.com/2010/09/man-pages-326-is-released.html
) and the current version of the pages is browsable at
http://www.kernel.org/doc/man-pages/

You are receiving this message either because:

a) You contributed to the content of this release.

b) You are subscribed to linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (*).

c) I have information (possibly inaccurate) that you are the
maintainer of a translation of the manual pages, or are the maintainer
of the manual pages set in a particular distribution, or have
expressed interest in helping with man-pages maintenance, or have
otherwise expressed interest in being notified about man-pages
releases.  If you don't want to receive such messages from me, or you
know of some other translator or maintainer who may want to receive
such notifications, send me a message.

Cheers,

Michael

==================== Changes in man-pages-3.26 ====================

Released: 2010-09-04, Munich


Contributors
------------

The following people contributed notes, ideas, or patches that have
been incorporated in changes in this release:

Alexander Shishkin <virtuoso-0lOfPCoBze7YtjvyW6yDsg@public.gmane.org>
Brian Sutin <Brian.Sutin-ErF4HNK4sl3QT0dZR+AlfA@public.gmane.org>
Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Jianhua Li <jhlicc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Linus Nilsson <lajnold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Lenaic Huard <lenaic.huard-QFKgK+z4sOrR7s880joybQ@public.gmane.org>
mac-6JwzNyXSCK3QT0dZR+AlfA@public.gmane.org
Martin Schulze <joey-1lCxjdRlhQ9g9hUCZPvPmw@public.gmane.org>
Maxin John <maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Nicholas Hunt <nhunt-GmWTxIRN22iJaUV4rX00uodd74u8MsAO@public.gmane.org>
Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Peter Stuge <peter-Y+HMSxxDrH8@public.gmane.org>
Przemyslaw Szczepaniak <Przemyslaw.Szczepaniak-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Scott Walls <sawalls-63aXycvo3TyHXe+LvDLADg@public.gmane.org>
TAN Yee Fan <tanyeefa-re5r+meJ/dN84TsAtUCrkA@public.gmane.org>
Wu Fengguang <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Yitzchak Gale <gale-qokrdK/Rc/HYtjvyW6yDsg@public.gmane.org>
Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>

Apologies if I missed anyone!

Newly documented interfaces in existing pages
---------------------------------------------

eventfd.2
    Michael Kerrisk
        Document EFD_SEMAPHORE
            Document the EFD_SEMAPHORE flag, added in kernel 2.6.30.
            Also restructured some parts of the text to fit with the
            addition of the EFD_SEMAPHORE text.


Global changes
--------------

getaddrinfo.3
getipnodebyname.3
st.4
    Michael Kerrisk
        s/logical OR/bitwise OR/


Changes to individual pages
---------------------------

clock_nanosleep.2
    Michael Kerrisk
        Fix discussion of return value when interrupted by a signal

epoll_ctl.2
    Yuri Kozlov
        Small fix to types in data structures

eventfd.2
    Alexander Shishkin
        Clarified close-on-exec behavior

madvise.2
    Michael Kerrisk
        Improve discussion of MADV_SOFT_OFFLINE

mkdir.2
    Michael Kerrisk
        Add EMLINK error to ERRORS

mq_getsetattr.2
mq_close.3
mq_getattr.3
mq_notify.3
mq_send.3
mq_unlink.3
    Lnac Huard
        Fix return type in SYNOPSIS (s/mqd_t/int/)

recv.2
send.2
    Michael Kerrisk
        Remove obsolete reference to glibc version in NOTES

recv.2
send.2
    Nicholas Hunt
        Adjust type shown for msg_controllen to glibc reality
            This patch fixes the type of msg_controllen in the struct msghdr
            definition given in send.2 and recv.2 to match the definition in
            glibc and the kernel.

select.2
    Michael Kerrisk
        Update NOTES on old glibc pselect()
            Make it clear that modern glibc uses the kernel pselect()
            on systems where it is available.
            See https://bugzilla.kernel.org/show_bug.cgi?id=14411

statfs.2
    Guillem Jover
        Fix copy & paste error for __SWORD_TYPE definition

sysfs.2
    Michael Kerrisk
        Clarify that this syscall is obsolete.
            And strengthen recommendation to use /proc/filesystems instead.

write.2
    Michael Kerrisk
        Add EDESTADDRREQ error

a64l.3
    Peng Haitao
        Fix error in NOTES, s/a64l/l64a/

error.3
    Linus Nilsson
        Change "perror" to "strerror" in DESCRIPTION of error()

mq_send.3
    Michael Kerrisk
        Fix EAGAIN description (s/empty/full)

initrd.4
    Yuri Kozlov
        Fix IP address in explanation of NFS example

tzfile.5
    Michael Kerrisk
        Add information on version 2 format timezone files
            Updated using information from the tzcode 2010l release at
            ftp://elsie.nci.nih.gov/pub.
            (It's an open question whether or not a version of tzfile.5
            should live independently in man-pages. It was added to the
            man-pages set many years ago. For now, I'll follow a
            conservative course that causes least pain to downstream,
            by continuing to maintain a separate copy in man-pages.)

            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=594219

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
