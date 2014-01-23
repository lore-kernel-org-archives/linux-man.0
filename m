From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH] strtod.3: ATTRIBUTES: Note functions that are thread
 safe with exceptions
Date: Thu, 23 Jan 2014 08:07:56 +0800
Message-ID: <52E05D5C.2090101@cn.fujitsu.com>
References: <CAKgNAkhCPtc4edgFhmc+3m+j_8AxucNzG4TY79sSuK2Cq8kreA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkhCPtc4edgFhmc+3m+j_8AxucNzG4TY79sSuK2Cq8kreA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Andre Majorel <aym-xunil-Bi/FLWfhfolQFI55V6+gNQ@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


On 01/22/2014 06:41 PM, Michael Kerrisk (man-pages) wrote:
>>> This wording can be interpreted to mean that calling setlocale()
>>> *is* permitted as long as the locale doesn't change. If that is
>>> really what you mean, then no further objections from me.
>>
>> That is what I mean.
> 
> Can I just confirm what I understand from this conversation:
> 
> * A call to strtod() is thread-safe so long as no other thread uses
> setlocale() to change the locale *during* the execution of strtod().
> * If a call to setlocale() changes the locale *before* a call to
> strtod(), then the call to strtod() is still thread safe.
> 
> Correct?
> 

Yes, it is correct.


-- 
Best Regards,
Peng

> Thanks,
> 
> Michael
> 
> 
>> --
>> Best Regards,
>> Peng
>>
>>> Otherwise, my recommendation would be
>>>
>>>   These functions can be safely used in multithreaded
>>>   applications, as long as setlocale() is not called during
>>>   their execution.
>>>
>>
> 
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
