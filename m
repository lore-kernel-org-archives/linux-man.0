From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: [PATCH] iswblank.3: ATTRIBUTES: Note function that is thread
 safe with exceptions
Date: Tue, 25 Feb 2014 12:17:17 +0100
Message-ID: <530C7BBD.3060305@bfs.de>
References: <1392013239-31138-1-git-send-email-penght@cn.fujitsu.com>	<CAE2sS1g5w0jZ04EovvQoW=Cta4ACdHWVus-5zo+vw1J7E1SnZg@mail.gmail.com>	<52FACFBB.6070607@cn.fujitsu.com> <CAE2sS1ijg2ef1WcswN0o+wmJOcgLDoCEbYrcNJyOxhS-HCxuSg@mail.gmail.com> <530C2BA9.8070604@cn.fujitsu.com>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <530C2BA9.8070604-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org



Am 25.02.2014 06:35, schrieb Peng Haitao:
> 
> On 02/12/2014 11:31 PM, Carlos O'Donell wrote:
>>> Yes, maybe it is better.
>>> But in Oracle Solaris's manpages, iswblank is marked "MT-Safe with exceptions".
>>> I also think "MT-Safe with exceptions" is OK.
>>
>> My suggestion is:
>>
>> "The function iswblank() is thread safe with exceptions (locale). See
>> "Safety Concepts" for more information."
>>
> 
> I think we should tell users where can look up "Safety Concepts".
> The description may be:
> 
> "The function iswblank() is thread safe with exceptions (locale). See
> "Safety Concepts" for more information in pthreads(7)."
> 

Good idea, maybe also (locale(7)) ?

re,
 wh

> Maybe pthreads(7) is man-pages(7) or others.
> 
> Before the decision is made, I will only send the patch without exceptions.
> Thanks.
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
