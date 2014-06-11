From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mq_unlink.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 11 Jun 2014 10:35:46 +0200
Message-ID: <539814E2.9020701@gmail.com>
References: <1402285503.1804.34.camel@fedora> <5395F590.5060005@gmail.com>	 <1402381722.1169.1.camel@fedora> <539719C1.4050009@gmail.com> <1402465502.20654.7.camel@fedora>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402465502.20654.7.camel@fedora>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Qian Lei,

On 06/11/2014 07:45 AM, Qian Lei wrote:
> Hello Michael
> 
> Thank you for your suggestions, I'll CC Peng Haitao and add
> "Reviewed-by" in my patches.

I want to check that we have not misunderstood each other here.
My idea is that the Reviewed-by: tag should be added only if 
the other person has actually reviewed the patch. I'll normally
accept patches from the two of you without the need for the 
Reviewed-by: tag, but it would be nice to have that extra level 
of assurance, if possible.

Cheers,

Michael

> Qian Lei
> 
> On Tue, 2014-06-10 at 16:44 +0200, Michael Kerrisk (man-pages) wrote:
>> On 06/10/2014 08:28 AM, Qian Lei wrote:
>>> Hello Michael
>>>
>>> Yeah, You are right. I'm working together with Peng Haitao.
>>
>> Hello Qian Lei,
>>
>> Thanks for the info, 
>>
>> I do not know how closely you are working together, but if you are
>> reviewing each other's work, it would be great if you CCed each 
>> other on your patches, and perhaps also provided an "Reviewed-by" 
>> for each other's work.
>>
>> Thanks,
>>
>> Michael
>>
>>
>>> On Mon, 2014-06-09 at 19:57 +0200, Michael Kerrisk (man-pages) wrote:
>>>> On 06/09/2014 05:45 AM, Qian Lei wrote:
>>>>> The function mq_unlink() is thread safe.
>>>>
>>>> Hello Qian Lei,
>>>>
>>>> Am I correct to assume that you are working together with Peng Haitao?
>>>>
>>>> Cheers,
>>>>
>>>> Michael
>>>>
>>>>
>>>>> Signed-off-by: Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
>>>>> ---
>>>>>  man3/mq_unlink.3 | 5 +++++
>>>>>  1 file changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/man3/mq_unlink.3 b/man3/mq_unlink.3
>>>>> index 19b977f..bf49e9c 100644
>>>>> --- a/man3/mq_unlink.3
>>>>> +++ b/man3/mq_unlink.3
>>>>> @@ -59,6 +59,11 @@ was too long.
>>>>>  .B ENOENT
>>>>>  There is no message queue with the given
>>>>>  .IR name .
>>>>> +.SH ATTRIBUTES
>>>>> +.SS Multithreading (see pthreads(7))
>>>>> +The
>>>>> +.BR mq_unlink ()
>>>>> +function is thread-safe.
>>>>>  .SH CONFORMING TO
>>>>>  POSIX.1-2001.
>>>>>  .SH SEE ALSO
>>>>>
>>>>
>>>>
>>>
>>>
>>
>>
> 
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
