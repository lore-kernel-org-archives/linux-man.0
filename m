From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: Documenting the (dynamic) linking rules for symbol versioning
Date: Thu, 20 Apr 2017 16:07:24 +0200
Message-ID: <0409f767-3ae3-48f0-4836-8694361c755c@gmail.com>
References: <b3a962de-6703-d8b9-18f7-138185171475@gmail.com>
 <ee5e8057-7afa-c919-8ccb-9c8e6d0833c4@redhat.com>
 <517c3e75-93b5-0762-d6a4-7a17d196654e@gmail.com>
 <3edb27c6-c9b6-df95-3810-a8b5abc740fb@redhat.com>
 <23c0ee0f-3abe-d411-b8fc-821d91b75fa7@gmail.com>
 <5093fc5e-2f99-edff-b657-5f93f978ce1e@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <libc-alpha-return-78799-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <5093fc5e-2f99-edff-b657-5f93f978ce1e@redhat.com>
To: Florian Weimer <fweimer@redhat.com>, "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Cc: mtk.manpages@gmail.com, linux-man <linux-man@vger.kernel.org>, Siddhesh Poyarekar <siddhesh@sourceware.org>, Carlos O'Donell <carlos@redhat.com>, Rich Felker <dalias@aerifal.cx>, "H.J. Lu" <hjl.tools@gmail.com>
List-Id: linux-man@vger.kernel.org

Hi Florian,

On 04/20/2017 03:17 PM, Florian Weimer wrote:
> On 04/20/2017 01:45 PM, Michael Kerrisk (man-pages) wrote:
> 
>>>>>> 7. The way to remove a versioned symbol from a new release
>>>>>>       of a shared library is to not define a default version
>>>>>>       (NAME@@VERSION) for that symbol. (Right?)
>>>>>>
>>>>>>       In other words, if we wanted to create a VER_4 of lib_ver.so
>>>>>>       that removed the symbol 'abc', we simply don't create use
>>>>>>       the usual asm(".symver") magic to create abc@VER_4.
>>>>>
>>>>> You still need to use .symver, but with a @ version instead of a @@ version.
>>>>
>>>> Why is that? What functionally is the difference between
>>>> having no .symver and a .symver with an @ version? (I tried
>>>> both, and they *both* result in undefined symbol errors from
>>>> ld(1), as I expected.
>>>
>>> I was assuming that you want to preserve ABI.  People who are interested
>>> in symbol versioning usually want that. :)
>>
>> I am thinking of the situation where one explicitly wants to
>> deprecate a function in say VER_4, while still allowing that symbol
>> to be available in VER_1 to VER_3. For example, one might possibly
>> want to do this one day for the gets() function that has been
>> removed in C11 and is deprecated in the last POSIX.1 (2008).
> 
> They way this usually works is that deprecation involves removing the 
> default, but keeping the version itself around.  This means that 
> existing binaries will continue to work, but new programs won't be able 
> to use the symbol anymore.
> 
>> The point is that removing a symbol is possible in the traditional
>> (filename-based) major versioning scheme where we create a new
>> incompatible major version that drops the symbol. I've occasionally
>> had people ask me how you would do something similar with symbol
>> versioning.
> 
> Yes.  Removing the entire version still requires a soname bump (at which 
> point you can remove all non-default versions because there aren't any 
> legacy binaries anymore), which is why I believe you typically do not 
> want to do that.
> 
>> To return to my question: given the two options, having no abc@VER_4
> 
> I think you mean “no abc” (with any version whatsoever).

No, I meant having no abc@VER_4.

Let me explain with a more concrete example. (I'm actually beginning
to think we agree on the details here, but I didn't convey my
scenario clearly enough.)

Suppose we have a version script:

[[
VER_1 {
    global: xyz;
    local: *;
};

VER_2 {
    ...
} VER_1;

VER_3 {
    ...
} VER_2;
]]

And we have a C file that defines xyz@VER_1, xyz@VER_2, and xyz@VER_3.

Now suppose that we want to add a VER_4 tag to the map, and a new
function, abc(), to our C source file (so that we will end up with
a symbol abc@VER_4). 

Suppose also that in programs that link against the new library (built 
with the VER_4 map), we want the symbol xyz() to no longer be accessible 
to ld(1). There appears  to be two ways to do this:

* Don't define an xyz@VER_4 (or, of course, xyz@@VER_4) in our 
  C source file.
* Define an xyz@VER_4.

In both cases, the linker emits an error if a program that uses
'xyz' tries to link against the library. But the former approach
seems more natural to me. (I mean, why add an xyz@VER_4 definition
in the C file?)

And in both cases, the VER_4 map file would look like this:

[[
VER_1 {
    global: xyz;
    local: *;
};

VER_2 {
    global: ...;
} VER_1;

VER_3 {
    global: ...;
} VER_2;

VER_4 {
    global: abc;
} VER_3;
]]

Cheers,

Michael

>> defined and having abc@VER_4 (not abc@@VER_4), then the effects are
>> as follows:
>>
>> * In both cases, the static linker would emit an error when trying
>>    to resolve a reference to 'abc'.
> 
> Right.
> 
>> * In the case where we had a symbol abc@VER_4 in the SO, then
>>    that symbol would be accessible to the static linker using
>>    asm(".symver") (and obviously this wouldn't be possible
>>    if there was no abc@VER_4 defined).
>>
>> Any other differences to be aware of?
> 
> The key difference is that if there used to be an abc@@VER_4 default 
> version, then older binaries did not have to use the .symver kludge to 
> get the definition.  The static linker would have magically applied that 
> version.
> 
> In fact, the general expectation is that the .symver backdoor to get 
> symbols at non-default versions doesn't really exist. :)
> 
> Thanks,
> Florian
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
