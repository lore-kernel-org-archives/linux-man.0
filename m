From: KOSAKI Motohiro <kosaki.motohiro@gmail.com>
Subject: Re: [RESEND][PATCH] Mark thread stack correctly in proc/<pid>/maps
Date: Wed, 08 Feb 2012 12:57:10 -0500
Message-ID: <4F32B776.6070007@gmail.com>
References: <20120116163106.GC7180@jl-vm1.vm.bytemark.co.uk> <1326776095-2629-1-git-send-email-siddhesh.poyarekar@gmail.com> <CAAHN_R2g9zaujw30+zLf91AGDHNqE6HDc8Z4yJbrzgJcJYFkXg@mail.gmail.com> <4F2B02BC.8010308@gmail.com> <CAAHN_R0O7a+RX7BDfas3+vC+mnQpp0h3y4bBa1u4T-Jt=S9J_w@mail.gmail.com> <CAHGf_=qA6EFue2-mNUg9udWV4xSx86XQsnyGV07hfZOUx6_egw@mail.gmail.com> <CAAHN_R0+ExGcdpLM7KwC_KsPOemVOiRrmyWcowiu5_cWW3BPLQ@mail.gmail.com> <CAAHN_R0N=3J4=VqvDsGB=_2Ln9yKBjOevW2=_UAMBK1pGepqvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <CAAHN_R0N=3J4=VqvDsGB=_2Ln9yKBjOevW2=_UAMBK1pGepqvA@mail.gmail.com>
Sender: owner-linux-mm@kvack.org
To: Siddhesh Poyarekar <siddhesh.poyarekar@gmail.com>
Cc: Jamie Lokier <jamie@shareable.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, linux-man@vger.kernel.org, Mike Frysinger <vapier@gentoo.org>
List-Id: linux-man@vger.kernel.org

(2/7/12 11:00 PM), Siddhesh Poyarekar wrote:
> On Sat, Feb 4, 2012 at 12:04 AM, Siddhesh Poyarekar
> <siddhesh.poyarekar@gmail.com>  wrote:
>> On Fri, Feb 3, 2012 at 1:31 PM, KOSAKI Motohiro
>> <kosaki.motohiro@gmail.com>  wrote:
>>> The fact is, now process stack and pthread stack clearly behave
>>> different dance. libc don't expect pthread stack grow automatically.
>>> So, your patch will break userland. Just only change display thing.
> <snip>
>> I have also dropped an email on the libc-alpha list here to solicit
>> comments from libc maintainers on this:
>>
>> http://sourceware.org/ml/libc-alpha/2012-02/msg00036.html
>>
>
> Kosaki-san, your suggestion of adding an extra flag seems like the
> right way to go about this based on the discussion on libc-alpha,
> specifically, your point about pthread_getattr_np() -- it may not be a
> standard, but it's a breakage anyway. However, looking at the vm_flags
> options in mm.h, it looks like the entire 32-bit space has been
> exhausted for the flag value. The vm_flags is an unsigned long, so it
> ought to take 8 bytes on a 64-bit system, but 32-bit systems will be
> left behind.
>
> So there are two options for this:
>
> 1) make vm_flags 64-bit for all arches. This will cause ABI breakage
> on 32-bit systems, so any external drivers will have to be rebuilt

Several month ago, Linus NAKed this way.


> 2) Implement this patch for 64-bit only by defining the new flag only
> for 64-bit. 32-bit systems behave as is

No. That's bad than status quo. Enduser may get inconsistent and bad user
experience.

Now, we are using some bit saving hack. example,

1) use ifdef

#ifndef CONFIG_TRANSPARENT_HUGEPAGE
#define VM_MAPPED_COPY 0x01000000      /* T if mapped copy of data (nommu mmap) */
#else
#define VM_HUGEPAGE    0x01000000      /* MADV_HUGEPAGE marked this vma */
#endif

2) use bit combination

#define VM_STACK_INCOMPLETE_SETUP      (VM_RAND_READ | VM_SEQ_READ)


Maybe you can take a similar way. And of course, you can ban some useless flag
bits.

thanks.

> Which of these would be better? I prefer the latter because it looks
> like the path of least breakage.
>

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Fight unfair telecom internet charges in Canada: sign http://stopthemeter.ca/
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
