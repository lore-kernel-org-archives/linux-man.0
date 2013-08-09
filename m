From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] syscall.2: correct registers for arm/EABI
Date: Fri, 09 Aug 2013 10:14:26 +0200
Message-ID: <5204A4E2.70609@gmail.com>
References: <CALiXj0DSRYwxa07h3uOgk7FB8BssaWmwWmnzLYwUvtaNqSgpsg@mail.gmail.com> <CAKgNAkiMpPwFR=CFGvF+-bCAwvscUFdG8HFsLZPnb50ZOdQASA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkiMpPwFR=CFGvF+-bCAwvscUFdG8HFsLZPnb50ZOdQASA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Johan Erlandsson <jeoerl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 08/09/13 09:41, Michael Kerrisk (man-pages) wrote:
> [CC += Mike F]
> 
> On Fri, Aug 9, 2013 at 1:59 AM, Johan Erlandsson <jeoerl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Registers was off by one.
> 
> I'd like some more eyes on this. Mike, does this look good to you?

So, looking at this again, the proposed patch certainly seems consistent with
various other sources, e.g.:

http://peterdn.com/post/e28098Hello-World!e28099-in-ARM-assembly.aspx
https://wiki.debian.org/ArmEabiPort
http://en.wikipedia.org/wiki/Calling_convention#ARM

Patch applied.

Cheers,

Michael


>> Reference:
>> http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=3105/4
>> ---
>>  man2/syscall.2 |    4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/man2/syscall.2 b/man2/syscall.2
>> index 1cca9ce..a4a243d 100644
>> --- a/man2/syscall.2
>> +++ b/man2/syscall.2
>> @@ -156,7 +156,7 @@ l l1 l l1 l.
>>  arch/ABI       instruction     syscall #       retval  Notes
>>  _
>>  arm/OABI       swi NR  -       a1      NR is syscall #
>> -arm/EABI       swi 0x0 r7      r1
>> +arm/EABI       swi 0x0 r7      r0
>>  blackfin       excpt 0x0       P0      R0
>>  i386   int $0x80       eax     eax
>>  ia64   break 0x100000  r15     r10/r8
>> @@ -181,7 +181,7 @@ l l l l l l l l.
>>  arch/ABI       arg1    arg2    arg3    arg4    arg5    arg6    arg7
>>  _
>>  arm/OABI       a1      a2      a3      a4      v1      v2      v3
>> -arm/EABI       r1      r2      r3      r4      r5      r6      r7
>> +arm/EABI       r0      r1      r2      r3      r4      r5      r6
>>  blackfin       R0      R1      R2      R3      R4      R5      -
>>  i386   ebx     ecx     edx     esi     edi     ebp     -
>>  ia64   r11     r9      r10     r14     r15     r13     -
>> --
>> 1.7.9.5
> 
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
