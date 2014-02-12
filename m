From: "Carlos O'Donell" <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>
Subject: Re: [PATCH] iswblank.3: ATTRIBUTES: Note function that is thread safe
 with exceptions
Date: Wed, 12 Feb 2014 10:31:32 -0500
Message-ID: <CAE2sS1ijg2ef1WcswN0o+wmJOcgLDoCEbYrcNJyOxhS-HCxuSg@mail.gmail.com>
References: <1392013239-31138-1-git-send-email-penght@cn.fujitsu.com>
	<CAE2sS1g5w0jZ04EovvQoW=Cta4ACdHWVus-5zo+vw1J7E1SnZg@mail.gmail.com>
	<52FACFBB.6070607@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52FACFBB.6070607-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Feb 11, 2014 at 8:34 PM, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> wrote:
>
> On 02/11/2014 12:03 AM, Carlos O'Donell wrote:
>> On Mon, Feb 10, 2014 at 1:20 AM, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> wrote:
>>> The function iswblank() is thread safe with exceptions.
>>> +.SH ATTRIBUTES
>>> +.SS Multithreading (see pthreads(7))
>>> +The
>>> +.BR iswblank ()
>>> +function is thread-safe with exceptions.
>>> +It can be safely used in multithreaded applications, as long as
>>> +.BR setlocale (3)
>>> +is not called to change the locale during its execution.
>>
>> Now that glibc 2.19 is out the door and using a standard set of
>> "exception" markers should we try to standardize the same markers?
>>
>
> Yes, maybe it is better.
> But in Oracle Solaris's manpages, iswblank is marked "MT-Safe with exceptions".
> I also think "MT-Safe with exceptions" is OK.

My suggestion is:

"The function iswblank() is thread safe with exceptions (locale). See
"Safety Concepts" for more information."

Then describe the locale issue once in the "Safety Concepts" section.

This reduces duplicated text and simplifies each man page.

Users that know what "locale" means can scroll quickly, users that
don't can look it up and learn.

Does that make sense?

My further suggestion is to use the same ~20 exception notes as glibc e.g.
race, const, locale, env, hostid, sigintr, init, lock, corrupt, heap,
dlopen, plugin, i18ln, fd, mem, sig, term, and cwd (we also have
!posix to indicate it is known not to conform with posix).

The glibc manual is marked with them now, you can see iswblank here:
http://www.gnu.org/software/libc/manual/html_mono/libc.html#index-iswblank-486

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
