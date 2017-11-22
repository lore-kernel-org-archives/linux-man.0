From: QingFeng Hao <haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 1/1] s390_sthyi.2: New page for s390-specific s390_sthyi(2)
Date: Wed, 22 Nov 2017 07:54:08 +0100
Message-ID: <20171122065408.40841-1-haoqf@linux.vnet.ibm.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org, borntraeger-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org, QingFeng Hao <haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: QingFeng Hao <haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---

Changes since v1:
 - better wording and explanations provided by Michael Kerrisk
   and Heiko Carstens.
 - remove 2 error lines detected by Michael Kerrisk

 man2/s390_sthyi.2 | 115 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 man2/s390_sthyi.2

diff --git a/man2/s390_sthyi.2 b/man2/s390_sthyi.2
new file mode 100644
index 0000000..d1f21cc
--- /dev/null
+++ b/man2/s390_sthyi.2
@@ -0,0 +1,115 @@
+.\" Copyright IBM Corp. 2017
+.\" Author: QingFeng Hao <haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
+.\"
+.\" %%%LICENSE_START(GPLv2+_DOC_FULL)
+.\" This is free documentation; you can redistribute it and/or
+.\" modify it under the terms of the GNU General Public License as
+.\" published by the Free Software Foundation; either version 2 of
+.\" the License, or (at your option) any later version.
+.\"
+.\" The GNU General Public License's references to "object code"
+.\" and "executables" are to be interpreted as the output of any
+.\" document formatting or typesetting system, including
+.\" intermediate and printed output.
+.\"
+.\" This manual is distributed in the hope that it will be useful,
+.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
+.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+.\" GNU General Public License for more details.
+.\"
+.\" You should have received a copy of the GNU General Public
+.\" License along with this manual; if not, see
+.\" <http://www.gnu.org/licenses/>.
+.\" %%%LICENSE_END
+.\"
+.TH S390_STHYI 2 2017-09-21 "Linux Programmer's Manual"
+.SH NAME
+s390_sthyi \- emulate STHYI instruction
+.SH SYNOPSIS
+.nf
+.B #include <asm/unistd.h>
+.PP
+.BI "int s390_sthyi(unsigned long " function_code ", void *" buffer ", uint64_t *" return_code ", unsigned long " flags ");
+.fi
+.SH DESCRIPTION
+The
+.BR s390_sthyi ()
+system call emulates the STHYI (Store Hypervisor Information) instruction.
+It provides hardware resource information for the machine and its virtualization
+levels. This includes CPU type and capacity, as well as the machine model and
+other metrics.
+.PP
+The
+.I function_code
+argument indicates which function to perform.
+The following code(s) are supported:
+.RB ( 0 )
+Return CP (Central Processor) and IFL (Integrated Facity for Linux)
+capacity information.
+.PP
+The
+.I buffer 
+argument specifies the address of response buffer. If the system
+call returns 0, the response buffer will be filled with CPU capacity
+information. Otherwise, the response buffer's content is unchanged.
+.PP
+The
+.I return_code
+argument stores the return code of the STHYI instruction, success
+.RB ( 0 )
+or unsupported function code
+.RB ( 4 ).
+For details about this and function_code, buffer argument, please reference the link in
+.IR "CONFORMING TO"
+below.
+.PP
+The
+.I flags
+argument is provided to allow for future extensions and currently
+must be set to "0".
+.SH RETURN VALUE
+On success, the return value of
+.BR s390_sthyi ()
+matches the condition code of the STHYI instructions, which is a value
+between 0-3 (that is: emulation succeeded).
+Return value of 0 indicates that CPU capacity information is stored to
+.I buffer.
+Return value of 3 indicates "unsupported function code" and buffer's
+content is unchanged.
+.PP
+On error, -1 is returned, and
+.IR errno
+is set appropriately.
+.SH ERRORS
+.TP
+.B EINVAL
+The value specified in
+.I flags
+is non-zero.
+.TP
+.B EOPNOTSUPP
+The value specified in
+.I function_code 
+is not a valid value.
+.TP
+.B EFAULT
+The value specified in
+.I buffer 
+or
+.I return_code
+is not a valid address.
+.TP
+.B ENOMEM
+Allocating memory for handling the CPU capacity information failed.
+.SH VERSIONS
+This system call is available since Linux 4.15.
+.SH CONFORMING TO
+This Linux-specific system call is available only on the s390 architecture.
+For details about the STHYI instruction, please reference the link:
+https://www.ibm.com/support/knowledgecenter/SSB27U_6.3.0/com.ibm.zvm.v630.hcpb4/hcpb4sth.htm#hcpb4-sth__headsec
+.SH NOTES
+Glibc does not provide a wrapper for this system call, use
+.BR syscall (2)
+to call it.
+.SH SEE ALSO
+.BR syscall (2)
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
