From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] tzset.3: ffix
Date: Tue, 03 Feb 2015 08:15:27 +0100
Message-ID: <54D0758F.6020408@gmail.com>
References: <54CE8BB2.5070100@gmx.com> <CAKgNAkjSUeKOXUHG5AU8ipVVxiATaJAb2WFnqgz-Y0KVNgL5pw@mail.gmail.com> <54CFE913.2040606@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54CFE913.2040606-KK0ffGbhmjU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Willliam,

On 02/02/2015 10:16 PM, J William Piggott wrote:
> Hello Michael,
> 
> On 02/02/2015 01:39 AM, Michael Kerrisk (man-pages) wrote:
>> Hi William,
>>
>> On 1 February 2015 at 21:25, J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org> wrote:
>>>
>>> Fix tzset.3 regression, dst is optional.
>>>
>>> $ date
>>> Sun Feb  1 15:14:33 EST 2015
>>> $ TZ=NZST-12 date
>>> Mon Feb  2 08:14:38 NZST 2015
>>> $ TZ=EST5 date
>>> Sun Feb  1 15:15:02 EST 2015
>>>
>>> Signed-off-by: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
>>> ---
>>>  man3/tzset.3 | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/man3/tzset.3 b/man3/tzset.3
>>> index 1253241..7a4dd6a 100644
>>> --- a/man3/tzset.3
>>> +++ b/man3/tzset.3
>>> @@ -95,7 +95,7 @@ The first format is a string of characters that directly represent the
>>>  timezone to be used:
>>>  .sp
>>>  .RS
>>> -.RI "std offset " dst [ offset ][, start [ /time ], end [ /time ]]
>>> +.RI "std offset[" dst [ offset ][, start [ /time ], end [ /time ]]]
>>>  .RE
>>>  .sp
>>>  There are no spaces in the specification.
>>
>> Thanks, I've applied this, and then also made some more changes to
>> bring make that line a bit more consistent with formatting norm in man
>> pages.
> 
> My thinking regarding the format, was that because so much of the string 
> is optional, contrasting the compulsory part makes it easier to parse. 
> Did you look at how it rendered before changing it? It also highlights
> that portion as unique, as it is illustrated with a space that does not 
> exist when put into use; that is not true for the rest of the string. I 
> think it is good to have it standout. I would have made it bold, but that
> is for commands and might have been confusing.
> 
> Well, it is better now either-way compared to the whole thing being italic
> as it was before.

I made the format this way mainly for overall consistency. The '[]' should
be enough for folk to work out what's optional.

Thanks,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
