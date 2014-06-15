From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.69 released
Date: Sun, 15 Jun 2014 21:55:51 +0200
Message-ID: <539DFA47.5030409@gmail.com>
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

    man-pages-3.69 - man pages for Linux

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.69

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2014/06/man-pages-369-is-released.html

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



==================== Changes in man-pages-3.69 ====================

Released: 2014-06-14, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Jeff Layton <jlayton-vpEMnDpepFuMZCB2o+C8xQ@public.gmane.org>
Kirill A. Shutemov <kirill.shutemov-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
KOSAKI Motohiro <kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Petr Gajdos <pgajdos-AlSwsSmVLrQ@public.gmane.org>
Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Vasiliy Kulikov <segoon-cxoSlKxDwOJWk0Htik3J/w@public.gmane.org>
Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>
Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

iconv.1
    Marko Myllynen  [Michael Kerrisk]
        New page for the iconv(1) command

iconvconfig.8
    Marko Myllynen
        New page for iconvconfig(8)


Newly documented interfaces in existing pages
---------------------------------------------

fcntl.2
    Jeff Layton, Michael Kerrisk
        Document open file description locks
            As provided by the fcntl() operations F_OFD_SETLK,
            F_OFD_SETLKW, and F_OFD_GETLK


Changes to individual pages
---------------------------

locale.1
    Marko Myllynen
        Add FILES section, add charmap(5) reference
    Marko Myllynen
        Align with recent charmap(5) / repertoiremap(5) changes

execve.2
    Michael Kerrisk  [NeilBrown]
        Before kernel 2.6.0, RLIMIT_NPROC had no effect for set*uid()
    Michael Kerrisk  [Vasiliy Kulikov]
        RLIMIT_NPROC is checked only if preceded by set*uid()
    Michael Kerrisk  [Vasiliy Kulikov, NeilBrown, KOSAKI Motohiro]
        Document EAGAIN error
            See also https://bugzilla.kernel.org/show_bug.cgi?id=42704

fcntl.2
    Michael Kerrisk
        Detail the limitations of traditional (process-associated) locks
    Michael Kerrisk  [Jeff Layton]
        Describe how to check whether the kernel supports a particular command
    Michael Kerrisk
        ERRORS: add EINVAL for invalid 'cmd'
    Michael Kerrisk
        Add para introducing advisory locks and noting existence of OFD locks
    Michael Kerrisk  [Jeff Layton]
        Add notes on F_SETLKW deadlock detection and its limitations
    Michael Kerrisk
        Add an explicit note that mandatory locking is not in POSIX
    Michael Kerrisk
        Rewrite introductory paragraphs on mandatory locking
            Make the structure more logical, and also explicitly mention
            OFD locks.
    Michael Kerrisk  [Jeff Layton]
        Reword discussion of mandatory lock bug a little
            Jeff Layton confirmed that the bug remains even in modern kernels.
    Michael Kerrisk
        Explain POSIX background to EACCES/EAGAIN error for F_GETLK
    Michael Kerrisk
        Add NOTES subhead for record locking and NFS
    Michael Kerrisk  [NeilBrown]
        Note treatment of locks when an NFS client loses contact with the server
    Michael Kerrisk  [NeilBrown]
        Refine discussion of locks when NFSv4 client loses contact with server
    Michael Kerrisk  [Jeff Layton]
        nfsv4leasetime controls the "contact lost" interval for NFSv4
            Jeff Layton:

flock.2
    Michael Kerrisk
        In some modern BSDs, fcntl() and flock() locks do interact
            So, reword and extend the discussion of this topic in NOTES.
    Michael Kerrisk
        Move NOTES text describing implementation of flock()
    Michael Kerrisk  [NeilBrown]
        Add more details on NFS, including Linux 2.6.37 changes
            Also: move NOTES text describing interaction of fcntl()
            and flock() locks.

fork.2
    Michael Kerrisk
        Add notes on inheritance of flock() and OFD locks across fork()

lseek.2
    Michael Kerrisk
        Add reference to open(2) for discussion of file descriptors and OFDs

open.2
    Michael Kerrisk
        Rework and extend the discussion of open file descriptions

open_by_handle_at.2
    Rasmus Villemoes
        Add reference to feature_test_macros(7)

recvmmsg.2
    Rasmus Villemoes
        Add reference to feature_test_macros(7)

remap_file_pages.2
    Michael Kerrisk  [Kirill A. Shutemov]
        Note that remap_file_pages() is deprecated

sendmmsg.2
    Rasmus Villemoes
        Add reference to feature_test_macros(7)

seteuid.2
    Michael Kerrisk
        seteuid() and setegid() are implemented as library functions
    Michael Kerrisk
        Error checking should always be performed, even when caller is UID 0

setresuid.2
    Michael Kerrisk
        Document EAGAIN error that can occur after kernel alloc_uid() failure
    Michael Kerrisk
        Since Linux 3.1, the EAGAIN case for RLIMIT_NPROC no longer occurs
    Michael Kerrisk
        Correct the description of the EAGAIN error
    Michael Kerrisk
        Error checking should always be performed, even when caller is UID 0

setreuid.2
    Michael Kerrisk
        Document EAGAIN error that can occur after kernel alloc_uid() failure
    Michael Kerrisk
        Error checking should always be performed, even when caller is UID 0
    Michael Kerrisk
        Add EAGAIN error for hitting RLIMIT_NPROC limit
    Michael Kerrisk
        Since Linux 3.1, the EAGAIN case for RLIMIT_NPROC no longer occurs

setuid.2
    Michael Kerrisk
        Document EAGAIN error that can occur after kernel alloc_uid() failure
    Michael Kerrisk
        Correct the description of the EAGAIN error
    Michael Kerrisk
        Error checking should always be performed, even when caller is UID 0
    Michael Kerrisk
        Since Linux 3.1, the EAGAIN case for RLIMIT_NPROC no longer occurs

statfs.2
    Cyril Hrubis
        Update MAGIC constants
            Most of the updates are taken from /usr/include/linux/magic.h,
            some were found by grepping the Linux source code.
    Cyril Hrubis  [Michael Kerrisk]
        fstatfs(2) was broken on file descriptors from pipe(2)

syscalls.2
    Michael Kerrisk
        Note that remap_file_pages() is deprecated

basename.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions basename() and dirname() are thread safe.

catgets.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function catgets() is thread safe.

getdate.3
    Rasmus Villemoes
        Use blank definition of _GNU_SOURCE in example program

getdirentries.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function getdirentries() is thread safe.

getdtablesize.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function getdtablesize() is thread safe.

iconv.3
    Qian Lei  [Peng Haitao]
        ATTRIBUTES: Note function that is thread-safe
            The function iconv() is thread safe.
    Michael Kerrisk
        SEE ALSO: add iconvconfig(8)

lockf.3
    Qian Lei  [Peng Haitao]
        ATTRIBUTES: Note function that is thread-safe
            The function lockf() is thread safe.

malloc_get_state.3
    Rasmus Villemoes
        SYNOPSIS: use correct header
            The nonstandard functions malloc_set_state() and
            malloc_get_state() are provided by <malloc.h> not <stdlib.h>.

malloc_usable_size.3
    Qian Lei
        ATTRIBUTES: Note function that is thread-safe
            The function malloc_usable_size() is thread safe.

matherr.3
    Qian Lei  [Peng Haitao]
        ATTRIBUTES: Note function that is thread-safe
            The function matherr() is thread safe.

mkdtemp.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function mkdtemp() is thread safe.

mkstemp.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions mkstemp(), mkostemp(), mkstemps() and mkostemps()
            are thread safe.

mq_close.3
    Qian Lei
        ATTRIBUTES: Note function that is thread-safe
            The function mq_close() is thread safe.

mq_getattr.3
    Qian Lei
        ATTRIBUTES: Note function that is thread-safe
            The functions mq_getattr() and mq_setattr() are thread safe.

mq_open.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function mq_open() is thread safe.

mq_receive.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions mq_receive() and mq_timedreceive() are thread safe.

mq_send.3
    Peng Haitao
        ATTRIBUTES: Note functions that are thread-safe
            The functions mq_send() and mq_timedsend() are thread safe.

mq_unlink.3
    Qian Lei
        ATTRIBUTES: Note function that is thread-safe
            The function mq_unlink() is thread safe.

posix_fallocate.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function posix_fallocate() is thread safe.

posix_openpt.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function posix_openpt() is thread safe.

siginterrupt.3
    Peng Haitao
        ATTRIBUTES: Note function that is not thread-safe
            The function siginterrupt() is not thread safe.

system.3
    Peng Haitao
        ATTRIBUTES: Note function that is thread-safe
            The function system() is thread safe.

charmap.5
    Marko Myllynen
        Update to match current glibc
            charmap(5) was outdated, bring it to closer to reality by fixing
            syntax descriptions to match current glibc code and practices,
            adding missing options, removing obsolete comments and references,
            and removing now incorrect examples.

locale.5
    Marko Myllynen
        Clarify AM/PM settings a bit
            localedef(1) complains if really undefined, should be empty instead.
            Also: add some SEE ALSO references.
    Marko Myllynen
        Document glibc conventions regarding days and week
            Based on existing practice and glibc community wiki page at
            https://sourceware.org/glibc/wiki/Locales

proc.5
    Michael Kerrisk  [Jan Chaloupka, Walter Harms]
        Add a brief description of /proc/fs

repertoiremap.5
    Marko Myllynen
        New page for repertoiremap(5)
            Rather obsolete feature but localedef(1) refers to repertoiremaps.

bootparam.7
    Petr Gajdos
        Describe 'rootflags' and 'rootdelay' kernel parameters
            Patch based on text from Documentation/kernel-parameters.txt

charsets.7
    Marko Myllynen
        Update to reflect past developments
            Rewrite the introduction to make Unicode's prominence more obvious.
            Reformulate parts of the text to reflect current Unicode world.
            Minor clarification for ASCII/ISO sections, some other minor fixes.
    Marko Myllynen
        List CJK encodings in the order of C, J, K

environ.7
    Michael Kerrisk
        SEE ALSO: add env(1), printenv(1), ld.so(8)

locale.7
    Marko Myllynen
        Add some SEE ALSO references

man-pages.7
    Michael Kerrisk
        Note that .TH 'date' field is nowadays automatically updated by scripts

signal.7
    Michael Kerrisk
        Describe EINTR semantics for recvmmsg(2)
    Michael Kerrisk
        Clarify text describing EINTR semantics for socket interfaces

unicode.7
    Marko Myllynen
        Update to reflect past developments
            The unicode(7) page will look more modern with few small changes:

            - drop old BUGS section, editors cope with UTF-8 ok these days,
              and perhaps the state-of-the-art is better described elsewhere
              anyway than in a man page
            - drop old suggestion about avoiding combined characters
            - refer to LANANA for Linux zone, add registry file reference
            - drop a reference to an inactive/dead mailing list
            - update some reference URLs

utf-8.7
    Marko Myllynen
        Drop an old comment about UTF-8 replacing ISO 8859
            And add locale(1) under SEE ALSO.

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
