From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mkstemp: fix _POSIX_C_SOURCE value for mkstemp()
Date: Thu, 4 Aug 2016 08:17:29 +1000
Message-ID: <5f03a2c7-3535-8203-c6f2-559939350552@gmail.com>
References: <20160708000626.GA26576@alpha.fifth.space>
 <20160803025809.GE6702@vapier.lan> <20160803113131.GA24366@alpha.fifth.space>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160803113131.GA24366-lvRy8M+iZ/WfwRssfSzb0bNAH6kLmebB@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Quentin Rameau <quinq-UlqG2OPX9a0ue8ZPuPpd/Q@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Quentin

For some reasons, all of your earlier mails got marked as spam by
gmail, and so I did not see them. However, Mike's reply came through
okay, and so I saw this at last.

On 08/03/2016 09:31 PM, Quentin Rameau wrote:
> Hi, thanks for the response!
>
>> On 08 Jul 2016 02:06, Quentin Rameau wrote:
>>> Here are more informations to save you the time searching for it.
>>> Introduced in f095bb7 (2010-01-09) in stdlib/stdlib.h line 609:
>>>
>>> +#if defined __USE_MISC || defined __USE_XOPEN_EXTENDED \
>>> +    || defined __USE_XOPEN2K8
>>> [..]
>>> extern int mkstemp (char *__template) __nonnull ((1)) __wur;
>>>
>>> And in include/features.h (from glibc 2.12 e28c887):
>>>
>>> #if (_POSIX_C_SOURCE - 0) >= 200112L
>>> # define __USE_XOPEN2K		1
>>> # undef __USE_ISOC95
>>> # define __USE_ISOC95		1
>>> # undef __USE_ISOC99
>>> # define __USE_ISOC99		1
>>> #endif
>>>
>>> #if (_POSIX_C_SOURCE - 0) >= 200809L
>>> # define __USE_XOPEN2K8		1
>>> # undef  _ATFILE_SOURCE
>>> # define _ATFILE_SOURCE	1
>>> #endif
>>
>> what is it you're trying to report ?  the man page already reads:
>>        mkstemp():
>>            _XOPEN_SOURCE >= 500
>>                || /* Since glibc 2.12: */ _POSIX_C_SOURCE >= 200112L
>>                || /* Glibc versions <= 2.19: */ _SVID_SOURCE || _BSD_SOURCE
>
> Yes, that's the whole point, it is incorrect!
> mkstemp is declared with __USE_XOPEN2K8 defined, which occurs when
> _POSIX_C_SOURCE is defined to 200809L, not 200112L as it is incorrectly
> stated in the current manpage version.
>
>> can you attach a patch ?
>> -mike
>
> Of course, already did that in fact, that's the first mail of the
> thread.
> I can link the marc.info archive to you if that can help:
> http://marc.info/?l=linux-man&m=146737548209893

Thanks for catching this. I've applied your patch.

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
