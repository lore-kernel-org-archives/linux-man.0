From: Florian Weimer <fweimer@redhat.com>
Subject: Re: Documenting the (dynamic) linking rules for symbol versioning
Date: Thu, 20 Apr 2017 15:17:52 +0200
Message-ID: <5093fc5e-2f99-edff-b657-5f93f978ce1e@redhat.com>
References: <b3a962de-6703-d8b9-18f7-138185171475@gmail.com>
 <ee5e8057-7afa-c919-8ccb-9c8e6d0833c4@redhat.com>
 <517c3e75-93b5-0762-d6a4-7a17d196654e@gmail.com>
 <3edb27c6-c9b6-df95-3810-a8b5abc740fb@redhat.com>
 <23c0ee0f-3abe-d411-b8fc-821d91b75fa7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <libc-alpha-return-78792-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <23c0ee0f-3abe-d411-b8fc-821d91b75fa7@gmail.com>
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Cc: linux-man <linux-man@vger.kernel.org>, Siddhesh Poyarekar <siddhesh@sourceware.org>, Carlos O'Donell <carlos@redhat.com>, Rich Felker <dalias@aerifal.cx>, "H.J. Lu" <hjl.tools@gmail.com>
List-Id: linux-man@vger.kernel.org

On 04/20/2017 01:45 PM, Michael Kerrisk (man-pages) wrote:

>>>>> 7. The way to remove a versioned symbol from a new release
>>>>>       of a shared library is to not define a default version
>>>>>       (NAME@@VERSION) for that symbol. (Right?)
>>>>>
>>>>>       In other words, if we wanted to create a VER_4 of lib_ver.so
>>>>>       that removed the symbol 'abc', we simply don't create use
>>>>>       the usual asm(".symver") magic to create abc@VER_4.
>>>>
>>>> You still need to use .symver, but with a @ version instead of a @@ version.
>>>
>>> Why is that? What functionally is the difference between
>>> having no .symver and a .symver with an @ version? (I tried
>>> both, and they *both* result in undefined symbol errors from
>>> ld(1), as I expected.
>>
>> I was assuming that you want to preserve ABI.  People who are interested
>> in symbol versioning usually want that. :)
> 
> I am thinking of the situation where one explicitly wants to
> deprecate a function in say VER_4, while still allowing that symbol
> to be available in VER_1 to VER_3. For example, one might possibly
> want to do this one day for the gets() function that has been
> removed in C11 and is deprecated in the last POSIX.1 (2008).

They way this usually works is that deprecation involves removing the 
default, but keeping the version itself around.  This means that 
existing binaries will continue to work, but new programs won't be able 
to use the symbol anymore.

> The point is that removing a symbol is possible in the traditional
> (filename-based) major versioning scheme where we create a new
> incompatible major version that drops the symbol. I've occasionally
> had people ask me how you would do something similar with symbol
> versioning.

Yes.  Removing the entire version still requires a soname bump (at which 
point you can remove all non-default versions because there aren't any 
legacy binaries anymore), which is why I believe you typically do not 
want to do that.

> To return to my question: given the two options, having no abc@VER_4

I think you mean “no abc” (with any version whatsoever).

> defined and having abc@VER_4 (not abc@@VER_4), then the effects are
> as follows:
> 
> * In both cases, the static linker would emit an error when trying
>    to resolve a reference to 'abc'.

Right.

> * In the case where we had a symbol abc@VER_4 in the SO, then
>    that symbol would be accessible to the static linker using
>    asm(".symver") (and obviously this wouldn't be possible
>    if there was no abc@VER_4 defined).
> 
> Any other differences to be aware of?

The key difference is that if there used to be an abc@@VER_4 default 
version, then older binaries did not have to use the .symver kludge to 
get the definition.  The static linker would have magically applied that 
version.

In fact, the general expectation is that the .symver backdoor to get 
symbols at non-default versions doesn't really exist. :)

Thanks,
Florian
