From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.37 released
Date: Sat, 10 Mar 2012 06:28:14 +1300
Message-ID: <CAKgNAkjJSkf68TG2A5Ls9H8XoaaOuh44H4M7xJCWH_yRUgBpEQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

   man-pages-3.37.tar.gz - man pages for Linux

Tarball download:
   http://www.kernel.org/pub/linux/docs/man-pages/
Git repository:
   http://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
Online changelog:
   http://man7.org/linux/man-pages/changelog.html#release_3.37

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2012/03/man-pages-337-is-released.html

The current version of the pages is browsable at:
http://man7.org/linux/man-pages/

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


==================== Changes in man-pages-3.37 ====================

Released: 2012-03-06, Christchurch


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Mark R. Bannister <cambridge-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

getent.1
    Mark R. Bannister
        New page to document 'getent' binary provided by glibc


Changes to individual pages
---------------------------

bdflush.2
    Michael Kerrisk
        Note that bdflush() is deprecated, and does nothing

nfsservctl.2
    Michael Kerrisk
        Note that this system call was removed in Linux 3.1

ptrace.2
    Denys Vlasenko  [Oleg Nesterov, Tejun Heo]
        add extended description of various ptrace quirks
            Changes include:

            s/parent/tracer/g, s/child/tracee/g - ptrace interface now
            is sufficiently cleaned up to not treat tracing process
            as parent.

            Deleted several outright false statements:
            - pid 1 can be traced
            - tracer is not shown as parent in ps output
            - PTRACE_ATTACH is not "the same behavior as if tracee had done
              a PTRACE_TRACEME": PTRACE_ATTACH delivers a SIGSTOP.
            - SIGSTOP _can_ be injected.
            - Removed mentions of SunOS and Solaris as irrelevant.
            - Added a few more known bugs.

            Added a large block of text in DESCRIPTION which doesn't focus
            on mechanical description of each flag and operation, but rather
            tries to describe a bigger picture. The targeted audience is
            a person which is reasonably knowledgeable in Unix but did not
            spend years working with ptrace, and thus may be unaware of its
            quirks. This text went through several iterations of review by
            Oleg Nesterov and Tejun Heo.
            This block of text intentionally uses as little markup as possible,
            otherwise future modifications to it will be very hard to make.
    Michael Kerrisk
        Global clean-up of page
            * Wording and formatting fixes to existing text and
              Denys Vlasenko's new text.
            * Various technical amendments and improvements to
              Denys Vlasenko's new text.
            * Added FIXME for various problems with the current text.
    Michael Kerrisk
        Integrated changes after further review from Denys Vlasenko

syscalls.2
    Michael Kerrisk
        Note that nfsservctl(2) was removed in Linux 3.1
        Note that bdflush(2) is deprecated

capabilities.7
    Michael Kerrisk
        Add CAP_WAKE_ALARM
    Michael Kerrisk
        Add various operations under CAP_SYS_ADMIN
        Add perf_event_open(2) to CAP_SYS_ADMIN
        Add VM86_REQUEST_IRQ vm86(2) command to CAP_SYS_ADMIN
        Update CAP_NET_ADMIN with notes from include/linux/capability.h
        Add nfsservctl(2) to CAP_SYS_ADMIN
    Michael Kerrisk
        Add ioctl(FIBMAP) under CAP_SYS_RAWIO
    Michael Kerrisk
        Add virtual terminal ioctl()s under CAP_SYS_TTY_CONFIG
    Michael Kerrisk
        Update CAP_NET_RAW with notes from include/linux/capability.h
    Michael Kerrisk
        Add F_SETPIPE_SZ case to CAP_SYS_RESOURCE
        Add POSIX messages queues queues_max case to CAP_SYS_RESOURCE
        Update CAP_SYS_RESOURCE with notes from include/linux/capability.h
    Michael Kerrisk
        SEE ALSO: Add libcap(3)

ld.so.8
    Michael Kerrisk
        Add --audit command-line option

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
