From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: man-pages-3.08 released
Date: Wed, 27 Aug 2008 16:32:37 +0200
Message-ID: <48B56585.7040002@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerrit Renker <gerrit-VsoRXqaLlyfQzY9nttDBhA@public.gmane.org>, Li Zefan <lizf-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Mike Bianchi <MBianchi-GOv4aqOel1DQT0dZR+AlfA@public.gmane.org>, Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>, Venkatesh Srinivas <me-YxllIAoeIHiVc3sceRu5cw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, base-system-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org, Christophe-MeO/4o4RY/8dnm+yROfE0A@public.gmane.org, Ivana Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Eduardo Madeira Fleury <efleury-xuelUoVDAHHQT0dZR+AlfA@public.gmane.org>, manpages-fr maintainer <manpagesfr-GANU6spQydw@public.gmane.org>, =?ISO-8859-1?Q?Giulio_Dap?= =?ISO-8859-1?Q?rel=E0?= <giulio-pvpjhgE6P/E@public.gmane.org>, "Martin (Joey) Schulze" <joey-1lCxjdRlhQ9g9hUCZPvPmw@public.gmane.org>, Thorsten Kukuk <kukuk-l3A5Bk7waGM@public.gmane.org>, Mohsen Pahlevanzadeh <mohsen-iPr4nGsj6FvziFbYTSYfcdi2O/JbrIOy@public.gmane.org>, Alain Portal <alain.portal-CD6X2pywdrkGaKE8qFNMvg@public.gmane.org>, Subrata Modak <subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, ro-l3A5Bk7waGM@public.gmane.org, Aleksandr Blokhin <sass-u2l5PoMzF/Uox3rIn2DAYQ@public.gmane.org>, Senthil Kumar <senthilkumar_sen-ktR7oAotx3zQT0dZR+AlfA@public.gmane.org>, Stefan Puiu <stefanpuiuro-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, Kaveh Mousavi <kavehmz-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Stepan Kasal <kasal-+ZI9xUNit7I@public.gmane.org>, Elisa <lab-LS/GNBF6ldo@public.gmane.org>, "Michael Kerrisk (gmail)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jim Zemlin <jzemlin-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

     man-pages-3.08.tar.gz - man pages for Linux

This release is now available for download at:

     http://www.kernel.org/pub/linux/docs/man-pages
     or ftp://ftp.kernel.org/pub/linux/docs/man-pages

The online changelog is available at
http://www.kernel.org/doc/man-pages/changelog.html
(blogged at
http://linux-man-pages.blogspot.com/2008/08/man-pages-308-is-released.html)

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


==================== Changes in man-pages-3.08 ====================

Released: 2008-08-27, Zurich


Contributors
------------

The following people contributed notes, ideas, or patches that have
been incorporated in changes in this release:

Gerrit Renker <gerrit-VsoRXqaLlyfQzY9nttDBhA@public.gmane.org>
Li Zefan <lizf-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Mike Bianchi <MBianchi-GOv4aqOel1DQT0dZR+AlfA@public.gmane.org>
Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Venkatesh Srinivas <me-YxllIAoeIHiVc3sceRu5cw@public.gmane.org>
Vijay Kumar <vijaykumar-NDm7FNP0skFg9hUCZPvPmw@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

getnetent_r.3
     mtk
         Documents getnetent_r(), getnetbyname_r(),
         and getnetbyaddr_r(), the reentrant equivalents of
         getnetent(), getnetbyname(), and getnetbyaddr().

getprotoent_r.3
      mtk
         Documents getprotoent_r(), getprotobyname_r(), and
         getprotobynumber_r(), the reentrant equivalents of
         getprotoent(), getprotobyname(), and getprotobynumber().

getrpcent_r.3
      mtk
         Documents getrpcent_r(), getrpcbyname_r(), and
         getrpcbynumber_r(), the reentrant equivalents of
         getrpcent(), getrpcbyname(), and getrpcbynumber().

getservent_r.3
      mtk
         Documents getservent_r(), getservbyname_r(), and
         getservbyport_r(), the reentrant equivalents of
         getservent(), getservbyname(), and getservbyport().

numa.7
     mtk
         A new page giving overview details for the Linux NUMA interfaces.
         Incorporates some material from mbind.2, and the description
         of /proc/PID/numa_maps from proc.5.


Newly documented interfaces in existing pages
---------------------------------------------

crypt.3
     mtk
         Add description of crypt_r().


New and changed links
---------------------

crypt.3
     mtk
         New link to crypt.3.

getnetbyname_r.3
getnetbyaddr_r.3
     mtk
         New links to new getnetent_r.3.

getprotobyname_r.3
getprotobynumber_r.3
     mtk
         New links to new getprotoent_r.3.

getrpcbyname_r.3
getrpcbynumber_r.3
     mtk
         New links to new getrpcent_r.3.

getservbyname_r.3
getservbyport_r.3
     mtk
         New links to new getservent_r.3.

numa_maps.5
     mtk
         Link to new numa(7) page, which incorporates the
         /proc/PID/numa_maps description.
         As part of the numactl() package, the /proc/PID/numa_maps
         documentation was in a numa_maps.5 page; this link
         ensures that "man 5 numa_maps" still works.
         (Eventually, we may want to remove this link.)


Global changes
--------------

get_mempolicy.2
mbind.2
move_pages.2
set_mempolicy.2
     mtk
         Add reference to numa(7) for information on library support.
         Added  a VERSIONS section.
         SEE ALSO: Add numa(7).

faccessat.2
fchmodat.2
fchownat.2
fstatat.2
mkdirat.2
mknodat.2
linkat.2
openat.2
readlinkat.2
renameat.2
symlinkat.2
unlinkat.2
mkfifoat.3
psignal.3
strsignal.3
     mtk
         These interfaces are specified in POSIX.1-2008.


Changes to individual pages
---------------------------

eventfd.2
     Vijay Kumar
         When an eventfd overflows, select() indicates the file as both
         readable and writable (not as having an exceptional condition).

fcntl.2
     mtk
         F_DUPFD_CLOEXEC is specified in POSIX.1-2008.

getrlimit.2
     mtk
         NOTES: Add text mentioning the shell 'ulimit' (or 'limit')
         built-in command for setting resource limits.

gettimeofday.2
     mtk
         CONFORMING TO: POSIX.1-2008 marks gettimeofday() as obsolete.

link.2
     mtk
         Note kernel version where Linux stopped following symbolic
         links in 'oldpath'; see also http://lwn.net/Articles/294667.
         POSIX.1-2008 makes it implementation-dependent whether or not
         'oldpath' is dereferenced if it is a symbolic link.
         Add a reference to linkat(2) for an interface that allows
         precise control of the treatment of symbolic links.

mbind.2
     mtk
         Remove material on library support and numactl; that material
         is now in numactl.7.

mmap.2
     mtk
         Add kernel version numbers for MAP_32BIT.
         Add some details on MAP_32BIT (see http://lwn.net/Articles/294642).

move_pages.2
     mtk
         Added VERSIONS (from kernel 2.6.18) and CONFORMING TO sections.

open.2
     mtk
         O_CLOEXEC is specified in POSIX.1-2008.

socket.2
     mtk
         s/d/domain/ for name of argument.
         Add reference to socket(2) for further information on
         domain, type, and protocol arguments.

utimensat.2
     mtk
         CONFORMING TO: POSIX.1-2008 specifies utimensat() and futimens().

dirfd.3
     mtk
         CONFORMING TO: Add POSIX.1-2008; other minor changes.

exec.3
     mtk
         Small rewording: "s/returned/failed with/ [an error]".

fmemopen.3
     mtk
         Since glibc 2.7, it is possible to seek past the end of
         a stream created by open_memstream().  Add a BUGS section
         describing the bug in earlier glibc versions.

gethostbyname.3
     mtk
         Clarify exactly which functions are obsoleted by getnameinfo()
         and getaddrinfo().

getnetent.3
     mtk
         Rephrase description in terms of a database, rather than a file.
         Note that each of the get*() functions opens a connection to
         the database if necessary.
         The database connection is held open between get*() calls if
         'stayopen' is non-zero (not necessarily 1).
         s/zero terminated list/NULL-terminated list/
     mtk
         In glibc 2.2, the type of the 'net' argument for getnetbyaddr()
         changed from 'long' to 'uint32_t'.
     mtk
         Note that the gethostbyaddr() 'net' argument is in host byte order.
     mtk
         RETURN VALUE: emphasize that returned pointer points to a
         statically allocated structure.
         SEE ALSO: add getnetent_r.3.

getprotoent.3
     mtk
         Rephrase description in terms of a database, rather than a file.
         Note that each of the get*() functions opens a connection to
         the database if necessary.
         The database connection is held open between get*() calls if
         'stayopen' is non-zero (not necessarily 1).
         s/zero terminated list/NULL-terminated list/
     mtk
         RETURN VALUE: emphasize that returned pointer points to a
         statically allocated structure.
         SEE ALSO: add getprotoent_r.3.

getrpcent.3
     mtk
         s/rpc/RPC/.
         Rephrase description in terms of a database, rather than a file.
         Note that each of the get*() functions opens a connection to
         the database if necessary.
         s/zero terminated list/NULL-terminated list/
     mtk
         RETURN VALUE: emphasize that returned pointer points to a
         statically allocated structure.
         SEE ALSO: add getrpcent_r.3.

getservent.3
     mtk
         Rephrase description in terms of a database, rather than a file.
         Note that each of the get*() functions opens a connection to
         the database if necessary.
         The database connection is held open between get*() calls if
         'stayopen' is non-zero (not necessarily 1).
         s/zero terminated list/NULL-terminated list/
     mtk
         RETURN VALUE: emphasize that returned pointer points to a
         statically allocated structure.
         SEE ALSO: add getservent_r.3.

mkdtemp.3
     mtk
         CONFORMING TO: this function is specified in POSIX.1-2008.

mq_notify.3
     Venkatesh Srinivas
         s/sigev_notify_function/sigev_thread_function/
         as per http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=494956.

realpath.3
     mtk
         Relocate text for resolved_path==NULL case to DESCRIPTION.
         POSIX.1-2001 leaves the resolved_path==NULL case as
         implementation-defined; POSIX.1-2008 specifies the behavior
         described in this man page.

sem_init.3
     mtk
         POSIX.1-2008 rectifies the POSIX.1-2001 omission, specifying
         that zero is returned by a successful sem_init() call.

core.5
     Mike Bianchi / mtk
         Make the page more helpful to non-programmers by referencing
         the documentation of the shell's 'ulimit' command in the
         discussion of RLIMIT_CORE and RLIMIT_FSIZE.
         SEE ALSO: Add bash(1).
     mtk
         Note that a core dump file can be used in a debugger.

proc.5
     mtk
         Remove /proc/PID/numa_maps material (it is now in numa(7)).

cpuset.7
     mtk
         SEE ALSO: Add numa(7).

inotify.7
     mtk / Li Zefan
          Explain bug that occurred in coalescing identical events in
          kernels before 2.6.25.
          (See commit 1c17d18e3775485bf1e0ce79575eb637a94494a2
          "A potential bug in inotify_user.c" in the 2.6.25 Changelog.)

pthreads.7
     mtk
         Update thread-safe functions list with changes in POSIX.1-2008.
         SEE ALSO: add proc(5).

signal.7
     mtk
         Update list of async-sygnal-safe functions for POSIX.1-2008.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
