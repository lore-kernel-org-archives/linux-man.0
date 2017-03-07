From: Victor Khimenko <khim-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: syscall(2)
Date: Tue, 7 Mar 2017 22:51:30 +0100
Message-ID: <CABLBYvRKpgpg9cHMksP3v0StizrZKKYO0ih4E90vc7dti4cgfw@mail.gmail.com>
References: <CABLBYvTBKvQXSmiGx3LOUoFHZDGAMmNCofcuHTiKW51kS2bh4g@mail.gmail.com>
 <CAKgNAkg1iRisrd18WHn64j1NWAs2T0hrsc7dRoZs4XPV_22uhA@mail.gmail.com>
 <20170306190803.GJ28432@vapier> <58BEA1F3.2070502@bfs.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <58BEA1F3.2070502-fPG8STNUNVg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wharms-fPG8STNUNVg@public.gmane.org
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Changhee Han <ch0.han-Hm3cg6mZ9cc@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Mar 7, 2017 at 1:05 PM, walter harms <wharms-fPG8STNUNVg@public.gmane.org> wrote:
>
>
> Am 06.03.2017 20:08, schrieb Mike Frysinger:
>> On 06 Mar 2017 12:01, Michael Kerrisk (man-pages) wrote:
>>> [Extending the CC for some other input. Changhee Han added the text
>>> that you are asking about; Mike F has done a lot of other work on the
>>> page. Perhaps they can comment.]
>>>
>>> On 5 March 2017 at 09:08, Victor Khimenko <khim-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
>>>> syscall(2) example includes the following snippet which explains how to
>>>> call readahead on ARM:
>>>>
>>>>        syscall(SYS_readahead, fd, 0,
>>>>                    (unsigned int) (offset >> 32),
>>>>                    (unsigned int) (offset & 0xFFFFFFFF),
>>>>                    count);
>>>>
>>>> But ARM EABI specifies that "A double-word sized type is passed in two
>>>> consecutive registers (e.g., r0 and r1, or r2 and r3). The content of
>>>> the registers is as if the value had been loaded from memory representation
>>>> with a single LDM instruction."
>>>>
>>>> This would imply that arguments are swapped around in the man page, no?
>>>
>>> So, I'm taking it that you mean the call should look like this:
>>>
>>>        syscall(SYS_readahead, fd, 0,
>>>                    (unsigned int) (offset & 0xFFFFFFFF),
>>>                    (unsigned int) (offset >> 32),
>>>                   count);
>>>
>>> Is that what you mean?
>>>
>>>> I've tried to experiement and with ftruncate, at least, it works like
>>>> this...
>>>
>>> Sounds plausible. I'm hoping that Mike or Changhee Han might comment.
>>
>> it depends on the endianness.  the man page shows BE, and Victor's
>> suggestion changes it to LE.  we probably need to explain that and
>> not just swap the args in the example.
>> -mike
>
>
> I think that the point is: "invokes the system call whose assembly language interface"
>
> And a lot of new programmes have no experience with assembler these days. So the example
> should go into more details an explain how this is mapped into registers.
> e.g. ARM/EABI
>           syscall(SYS_readahead,                    // r7
>                    fd,                              // r0
>                     0,                              // r1
>                    (unsigned int) (offset >> 32),   // r2
>                    (unsigned int) (offset & 0xFFFFFFFF), // r3
>                    count);                         //r4
>
> Then the next lines make more sense for the reader:
> "       Since  the  offset  argument is 64 bits, and the first argument (fd) is
>        passed in r0, the caller must manually split and align the 64-bit value
>        so  that it is passed in the r2/r3 register pair.  That means inserting
>        a dummy value into r1 (the second argument of 0)."
>
> then adding something like pitfalls:
> The programmer needs to be aware of the endianess of is cpu. Big Endian CPU will
> need to swap arguments.
>
> @khim-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
> what do you think ?
>
Well, as long as explanation is correct - I'm happy. Would probably
good idea to convert example to Little Endian and mention that "Big
Endian CPU would swap r2 and r3 arguments".

Nowadays most platforms (including most ARM platforms) are Little
Endian thus it looks a bit weird to have Big Endian ARM as canonical
example!

Heck, preadv/pwritev use low/high even on Big Endian platform!

See https://lwn.net/Articles/311630/

That's how I become involved with all that mess: I've tried to
understand the difference between __llseek, pread64 and preadv
syscalls. __llseek uses "hi, lo" arguments order, preadv uses "lo, hi"
and pread64... that's where I've started trying to decypher syscall(2)
man page...
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
