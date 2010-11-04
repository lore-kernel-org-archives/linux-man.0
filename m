From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.30 released
Date: Thu, 4 Nov 2010 06:23:03 +0100
Message-ID: <AANLkTi=oN7ai8XHBAgmhVFmU9gFkScLVO7U=na0zOpMv@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

 =A0man-pages-3.30.tar.gz - man pages for Linux

This release is now available for download at:

 =A0http://www.kernel.org/pub/linux/docs/man-pages
=A0 or ftp://ftp.kernel.org/pub/linux/docs/man-pages

The online changelog is available at
http://www.kernel.org/doc/man-pages/changelog.html (blogged at
http://linux-man-pages.blogspot.com/2010/11/man-pages-330-is-released.h=
tml
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
releases. =A0If you don't want to receive such messages from me, or you
know of some other translator or maintainer who may want to receive
such notifications, send me a message.

Cheers,

Michael

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Changes in=
 man-pages-3.30 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Released: 2010-11-01, Munich


Contributors
------------

The following people contributed notes, ideas, or patches that have
been incorporated in changes in this release:

Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Bernhard Walle <bernhard-X9USDgGjgfuzQB+pC5nmwQ@public.gmane.org>
David Prevot <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org>
Eric W. Biederman <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
=46lorian Lehmann <flo.lehmann-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Jan Engelhardt <jengelh-nopoi9nDyk+ELgA04lAiVw@public.gmane.org>
Lucian Adrian Grijincu <lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
P=E1draig Brady <P@draigbrady.com>
Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
scarlettsp <scarlettsp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

kexec_load.2
    Andi Kleen
        New page documenting kexec_load(2)
    Michael Kerrisk
        Add license
    Michael Kerrisk
        Incorporate fixes from Eric W. Biederman
            Eric noted that a few instances of "virtual" should
            be "physical" and noted:

                There is an expectation that at hand off from sys_kexec=
 that
                virtual and physical addresses will be identity mapped.=
 But
                this isn't the old Alpha booting convention where you h=
ave
                a virtual address and then you have to parse the page t=
able
                to figure out where your kernel was actually loaded.
    Michael Kerrisk
        Additions and edits by mtk
            Various wording and layout improvements.
            Fixed the name of a constant: s/KEXEC_ARCH_I386/KEXEC_ARCH_=
386/.
            Added RETURN VALUE and ERRORS sections.
            Added VERSIONS section
            Note that CONFIG_KEXEC is needed
            Removed details of using syscall; the reader can find them =
in
            syscall(2).
            Added some details for KEXEC_PRESERVE_CONTEXT.
            Revised the text mentioning the kernel header, since it is
            not yet exported, and it's not certain that it will be.

lio_listio.3
    Michael Kerrisk
        New page documenting lio_listio(3)


Newly documented interfaces in existing pages
---------------------------------------------

reboot.2
    Andi Kleen
        Document LINUX_REBOOT_KEXEC
            Some fix-ups by Michael Kerrisk
    Michael Kerrisk
        Place 'cmd' values in alphabetical order.

unshare.2
    Michael Kerrisk
        Document CLONE_NEWIPC
    Michael Kerrisk
        Document CLONE_NEWNET
    Lucian Adrian Grijincu
        Improve description of CLONE_NEWNET
            CLONE_NEWNET creates a new network namespace from scratch.
            You don't have anything from the old network namespace in
            the new one. Even the loopback device is new.
    Michael Kerrisk
        Document CLONE_SYSVSEM
    Michael Kerrisk
        Document CLONE_NEWUTS
    Michael Kerrisk
        Relocate discussion of CAP_SYS_ADMIN to CLONE_NEWNS section
            And rewrite the EPERM description to be more general in
            preparation for the new flags to be documented.


Global changes
--------------

Various pages
    Michael Kerrisk
        Add reference to feature_test_macros(7)
            Some pages simply list feature test macro requirements in
            the form:

                #define #GNU_SOURCE
                #include <someheader.h>

            For these pages, add a "See feature_test_macros(7)" comment
            on the "#define" line.

Various pages
    Michael Kerrisk
        SEE ALSO: Remove redundant reference to feature_test_macros(7)

Various pages
    David Prevot
        Use greater consistency in NAME line
        (Remove definite article at start of descriptiive clause.)

Various pages
    Michael Kerrisk
        SEE ALSO: Place entries in correct order

Various pages
    Michael Kerrisk
        ERRORS: Place entries in correct order

Various pages
    Michael Kerrisk
        Add section number to references to functions documented in oth=
er pages

Various pages
    Michael Kerrisk
        Remove redundant section number in page references
            Remove section number in function references that are for
            functions documented on this page.

armscii-8.7
iso_8859-3.7
iso_8859-4.7
iso_8859-5.7
iso_8859-6.7
iso_8859-10.7
iso_8859-11.7
iso_8859-13.7
iso_8859-14.7
koi8-u.7
    David Prevot
        Capitalize hexadecimal numbers


Changes to individual pages
---------------------------

access.2
    Michael Kerrisk
        Note use of faccessat(2) for checking symbolic link permissions
    Michael Kerrisk
        Give an example of a safer alternative to using access()

clone.2
    Michael Kerrisk
        Clarify when CLONE_NEWNET implementation was completed

faccessat.2
    Michael Kerrisk
        Note that faccessat() is racy

fcntl.2
    Michael Kerrisk
        RETURN VALUE: Improve description of F_GETFD and F_GETFL

inotify_add_watch.2
    Michael Kerrisk
        Document ENOENT error

mlock.2
    Michael Kerrisk
        Improve wording describing /proc/PID/status /VmLck field
    Michael Kerrisk
        shmctl() SHM_LOCKed memory is not included in VmLck

reboot.2
    Michael Kerrisk
        Place 'cmd' values in alphabetical order

subpage_prot.2
    Michael Kerrisk
        Change 1-line page description
    Michael Kerrisk
        Improvements after review by Paul Mackerras

timer_settime.3
    Michael Kerrisk
        Remove redundant SEE ALSO reference

euidaccess.3
    Michael Kerrisk
        Note the use of faccessat(2) to operate on symbolic links
    Michael Kerrisk
        Note that the use of euidaccess() is racy

fenv.3
    Michael Kerrisk
        Clarify wording relating to glibc version

getgrent.3
getgrent_r.3
getgrnam.3
    Michael Kerrisk
        Refer reader for group(5) for more info on group structure

getopt.3
    Bernhard Walle
        Use constants in getopt_long() example
            The description of getopt_long() mentions the constants
            required_argument, no_argument and optional_argument.
            Use them in the example to make the code easier to understa=
nd.

getpw.3
    Michael Kerrisk
        Change comment describing pw_gecos

getpw.3
getpwent.3
getpwent_r.3
    Michael Kerrisk
        Refer reader to passwd(5) for more info on the passwd structure

getpwent.3
getpwnam.3
    Michael Kerrisk
        Note that pw_gecos is not in POSIX
            And change the comment describing this field

getpwent_r.3
    Michael Kerrisk
        Change comment describing pw_gecos

getpwnam.3
    Michael Kerrisk
        Some rewording and restructuring

sched_getcpu.3
    Michael Kerrisk
        Fix feature test macro requirements

strnlen.3
    Michael Kerrisk
        Fix feature test macro requirements

group.5
    Michael Kerrisk
        Various minor rewordings

hosts.5
protocols.5
spufs.7
termio.7
    David Prevot
        Remove definite article from NAME section
            Please find inline another tiny patch in order to shrink
            the definite article from some other pages (found with
            "rgrep -i ' \\\- the' man*").

passwd.5
    Michael Kerrisk
        Various minor rewordings

proc.5
    Michael Kerrisk
        Add reference to mlock(2) for further info on /proc/PID/status =
VmLck

armscii-8.7
    David Prevot
        Write the character set name as ArmSCII

cp1251.7
    David Prevot
        Capitalize hexadecimal numbers

ip.7
    David Prevot
        Fix name of socket option: s/IP_TTL/IP_TRANSPARENT/
    David Prevot
        Place socket options in alphabetical order

koi8-r.7
    David Prevot
        Fix special character names
            Comparing to koi8-u.7, I noticed some inconsistencies in sp=
ecial
            character names. After checking with the following Unicode =
related
            pages, please find inline (and gzipped attached, hopefully =
not
            messing with encoding), a patch in order to make it right, =
on an
            Unicode point of view.

            http://www.unicode.org/charts/PDF/U2500.pdf
            http://www.unicode.org/charts/PDF/U25A0.pdf
            http://www.unicode.org/charts/PDF/U0080.pdf
            http://www.unicode.org/charts/PDF/U1D400.pdf
    David Prevot
        Fix SEE ALSO reference and letter names
            The koi8-r(7) (Russian Net Character Set) manual page refer=
s
            to iso-8859-7(7) manual page, which is the Latin/Greek one.
            I guess it should refer instead to the iso-8859-5(7)
            (Latin/Cyrillic) one. This is addressed at the end of the p=
atch.

            It has also been spotted that letter names are different in
            this manual page and in the Unicode related page [0], the
            first part of the page address this.

                    0: http://www.unicode.org/charts/PDF/U0400.pdf

man-pages.7
    Michael Kerrisk
        Update example
            The old example used the chmod(2) man page, but the
            feature test macro requirements on that page had changed.
            Update to use an example from a different page (acct(2),
            whose feature test macro requirements are probably unlikely
            to change in the future).


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
