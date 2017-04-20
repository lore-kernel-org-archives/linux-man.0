From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Documenting the (dynamic) linking rules for symbol versioning
Date: Thu, 20 Apr 2017 13:45:21 +0200
Message-ID: <23c0ee0f-3abe-d411-b8fc-821d91b75fa7@gmail.com>
References: <b3a962de-6703-d8b9-18f7-138185171475@gmail.com>
 <ee5e8057-7afa-c919-8ccb-9c8e6d0833c4@redhat.com>
 <517c3e75-93b5-0762-d6a4-7a17d196654e@gmail.com>
 <3edb27c6-c9b6-df95-3810-a8b5abc740fb@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3edb27c6-c9b6-df95-3810-a8b5abc740fb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Siddhesh Poyarekar <siddhesh-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, "H.J. Lu" <hjl.tools-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 04/20/2017 10:49 AM, Florian Weimer wrote:
> On 04/19/2017 09:49 PM, Michael Kerrisk (man-pages) wrote:
>> Hi Florian,
>>
>> Thanks for your answers.
>>
>> On 04/19/2017 05:48 PM, Florian Weimer wrote:
>>> On 04/19/2017 05:07 PM, Michael Kerrisk (man-pages) wrote:
>>>>      Am I right about my rough guess for the rationale for point 6,
>>>>      or is there something else I should know/write about?
>>>
>>> We currently have a bug where the symbol resolution depends on the order
>>> of alternatives along a hash bucket list:
>>>
>>>     <https://sourceware.org/bugzilla/show_bug.cgi?id=12977#c2>
>>
>> Okay.
> 
> What I was trying to say is that point 6 might be a bug.

Ahhh -- okay. Thanks for the clarification.

> But I think the problem there is that the file format only has one 
> global base version, not different per-symbol base versions.  Your 
> second symbol with the unexpected binding simply does not have a base 
> version at all.

Yes, that all makes sense.

>>> Another open problem is what happens when a versioned symbol moves from
>>> one DSO to another.  This is not a problem for unversioned symbols, but
>>> we currently have a soname check for versioned symbols.  This is rather
>>> odd because this check isn't used to accelerate lookups.  It does not
>>> prevent symbol interposition from other DSOs, it merely introduces
>>> spurious failures.
>>
>> I have a vague recollection that this problem has been around for a
>> very long time, right?
> 
> Yes, it has.
> 
>>>> 7. The way to remove a versioned symbol from a new release
>>>>      of a shared library is to not define a default version
>>>>      (NAME@@VERSION) for that symbol. (Right?)
>>>>
>>>>      In other words, if we wanted to create a VER_4 of lib_ver.so
>>>>      that removed the symbol 'abc', we simply don't create use
>>>>      the usual asm(".symver") magic to create abc@VER_4.
>>>
>>> You still need to use .symver, but with a @ version instead of a @@ version.
>>
>> Why is that? What functionally is the difference between
>> having no .symver and a .symver with an @ version? (I tried
>> both, and they *both* result in undefined symbol errors from
>> ld(1), as I expected.
> 
> I was assuming that you want to preserve ABI.  People who are interested 
> in symbol versioning usually want that. :)

I am thinking of the situation where one explicitly wants to
deprecate a function in say VER_4, while still allowing that symbol
to be available in VER_1 to VER_3. For example, one might possibly
want to do this one day for the gets() function that has been
removed in C11 and is deprecated in the last POSIX.1 (2008).

The point is that removing a symbol is possible in the traditional
(filename-based) major versioning scheme where we create a new
incompatible major version that drops the symbol. I've occasionally
had people ask me how you would do something similar with symbol
versioning.

To return to my question: given the two options, having no abc@VER_4
defined and having abc@VER_4 (not abc@@VER_4), then the effects are
as follows:

* In both cases, the static linker would emit an error when trying
  to resolve a reference to 'abc'.
* In the case where we had a symbol abc@VER_4 in the SO, then 
  that symbol would be accessible to the static linker using
  asm(".symver") (and obviously this wouldn't be possible
  if there was no abc@VER_4 defined).

Any other differences to be aware of?

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
