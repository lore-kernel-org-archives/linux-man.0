From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] stat.2: tweak description of AT_EMPTY_PATH
Date: Wed, 19 Apr 2017 17:23:53 +0200
Message-ID: <f340a953-6934-d418-e484-0ea79f6bb9d6@gmail.com>
References: <CA+GA0_vdZxOQaUji0c+Sbv=qTYX3uRRGVnEov91_OM=DrNfg1g@mail.gmail.com>
 <ceea65c2-45d8-725d-0d38-9f1a0f42391f@gmail.com>
 <CA+GA0_sjHnu9+-hFw_+z6Q=d4fnhL02W-rQ6ohfu-8yr1oQmuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+GA0_sjHnu9+-hFw_+z6Q=d4fnhL02W-rQ6ohfu-8yr1oQmuA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Marcin_=c5=9alusarz?= <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/12/2017 08:35 PM, Marcin Ślusarz wrote:
> 2017-04-10 17:21 GMT+02:00 Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>> Hello Marcin
>>
>> On 04/01/2017 09:23 PM, Marcin Ślusarz wrote:
>>> Currently it says when dirfd is AT_FDCWD it can be something
>>> other than directory, which doesn't make much sense. Just swap
>>> the order of sentences.
>>>
>>> Signed-off-by: Marcin Ślusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>  man2/stat.2 | 6 +++---
>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/man2/stat.2 b/man2/stat.2
>>> index 1d838a9..7ec2593 100644
>>> --- a/man2/stat.2
>>> +++ b/man2/stat.2
>>> @@ -506,14 +506,14 @@ is an empty string, operate on the file referred to by
>>>  .BR open (2)
>>>  .B O_PATH
>>>  flag).
>>> +In this case,
>>> +.I dirfd
>>> +can refer to any type of file, not just a directory.
>>>  If
>>>  .I dirfd
>>>  is
>>>  .BR AT_FDCWD ,
>>>  the call operates on the current working directory.
>>> -In this case,
>>> -.I dirfd
>>> -can refer to any type of file, not just a directory.
>>>  This flag is Linux-specific; define
>>>  .B _GNU_SOURCE
>>>  .\" Before glibc 2.16, defining _ATFILE_SOURCE sufficed
>>
>> Thanks! Patch applied.
> 
> I'm not seeing it in any of these trees:
> https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
> https://github.com/mkerrisk/man-pages
> 
> Some secret repo? ;)

No, I just hadn't pushed yet. Should be visible now.

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
