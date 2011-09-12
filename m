From: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Subject: Re: sendmmsg(2)
Date: Mon, 12 Sep 2011 21:18:26 +0200
Message-ID: <4E6E5B02.3070407@atsec.com>
References: <4E64D0F9.9050509@atsec.com> <CAKgNAkhZ2uVSMZx9ofhs-r+A2Cam06R7Hb8yQo5RS4g5G2bX6A@mail.gmail.com> <4E6A85C3.4080409@atsec.com> <CAKgNAki7oP-FLS7=J-J0Z+bgWyqNd3g=9OsDMG1GfY3AcPq4Ww@mail.gmail.com> <4E6A8B9E.4080707@atsec.com> <4E6E53C4.1010601@atsec.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070909060606080905090402"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E6E53C4.1010601-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------070909060606080905090402
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12.09.2011 20:47:32, +0200, Stephan Mueller
<stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org> wrote:

Hi,

> On 09.09.2011 23:56:46, +0200, Stephan Mueller
> <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org> wrote:
> 
> Hi,
> 
>>
>> Let us take the BSD license.
>>
>> Thank you very much.
> 
> Please find the updated man page attached. Unfortunately, I am not sure
> which version you want to have these files, I now appended the unzipped
> file as the tarball you distribute contains the unzipped files as well.
> 
There is a cleaned up version attached. I ensured that arguments are
formatted with .IR and function names with .BR.

-- 
Ciao
Stephan

--------------070909060606080905090402
Content-Type: text/plain;
 name="sendmmsg.2"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="sendmmsg.2"

.\" Copyright (c) 2011, Stephan Mueller <smueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
.\" All rights reserved.
.\"
.\" Redistribution and use in source and binary forms, with or without
.\" modification, are permitted provided that the following conditions
.\" are met:
.\" * Redistributions of source code must retain the above copyright
.\"   notice, this list of conditions and the following disclaimer.
.\" * Redistributions in binary form must reproduce the above copyright
.\"   notice, this list of conditions and the following disclaimer in
.\"   the documentation and/or other materials provided with the
.\"   distribution.
.\" * Neither the name of the atsec information security corp.
.\"   nor the names of its contributors may be used to endorse or
.\"   promote products derived from this software without specific prior
.\"   written permission.
.\"
.\" THIS SOFTWARE IS PROVIDED BY atsec information security corp.
.\" ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
.\" LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
.\" FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
.\" IN NO EVENT SHALL THE <copyright-holder>
.\" BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
.\" OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
.\" OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
.\" OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
.\" LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
.\" NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
.\" SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
.\"
.\" Parts of this man page are derived from recvmmsg(2).
.TH SENDMMSG 2 2010-11-23 "Linux" "Linux Programmer's Manual"
.SH NAME
sendmmsg \- send multiple messages on a socket
.SH SYNOPSIS
.BI "#include <sys/socket.h>"
.br
.BI "int sendmmsg(int " fd ", struct mmsghdr *" mmsghdr \
", unsigned int " vlen ","
.br
.BI "             unsigned int " flags ");" 
.SH DESCRIPTION
The 
.B sendmmsg 
system call transmits multiple messages to another socket.
It acts similar to 
.BR sendmsg (2),
but allows to batch multiple send operations into a single syscall.

.I fd 
is the file descriptor of the socket data is transmitted through. 
.I mmsghdr
is a pointer to an array with length
.I vlen
of  
.I mmsghdr
structures. 
.I struct mmsg 
is defined in
.I sys/socket.h
as:
.in +4n
.nf
struct mmsghdr {
    struct msghdr msg_hdr;  /* Message header */
    unsigned int  msg_len;
};
.fi
.in
.PP
.I msg_hdr 
is a struct
.I msghdr
as described in
.BR sendmsg (2).
.I msg_len
is the number of bytes send for the message in the entry.
This field has the same value as the return value of a single
.IR sendmsg (2)
on the header.

.B flags
contains flags ored together. The flags are the same
as documented for
.BR sendmsg (2).
.SH RETURN VALUE
.I sendmmsg
returns the number of messages sent in
.I mmsghdr
or 
-1
when an error occurs. The 
.I msg_len
members of 
.I mmsghdr
are updated for each sent message,
in addition to other fields in the msg_hdr for each message,
as described in 
.IR sendmsg (2).
.SH SEE ALSO
.BR recvmsg (2),
.BR recvmmsg (2),
.BR sendmsg (2),
.BR socket (7),
.BR socket (2),
.BR clock_gettime (2)
.SH VERSIONS
The
.B sendmmsg
syscall was added with kernel 3.0.
On earlier glibcs the function can be called
manually using 
.IR syscall (2).


--------------070909060606080905090402--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
