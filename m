From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] strtod.3: ATTRIBUTES: Note functions that are thread safe
 with exceptions
Date: Wed, 22 Jan 2014 11:41:08 +0100
Message-ID: <CAKgNAkhCPtc4edgFhmc+3m+j_8AxucNzG4TY79sSuK2Cq8kreA@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: Andre Majorel <aym-xunil-Bi/FLWfhfolQFI55V6+gNQ@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Haitao,

On Wed, Jan 22, 2014 at 9:57 AM, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> wrote:
>
> On 01/22/2014 04:29 PM, Andre Majorel wrote:
>>>> If that is the case, how about :
>>>>
>>>>   These functions can be safely used in multithreaded
>>>>   applications, as long as the locale is not changed during
>>>>   their execution.
>>>
>>> The above sentence is OK, but I think added setlocale(3) is
>>> better, thanks.
>>>
>>> These functions can be safely used in multithreaded
>>> applications, as long as setlocale(3) is not called
>>> to change the locale during their execution.
>>
>> This wording can be interpreted to mean that calling setlocale()
>> *is* permitted as long as the locale doesn't change. If that is
>> really what you mean, then no further objections from me.
>
> That is what I mean.

Can I just confirm what I understand from this conversation:

* A call to strtod() is thread-safe so long as no other thread uses
setlocale() to change the locale *during* the execution of strtod().
* If a call to setlocale() changes the locale *before* a call to
strtod(), then the call to strtod() is still thread safe.

Correct?

Thanks,

Michael


> --
> Best Regards,
> Peng
>
>> Otherwise, my recommendation would be
>>
>>   These functions can be safely used in multithreaded
>>   applications, as long as setlocale() is not called during
>>   their execution.
>>
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
