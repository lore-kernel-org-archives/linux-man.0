From: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: Re: aio_cancel
Date: Wed, 05 Oct 2011 01:08:56 +0100
Message-ID: <4E8BA018.5070707@jguk.org>
References: <CAGc9Evf=94fyfYM67q0BRJCN=vu14aYV91pE+Hw=uhgkVS5p5g@mail.gmail.com> <CAKgNAkgcKRrdepNS9jQw=MzNY+sRpP+-idDEfpT0ALBJOJ3w1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkgcKRrdepNS9jQw=MzNY+sRpP+-idDEfpT0ALBJOJ3w1w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael Kerrisk wrote, On 04/10/11 06:42:
> Hi Jon,
>
> On Tue, Oct 4, 2011 at 12:03 AM, Jon Grant<jg-hus3n9K41k0@public.gmane.org>  wrote:
>> Hello
>>
>> I have a query about the ask about the aio_cancel description please.
>>
>> http://man7.org/linux/man-pages/online/pages/man3/aio_cancel.3.html
>>
>> "Normal asynchronous notification occurs for canceled requests.  The request
>>        return status is set to -1, and the request error status is set
>> to ECANCELED."
>>
>> I would like to ask about this description. Could the detail of
>> "request return status" and "request error status" be described
>> please.
>>
>> My assumption
>>
>> "request return status" -- perhaps the value returned by aio_return()?
>> "request error status" -- not sure. maybe aio_error() ?
>>
>> Thank you for taking a look into this.
>
> Your assumption is correct. I added some words to the man page for
> version 3.35 to clarify this.

Looks good.

Could I ask a related question. When an aio block is cancelled, is there 
anyway to get back the byte count that was processed? e.g. aio_read, the 
number of bytes read before the operation was cancelled.

Best regards, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
