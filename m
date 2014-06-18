From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] man2/syscalls.2: Add prlimit64.
Date: Wed, 18 Jun 2014 10:40:18 -0400
Message-ID: <53A1A4D2.60903@redhat.com>
References: <53A053B3.1000704@redhat.com> <53A08684.7050804@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53A08684.7050804-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 06/17/2014 02:18 PM, Michael Kerrisk (man-pages) wrote:
> On 06/17/2014 04:41 PM, Carlos O'Donell wrote:
>> While trying to reconcile the new features in glibc with the
>> documented entries in the linux kernel man pages I noticed that
>> glibc exports prlimit64 for use by 32-bit applications (as does
>> the linux kernel), but that prlimit64 was not defined in the
>> syscalls list or in the prlimit-related page.
>>
>> This is not the complete fix for this, but I don't have the time
>> to explain why and when prlimit64 should be used (or how it should
>> be used safely). Therefore I'm just patching the syscalls.2 list
>> to show that prlimit64 exists and was added in 2.6.36 (verified
>> with git by checking out the tags before and after).
>>
>> Unless you've purposely excluded prlimit64 to avoid telling users
>> about it because it's complicated, please apply.
>>
>> Patch against master.
> 
> Thanks, Carlos. Applied. When you one day explain it, probably
> I will also get a bit of an educations :-).

It's the `struct rlimit64`-equivalent syscall for the kernel.

Given that prlimit and prlimit64 were added at the same
time glibc's prlimit function always calls prlimit64 and
converts where possible the struct rlimit64 to a struct
rlimit handling overflows and nasty error cases. So prlimit
is not a wrapper, but prlimit64 *is* just a syscall wrapper.
Thus the complexity and probably verbose notes we'll need to
add for direct usage of prlimit64.

Cheers,
Carlos.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
