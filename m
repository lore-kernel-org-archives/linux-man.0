From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-3.78 released
Date: Fri, 23 Jan 2015 09:52:17 +0100
Message-ID: <54C20BC1.3090809@gmail.com>
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

    man-pages-3.78 - man pages for Linux

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_3.78

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2015/01/man-pages-378-is-released.html

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


==================== Changes in man-pages-3.78 ====================

Released: 2015-01-22, Munich


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Alexey Ishchuk <aishchuk-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Christian Seiler <christian-+GPkE3DhqnY@public.gmane.org>
Daniel J Blueman <daniel-JCXMqzvhRcvYtjvyW6yDsg@public.gmane.org>
David Drysdale <drysdale-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Elliot Hughes <enh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Jessica McKellar <jessica.mckellar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Michael Hayes <mike-llb2Xkb5Bs0@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>
Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

execveat.2
    David Drysdale, Michael Kerrisk  [Rich Felker]
        New page for execveat(2)

memfd_create.2
    Michael Kerrisk, David Herrmann
        New page for memfd_create() system call
             Including notes about file sealing

s390_pci_mmio_write.2
    Alexey Ishchuk
        New page for s390 s390_pci_mmio_write() and s390_pci_mmio_read()
            New manual page for the new PCI MMIO memory access system
            calls, s390_pci_mmio_write() and s390_pci_mmio_read(),
            added for the s390 platform.


Newly documented interfaces in existing pages
---------------------------------------------

fcntl.2
    David Herrmann  [Michael Kerrisk]
        Document F_ADD_SEALS and F_GET_SEALS commands

proc.5
    Elie De Brauwer
        Document /proc/sys/vm/compact_memory
    Michael Kerrisk
        Document /proc/sys/fs/nr_open


New and changed links
---------------------

s390_pci_mmio_read.2
    Michael Kerrisk
        New link to new s390_pci_mmio_write(2) page


Changes to individual pages
---------------------------

dup.2
    Michael Kerrisk
        Add reference to RLIMIT_NOFILE for EMFILE error
    Michael Kerrisk
        Add reference to RLIMIT_NOFILE for EBADF error on 'newfd'.

execve.2
fexecve.3
    Michael Kerrisk
        SEE ALSO: add execveat(2)

fallocate.2
mmap.2
open.2
truncate.2
write.2
    Michael Kerrisk
        ERRORS: add EPERM for operation denied by file seal

fcntl.2
    Michael Kerrisk
        ERRORS: add EBUSY case for F_SETPIPE_SZ
    Michael Kerrisk
        Add reference to RLIMIT_NOFILE for F_DUPFD EINVAL error on 'arg'.
    Michael Kerrisk
        ERRORS: add open file description lock error cases

getrlimit.2
    Michael Kerrisk
        Update text on RLIMIT_NOFILE ceiling to refer to /proc/sys/fs/file-max

mbind.2
    Michael Kerrisk  [Daniel J Blueman]
        Clarify EFAULT text

mmap.2
shmget.2
shm_open.3
    Michael Kerrisk
        SEE ALSO: add memfd_create(2)

open.2
    Michael Kerrisk
        Refer to RLIMIT_NOFILE for explanation of EMFILE error
    Michael Kerrisk
        Add execveat(2) in system call list under "Rationale for openat()"

perf_event_open.2
    Vince Weaver
        Clarify description of overflow events
            Update the perf_event_open manpage to be more consistent when
            discussing overflow events.  It merges the discussion of
            poll-type notifications with those generated by SIGIO
            signal handlers.
            This addresses the remaining FIXMEs is the document.
    Vince Weaver
        Remove inaccurate paragraph describing attr.config
            Remove an inaccurate paragraph about values in the attr.config
            field.  This information was never true in any released kernel;
            it somehow snuck into the manpage because it is still described
            this way in tools/perf/design.txt in the kernel source tree.
    Michael Kerrisk
        Correct the kernel version number for PERF_COUNT_HW_CACHE_NODE
    Michael Kerrisk
        Add some kernel version numbers to various fields and constants

ptrace.2
sigaction.2
seccomp.2
    Kees Cook
        Ptrace and siginfo details
            While writing some additional seccomp tests, I realized
            PTRACE_EVENT_SECCOMP wasn't documented yet. Fixed this, and added
            additional notes related to ptrace events SIGTRAP details.

readv.2
    Michael Kerrisk
        Update details on glibc readv()/writev() wrapper behavior
            And add a historical detail about Linux 2.0.

select.2
    Michael Kerrisk
        Mention RLIMIT_NOFILE as a possible cause of EINVAL error

syscall.2
    Kees Cook
        Add arm64 and mips
            Add mips and arm64 to tables, along with some further
            details on these architectures,

syscalls.2
    Michael Kerrisk
        Add s390_pci_mmio_read(2) and s390_pci_mmio_write(2)
    Michael Kerrisk
        Note kernel() version that introduced get_kernel_syms()
        Note kernel version that introduced ppc_rtas()
        Note kernel version that introduced create_module()
        Note kernel version that added setup()
    Michael Kerrisk
        Remove some details for sync_file_range2()
            Make the table a bit simpler. The details can anyway be
            found in the system call man page.

utimensat.2
    Michael Kerrisk  [Elliot Hughes]
        If both tv_sec fields are UTIME_OMIT, the file need not exist
            As noted by Elliot, if both tv_sec fields are UTIME_OMIT,
            utimensat() will return success even if the file does not exist.

errno.3
    Michael Kerrisk
        The RLIMIT_NOFILE resource limit is a common cause of EMFILE

exec.3
    Michael Kerrisk
        SEE ALSO: add execveat(2)

fclose.3
    Carlos O'Donell
        Consistency fix: use "stream" as name for "FILE *" argument
            Harmonize all the manual pages to use "stream" for FILE*
            instead of randomly using "fp" or "stream." Choosing something
            and being consistent helps users scan the man pages quickly
            and understand what they are looking at.

fexecve.3
    Michael Kerrisk
        Rewrite the script+close-on-exec problem as a BUG
            Also, add one or two details about this scenario.
    Michael Kerrisk
        The natural idiom when using fexecve() is to use the close-on-exec flag

fmemopen.3
fopencookie.3
getline.3
    Michael Kerrisk
        Consistency fix: use "stream" as name for "FILE *" argument

getpw.3
    Michael Kerrisk  [Carlos O'Donell]
        Describe return value when 'uid' is not found

getgrent_r.3
getmntent.3
getpwent_r.3
getspnam.3
malloc_info.3
putgrent.3
    Carlos O'Donell
        Consistency fix: use "stream" as name for "FILE *" argument
            Harmonize all the manual pages to use "stream" for FILE*
            instead of randomly using "fp" or "stream." Choosing something
            and being consistent helps users scan the man pages quickly
            and understand what they are looking at.

posix_fallocate.3
    Michael Kerrisk
        Note that posix_fallocate() is implemented using fallocate(2)

locale.5
    Akihiro Motoki
        Correct variable name

proc.5
    Michael Kerrisk
        Remove bogus statement about NR_OPEN being a ceiling for file-max


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
