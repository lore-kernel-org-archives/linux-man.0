From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Edited draft of bpf(2) man page for review/enhancement
Date: Wed, 22 Jul 2015 17:58:41 +0200
Message-ID: <55AFBDB1.7070703@gmail.com>
References: <556583B4.4000607@gmail.com> <55658DB4.6000106@iogearbox.net> <55AFAD7A.6090009@gmail.com> <55AFB2E0.5060307@iogearbox.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55AFB2E0.5060307-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>, Silvan Jegen <s.jegen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Daniel,

On 07/22/2015 05:12 PM, Daniel Borkmann wrote:
> On 07/22/2015 04:49 PM, Michael Kerrisk (man-pages) wrote:
>> Hi Daniel,
>>
>> Sorry for the long delay in following up....
> 
> No worries, eBPF is quite some material. ;)
> 
>> On 05/27/2015 11:26 AM, Daniel Borkmann wrote:
>>> On 05/27/2015 10:43 AM, Michael Kerrisk (man-pages) wrote:
>>>> Hello Alexei,
>>>>
>>>> I took the draft 3 of the bpf(2) man page that you sent back in March
>>>> and did some substantial editing to clarify the language and add a
>>>> few technical details. Could you please check the revised  version
>>>> below, to ensure I did not inject any errors.
>>>>
>>>> I also added a number of FIXMEs for pieces of the page that need
>>>> further work. Could you take a look at these and let me know your
>>>> thoughts, please.
>>>
>>> That's great, thanks! Minor comments:
>>>
>>> ...
>>>> .TH BPF 2 2015-03-10 "Linux" "Linux Programmer's Manual"
>>>> .SH NAME
>>>> bpf - perform a command on an extended BPF map or program
>>>> .SH SYNOPSIS
>>>> .nf
>>>> .B #include <linux/bpf.h>
>>>> .sp
>>>> .BI "int bpf(int cmd, union bpf_attr *attr, unsigned int size);
>>>>
>>>> .SH DESCRIPTION
>>>> The
>>>> .BR bpf ()
>>>> system call performs a range of operations related to extended
>>>> Berkeley Packet Filters.
>>>> Extended BPF (or eBPF) is similar to
>>>> the original BPF (or classic BPF) used to filter network packets.
>>>> For both BPF and eBPF programs,
>>>> the kernel statically analyzes the programs before loading them,
>>>> in order to ensure that they cannot harm the running system.
>>>> .P
>>>> eBPF extends classic BPF in multiple ways including the ability to call
>>>> in-kernel helper functions (via the
>>>> .B BPF_CALL
>>>> opcode extension provided by eBPF)
>>>> and access shared data structures such as BPF maps.
>>>
>>> I would perhaps emphasize that maps can be shared among in-kernel
>>> eBPF programs, but also between kernel and user space.
>>
>> This is covered later in the page, under the "BPF maps" subheading.
>> Maybe you missed that? (Or did you think it doesn't suffice?)
> 
> Okay, I presume you mean:
> 
>    Maps are a generic data structure for storage of different types
>    and sharing data between the kernel and user-space programs.
> 
> Maybe, to emphasize both options a bit (not sure if it's better in
> my words, though):
> 
>    Maps are a generic data structure for storage of different types
>    and allow for sharing data among eBPF kernel programs, but also
>    between kernel and user-space applications.

Yes, that's better. I tweaked that a little and included it in the page.
Thanks.

>>>> The programs can be written in a restricted C that is compiled into
>>>> .\" FIXME In the next line, what is "a restricted C"? Where does
>>>> .\"       one get further information about it?
>>>
>>> So far only from the kernel samples directory and for tc classifier
>>> and action, from the tc man page and/or examples/bpf/ in the tc git
>>> tree.
>>
>> So, given that we are several weeks down the track, and things may have
>> changed, I'll re-ask the questions ;-) :
>>
>> * Is this restricted C documented anywhere?
> 
> Not (yet) that I'm aware of. We were thinking that short-mid term
> to polish the stuff that resides in the kernel documentation, that
> is, Documentation/networking/filter.txt, to get it in a better
> shape, which I presume, would also include a documentation on the
> restricted C. So far, examples are provided in the tc-bpf man page
> (see link below).
> 
> The set of available helper functions callable from eBPF resides
> under (enum bpf_func_id):
>    https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/bpf.h
> 

Yep, I did eventually find that on my own.

[...]

>>>> BPF maps are a generic data structure for storage of different data types.
>>>> A user process can create multiple maps (with key/value-pairs being
>>>> opaque bytes of data) and access them via file descriptors.
>>>> BPF programs can access maps from inside the kernel in parallel.
>>>> It's up to the user process and BPF program to decide what they store
>>>> inside maps.
>>>> .P
>>>> BPF programs are similar to kernel modules.
>>>> They are loaded by the user
>>>> process and automatically unloaded when the process exits.
>>>
>>> Generally that's true. Btw, in 4.1 kernel, tc(8) also got support for
>>> eBPF classifier and actions, and here it's slightly different: in tc,
>>> we load the programs, maps etc, and push down the eBPF program fd in
>>> order to let the kernel hold reference on the program itself.
>>>
>>> Thus, there, the program fd that the application owns is gone when the
>>> application terminates, but the eBPF program itself still lives on
>>> inside the kernel. But perhaps it's already too much detail to mention
>>> here ...
>>
>> Well, it should be documented somewhere....
> 
> Yep, fwiw some time ago I've hacked together a man page for tc:
> 
> https://git.kernel.org/cgit/linux/kernel/git/shemminger/iproute2.git/commit/?id=cbdd1e6921d21815e35d2a96526cfbad5ac98e09

I added a reference to that page (tc-bpff(8) under SEE ALSO.

[...]

>> I'll send out a new draft soon, but in the meantime hopefully you
>> or Alexei might have a chance to answer some open questions (see my
>> other mail to Alexei, which will be sent soon), so I can further edit
>> the page before sending it out.
> 
> Later on, we should also add a paragraph on eBPF tail calls, but one
> step at a time.

Yep, I have a FIXME for that.

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
