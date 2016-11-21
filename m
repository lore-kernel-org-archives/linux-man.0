From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] mprotect.2: Added information regarding
 PROT_{SEM,SAO,GROWSUP,GROWSDOWN}
Date: Mon, 21 Nov 2016 11:09:04 +0100
Message-ID: <cf07546c-e0dd-20c8-1bfd-a718718b516a@gmail.com>
References: <20161120011603.GA31811@obsidian>
 <91214c03-05a1-ad11-7ac8-282dc4177cca@gmail.com>
 <CACGkJdvCeG4a8dYb5JkbUtaCmpsZ_V8Mn_azucR1a+dKyo9xtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACGkJdvCeG4a8dYb5JkbUtaCmpsZ_V8Mn_azucR1a+dKyo9xtA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 11/21/2016 01:29 AM, Eugene Syromyatnikov wrote:
> On Sun, Nov 20, 2016 at 9:39 PM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hello Eugene,
>>
>> I've applied this patch, and tweaked a few pieces, but need
>> help on one point.
>>
>> On 11/20/2016 02:16 AM, Eugene Syromyatnikov wrote:

[...]

>>> +.B PROT_GROWSUP
>>> +Apply protection mode up to the end of the mapping which grows up (it should be a
>>> +stack segment on HP PA-RISC, since there are no other ways to map a segment with
>>> +.B VM_GROWSUP
>>> +even if architecture has support for it.)
>>
>> We need a different way to talk about VM_GROWSUP, since that is
>> a detail internal to the kernel. Do you have a suggestion?
> Well, it's difficult to say, because, while there is some support for
> VMAs that grow up or down, there are little controls available from
> userspace (judging by the code i've read).  There's no way to perform
> such mapping manually; on HP PA-RISC, it is done implicitly for stack,
> as i understood, and on ia64 it should be used for register offload.
> But the only handling present in mmap() is for
> MAP_GROWSDOWN/MAP_DENYWRITE/MAP_LOCKED (calc_vm_flag_bits(); so, even
> if MAP_GROWSUP definition is present on ia64, it can't be actually
> used), and the VM_GROWSUP flag itself is arch-specific and defined
> only on some arhitectures (pa-risc, metag and ia64) and used only as a
> definition for VM_STACK.
> 
> Maybe, just say "Apply protection mode up to the end of the mapping
> which grows up (stack segment on HP PA-RISC and some other
> architectures where it grows up and not down)", because there couldn't
> be any other segments with this flag set.

Thanks. I reworded along those lines. While looking at this
stuff, I was also prompted to add some detail about MAP_GROWSDOWN
to mmap(2).

All changes pushed to Git.

Cheers,

Michael




-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
