From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.79 released
Date: Mon, 02 Feb 2015 09:59:44 +0100
Message-ID: <54CF3C80.3090906@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

    man-pages-3.79 - man pages for Linux

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.79

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2015/02/man-pages-379-is-released.html

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

==================== Changes in man-pages-3.79 ====================

Released: 2015-02-01, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
Masanari Iida <standby24x7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Scot Doyle <lkml14-enLWO88E2pdl57MIdRCFDg@public.gmane.org>
Sergey V. Zubkov <cubbi-+Aw+eGX9mmUAvxtiuMwx3w@public.gmane.org>
Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

getrandom.2
    Heinrich Schuchardt, Theodore T'so, Michael Kerrisk
        New page documenting getrandom(2)
            Kernel 3.17 introduces a new system call getrandom(2).

kexec_load.2
    Vivek Goyal, Michael Kerrisk
        Add documentation of kexec_file_load(2)
    Michael Kerrisk, Vivek Goyal
        Rewrite and extend documentation of kexec_load().


New and changed links
---------------------

kexec_file_load.2
    Michael Kerrisk
        New link to kexec_load.2

Changes to individual pages
---------------------------

personality.2
    Michael Kerrisk
        SEE ALSO: add setarch(8)

prctl.2
    Michael Kerrisk
        Unused arguments of PR_MPX_(EN,DIS}ABLE_MANAGEMENT must be zero

reboot.2
    Michael Kerrisk
        SEE ALSO: add kexec_load(2)

socket.2
    Stephan Mueller
        document AF_ALG
            Add a reference to the AF_ALG protocol accessible via socket(2).

fflush.3
    Michael Kerrisk  [Sergey V. Zubkov]
        Clarify that flushing of input streams occurs only for seekable files
            See https://bugzilla.kernel.org/show_bug.cgi?id=91931
    Michael Kerrisk  [Sergey V. Zubkov]
        POSIX.1-2008 specifies the behavior when flushing input streams
            POSIX.1-2001 did not have a specification for input streams,
            but POSIX.1-2008 added one.

getopt.3
    Michael Kerrisk
        SEE ALSO: add getopt(1)

random.3
    Heinrich Schuchardt
        SEE ALSO: add getrandom(2)

termios.3
    Michael Kerrisk
        SEE ALSO: add reset(1), setterm(1), tput(1)

tzset.3
    J William Piggott
        Document behavior when TZ filespec omits the colon
            If the TZ filespec omits the leading colon, glibc will parse
            it for any valid format, i.e., it will still work.
    J William Piggott
        Add description for posixrules file
    J William Piggott
        Correct system timezone file path
    J William Piggott
        There are only two TZ formats
            tzset(3) currently states that there are three TZ formats. The
            first two it lists are actually variations of the POSIX-style
            TZ format, of which there are at least five variations.

            This patch corrects this to match the POSIX specification of
            TZ having only two formats.
    J William Piggott
        Filespec omitted incorrect
            Paragraph three of the DESCRIPTION section says
            that when TZ is set, but empty, then UTC is used.

            Later it says if the TZ filespec is omitted then the file
            /usr/share/zoneinfo/localtime is used.  This is incorrect,
            it will use UTC in that case as well.
    J William Piggott
        Fix incorrect TZ string representation
            The TZ string representation indicates that the start/end
            rules are required; this is incorrect.
    J William Piggott
        Add ENVIRONMENT section + other rearrangements
            FILES section was overly verbose and included
            environment variables.  Added ENVIRONMENT section,
            removing ENV VARS from the FILES section.

random.4
    Heinrich Schuchardt
        SEE ALSO: add getrandom(2)

passwd.5
    Michael Kerrisk
        SEE ALSO: add chfn(1), chsh(1)

capabilities.7
    Michael Kerrisk
        SEE ALSO: add setpriv(1)

signal.7
    Michael Kerrisk
        Add getrandom(2) to list of restartable system calls
    Michael Kerrisk
        Add F_OFD_SETLKW to list of restartable operations

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
