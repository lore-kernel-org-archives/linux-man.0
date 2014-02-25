From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH] iswblank.3: ATTRIBUTES: Note function that is thread
 safe with exceptions
Date: Tue, 25 Feb 2014 13:35:37 +0800
Message-ID: <530C2BA9.8070604@cn.fujitsu.com>
References: <1392013239-31138-1-git-send-email-penght@cn.fujitsu.com>	<CAE2sS1g5w0jZ04EovvQoW=Cta4ACdHWVus-5zo+vw1J7E1SnZg@mail.gmail.com>	<52FACFBB.6070607@cn.fujitsu.com> <CAE2sS1ijg2ef1WcswN0o+wmJOcgLDoCEbYrcNJyOxhS-HCxuSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAE2sS1ijg2ef1WcswN0o+wmJOcgLDoCEbYrcNJyOxhS-HCxuSg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


On 02/12/2014 11:31 PM, Carlos O'Donell wrote:
>> Yes, maybe it is better.
>> But in Oracle Solaris's manpages, iswblank is marked "MT-Safe with exceptions".
>> I also think "MT-Safe with exceptions" is OK.
> 
> My suggestion is:
> 
> "The function iswblank() is thread safe with exceptions (locale). See
> "Safety Concepts" for more information."
> 

I think we should tell users where can look up "Safety Concepts".
The description may be:

"The function iswblank() is thread safe with exceptions (locale). See
"Safety Concepts" for more information in pthreads(7)."

Maybe pthreads(7) is man-pages(7) or others.

Before the decision is made, I will only send the patch without exceptions.
Thanks.


-- 
Best Regards,
Peng

> Then describe the locale issue once in the "Safety Concepts" section.
> 
> This reduces duplicated text and simplifies each man page.
> 
> Users that know what "locale" means can scroll quickly, users that
> don't can look it up and learn.
> 
> Does that make sense?
> 
> My further suggestion is to use the same ~20 exception notes as glibc e.g.
> race, const, locale, env, hostid, sigintr, init, lock, corrupt, heap,
> dlopen, plugin, i18ln, fd, mem, sig, term, and cwd (we also have
> !posix to indicate it is known not to conform with posix).
> 
> The glibc manual is marked with them now, you can see iswblank here:
> http://www.gnu.org/software/libc/manual/html_mono/libc.html#index-iswblank-486
> 
> Cheers,
> Carlos.
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
