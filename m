From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Documenting the (dynamic) linking rules for symbol versioning
Date: Thu, 20 Apr 2017 16:35:25 +0200
Message-ID: <f8e7374d-64bd-d919-4a30-dd6115e65bf9@gmail.com>
References: <b3a962de-6703-d8b9-18f7-138185171475@gmail.com>
 <22f26755-f7f0-898a-ac74-3f6df92a22d7@sourceware.org>
 <c6736794-60bb-517e-0bcf-2e80331f0f72@gmail.com>
 <eb5bea0c-1f54-1b20-dc78-999160738ed3@sourceware.org>
 <2fab9588-2fa6-8c87-da25-be9376c085ea@redhat.com>
 <c31e55fb-25af-bfe9-09db-83e622ec5e3f@sourceware.org>
 <89907506-fddb-2429-7e18-b00b8a560070@redhat.com>
 <c1b5fd84-22ec-56de-b169-502d8072d188@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c1b5fd84-22ec-56de-b169-502d8072d188-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, siddhesh-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org, "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, "H.J. Lu" <hjl.tools-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 04/20/2017 04:09 PM, Michael Kerrisk (man-pages) wrote:
> On 04/20/2017 03:45 PM, Florian Weimer wrote:
>> On 04/20/2017 03:15 PM, Siddhesh Poyarekar wrote:
>>> On Thursday 20 April 2017 06:31 PM, Florian Weimer wrote:
>>>>> Hmm interesting, I thought 'latest' would imply the last version in the
>>>>> sequence of versions in the map, but I guess it kinda makes sense that
>>>>> it is the @@ default, similar to how a static linker would pick it up.
>>>>
>>>> It might be another instance of bug 12977.  At least its fix will
>>>> involve preferring the default version in this case.  I don't know what
>>>
>>>  From Michael's test case it seems like it already is preferring the
>>> default version.  The fix would have to be to the comment that says
>>> prefer the oldest version for regular unversioned lookups and the
>>> *latest* for the dlsym lookups.
>>>
>>> That or I misunderstood what you said.
>>
>> I think it picked the default version by accident because of the way the 
>> linker ordered the list.  But I could be mistaken.
> 
> How could I test your hypothesis? Just a longer chain of versions,
> maybe? Or oddly named version tags?

So, some quick testing.

1. A map file that have tags VER_1 through VER_5.
2. A C file with five implementations of xyz corresponding
   to those 5 VER_* tags.
3. My 'dynload' program that loads a shared library and looks up
   (dlsym) and calls the named function symbol.

I tried variously marking all five versions of xyz with '@@',
rebuilding the library, and running the command

    ./dynload libsv.o xyz

In each case, it was the xyz@@ symbol that was found by
dlsym().

If I marked none of five versions of xyz as default (i.e., @@),
then I get the error:

    dlsym: ./libsv.so: undefined symbol: xyz

All of this *suggests* that the observed behavior is not accidental.

And then there is this comment in elf/dl-lookup.c::check_match():

      /* No specific version is selected.  There are two ways we
         can got here:

         - a binary which does not include versioning information
         is loaded

         - dlsym() instead of dlvsym() is used to get a symbol which
         might exist in more than one form

         If the library does not provide symbol version information
         there is no problem at all: we simply use the symbol if it
         is defined.

         These two lookups need to be handled differently if the
         library defines versions.  In the case of the old
         unversioned application the oldest (default) version
         should be used.  In case of a dlsym() call the latest and
         public interface should be returned.  */

The last sentence doesn't seem quite right though: it appears
that it is the default symbol that is returned, not the latest
(which would always have been VER_5 in my example).

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
