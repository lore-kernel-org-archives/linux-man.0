From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Some locale related updates
Date: Wed, 13 May 2015 14:05:17 +0200
Message-ID: <55533DFD.30305@gmail.com>
References: <555206C7.8000308@redhat.com> <55520CE0.8080302@gmail.com> <5552123E.9060005@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5552123E.9060005-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 05/12/2015 04:46 PM, Marko Myllynen wrote:
> Hi,
> 
> On 2015-05-12 17:23, Michael Kerrisk (man-pages) wrote:
>> On 05/12/2015 03:57 PM, Marko Myllynen wrote:
>>>
>>> I'll send some locale related updates shortly, most of them should be
>>> pretty self-explanatory but I'll provide some references in few cases
>>> and I'm sure you can come up with slightly better wording here and there.
>>
>> I've applied all of the following:
>>
>> and also this one that you just sent
>>
>> Are there more to come?
> 
> no, that's all, thanks for your superfast response!
> 
>>> Related to wording, I see that setlocale(3) states:
>>>
>>> The locale "C" or "POSIX" is a portable locale; its LC_CTYPE part
>>> corresponds to the 7-bit ASCII character set.
>>>
>>> And
>>> http://pubs.opengroup.org/onlinepubs/009695399/basedefs/xbd_chap07.html#tag_07_02
>>> states:
>>>
>>> The tables in Locale Definition describe the characteristics and
>>> behavior of the POSIX locale for data consisting entirely of characters
>>> from the portable character set and the control character set. For other
>>> characters, the behavior is unspecified.
>>>
>>> Do you think setlocale(3) is consistent with the above?
>>
>> Help me here ;-). Do you see a problem? If yes, what is it?
> 
> Perhaps it's just a language issue, the latter is IMHO somewhat clearer
> wrt non-ASCII characters (someone could perhaps interpret setlocale(3)
> so that non-ASCII characters are not allowed). I'm ok leaving it as-is,
> just wanted to hear your opinion.

I suppose I'd take a patch to improve this.

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
