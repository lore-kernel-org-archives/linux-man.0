From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Manual pages for new PCI memory access system calls
Date: Tue, 06 Jan 2015 07:45:42 +0100
Message-ID: <54AB8496.8070103@gmail.com>
References: <1418108227-13426-1-git-send-email-aishchuk@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418108227-13426-1-git-send-email-aishchuk-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexey Ishchuk <aishchuk-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, blaschka-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, schwidefsky-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org, heicars2-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Alexey,

On 12/09/2014 07:57 AM, Alexey Ishchuk wrote:
> Add s390_pci_mmio_read.2 and s390_pci_mmio_write.2 manual pages for the
> new PCI MMIO memory access system calls added for s390 platform.
> 
> Signed-off-by: Alexey Ishchuk <aishchuk-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>

Thanks for these patches. 

A general question: these pages have so much text in common, might
it not be better to combine them into one page? If you agree,
could you please resubmit a single-page version?

Some more comments below.

> ---
>  man2/s390_pci_mmio_read.2  | 85 ++++++++++++++++++++++++++++++++++++++++++++++
>  man2/s390_pci_mmio_write.2 | 83 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 168 insertions(+)
>  create mode 100644 man2/s390_pci_mmio_read.2
>  create mode 100644 man2/s390_pci_mmio_write.2
> 
> diff --git a/man2/s390_pci_mmio_read.2 b/man2/s390_pci_mmio_read.2
> new file mode 100644
> index 0000000..16487c3
> --- /dev/null
> +++ b/man2/s390_pci_mmio_read.2
> @@ -0,0 +1,85 @@
> +.\" Copyright (c) IBM Corp. 2014
> +.\" Author: Alexey Ishchuk <aishchuk-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> +.\"
> +.\" %%%LICENSE_START(GPLv2+_DOC_FULL)
> +.\" This is free documentation; you can redistribute it and/or
> +.\" modify it under the terms of the GNU General Public License as
> +.\" published by the Free Software Foundation; either version 2 of
> +.\" the License, or (at your option) any later version.
> +.\"
> +.\" The GNU General Public License's references to "object code"
> +.\" and "executables" are to be interpreted as the output of any
> +.\" document formatting or typesetting system, including
> +.\" intermediate and printed output.
> +.\"
> +.\" This manual is distributed in the hope that it will be useful,
> +.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
> +.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +.\" GNU General Public License for more details.
> +.\"
> +.\" You should have received a copy of the GNU General Public
> +.\" License along with this manual; if not, see
> +.\" <http://www.gnu.org/licenses/>.
> +.\" %%%LICENSE_END
> +.\"
> +
> +.TH S390_PCI_MMIO_READ 2 2014-11-25 "Linux Programmer's Manual"
> +.SH NAME
> +s390_pci_mmio_read \- read data from PCI MMIO memory page.

No "." at the end of the above line.

In a combined page, this line might read:

s390_pci_mmio_read, s390_pci_mmio_write \- transfer data to/from PCI MMIO memory page.

> +.SH SYNOPSIS
> +.nf
> +.B #include <asm/unistd.h>
> +
> +.BI "int s390_pci_mmio_read(unsigned long " mmio_addr ",
> +.BI "                    void * " user_buffer ",

No space after the "*"

> +.BI "                    size_t " length ");
> +.fi
> +.SH DESCRIPTION
> +The
> +.BR s390_pci_mmio_read ()
> +system call reads data from a PCI MMIO memory location
> +to the user space buffer
> +.IR user_buffer
> +of
> +.IR length
> +bytes size.

Can these reads ever block?

> +
> +The address specified by the
> +.IR mmio_addr
> +parameter must belong to a PCI MMIO memory page mapping in the user
> +address space, and data being read must not cross a page boundary.

s/data/the data/

> +The
> +.IR length
> +parameter value cannot be greater than page size.

s/page/the page/

> +.SH RETURN VALUE
> +On success,
> +.BR s390_pci_mmio_read ()
> +returns 0.
> +On error, \-1 is returned and
> +.IR errno
> +is set to one of the error codes listed below.
> +.SH ERRORS
> +.TP
> +.B ENODEV
> +PCI support is not enabled.
> +.TP
> +.B ENOMEM
> +insufficient memory.

The first word of the sentence following each of these error entries
should be capitalized. This: "Insufficient memory" Same for each of the
two entries below.

> +.TP
> +.B EFAULT
> +invalid address was specified.
> +.TP
> +.B EINVAL
> +invalid parameter value.
> +.SH VERSIONS
> +This system call is available since Linux 3.19.
> +.SH CONFORMING TO
> +This Linux-specific system call is available only on the s390
> +architecture.
> +The PCI support is available beginning with System z EC12.

Is this maybe better as: "The required PCI support..."?

> +.SH NOTES
> +Glibc does not provide a wrapper for this system call, use
> +.BR syscall (2)
> +to call it.
> +.SH SEE ALSO
> +.BR syscall (2)
> diff --git a/man2/s390_pci_mmio_write.2 b/man2/s390_pci_mmio_write.2
> new file mode 100644
> index 0000000..d2a8411
> --- /dev/null
> +++ b/man2/s390_pci_mmio_write.2
> @@ -0,0 +1,83 @@
> +.\" Copyright (c) IBM Corp. 2014
> +.\" Author: Alexey Ishchuk <aishchuk-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> +.\"
> +.\" %%%LICENSE_START(GPLv2+_DOC_FULL)
> +.\" This is free documentation; you can redistribute it and/or
> +.\" modify it under the terms of the GNU General Public License as
> +.\" published by the Free Software Foundation; either version 2 of
> +.\" the License, or (at your option) any later version.
> +.\"
> +.\" The GNU General Public License's references to "object code"
> +.\" and "executables" are to be interpreted as the output of any
> +.\" document formatting or typesetting system, including
> +.\" intermediate and printed output.
> +.\"
> +.\" This manual is distributed in the hope that it will be useful,
> +.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
> +.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +.\" GNU General Public License for more details.
> +.\"
> +.\" You should have received a copy of the GNU General Public
> +.\" License along with this manual; if not, see
> +.\" <http://www.gnu.org/licenses/>.
> +.\" %%%LICENSE_END
> +.\"
> +.TH S390_PCI_MMIO_WRITE 2 2014-11-25 "Linux Programmer's Manual"
> +.SH NAME
> +s390_pci_mmio_write \- write data to PCI MMIO memory page.
> +.SH SYNOPSIS
> +.nf
> +.B #include <asm/unistd.h>
> +
> +.BI "int s390_pci_mmio_write(unsigned long " mmio_addr ",
> +.BI "                     void * " user_buffer ",
> +.BI "                     size_t " length ");
> +.fi
> +.SH DESCRIPTION
> +The
> +.BR s390_pci_mmio_write ()
> +system call writes data of length
> +.IR length
> +from the user space buffer
> +.IR user_buffer
> +to a PCI MMIO memory location.
> +
> +The

Remove the preceding line.

> +The address specified by the
> +.IR mmio_addr
> +parameter must belong to a PCI MMIO memory page mapping in the user
> +address space, and data being written must not cross a page

s/data/the data/

> +boundary. The
> +.IR length
> +parameter value cannot be greater than page size.

s/page/the page/

> +.SH RETURN VALUE
> +On success,
> +.BR s390_pci_mmio_write ()
> +returns 0.
> +On error, \-1 is returned and 
> +.IR errno
> +is set to one of the error codes listed below.
> +.SH ERRORS
> +.TP
> +.B ENODEV
> +PCI support is not enabled.
> +.TP
> +.B ENOMEM
> +insufficient memory.
> +.TP
> +.B EFAULT
> +invalid address was specified.
> +.TP
> +.B EINVAL
> +invalid parameter value.
> +.SH VERSIONS
> +This system call is available since Linux 3.19.
> +.SH CONFORMING TO
> +This Linux-specific system call is available only on the s390
> +architecture. The PCI support is available beginning with System z EC12.
> +.SH NOTES
> +Glibc does not provide a wrapper for this system call, use
> +.BR syscall (2)
> +to call it.
> +.SH SEE ALSO
> +.BR syscall (2)

Thanks,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
