From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH] iswblank.3: ATTRIBUTES: Note function that is thread
 safe with exceptions
Date: Wed, 12 Feb 2014 09:34:51 +0800
Message-ID: <52FACFBB.6070607@cn.fujitsu.com>
References: <1392013239-31138-1-git-send-email-penght@cn.fujitsu.com> <CAE2sS1g5w0jZ04EovvQoW=Cta4ACdHWVus-5zo+vw1J7E1SnZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAE2sS1g5w0jZ04EovvQoW=Cta4ACdHWVus-5zo+vw1J7E1SnZg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>
Cc: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


On 02/11/2014 12:03 AM, Carlos O'Donell wrote:
> On Mon, Feb 10, 2014 at 1:20 AM, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> wrote:
>> The function iswblank() is thread safe with exceptions.
>> +.SH ATTRIBUTES
>> +.SS Multithreading (see pthreads(7))
>> +The
>> +.BR iswblank ()
>> +function is thread-safe with exceptions.
>> +It can be safely used in multithreaded applications, as long as
>> +.BR setlocale (3)
>> +is not called to change the locale during its execution.
> 
> Now that glibc 2.19 is out the door and using a standard set of
> "exception" markers should we try to standardize the same markers?
> 

Yes, maybe it is better.
But in Oracle Solaris's manpages, iswblank is marked "MT-Safe with exceptions".
I also think "MT-Safe with exceptions" is OK.

> For example in glibc this exception is called "locale" and iswblank is
> marked "MT-Safe locale." With "locale" being described in detail in
> the safety conceptions section.
> 
> For example the description you use is not quite technically correct.
> It is possible to call setlocale, but you must guard the call to
> setlocale and all other functions marked with the "locale" safety note
> using a mutex to serialize access. That may be prohibitively
> expensive, but it's an option.
> 

This is a method to avoid exceptions, but I want to tell the users
iswblank() is "MT-Safe with exceptions".


The description of "locale" in glibc 2.19 is as follows:
Functions annotated with locale called concurrently with locale changes
may behave in ways that do not correspond to any of the locales active
during their execution, but an unpredictable mix thereof.

I think the description is similar to ours.

> In summary:
> * Suggest you look at glibc 2.19 release and the safety notes used
> there to simplify the linux kernel manual page notes.
> * Add a manual page that specifically talked about "Safety concepts"
> including thread, signal, and cancellation. Talk about things in more
> detail there.
> 

There is a manual page "man-pages(7)" which talks about "Safety concepts".


-- 
Best Regards,
Peng

> If need be Alex can repost the text for the linux kenrel man pages
> project to reuse it under an alternate license.
> 
> Comments?
> 
> Cheers,
> Carlos.
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
