From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] prctl.2: add information regarding PR_SET_FP_MODE and
 PR_GET_FP_MODE options
Date: Sun, 20 Nov 2016 18:26:37 +0100
Message-ID: <eb7d6f73-e4b4-ed7f-39f4-1855b19438e0@gmail.com>
References: <20161120005511.GA17261@obsidian>
 <ac782540-3001-899d-2e13-17ff24d6d2cb@gmail.com>
 <20161120145944.GA8724@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161120145944.GA8724@obsidian>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Eugene,

On 11/20/2016 03:59 PM, Eugene Syromyatnikov wrote:
> On Sun, Nov 20, 2016 at 12:27:28PM +0100, Michael Kerrisk (man-pages) wrote:
>> Hi Eugene,
>>
>> I have applied this patch and tweaked some pieces (and pushed to Git),
>> but some parts need work still, I think. See my comments below.
>>
>> Rather than sending a patch, I think it would be easier if you just
>> respond to my comments in line below.
>>
>>
>> On 11/20/2016 01:55 AM, Eugene Syromyatnikov wrote:
>>> Based on description provided in commit 9791554b and information in
>>> https://dmz-portal.mips.com/wiki/MIPS_O32_ABI_-_FR0_and_FR1_Interlinking
>>> ---
>>>  man2/prctl.2 | 100 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 100 insertions(+)
>>>
>>> diff --git a/man2/prctl.2 b/man2/prctl.2
>>> index ae1fbc5..954641c 100644
>>> --- a/man2/prctl.2
>>> +++ b/man2/prctl.2
>>> @@ -263,6 +263,98 @@ or
>>>  Return the endian-ness of the calling process,
>>>  in the location pointed to by
>>>  .IR "(int\ *) arg2" .
>>> +.\" 9791554b45a2acc28247f66a5fd5bbc212a6b8c8
>>> +.TP
>>> +.BR PR_SET_FP_MODE " (since Linux 4.0, only on MIPS)"
>>> +On MIPS, user land code can be built using ABI which permits linking with a code
>>> +with a more restrictive floating point requirements.  For example, user land
>>> +code may be built to target the O32 FPXX ABI and linked with code built for
>>> +either one of the more restrictive FP32 or FP64. When more restrictive code is
>>> +linked in, the overall requirement for the process is to use this more
>>> +restrictive floating point mode. Since kernel has no means of knowing in advance
>>> +which mode process should be executed in, and having possibility that these
>>> +restrictions can be changed during the process' lifetime, 
>>
>> I have trouble to understand "and having possibility that these
>> restrictions can be changed during the process' lifetime".
>>
>> I think the main problem is: who can do the changing?
>> It's not clear from the sentence. Can you explain a little?
>
> Yes, you are correct; probably the note regarding the time of change is
> rather misleading; the need for change which can be determined only from user
> space is what has lead to such interface.

So, how would the wording be:

[[
Because the kernel has no means of knowing in advance
which mode the process should be executed in,
and because the ABI restrictions can 
change over the lifetime of the process, the
.B PR_SET_FP_MODE
operation is provided to allow control of the floating-point mode
from user space.
]]

>>> the ability to control
>>> +it from the user space via this option is provided.
>>
>> Does "it" in the previous line mean "the floating-point mode"?
> Yes.

Thanks.

>>> +
>>> +.\" https://dmz-portal.mips.com/wiki/MIPS_O32_ABI_-_FR0_and_FR1_Interlinking
>>> +The
>>> +.I (unsigned int) arg2
>>> +argument is a bit mask describing floating point mode used:
>>> +.RS
>>> +.TP
>>> +.BR PR_FP_MODE_FR " = " "(1 << 0)"
>>
>> I removed the piece [" = " "(1 << 0)"] (and similar below), since
>> presumably user-space doesn't need to know the precise numeric
>> values.
> Yes, sure.

Okay.

>>> +When this bit is
>>> +.I unset
>>> +(so called
>>> +.BR FR=0 " or " FR0
>>> +mode), 32 FP registers are 32-bit wide, and 64-bit registers are represented as
>>
>> What are "32 FP registers"? (And again below.)
>>
>> Perhaps this is just a language issue. Should it be "the 32 FP registers"?
>> (The lack of an article--"the" or "a"--can sometimes be fatal to 
>> comprehension in English.)
> Yes, you are correct, I meant the amount of floating point registers available.

Okay. Fixed.

>>> +pair of registers (even- and odd- numbered, with even-numbered register
>>> +containing lower 32 bits, and odd-numbered register containing higher 32 bits).
>>> +When this bit is
>>> +.I set
>>> +(on supported hardware), 32 FP registers are 64-bit wide (so called
>>
>> "the 32 FP registers"?
> Right.

Fixed.

>>> +.BR FR=1 " or " FR1
>>> +mode). Note that modern MIPS implementations (MIPS R6 and newer) support
>>> +.B FR=1
>>> +mode only.
>>> +
>>> +Applications that use O32 FP32 ABI can operate only when this bit is
>>> +.I unset
>>> +.RB ( FR=0 ;
>>> +or they can be used with FRE enabled, see below).
>>> +Applications that use O32 FP64 ABI (and O32 FP64A ABI, which exists for
>>> +providing ability to operate with existing FP32 code; see below) can operate
>>> +only when this bit is
>>> +.I set
>>> +.RB ( FR=1 ).
>>> +Applications that use O32 FPXX ABI can operate in both cases.
>>
>> What does "both cases" mean in the above line?
> Both in case of FR=0 and FR=1.

So, I made this:
[[
Applications that use the O32 FPXX ABI can operate in with either
.BR FR=0
or
.BR FR=1 .
]]

Okay?

>>> +.TP
>>> +.BR PR_FP_MODE_FRE " = " "(1 << 1)"
>>> +Compatibility with 32-bit FP mode. When this mode is enabled, it emulates 32-bit
>>
>> I think the first sentence needs at least one or two more words.  Is
>>
>>     Provide compatibility with 32-bit FP mode.
>>
>> correct?
> Yes. Another possibility is "Enable emulation of 32-bit FP mode".

Ah that's better. Changed.

>>> +FP operations by raising reserved instruction exception on every instruction
>>> +that uses 32-bit formats and kernel then handles the instruction in software
>>> +(the problem lies in discrepancy of handling odd-numbered registers which are
>>> +high 32 bits of 64-bit registers with even numbers in
>>> +.B FR=0
>>> +mode and lower 32-bit parts of odd-numbered 64-bit registers in
>>> +.B FR=1
>>> +mode). Enabling of this bit is needed when code with O32 FP32 ABI should operate
>>> +with code with compatible O32 FPXX or O32 FP64A ABIs (which require
>>> +.B FR=1
>>> +FPU mode) or when it is executed on newer hardware (MIPS R6 onwards) which lacks
>>> +.B FR=0
>>> +mode support when binary with FP32 ABI is used.
>>> +.IP
>>> +Note that this mode only makes sense when FPU is in 64-bit mode
>>> +.RB ( FR=1 .)
>>> +.IP
>>> +Note that usage of emulation inherently has a significant performance hit and
>>> +should be avoided if possible.
>>> +.RE
>>> +.IP
>>> +Note that for N32/N64 ABI is a different story and does not need FPU emulation
>>> +and always operates in
>>> +.B FR=1
>>> +mode.
>>
>> That last sentence is a bit hard to parse. Would the following be okay:
>>
>> [[
>> For the N32/N64 ABI, the story is different story: FPU emulation
>> is not required and the FPU always operates in
>> .B FR=1
>> mode.
>> ]]
>>
>> ?
> Maybe
> 
> [[
> In N32/N64 ABI, 64-bit FP mode is always used, so FPU emulation
> is not required and the FPU always operates in
> .B FR=1
> mode.
> ]]
> 
> ?

Good. Taken as you gave it. Thanks.

>>> +.IP
>>> +This option is mainly intended for use by dynamic loader, but may be of use by
>>> +applications in case library loading during runtime (via
>>> +.BR dlopen (3),
>>> +for example) is used.
> Please discard the note regarding dlopen, I've incorrectly interpreted
> the glibc code found in sysdeps/mips/tst-abi-interlink.c; looks like
> glibc also accounts for libraries loaded via dlopen too (as noted in
> sysdeps/mips/dl-machine-reject-phdr.h); as a result,
> looks like this command is of little use for user applications and intended
> mainly for libc implementations (or some very specific applications which
> have to deal with pre-generated FP code, maybe).

So, then just replace those lines with:

    This option is mainly intended for use by dynamic loader.

?

(Current version pushed to Git.)

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
