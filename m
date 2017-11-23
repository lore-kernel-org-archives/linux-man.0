From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: [PATCH] errno.3: Add values for all errors
Date: Thu, 23 Nov 2017 11:57:36 +0100
Message-ID: <5A16A9A0.30605@bfs.de>
References: <20171123001545.dp55g3pkdm5bzah3@prism.localdomain> <20171123083109.GA25458@infradead.org> <f033a61a-f305-689d-b69a-72267ef767c1@gmail.com> <5A169376.90002@bfs.de> <CAKgNAkiRdXxXWznvwOneU9uQqPYHs-JM0thiFEjveSPpt8GdNg@mail.gmail.com>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkiRdXxXWznvwOneU9uQqPYHs-JM0thiFEjveSPpt8GdNg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org



Am 23.11.2017 10:47, schrieb Michael Kerrisk (man-pages):
> Hi Walter,
> 
> On 23 November 2017 at 10:23, walter harms <wharms-fPG8STNUNVg@public.gmane.org> wrote:
>>
>>
>> Am 23.11.2017 10:07, schrieb Michael Kerrisk (man-pages):
>>> On 11/23/2017 09:31 AM, Christoph Hellwig wrote:
>>>> On Wed, Nov 22, 2017 at 07:15:45PM -0500, Wesley Aptekar-Cassels wrote:
>>>>> This patch documents the values of error numbers on linux. This is
>>>>> something that is in the OpenBSD errno man page, which I find quite
>>>>> useful.
>>>>
>>>> Error numbers are different for different architectures.
>>>
>>> I was just about to say the same.
>>>
>>> Someone else recently proposed the same change, and I should have
>>> thought then to add the text that I have added just now to errno(3).
>>> Hopefully this goes someway to addressing your requirements, Wesley.
>>>
>>> New text:
>>>
>>>        On  Linux, the error numbers that correspond to each symbolic name
>>>        vary somewhat across architectures.  Therefore, numeric values are
>>>        not  included in the list of error names below.  On any particular
>>>        system, one can obtain a list of all symbolic error names and  the
>>>        corresponding error numbers using the errno(1) command:
>>>
>> If i read this that would mean the values differ between the linux architectures only.
>> I do not ting that was intended.
> 
> Indeed. So, I changed the text to:
> 
>        The  error  numbers  that  correspond  to  each symbolic name vary
>        across UNIX systems, and even across  different  architectures  on
>        Linux.   Therefore, numeric values are not included in the list of
>        error names below.  Portable applications should use the  symbolic
>        error  names  (rather than explicit error numbers).  The perror(3)
>        and strerror(3) functions can be used to convert  these  names  to
>        corresponding textual error messages.
> 
>> What about that:
>>
>>
>> Portability:
>>  Programmers should use always the symbolic names as that the value of errno may vary
>>  across different systems. Always use strerror (3) (or compareable) to translate
>>  the errno code into a human readable string.
>>
>> note: errno (1) is a nice programm and it could be mentioned but a propper programm
>>       simply should not say things like "Error: 13".
> 
> I'm not sure what you are referring to with the preceding line.
> 

I would move the bulk of the text to a portability section or like because this is
the section where i would expect that information.

NTL i was not aware that different linux versions have different code for the same
error that should be changed.
Also i would drop "Portable" simply write "applications should use ..." there
is no reason to write programms that require the numeric value. Corner cases may exists
but a man page is no law, so i see no problem.


just my 2 cents,
re,
 wh

> Thanks for the input, Walter.
> 
> Cheers,
> 
> Michael
> 
>> re,
>>  wh
>>
>>
>>>            $ errno -l
>>>            EPERM 1 Operation not permitted
>>>            ENOENT 2 No such file or directory
>>>            ESRCH 3 No such process
>>>            EINTR 4 Interrupted system call
>>>            EIO 5 Input/output error
>>>            ...
>>>
>>>        The  errno(1) command can also be used to look up individual error
>>>        numbers and names as in the following examples:
>>>
>>>            $ errno 2
>>>            ENOENT 2 No such file or directory
>>>            $ errno ESRCH
>>>            ESRCH 3 No such process
>>>
>>> Cheers,
>>>
>>> Michael
>>>
> 
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
