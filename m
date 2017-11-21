From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] s390_sthyi.2: New page for s390-specific s390_sthyi(2)
Date: Tue, 21 Nov 2017 09:48:02 +0100
Message-ID: <CAKgNAkiRRqLpADiObHVGqxfgwYSqU23LuMEnThQmU1xXTTNMZA@mail.gmail.com>
References: <20171120133420.4700-1-haoqf@linux.vnet.ibm.com>
 <8b4188fa-bdda-c3eb-5184-cecf78267f0f@gmail.com> <10afe17f-9874-06c6-acd3-7da8fe14af55@linux.vnet.ibm.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <10afe17f-9874-06c6-acd3-7da8fe14af55-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: QingFeng Hao <haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Christian Borntraeger <borntraeger-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello QingFeng,

On 21 November 2017 at 09:26, QingFeng Hao <haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org> wrote=
:
>
>
> =E5=9C=A8 2017/11/20 23:37, Michael Kerrisk (man-pages) =E5=86=99=E9=81=
=93:
>>
>> Hello QingFeng
>>
>> Thank you for this manual page! Could I ask that you
>> address some points below please.
>
> Hello Michael,
> Thanks a lot and please see my comments below.
>
>>
>> On 11/20/2017 02:34 PM, QingFeng Hao wrote:
>>>
>>> Signed-off-by: QingFeng Hao <haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
>>> ---
>>>   man2/s390_sthyi.2 | 115
>>> ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 115 insertions(+)
>>>   create mode 100644 man2/s390_sthyi.2
>>>
>>> diff --git a/man2/s390_sthyi.2 b/man2/s390_sthyi.2
>>> new file mode 100644
>>> index 0000000..c8797b7
>>> --- /dev/null
>>> +++ b/man2/s390_sthyi.2
>>> @@ -0,0 +1,115 @@
>>> +.\" Copyright IBM Corp. 2017
>>> +.\" Author: QingFeng Hao <haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
>>> +.\"
>>> +.\" %%%LICENSE_START(GPLv2+_DOC_FULL)
>>> +.\" This is free documentation; you can redistribute it and/or
>>> +.\" modify it under the terms of the GNU General Public License as
>>> +.\" published by the Free Software Foundation; either version 2 of
>>> +.\" the License, or (at your option) any later version.
>>> +.\"
>>> +.\" The GNU General Public License's references to "object code"
>>> +.\" and "executables" are to be interpreted as the output of any
>>> +.\" document formatting or typesetting system, including
>>> +.\" intermediate and printed output.
>>> +.\"
>>> +.\" This manual is distributed in the hope that it will be useful,
>>> +.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> +.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> +.\" GNU General Public License for more details.
>>> +.\"
>>> +.\" You should have received a copy of the GNU General Public
>>> +.\" License along with this manual; if not, see
>>> +.\" <http://www.gnu.org/licenses/>.
>>> +.\" %%%LICENSE_END
>>> +.\"
>>> +.TH S390_STHYI 2 2017-09-21 "Linux Programmer's Manual"
>>> +.SH NAME
>>> +s390_sthyi \- emulate STHYI instruction
>>> +.SH SYNOPSIS
>>> +.nf
>>> +.B #include <asm/unistd.h>
>>> +.PP
>>> +.BI "int s390_sthyi(unsigned long " function_code ", void *" buffer ",
>>> uint64_t *" return_code ", unsigned long " flags ");
>>> +.fi
>>> +.SH DESCRIPTION
>>> +The
>>> +.BR s390_sthyi ()
>>> +system call emulates the STHYI (Store Hypervisor Information)
>>> instruction.
>>> +It provides hardware resource information for the machine and its
>>> virtualization
>>> +levels. This includes CPU type and capacity, as well as the machine
>>> model and
>>> +other metrics.
>>> +.PP
>>> +The
>>> +.I function_code
>>> +argument indicates which function to perform.
>>> +The following code(s) are supported:
>>> +.RB ( 0 )
>>> +CP and IFL capacity information.
>>
>> The line above is hard to understand. It needs a verb.
>> What is done with the CP and IFL capacity information?
>>
>> It may also be helpful to explain what the abbreviations "CP"
>> and "IFL" stand for.
>
> Return CP (Central Processor) and IFL (Integrated Facity for Linux) capac=
ity
> information

Okay.

>>> +.PP
>>> +The
>>> +.I buffer
>>> +argument specifies the address of response buffer. If the system
>>> +call returns 0, the response buffer will be filled with CPU capacity
>>> +information. Otherwise, the response buffer's content is unchanged.
>>> +.PP
>>> +The
>>> +.I return_code
>>> +argument stores the return code of the STHYI instruction, success
>>> +.RB ( 0 )
>>> +or unsupported function code
>>> +.RB ( 4 ).
>>> +For details about this and function_code, buffer argument, please
>>> reference the link in
>>> +.IR "CONFORMING TO"
>>> +below.
>>> +.PP
>>> +The
>>> +.I flags
>>> +argument is provided to allow for future extensions and currently
>>> +must be set to "0".
>>> +.SH RETURN VALUE
>>> +On success,
>>> +.BR s390_sthyi ()
>>> +returns 0 and stores CPU capacity information to
>>> +.I buffer.
>>> +.PP
>>> +On error, -1 is returned, and
>>> +.IR errno
>>> +is set appropriately.
>>> +.PP
>>> +On other cases, the value of condition code is returned, which current=
ly
>>
>> What does "On other cases" mean? When do those cases happen?
>> Could you reword please.
>
> The case is:
> If the STHYI facility is enabled and the system call fails to execute the
> underlying
> STHYI instruction, the value of condition code is returned, which current=
ly
> is only
> 3 indicating "unsupported function code".
> Is this OK to put it here?

Let me see if I understand correctly. There are three possible return
values for this system call:

0 =3D=3D> success
-1 =3D=3D> failure (and errno is set)
[condition code value is returned -- e,g,, 3]

This last case is a kind of failure in the system call, right?

If this is correct, this is a highly unusual--possibly even
unique--model for the system call return value. Most (in fact, I think
all) system calls indicate errors by returning -1. Values >=3D 0 always
mean success. I think it may be worth revisiting this design, to make
it more consistent with the usual conventions. For example, why not
handle the last case by returning -1, setting errno to some value
(maybe ENOTSUP), and return the condition code in *buffer?.

>>> +is only 3 indicating "unsupported function code".
>>> +.SH ERRORS
>>> +.TP
>>> +.B EINVAL
>>> +The value specified in
>>> +.I flags
>>> +is non-zero.
>>> +.TP
>>> +.B EOPNOTSUPP
>>> +The value specified in
>>> +.I function_code
>>> +is not a valid value.
>>> +.TP
>>> +.B EFAULT
>>> +The value specified in
>>> +.I buffer
>>> +or
>>> +.I return_code
>>> +is not a valid address.
>>> +.TP
>>> +.B ENOMEM
>>> +Allocating memory for handling the CPU capacity information failed.
>>> +.IR "CONFORMING TO"
>>> +below.
>>
>> The last two lines do not make a complete sentence. What do
>> you want to say here?
>
> Sorry, it's a mistake and I'll remove them.

Okay.

>>> +.SH VERSIONS
>>> +This system call is available since Linux 4.15.
>>> +.SH CONFORMING TO
>>> +This Linux-specific system call is available only on the s390
>>> architecture.
>>> +For details about the STHYI instruction, please reference the link:
>>>
>>> +https://www.ibm.com/support/knowledgecenter/SSB27U_6.3.0/com.ibm.zvm.v=
630.hcpb4/hcpb4sth.htm#hcpb4-sth__headsec
>>> +.SH NOTES
>>> +Glibc does not provide a wrapper for this system call, use
>>> +.BR syscall (2)
>>> +to call it.
>>> +.SH SEE ALSO
>>> +.BR syscall (2)

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
