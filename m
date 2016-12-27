From: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] New page describing userfaultfd(2) system call.
Date: Tue, 27 Dec 2016 12:16:53 +0100
Message-ID: <20161227111653.GC16976@redhat.com>
References: <1482307713-21853-1-git-send-email-rppt@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1482307713-21853-1-git-send-email-rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

On Wed, Dec 21, 2016 at 10:08:33AM +0200, Mike Rapoport wrote:
> +.TH USERFAULTFD 2 1016-12-12 "Linux" "Linux Programmer's Manual"

Typo: 2016

> +Currently, userfaultfd can only be used with anonymous private memory
> +mappings.

This will get obsoleted soon enough, as
shmem/hugetlbfs/non-cooperative patches are complete and are just in
queue for merging on -mm on linux-mm. Although the above is correct
current upstream.

hugetlbfs/shmem won't complicate things much, aside from
UFFDIO_ZEROCOPY not being supported for those areas (and it'll be
reported in the UFFDIO_REGISTER uffdio_register.ioctl structure so it
may not require additional docs).

The feature flags will probably require more documentation:

#define UFFD_API_FEATURES (UFFD_FEATURE_PAGEFAULT_FLAG_WP |	\
			   UFFD_FEATURE_EVENT_FORK |		\
			   UFFD_FEATURE_EVENT_REMAP |		\
			   UFFD_FEATURE_EVENT_MADVDONTNEED |	\
			   UFFD_FEATURE_MISSING_HUGETLBFS |	\
			   UFFD_FEATURE_MISSING_SHMEM)

UFFD_FEATURE_PAGEFAULT_FLAG_WP isn't queued for upstream merging yet
so that will be the last one to document.

If the kernel supports registering userfaultfd ranges on hugetlbfs
virtual memory areas, UFFD_FEATURE_MISSING_HUGETLBFS will be set in
uffdio_api.features (no matter what is given in input to
UFFDIO_API). If UFFD_FEATURE_MISSING_HUGETLBFS is given in input to
UFFDIO_API by setting it in uffdio_api.features and the kernel doesn't
support registering userfaultfd ranges on hugetlbfs areas, UFFDIO_API
ioctl will return -EINVAL. So there are effectively two ways to probe
if the userfaultfd syscall supports hugetlbfs. Only MAP_PRIVATE
hugetlbfs mappings are supported. UFFD_FEATURE_MISSING_HUGETLBFS being
set in uffdio_api.features however doesn't mean the kernel was built
with hugetlbfs support, it only means if a MAP_PRIVATE hugetlbfs
virtual memory area exists, UFFDIO_REGISTER will succeed on it. It's
up to userland to prepare a hugetlbfs mapping (a fstatfs
HUGETLBFS_MAGIC check can provide such guarantee before creating the
mapping on the hugetlbfs file descriptor).

UFFD_FEATURE_MISSING_SHMEM works the same for shmem (covering all
tmpfs, IPCSHM /dev/zero MAP_SHARED shmem APIs, the only difference is
that there's no MAP_PRIVATE constraint for shmem). The API used to
create shmem doesn't matter as userfaultfd only cares about virtual
memory areas so it doesn't matter how those shmem backed areas have
been created beforehand.

UFFD_FEATURE_EVENT_FORK|UFFD_FEATURE_EVENT_REMAP|UFFD_FEATURE_EVENT_MADVDONTNEED
will require further documentation and they're a bit more complicated.

> +The following values may be bitwise ORed in
> +.IR mode
> +to change the behavior of
> +.I UFFDIO_COPY
> +ioctl:
> +.RS
> +.sp
> +.PD 0
> +.TP 12
> +.B UFFDIO_COPY_MODE_DONTWAKE
> +Do not wake up the thread that waits for page fault resolution
> +.PD
> +.RE
> +.IP
> +The
> +.I copy
> +field of the
> +.I uffdio_copy
> +structure is used by the kernel to return amount of bytes that was actually
> +copied.

... or an error (-EINVAL/-EFAULT/-ENOMEM/-EEXIST). If uffdio_copy.copy
doesn't match the uffdio_copy.len passed in input to UFFDIO_COPY, the
ioctl will return -EAGAIN. If the ioctl returns zero it means it
succeeded, no error was reported and the entire area was copied. If a
an invalid fault happens while writing to the uffdio_copy.copy field
the syscall will return -EFAULT. uffdio_copy.copy is an output-only
field so it is not being read by the UFFDIO_COPY ioctl.

> +The
> +.I zeropage
> +field of the
> +.I uffdio_zero
> +structure is used by the kernel to return amount of bytes that was actually
> +zeroed.

.. or an error.. same as UFFDIO_COPY.

Great start of the manpage, thanks!

Andrea
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
