From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: vdso(7): new man page
Date: Wed, 01 Jan 2014 23:36:22 +1300
Message-ID: <52C3EFA6.7080507@gmail.com>
References: <201304092317.01590.vapier@gentoo.org> <201304112128.47633.vapier@gentoo.org> <519CC681.6080502@gmail.com> <201312310232.23392.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201312310232.23392.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Mike,

Thanks for following up on this.

On 12/31/13 20:32, Mike Frysinger wrote:
> On Wednesday 22 May 2013 09:22:09 Michael Kerrisk wrote:
>> On 04/12/13 03:28, Mike Frysinger wrote:
>>> here's v2 w/Andy's feedback
>>
>> Thanks for this--it's a nice piece of work. Could you take a
>> look at my comments below and send a v3, please.
> 
> anything i didn't explicitly respond to below i merged with my version
> 
>>> the kernel you wish to make a syscall.
>>> However, this instruction is expensive: it goes through the full
>>> interrupt handling paths in the processor's microcode as well as in the
>>> kernel. Newer processors have faster (but backwards incompatible)
>>> instructions to initiate system calls.
>>> Rather than require the C library to figure out if this functionality is
>>> available at runtime itself, it can use functions provided by the kernel
>>> in the vDSO.
>>
>> That last point (after the comma) is the most interesting (IMO) of the use
>> cases of the vDSO. If you cared to expand on the details (i.e., are what
>> are mechanics of the operation of those functions provided by the kernel),
>> I think that would be interesting for the reader.
> 
> i think the paragraph after this explains things somewhat as you'd like (where 
> it talks about gettimeofday) ?

Yes, thanks.

>>> All symbols are also versioned (using the GNU version format).
>>> This allows the kernel (in the very unlikely situation) to update the
>>> function
>>
>> s/situation/case that it is necessary/
> 
> hmm, i see what you mean, but i think your version isn't really better ... 
> just different.  i'll just delete the (...) text.

Okay.

>>> You use the standard C calling conventions when calling any of these
>>> functions. No need to worry about weird register or stack behavior.
>>
>> That last sentence is a little incomplete. Could you expand/reword a little
>> please.
> 
> it's meant as a follow up to the previous sentence.  so the implication is 
> that there are no functions which violate the C ABI for your particular 
> target.  arguments get passed in the standard way (registers/stack), and all 
> the registers have corresponding behavior: scratch are scratch, caller-
> preserved are caller-preserved, callee-preserved are callee-preserved, etc...

>>> Note that the vDSO that is used is based on the ABI of your userspace
>>> code and not the ABI of the kernel.
>>> i.e. If you run an i386 32bit ELF under an i386 32bit kernel or under an
>>
>> s/i.e. If/In other words, if/
> 
> i.e. shows up a lot in man pages as does e.g. (and both show up in this new 
> vdso(7) page) ...

I should have been clearer. I disfavor the use of "e.g." and "i.e.", except
in parenthetical asides. There were a very few exceptions to that guideline,
and I just now went through and stamped out most of them. And I edited your
page to be consistent with the guideline.


>>> So when referring to sections below, use the userspace ABI.
>>
>> It's not clear what you mean here when you say "use the userspace ABI."
>> Could you clarify?
> 
> the two sentences that preceded this one explained things ...

Sorry -- I still don't get it... (See my other reply.)

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
