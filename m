From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.38 released
Date: Thu, 12 Apr 2012 07:33:22 +1200
Message-ID: <CAKgNAkggCvSPvvcNDBs0+PwA2bmhCHcRwR+kTDO2=ai97LfPZQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

  man-pages-3.38.tar.gz - man pages for Linux

Tarball download:
  http://www.kernel.org/doc/man-pages/download.html
Git repository:
  http://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
Online changelog:
  http://man7.org/linux/man-pages/changelog.html#release_3.38

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2012/03/man-pages-338-is-released.h=
tml

The current version of the pages is browsable at:
http://man7.org/linux/man-pages/

You are receiving this message either because:

a) You contributed to the content of this release.

b) You are subscribed to linux-man-u79uwXL29TaiAVqoAR/hOA@public.gmane.org

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Changes in=
 man-pages-3.38 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2012-03-25, Christchurch


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Artyom Pervukhin <artyom-mKnqvlXXQCMvJsYlp49lxw@public.gmane.org>
Be=F2as Petr <xbenas00-qjZHU19XGF/maGwbMATS8qVXKuFTiq87@public.gmane.org>
Ben Bacarisse <software-QW8DL1zPdzBaa/9Udqfwiw@public.gmane.org>
Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
David Pr=E9vot <david-EYFo4vFR6XNAfugRpC6u6w@public.gmane.org>
Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Denys Vlasenko <vda.linux-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Eric Blake <ebb9-PGZyUNKar/Q@public.gmane.org>
Iain Fraser <iainkfraser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Justin T Pryzby <justinp-sqUMWyTXAylY7ZOgVWywrQ@public.gmane.org>
Kirill Brilliantov <brilliantov-aPYA7nAdAYY@public.gmane.org>
Mark R Bannister <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>
Matthew Gregan <kinetik-QufbIeIr5AY@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Nix <nix-dKoSMcxRz+Te9xe1eoZjHA@public.gmane.org>
Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sergei Zhirikov <sfzhi-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

get_nprocs_conf.3
    Be=F2as Petr
        New page documenting get_nprocs_conf(3) and get_nprocs(3)
    Michael Kerrisk
        Some additions and improvements

malloc_get_state.3
    Michael Kerrisk
        New page documenting malloc_get_state(3) and malloc_set_state(3=
)

mallopt.3
    Michael Kerrisk
        New man page for mallopt(3)

mtrace.3
    Michael Kerrisk
        Complete rewrite of page, adding much more detail

scandirat.3
    Mark R Bannister
        New page for scandirat(3) (new in glibc 2.15)


Newly documented interfaces in existing pages
---------------------------------------------

posix_memalign.3
    Michael Kerrisk
        Document aligned_alloc(3)
            aligned_alloc() is new in C11.
    Michael Kerrisk
        Document pvalloc(3)

qsort.3
    Mark R Bannister
        Add documentation of qsort_r(3)
    Ben Bacarisse
        Improvements to Mark R Bannister's qsort_r() patch
    Michael Kerrisk
        Add VERSIONS section for qsort_r()


New and changed links
---------------------

aligned_alloc.3
    Michael Kerrisk
        New link to posix_memalign.3

get_nprocs.3
    Be=F2as Petr
        Link to new get_nprocs_conf.3 page

malloc_set_state.3
    Michael Kerrisk
        Link to new malloc_get_state.3 page

pvalloc.3
    Michael Kerrisk
        New link to posix_memalign.3


Global changes
--------------

Various pages
    Michael Kerrisk
        Global formatting fix: balance .nf/.fi pairs

Various pages
    Michael Kerrisk
        Global fix: place sections in correct order

Various pages
    Michael Kerrisk  [Justin T Pryzby]
        Global fix: Remove duplicated words
            Remove instances of duplicate words found using Justin's
            grep-fu:

                for f in man?/*.[1-9]; do
                    grep -HE ' ([[:alpha:]]{2,} +)\1' "$f" |
                        grep -Evw '(proc|hugetlbfs|XXX*|root|long) *\1'=
;
                done | grep -E --colo ' ([[:alpha:]]{2,} +)\1'

Various pages
    Michael Kerrisk
        Correct order of SEE ALSO entries


Changes to individual pages
---------------------------

futimesat.2
    Michael Kerrisk
        PROTOTYPE: Correct header file and feature test macro requireme=
nts

keyctl.2
    Bjarni Ingi Gislason
        Strip trailing tabs from source line
            See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D6646=
88

ptrace.2
    Denys Vlasenko
        Document PTRACE_GETEVENTMSG for PTRACE_EVENT_EXEC
    Denys Vlasenko
        Various fixes to recent updates of this page

symlinkat.2
    Michael Kerrisk  [Eric Blake]
        PROTOTYPE: Correct header file

syscalls.2
    Michael Kerrisk
        Remove unimplemented system calls from main syscall list
            The unimplemented system calls are in any case noted lower =
down
            in the page. Also: rearrange the text describing the unimpl=
emented
            system calls.
    Michael Kerrisk
        Note a few system calls that were removed in Linux 2.6
    Michael Kerrisk
        Add process_vm_readv(2) and process_vm_writev(2)

unlinkat.2
    Michael Kerrisk  [Eric Blake]
        PROTOTYPE: Correct header file
    Michael Kerrisk
        PROTOTYPE: Add <fcntl.h> for AT_* constants

utimensat.2
    Michael Kerrisk
        PROTOTYPE: Add <fcntl.h> for AT_* constants

copysign.3
    Michael Kerrisk  [Tolga Dalman]
        DESCRIPTION: Add a couple of examples

malloc.3
    Michael Kerrisk
        NOTES: Add a short discussion of arenas
    Michael Kerrisk
        Replace discussion of MALLOC_CHECK_ with pointer to mallopt(3)
    Michael Kerrisk
        SEE ALSO: Add mtrace(3)
        SEE ALSO: add malloc_get_state(3)

posix_memalign.3
    Michael Kerrisk
        Rename memalign() argument
            Rename "boundary" to "alignment" for consistency
            with posix_memalign().
    Michael Kerrisk
        Improve discussion of feature test macros and header files for =
valloc(3)

rtnetlink.3
    Kirill Brilliantov  [Sergei Zhirikov]
        Fix example code, rta_len assignment should use RTA_LENGTH()
            See also http://bugs.debian.org/655088

scandir.3
    Mark R Bannister
        SEE ALSO: Add scandirat(3)

sigqueue.3
    Nix
        Remove rt_sigqueueinfo from TH line
            rt_sigqueueinfo() now has its own manual page, so should no=
t
            be listed in the .TH line of this page.

tzset.3
    Peter Schiffer
        Correct description for Julian 'n' date format
            The Julian 'n' date format counts starting from 0, not 1.
    Michael Kerrisk
        Add some clarifying remarks to discussion of Julian day formats

packet.7
    Michael Kerrisk  [Iain Fraser]
        Fix comment on 'sll_hatype' field

tcp.7
    Michael Kerrisk  [Artyom Pervukhin]
        Correct RFC for TIME_WAIT assassination hazards


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
