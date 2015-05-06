From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: aiocb member aio_offset is off_t which is a signed 32bit int
Date: Wed, 06 May 2015 14:28:38 +0200
Message-ID: <554A08F6.2090003@gmail.com>
References: <CAGc9Evc1oZkCYfYAkYU+fNA=9-Q+T+sgdj8qWuTctZjjvUdxEA@mail.gmail.com>	<CAKgNAkj5nh7=yVAOps6mPva3A93qtkTDMrMBmYbXAN4AAi_+2A@mail.gmail.com> <CAGc9EvcOSPb5f9kU3TeP-MU1FT-j=DRmnSNs4xZV_8fnAYdTTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGc9EvcOSPb5f9kU3TeP-MU1FT-j=DRmnSNs4xZV_8fnAYdTTA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 05/01/2015 12:11 AM, Jonny Grant wrote:
> On 12 April 2015 at 09:03, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hi Jonny,
>>
>> On 30 June 2014 at 12:51, Jonny Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
>>> Hello mtk
>>>
>>> Is it worth clarifying something on this page:
>>>
>>> http://man7.org/linux/man-pages/man7/aio.7.html
>>>
>>> off_t           aio_offset;     /* File offset */
>>>
>>> Could clarify that off_t on a 32bit system will be a signed 32bit
>>> integer, meaning the maximum seek size is 2GB.
>>>
>>> I think this means that aio can only be used to access files up to
>>> 2GB.
>>
>> I don't believe this is true. See <aio.h> and the defintion of this field there.
>>
>> Cheers,
>>
>> Michael
> 
> Hi Michael
> 
> ok, many thanks.
> 
> BTW, the link at bottom of aio.7 is 403:
> http://www.squid-cache.org/~adrian/Reprint-Pulavarty-OLS2003.pdf
> 
> My own opinion is that links change regularly.. so often simpler to avoid them.

Hi Jonny,

I've fixed the link.

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
