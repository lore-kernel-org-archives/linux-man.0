From: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Documenting the (dynamic) linking rules for symbol versioning
Date: Thu, 20 Apr 2017 10:49:25 +0200
Message-ID: <3edb27c6-c9b6-df95-3810-a8b5abc740fb@redhat.com>
References: <b3a962de-6703-d8b9-18f7-138185171475@gmail.com>
 <ee5e8057-7afa-c919-8ccb-9c8e6d0833c4@redhat.com>
 <517c3e75-93b5-0762-d6a4-7a17d196654e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <517c3e75-93b5-0762-d6a4-7a17d196654e-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Siddhesh Poyarekar <siddhesh-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, "H.J. Lu" <hjl.tools-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 04/19/2017 09:49 PM, Michael Kerrisk (man-pages) wrote:
> Hi Florian,
> 
> Thanks for your answers.
> 
> On 04/19/2017 05:48 PM, Florian Weimer wrote:
>> On 04/19/2017 05:07 PM, Michael Kerrisk (man-pages) wrote:
>>>      Am I right about my rough guess for the rationale for point 6,
>>>      or is there something else I should know/write about?
>>
>> We currently have a bug where the symbol resolution depends on the order
>> of alternatives along a hash bucket list:
>>
>>     <https://sourceware.org/bugzilla/show_bug.cgi?id=12977#c2>
> 
> Okay.

What I was trying to say is that point 6 might be a bug.

But I think the problem there is that the file format only has one 
global base version, not different per-symbol base versions.  Your 
second symbol with the unexpected binding simply does not have a base 
version at all.

>> Another open problem is what happens when a versioned symbol moves from
>> one DSO to another.  This is not a problem for unversioned symbols, but
>> we currently have a soname check for versioned symbols.  This is rather
>> odd because this check isn't used to accelerate lookups.  It does not
>> prevent symbol interposition from other DSOs, it merely introduces
>> spurious failures.
> 
> I have a vague recollection that this problem has been around for a
> very long time, right?

Yes, it has.

>>> 7. The way to remove a versioned symbol from a new release
>>>      of a shared library is to not define a default version
>>>      (NAME@@VERSION) for that symbol. (Right?)
>>>
>>>      In other words, if we wanted to create a VER_4 of lib_ver.so
>>>      that removed the symbol 'abc', we simply don't create use
>>>      the usual asm(".symver") magic to create abc@VER_4.
>>
>> You still need to use .symver, but with a @ version instead of a @@ version.
> 
> Why is that? What functionally is the difference between
> having no .symver and a .symver with an @ version? (I tried
> both, and they *both* result in undefined symbol errors from
> ld(1), as I expected.

I was assuming that you want to preserve ABI.  People who are interested 
in symbol versioning usually want that. :)

Thanks,
Florian
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
