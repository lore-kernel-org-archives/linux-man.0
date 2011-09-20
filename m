From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.33 released
Date: Tue, 20 Sep 2011 12:48:39 +0200
Message-ID: <CAKgNAkgL0U2MsH6FtwF07khgqVTtmXur8YBjdmS1_J8JNmw+Yg@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

 man-pages-3.33.tar.gz - man pages for Linux

Because of the kernel.org problems, the release artifacts are in
different locations than usual (and some of these changes may become
permanent):

This release tarball is available for download at:

    http://man7.org/linux/man-pages/download/man-pages-3.33.tar.gz

The online changelog is available at
http://man7.org/linux/man-pages/changelog.html#release_3.33 (blogged at
http://linux-man-pages.blogspot.com/2011/09/man-pages-333-is-released.html
) and the current version of the pages is browsable at
http://man7.org/linux/man-pages/

A git repository for man-pages can be found on github. You can clone
the repository with the command:

    git clone git-9UaJU3cA/F/QT0dZR+AlfA@public.gmane.org:mkerrisk/man-pages.git

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

==================== Changes in man-pages-3.33 ====================

Released: 2011-09-16, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes and ideas that have been
incorporated in changes in this release:

Akira Fujita <a-fujita-cUW4a6blu5N8UrSeD/g0lQ@public.gmane.org>
Alexander Schuch <Alex.Schuch-Mmb7MZpHnFY@public.gmane.org>
Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Brian M. Carlson <sandals-spVehEqlxw627WubY2PhZeTW4wlIGRCZ@public.gmane.org>
Dan Jacobson <jidanni-8D0D3YcSAvhAfugRpC6u6w@public.gmane.org>
Folkert van Heusden <folkert.mobiel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Graham Gower <graham.gower-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Hendrik Jan Thomassen <hjt-I2/4/b2VdYhUecB6AVeNQA@public.gmane.org>
Jan Engelhardt <jengelh-nopoi9nDyk+ELgA04lAiVw@public.gmane.org>
Joey Adams <joeyadams3.14159-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Johannes Laire <johannes-Dl1KTzG68bE@public.gmane.org>
Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>
Konstantin Ritt <ritt.ks-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Luis Javier Merino <ninjalj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Mikel Ward <mikel-pSK+WyAkGS32eFz/2MeuCQ@public.gmane.org>
Nick Black <dankamongmen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Paul Evans <leonerd-1IFLfc+FfvwDXYZnReoRVg@public.gmane.org>
Petr Pisar <ppisar-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Przemyslaw Pawelczyk <przemyslaw-2n1A7tesdGYx9gSFJV9Cjg@public.gmane.org>
Regid Ichira <regid23-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
Richard B. Kreckel <kreckel-HEL5OUoDxoc@public.gmane.org>
Ryan Mullen <rmmullen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sebastian Geiger <sbastig-hi6Y0CQ0nG0@public.gmane.org>
Sebastian Unger <sebunger-hi6Y0CQ0nG0@public.gmane.org>
Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Serge E. Hallyn <serge.hallyn-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Simon Cross <hodgestar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Stan Sieler <sieler-BUHhN+a2lJ4@public.gmane.org>
Timmy Lee <scuttimmy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Tolga Dalman <tolga.dalman-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Tomislav Jonjic <jonjic-iEixELS/QsY1GQ1Ptb7lUw@public.gmane.org>
Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Wei Luosheng <weiluosheng001-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Apologies if I missed anyone!


Newly documented interfaces in existing pages
---------------------------------------------

sync.2
    Michael Kerrisk
        Added new syncfs() system call
            syncfs() was added in Linux 2.6.39.


New and changed links
---------------------

syncfs.2
    Michael Kerrisk
        New link for sync(2).


Global changes
--------------

Various pages
    Simon Paillard
        Global fix:  properly escape minus sign


Changes to individual pages
---------------------------

clone.2
    Michael Kerrisk
        Note that CLONE_STOPPED was removed in 2.6.38

execve.2
    Michael Kerrisk  [Sebastian Geiger]
        Note that the first argv[] value should contain name of executable

fcntl.2
    Michael Kerrisk  [Reuben Thomas]
        Note that F_GETFL also retrieves file access mode

getrlimit.2
    Michael Kerrisk  [Ryan Mullen]
        Remove mention of kernel versions in discussion RLIMIT_CPU
    Michael Kerrisk  [Seonghun Lim]
        Fix example program and add _FILE_OFFSET_BITS requirement

mlock.2
    Michael Kerrisk  [Brian M. Carlson]
        Clarify EINVAL error
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?625747
    Michael Kerrisk  [Seonghun Lim]
        Simplify and correct text for EPERM error

mprotect.2
    Seonghun Lim
        fix off-by-one error in a memory range
    Seonghun Lim
        Fix small bug in example program
            The description of the example program says that it makes the
            third page "read-only". Thus use PROT_READ instead of PROT_NONE.

open.2
    Folkert van Heusden
        Remove text describing O_CLOEXEC as Linux-specific
            O_CLOEXEC is specified in POSIX.1-2008, as noted
            elsewhere in the page.

readlink.2
    Michael Kerrisk  [Dan Jacobson]
        SEE ALSO: Add readlink(1)

sendfile.2
    Akira Fujita
        Since 2.6.33, 'out_fd' can refer to any file type
            Linux kernel commit cc56f7de7f00d188c7c4da1e9861581853b9e92f
            meant sendfile(2) can work with any output file.
    Michael Kerrisk
        Shift text on falling back to read()/write() to NOTES
    Michael Kerrisk  [Tolga Dalman]
        Remove mention of kernel version for 'in_fd' argument
    Tolga Dalman
        Add an explicit reference to splice(2)
            Unlike sendfile(), splice() can transfer data
            between a pair of sockets.

sigaction.2
    Michael Kerrisk  [Tolga Dalman]
        Add a little info about ucontext_t

stat.2
    Michael Kerrisk  [Jon Grant]
        Small rewording of ENAMETOOLONG error

sync.2
    Michael Kerrisk
        Some rewrites to description of sync()

syscalls.2
    Michael Kerrisk
        Added fanotify_init() and fanotify_mark() to syscall list
    Michael Kerrisk
        Added new 2.6.39 system calls
    Michael Kerrisk
        Updated for Linux 3.0 system calls
    Michael Kerrisk
        Update kernel version at head of syscall list
    Michael Kerrisk
        Update to mention 3.x kernel series

syslog.2
    Michael Kerrisk  [Serge E. Hallyn]
        Update for kernel 2.6.37 changes
            Document /proc/sys/kernel/dmesg_restrict.
            Document CAP_SYSLOG.

time.2
    Michael Kerrisk  [Alexander Schuch]
        NOTES: Fix description of "Seconds since the Epoch"

timerfd_create.2
    Michael Kerrisk  [Josh Triplett]
        Note behavior when timerdfd_settime() old_value is NULL
        See http://bugs.debian.org/cgi-bin/bugreport.cgi?641513
    Tomislav Jonjic
        Fix small error in description of timerfd_settime()

truncate.2
    Seonghun Lim
        Remove redundant EINTR description

unlink.2
    Hendrik Jan Thomassen
        Improve EBUSY description

cacos.3
cacosh.3
catan.3
catanh.3
    Michael Kerrisk  [Richard B. Kreckel, Andries Brouwer]
        Fix formula describing function
            The man pages for cacos(), cacosh(), catan(), catanh()
            contain incorrect formulae describing the functions.

cacos.3
    Michael Kerrisk
        Add example program

cacosh.3
    Michael Kerrisk
        Add example program

cacosh.3
casinh.3
catan.3
catanh.3
    Michael Kerrisk
        SEE ALSO: Add reference to inverse function

catan.3
    Michael Kerrisk
        Add example program

catanh.3
    Michael Kerrisk
        Add example program

ccos.3
ccosh.3
csin.3
csinh.3
ctan.3
ctanh.3
    Michael Kerrisk
        SEE ALSO Add reference to "arc" inverse function

cexp.3
    Michael Kerrisk
        SEE ALSO: add cexp(3)

clog.3
    Michael Kerrisk
        SEE ALSO: Add reference to clog(2)

crypt.3
    Michael Kerrisk  [Jan Engelhardt]
        Fix header file and feature test macro requirements for crypt_r()

err.3
    Seonghun Lim
        Clean up description of error message source
            In the second paragraph of DESCRIPTION section, one of the
            sources of error messages is incorrect: the four functions obtain
            error message only from errno, and "a code" is just relevant
            with errc() and warnc(), which are not present on Linux.
            see http://www.unix.com/man-page/freebsd/3/ERR/ .

            Then, the third paragraph becomes a duplicate.

fflush.3
    Regid Ichira
        Fix wording error
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?614021

hsearch.3
    Seonghun Lim
        Update ERRORS section
            EINVAL can occur for hdestroy_r().
            EINVAL can't occur for hcreate().
            Other minor fixes.

lockf.3
    Michael Kerrisk  [Mikel Ward]
        ERRORS: EBADF can also occur for nonwritable file descriptor
            As noted in the DESCRIPTION, the file descriptor must be writable
            in order to place a lock.

malloc.3
    Seonghun Lim
        Reorder prototypes in SYNOPSIS
            calloc() comes before realloc() in the other sections,
            so should do in SYNOPSIS, too.

mbstowcs.3
    Michael Kerrisk
        SEE ALSO: add reference to wcstombs(3)

memcmp.3
    Michael Kerrisk  [Sebastian Unger]
        Clarify that comparison interprets bytes as "unsigned char"

realpath.3
    Michael Kerrisk  [Seonghun Lim]
        Fix EINVAL error
            Since glibc 2.3, resolved_path can be non-NULL (with the
            semantics already documented in the page).

scandir(3)
    Mike Frysinger
        Add ENOENT/ENOTDIR errors

siginterrupt.3
    Michael Kerrisk  [Luis Javier Merino]
        Remove misleading sentence about signal(2) and system call interruption

strlen.3
    Michael Kerrisk  [Jon Grant]
        SEE ALSO: Add strnlen(3)

strnlen.3
    Michael Kerrisk  [Jon Grant]
        CONFORMING TO: Note that strnlen() is in POSIX.1-2008

strtoul.3
    Michael Kerrisk  [Tolga Dalman]
        Fix NOTES section constants

termios.3
    Michael Kerrisk
        Use "terminal special characters" consistently throughout page
    Michael Kerrisk  [Paul Evans]
        Add documentation of _POSIX_VDISABLE
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=627841
    Michael Kerrisk
        Add a description of STATUS character
    Michael Kerrisk
        Added description of SWTCH character
    Michael Kerrisk
        Add names of terminal special characters
    Michael Kerrisk
        List terminal special characters in alphabetical order

wcstombs.3
    Michael Kerrisk
        SEE ALSO: add mbstowcs(3)

console_codes.4
    Petr Pisar
        Add ESC [ 3 J
            Linux 3.0 (commit f8df13e0a901fe55631fed66562369b4dba40f8b)
            implements \E[3J to allow scrambling content of console
            including scroll-back buffer
            (http://thread.gmane.org/gmane.linux.kernel/1125792).

proc.5
    Michael Kerrisk  [Stan Sieler]
        Add description of 'PPid' field of /proc/PID/status
    Michael Kerrisk  [Stan Sieler]
        Add description of 'SigQ' field of /proc/PID/status

capabilities.7
    Michael Kerrisk  [Serge E. Hallyn]
        Document CAP_SYSLOG and related changes in Linux 2.6.37
    Michael Kerrisk
        File capabilities are no longer optional
            Starting with Linux 2.6.33, the CONFIG_SECURITY_FILE_CAPABILITIES
            has been removed, and file capabilities are always part of the
            kernel.

complex.7
    Michael Kerrisk
        Updated SEE ALSO list to include all complex math functions

ipv6.7
    Michael Kerrisk  [Simon Cross]
        Fix description of address notation: "8 4-digit hexadecimal numbers"

signal.7
    Seonghun Lim
        Remove crufty repeated info about LinuxThreads

unix.7
    Michael Kerrisk
        Add pointer to cmsg(3) for an example of use of SCM_RIGHTS


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
