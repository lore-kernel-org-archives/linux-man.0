From: Alexey Ishchuk <aishchuk-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] Manual page for new PCI memory access system calls
Date: Tue, 20 Jan 2015 16:49:01 +0300
Message-ID: <54BE5CCD.2060803@linux.vnet.ibm.com>
References: <1421677372-15088-1-git-send-email-aishchuk@linux.vnet.ibm.com> <54BD21FC.1000602@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54BD21FC.1000602-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: blaschka-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, schwidefsky-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org, heicars2-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Michael,

the mmio_addr parameter value must belong to the user space memory area 
of a PCI MMIO page mapping to the user space. It is a logical user space 
address value which is translated to an appropriate physical address 
inside these system calls. This is mentioned in the system call 
description text, and, I think, we don't need to give additional details.

Your changes to the text look good. Thank you!

Best regards,
Alexey

On 19.01.2015 18:25, Michael Kerrisk (man-pages) wrote:
> Hello Alexey,
>
> On 01/19/2015 03:22 PM, Alexey Ishchuk wrote:
>> Add s390_pci_mmio_write.2 manual page for the new PCI MMIO memory access
>> s390_pci_mmio_write () and s390_pci_mmio_read () system calls added for
>> the s390 platform.
>
> I've applied this patch. I made a few tweaks to the text, and hopefully
> I did not inject any errors. Could you please check the version below.
>
> One question: do I understand correctly that mmio_addr
> is a physical address? Maybe we should say mention that in
> the page.
>
> Cheers,
>
> Michael
>
> .\" Copyright (c) IBM Corp. 2015
> .\" Author: Alexey Ishchuk <aishchuk-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> .\"
> .\" %%%LICENSE_START(GPLv2+_DOC_FULL)
> .\" This is free documentation; you can redistribute it and/or
> .\" modify it under the terms of the GNU General Public License as
> .\" published by the Free Software Foundation; either version 2 of
> .\" the License, or (at your option) any later version.
> .\"
> .\" The GNU General Public License's references to "object code"
> .\" and "executables" are to be interpreted as the output of any
> .\" document formatting or typesetting system, including
> .\" intermediate and printed output.
> .\"
> .\" This manual is distributed in the hope that it will be useful,
> .\" but WITHOUT ANY WARRANTY; without even the implied warranty of
> .\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> .\" GNU General Public License for more details.
> .\"
> .\" You should have received a copy of the GNU General Public
> .\" License along with this manual; if not, see
> .\" <http://www.gnu.org/licenses/>.
> .\" %%%LICENSE_END
> .\"
> .TH S390_PCI_MMIO_WRITE 2 2015-01-15 "Linux Programmer's Manual"
> .SH NAME
> s390_pci_mmio_write, s390_pci_mmio_read \- transfer data to/from PCI
> MMIO memory page
> .SH SYNOPSIS
> .nf
> .B #include <asm/unistd.h>
>
> .BI "int s390_pci_mmio_write(unsigned long " mmio_addr ",
> .BI "                        void *" user_buffer ", size_t " length ");
> .br
> .BI "int s390_pci_mmio_read(unsigned long " mmio_addr ",
> .BI "                        void *" user_buffer ", size_t " length ");
> .fi
> .SH DESCRIPTION
> The
> .BR s390_pci_mmio_write ()
> system call writes
> .IR length
> bytes of data from the user-space buffer
> .IR user_buffer
> to the PCI MMIO memory location specified by
> .IR mmio_addr .
> The
> .BR s390_pci_mmio_read ()
> system call reads
> .I length
> bytes of
> data from the PCI MMIO memory location specified by
> .IR mmio_addr
> to the user-space buffer
> .IR user_buffer .
>
> These system calls must be used instead of the simple assignment
> or data-transfer operations that are used to access the PCI MMIO
> memory areas mapped to user space on the Linux System z platform.
> The address specified by
> .IR mmio_addr
> must belong to a PCI MMIO memory page mapping in the caller's address space,
> and the data being written or read must not cross a page boundary.
> The
> .IR length
> value cannot be greater than the system page size.
> .SH RETURN VALUE
> On success,
> .BR s390_pci_mmio_write ()
> and
> .BR s390_pci_mmio_read ()
> return 0.
> On error, \-1 is returned and
> .IR errno
> is set to one of the error codes listed below.
> .SH ERRORS
> .TP
> .B EFAULT
> The address in
> .I mmio_addr
> is invalid.
> .TP
> .B EFAULT
> .IR user_buffer
> does not point to a valid location in the caller's address space.
> .TP
> .B EINVAL
> Invalid
> .I length
> argument.
> .TP
> .B ENODEV
> PCI support is not enabled.
> .TP
> .B ENOMEM
> Insufficient memory.
> .SH VERSIONS
> These system calls are available since Linux 3.19.
> .SH CONFORMING TO
> This Linux-specific system call is available only on the s390 architecture.
> The required PCI support is available beginning with System z EC12.
> .SH NOTES
> Glibc does not provide a wrapper for this system call, use
> .BR syscall (2)
> to call it.
> .SH SEE ALSO
> .BR syscall (2)
>

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
