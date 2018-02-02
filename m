From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages-4.15 released
Date: Fri, 2 Feb 2018 16:48:18 +0100
Message-ID: <1e6ffc25-c403-69b6-bf29-026a36b2953b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Gidday,

The Linux man-pages maintainer proudly announces:

    man-pages-4.15 - man pages for Linux

This release resulted from patches, bug reports, reviews, and comments 
from 26 contributors. Over 200 commits changed around 75 pages.
In addition, 3 new manual pages were added.

Tarball download:
    http://www.kernel.org/doc/man-pages/download.html
Git repository:
    https://git.kernel.org/cgit/docs/man-pages/man-pages.git/
Online changelog:
    http://man7.org/linux/man-pages/changelog.html#release_4.15

A short summary of the release is blogged at:
http://linux-man-pages.blogspot.com/2018/02/man-pages-415-is-released.html

The current version of the pages is browsable at:
http://man7.org/linux/man-pages/

You are receiving this message either because:

a) You contributed to the content of this release.

b) You are subscribed to linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org or
libc-alpha-9JcytcrH/bBqeNgBaj97IQ@public.gmane.org

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

==================== Changes in man-pages-4.15 ====================

Released: 2018-02-02, Palo Alto


Contributors
------------

The following people contributed patches/fixes or (noted in brackets
in the changelog below) reports, notes, and ideas that have been
incorporated in changes in this release:

Adam Liddell <ml+kernel.org-1+tRda/VQ3BWk0Htik3J/w@public.gmane.org>
Andrea Parri <parri.andrea-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Andries E. Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Elie Roudninski <xademax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Eric Benton <erbenton-Wuw85uim5zDR7s880joybQ@public.gmane.org>
Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
G. Branden Robinson <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Joel Williamson <jwilliamson-T1dms6jXtZNtdF/iL03xVDBc0kxJFkfs@public.gmane.org>
John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Jorgen Hansen <jhansen-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Michal Hocko <mhocko-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
NeilBrown <neilb-IBi9RG/b67k@public.gmane.org>
Nikola Forró <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Nikolay Borisov <nborisov-IBi9RG/b67k@public.gmane.org>
Pradeep Kumar <pradeepsixer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
QingFeng Hao <haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Ricardo Biehl Pasquali <pasqualirb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
roblabla <man-pages-KoZcQ+CXkXj3fQ9qLvQP4Q@public.gmane.org>
Roman Gushchin <guro-b10kYP2dOMg@public.gmane.org>
Shawn Landden <slandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Stefan Hajnoczi <stefanha-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Stefan Raspl <raspl-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Apologies if I missed anyone!


New and rewritten pages
-----------------------

s390_sthyi.2
    QingFeng Hao  [Michael Kerrisk]
        New page for s390-specific s390_sthyi(2)

network_namespaces.7
    Michael Kerrisk
        New page describing network namespaces
            Based on content moved from namespaces(7)

vsock.7
    Stefan Hajnoczi  [Jorgen Hansen, Michael Kerrisk]
        Document the VSOCK socket address family


Newly documented interfaces in existing pages
---------------------------------------------

cgroups.7
    Michael Kerrisk  [Tejun Heo]
        Document cgroups v2 "thread mode"
    Michael Kerrisk  [Tejun Heo]
        Document cgroup v2 delegation via the 'nsdelegate' mount option
    Michael Kerrisk
        Document the cgroup.max.depth and cgroup.max.descendants files
    Michael Kerrisk
        Document 'release_agent' mount option
    Michael Kerrisk  [Roman Gushchin]
        Document /sys/kernel/cgroup/delegate
    Michael Kerrisk  [Roman Gushchin]
        Document /sys/kernel/cgroup/features
    Michael Kerrisk  [Roman Gushchin]
        Document cgroups v2 cgroup.stat file


Global changes
--------------

Various pages
    G. Branden Robinson
        Standardize on "nonzero"
            Also add this term to the style guide in man-pages(7).


Changes to individual pages
---------------------------

bpf.2
    Nikolay Borisov
        Sync list of supported map types with 4.14 kernel

copy_file_range.2
    Michael Kerrisk
        Library support was added in glibc 2.27
    Shawn Landden
        glibc provides a user-space emulation where the system call is absent
    Florian Weimer
        EFBIG errors are possible, similar to write(2)
    Michael Kerrisk
        ERRORS: add EISDIR
    Michael Kerrisk
        Order ERRORS alphabetically
    Michael Kerrisk
        Add comment to code example explaining use of syscall(2)

fcntl.2
read.2
write.2
    NeilBrown
        Document "Lost locks" as cause for EIO.
            If an advisory lock is lost, then read/write requests on any
            affected file descriptor can return EIO - for NFSv4 at least.

memfd_create.2
    Michael Kerrisk
        glibc support for memfd_create() was added in version 2.27

mlock.2
    Michael Kerrisk
        Make details for MLOCK_ONFAULT a little more explicit
    Michael Kerrisk
        glibc support for mlock2() is added in version 2.27

mmap.2
    John Hubbard  [Michael Hocko]
        MAP_FIXED is no longer discouraged
            MAP_FIXED has been widely used for a very long time, yet the man
            page still claims that "the use of this option is discouraged".
    John Hubbard
        MAP_FIXED updated documentation
                -- Expand the documentation to discuss the hazards in
                   enough detail to allow avoiding them.

                -- Mention the upcoming MAP_FIXED_SAFE flag.

                -- Enhance the alignment requirement slightly.

mount.2
    Keno Fischer  [Michael Kerrisk]
        Add EINVAL error condition when MS_BINDing MNT_LOCKED submounts

mprotect.2
pkey_alloc.2
    Michael Kerrisk
        Glibc support for memory protection keys was added in version 2.27

perf_event_open.2
    Michael Kerrisk
        SEE ALSO: add perf(1)

pkey_alloc.2
    Michael Kerrisk
        Clarify description of pkey_alloc() 'flags' argument

prctl.2
    Michael Kerrisk
        Defer to capabilities(7) for discussion of the "keep capabilities" flag

recvmmsg.2
sendmmsg.2
    Nikola Forró
        Point out that error handling is unreliable

seccomp.2
    Michael Kerrisk
        Clarify that SECCOMP_RET_TRAP SIGSYS signal is thread-directed

syscalls.2
    Michael Kerrisk
        Add s390-specific s390_sthyi(2) to syscall list

unshare.2
    Michael Kerrisk
        Clarify the EUSERS occurred only until kernel 4.8

errno.3
    Michael Kerrisk
        'errno -s' can be used to search for errors by string in description
    Michael Kerrisk
        Add Linux error text corresponding to ENOMEM

fgetpwent.3
    Michael Kerrisk
        Add missing ATTRIBUTES preamble

fts.3
    Michael Kerrisk  [Pradeep Kumar]
        fts_pathlen = strlen(fts_path) + strlen(fts_name)

fuse.4
    Michael Kerrisk
        Places errors in alphabetical order (no content changes)

veth.4
    Michael Kerrisk
        Add network_namespaces(7)

sysfs.5
    Michael Kerrisk
        Refer to cgroups(7) for information about files in /sys/kernel/cgroup

capabilities.7
    Michael Kerrisk
        Note which capability sets are affected by SECBIT_NO_SETUID_FIXUP
            Note explicitly that SECBIT_NO_SETUID_FIXUP is relevant for
            the permitted, effective, and ambient capability sets.
    Michael Kerrisk
        Deemphasize the ancient prctl(2) PR_SET_KEEPCAPS command
            The modern approach is SECBITS_KEEP_CAPS.
    Michael Kerrisk
        Clarify effect of CAP_SETFCAP
            Make it clear that CAP_SETFCAP allows setting arbitrary
            capabilities on a file.
    Michael Kerrisk
        Clarify which capability sets are effected by SECBIT_KEEP_CAPS
            This flag has relevance only for the process permitted and
            effective sets.
    Michael Kerrisk
        Rephrase CAP_SETPCAP description
            * Mention kernel versions.
            * Place current kernel behavior first
    Michael Kerrisk
        SECBIT_KEEP_CAPS is ignored if SECBIT_NO_SETUID_FIXUP is set
    Michael Kerrisk
        Ambient set is also cleared when UIDs are set to nonzero value

cgroups.7
    Michael Kerrisk
        Add a more complete description of cgroup v1 named hierarchies
    Michael Kerrisk
        Add a section on unmounting cgroup v1 filesystems
    Michael Kerrisk
        Add subsection describing cgroups v2 subtree delegation
    Michael Kerrisk
        Mention ENOENT error that can occur when writing to subtree_control file
    Michael Kerrisk
        Add list of currently available version 2 controllers
    Nikolay Borisov
        Add information about RDMA controller
    Michael Kerrisk
        Rewrite the description of cgroup v2 subtree control
    Michael Kerrisk  [Tejun Heo]
        Note Linux 4.11 changes to cgroup v2 delegation containment rules
    Michael Kerrisk
        systemd(1) nowadays automatically mounts the cgroup2 filesystem
    Michael Kerrisk
        Clarify that cgroup.controllers is read-only
    Michael Kerrisk
        Elaborate a little on problems of splitting threads across cgroups in v1
    Michael Kerrisk  [Tejun Heo]
        Tweak the description of delegation of cgroup.subtree_control

ip.7
    Ricardo Biehl Pasquali
        INADDR_* values cannot be assigned directly to 's_addr'
    Michael Kerrisk
        s/INADDR_ANY/INADDR_LOOPBACK/ in discussion of htonl()
            INADDR_LOOPBACK is a better example, since it is not
            byte-order neutral.

namespaces.7
network_namespaces.7
    Michael Kerrisk
        Move content from namespaces(7) to network_namespaces(7)

pid_namespaces.7
    Michael Kerrisk
        SEE ALSO: add mount_namespaces(7)

sched.7
    Michael Kerrisk  [Andrea Parri]
        Correctly describe effect of priority changes for RT threads
            The placement of a thread in the run queue for its new
            priority depends on the direction of movement in priority.
            (This appears to contradict POSIX, except in the case of
            pthread_setschedprio().)

user_namespaces.7
    Michael Kerrisk
        Mention NS_GET_OWNER_UID ioctl() operation

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
