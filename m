From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iswblank.3: ATTRIBUTES: Note function that is thread
 safe with exceptions
Date: Sat, 22 Feb 2014 10:18:14 +0100
Message-ID: <53086B56.9090800@gmail.com>
References: <1392013239-31138-1-git-send-email-penght@cn.fujitsu.com>	<CAE2sS1g5w0jZ04EovvQoW=Cta4ACdHWVus-5zo+vw1J7E1SnZg@mail.gmail.com>	<52FACFBB.6070607@cn.fujitsu.com>	<CAE2sS1ijg2ef1WcswN0o+wmJOcgLDoCEbYrcNJyOxhS-HCxuSg@mail.gmail.com>	<52FC44E7.1030000@cn.fujitsu.com> <CAE2sS1g6ONVgapgZXh2XZJNCr+=JDEezpmPCnxLY2MfEpNfA2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAE2sS1g6ONVgapgZXh2XZJNCr+=JDEezpmPCnxLY2MfEpNfA2w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 02/13/2014 05:48 AM, Carlos O'Donell wrote:
> On Wed, Feb 12, 2014 at 11:07 PM, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> wrote:
>>> My suggestion is:
>>>
>>> "The function iswblank() is thread safe with exceptions (locale). See
>>> "Safety Concepts" for more information."
>>>
>>> Then describe the locale issue once in the "Safety Concepts" section.
>>>
>>> This reduces duplicated text and simplifies each man page.
>>>
>>> Users that know what "locale" means can scroll quickly, users that
>>> don't can look it up and learn.
>>>
>>> Does that make sense?
>>>
>>
>> Your suggestion can simplify each man page, but our description make each man page clearer.
> 
> There is a natural tension here between being descriptive and being succinct.

(Yup.)

>> In Oracle Solaris's manpages and POSIX, when the function has exceptions,
>> exceptions are described in this function.
> 
> We should strive to be better than that.

(Yup ;-).)

>> In POSIX, when the function has exceptions, exceptions are described in this function as follows:
>> The wcrtomb() function need not be thread-safe if called with a NULL ps argument.
>>
>> The tmpnam() function need not be thread-safe if called with a NULL parameter.
>>
>> I don't have strong preference. If Michael and other members prefer
>> your suggestion, I can modify my patches.
> 
> I have a strong preference for harmonizing this information across the
> man pages and the glibc manual.

Sorry for being late to this thread. Carlos, I agree with you. I will take a bit 
of time now to look more closely at the glibc markings, and follow up. Thanks for
raising this.

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
